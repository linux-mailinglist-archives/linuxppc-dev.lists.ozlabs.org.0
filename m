Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 364463C3D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 08:07:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NKKq2ghTzDqVw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 16:07:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=newverein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NKHl1F16zDqS9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 16:05:54 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 98BEE68B20; Tue, 11 Jun 2019 08:05:22 +0200 (CEST)
Date: Tue, 11 Jun 2019 08:05:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Larry Finger <Larry.Finger@lwfinger.net>
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
Message-ID: <20190611060521.GA19512@lst.de>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <20190607172902.GA8183@lst.de>
 <30000803-3772-3edf-f4a9-55122d504f3f@lwfinger.net>
 <20190610081825.GA16534@lst.de>
 <153c13f5-a829-1eab-a3c5-fecfb84127ff@lwfinger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153c13f5-a829-1eab-a3c5-fecfb84127ff@lwfinger.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 10, 2019 at 11:09:47AM -0500, Larry Finger wrote:
>>>                  return -EIO;
>>>
>>> For b43legacy, dev->dma_mask is 0xc265684800000000.
>>>      dma_supported(dev, mask) is 0xc08b000000000000, mask is 0x3fffffff, and
>>> the routine returns -EIO.
>>>
>>> For b43,       dev->dma_mask is 0xc265684800000001,
>>>      dma_supported(dev, mask) is 0xc08b000000000000, mask is 0x77777777, and
>>> the routine returns 0.
>>
>> I don't fully understand what values the above map to.  Can you send
>> me your actual debugging patch as well?
>
> I do not understand why the if statement returns true as neither of the 
> values is zero. After seeing the x86 output shown below, I also do not 
> understand all the trailing zeros.
>
> My entire patch is attached. That output came from this section:

What might be confusing in your output is that dev->dma_mask is a pointer,
and we are setting it in dma_set_mask.  That is before we only check
if the pointer is set, and later we override it.  Of course this doesn't
actually explain the failure.  But what is even more strange to me
is that you get a return value from dma_supported() that isn't 0 or 1,
as that function is supposed to return a boolean, and I really can't see
how mask >= __phys_to_dma(dev, min_mask), would return anything but 0
or 1.  Does the output change if you use the correct printk specifiers?

i.e. with a debug patch like this:


diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 2c2772e9702a..9e5b30b12b10 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -378,6 +378,7 @@ EXPORT_SYMBOL(dma_direct_map_resource);
 int dma_direct_supported(struct device *dev, u64 mask)
 {
 	u64 min_mask;
+	bool ret;
 
 	if (IS_ENABLED(CONFIG_ZONE_DMA))
 		min_mask = DMA_BIT_MASK(ARCH_ZONE_DMA_BITS);
@@ -391,7 +392,12 @@ int dma_direct_supported(struct device *dev, u64 mask)
 	 * use __phys_to_dma() here so that the SME encryption mask isn't
 	 * part of the check.
 	 */
-	return mask >= __phys_to_dma(dev, min_mask);
+	ret = (mask >= __phys_to_dma(dev, min_mask));
+	if (!ret)
+		dev_info(dev,
+			"%s: failed (mask = 0x%llx, min_mask = 0x%llx/0x%llx, dma bits = %d\n",
+			__func__, mask, min_mask, __phys_to_dma(dev, min_mask), ARCH_ZONE_DMA_BITS);
+	return ret;
 }
 
 size_t dma_direct_max_mapping_size(struct device *dev)
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index f7afdadb6770..6c57ccdee2ae 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -317,8 +317,14 @@ void arch_dma_set_mask(struct device *dev, u64 mask);
 
 int dma_set_mask(struct device *dev, u64 mask)
 {
-	if (!dev->dma_mask || !dma_supported(dev, mask))
+	if (!dev->dma_mask) {
+		dev_info(dev, "no DMA mask set!\n");
 		return -EIO;
+	}
+	if (!dma_supported(dev, mask)) {
+		printk("DMA not supported\n");
+		return -EIO;
+	}
 
 	arch_dma_set_mask(dev, mask);
 	dma_check_mask(dev, mask);
