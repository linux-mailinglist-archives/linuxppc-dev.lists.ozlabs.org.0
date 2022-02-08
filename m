Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E024AD1CC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 07:52:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtDG2740wz3bbH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 17:52:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=OCdVBdVF;
	dkim=pass (2048-bit key; unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim header.b=NJikcCFF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=opensource.wdc.com (client-ip=68.232.143.124;
 helo=esa2.hgst.iphmx.com;
 envelope-from=prvs=031d9b7bb=damien.lemoal@opensource.wdc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=OCdVBdVF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com
 header.a=rsa-sha256 header.s=dkim header.b=NJikcCFF; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Tue, 08 Feb 2022 17:51:32 AEDT
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtDFJ2jjlz30Ds
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 17:51:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644303092; x=1675839092;
 h=message-id:date:mime-version:subject:from:to:references:
 in-reply-to:content-transfer-encoding;
 bh=MUmIj9HT8Q0qoR8I95VwEicCdFoCMrt7kFRP92JZP0E=;
 b=OCdVBdVFD9yPObzejxdIWGpMgcEIbJXapYDcGZn5w97MLdkQsfrOtIQB
 aAvI+PjZtvJFuVLkqybEqmPtDxSd+A0R6fKoLRDVgyb4y5ttn8IOQfoC0
 zCCa5SoKF8e8dvdSsDuNiGs+BhZuVwhrLdb/tkivxqFrHDFbdY95Wckuh
 YEdHL0ATaC//i6KMAc5Ydyo/PEloCj/uPWPgWi4LNQ8sWdwal6R+elwTp
 TB7gJzVSORYnnQviOgeezVabHEk8aLMFi3wsDB3SIO1KEMmQD+9aDKX8F
 wPnP6RRNICOcwyL5tqyejZPZ6ByDH6L+/pfZt04LPPyBdLYQGOrFfppAk g==;
X-IronPort-AV: E=Sophos;i="5.88,352,1635177600"; d="scan'208";a="296489626"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2022 14:50:24 +0800
IronPort-SDR: PWQ4BmzI0+Pi5GhmDtweVSuGxoSseAVC6f3ITP64olVR1CmeMRg1mvHv4wGulr4CDE/h9a3DFP
 WyCWbVHBNqZa2LGH0HaWRglks9vbjjyCb9uHnnsM8/hN8R2u+x7inUQLABalKAnVxRpIobgxA5
 nSRSWtRInZjrLpkmpiQUVPV7ZiHYKhY4kJTvUnaaec+sGHxLusPjvuIOJ9fCwr4dOg2i4YotAF
 G1Aep6WAU7k+rB7Woak2O+tQUq6hyEV5X1R4G1XQTUkGW3BQTdAb0eQWIZu8RePUP5MTa5ap0q
 ZviXMcITN3TKcm4y4/b/fW/A
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 22:23:25 -0800
IronPort-SDR: LWNXg9weCcqnAFX8oBRRumfhsgG0Fxq+q5CEiakK3shZDrRtd1gss3WyAJx/3NjRHoZ8X7e3m1
 3y09P/h9bBHtAFFVmOpvctS4bqqoiO50gfeFj7KZfB9eyt0pTWEgl0mkD8LFaV2FdPXBTYeOKu
 mm8+sAJeNSJ/KB6NoVZM+Ojha0QwDQ4FGDUZ1qSii5vQ8rxIO61rSyYzMiQZJxBYuyfRUMMIT6
 +dzY0WrdnWEH/cZcn6OheByPNa2DI58WIMb7nNy1lqUT6UsS+yfMChyXPBfZygZMBY+jms9Khn
 zew=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 22:50:26 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JtDD05Q6Mz1SVnx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 22:50:24 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:references:to:from:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1644303024; x=1646895025; bh=MUmIj9HT8Q0qoR8I95VwEicCdFoCMrt7kFR
 P92JZP0E=; b=NJikcCFFfOx3pR51028RBaDEsAGeQOzzw4N6xEVvAL9dkXclUdu
 YgngF67VW+DG3IF1mAzTzHjogHaai55OhSb9yPlT1jiDYClsM3uf4QDPx+Tjs+RA
 SQA5ilNoln1muFETNDl2NAfnkbvKW4hx7et0NlaVPbFb1QR+yqtkaP0TAFjGmiGo
 xeO46BuVwRPZDPelgOImkIJNRr9MnS6M8xqIH/6XWfwat3POeI4iup3rijRuxrYT
 vLEOpPQ1cvFTq1yz7D5B0lH2ZrPZUW+wP7/yYuYiPzjBbnba2lszlpWSG5n29E+9
 lRemIbZltMNxpQPbAYT6N2u2jLIoj6zXX/A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id LPUkBgwaeHUh for <linuxppc-dev@lists.ozlabs.org>;
 Mon,  7 Feb 2022 22:50:24 -0800 (PST)
Received: from [10.225.163.67] (unknown [10.225.163.67])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JtDCz1hHjz1Rwrw;
 Mon,  7 Feb 2022 22:50:23 -0800 (PST)
Message-ID: <3a8cb80d-0104-934a-3c21-56afcc510634@opensource.wdc.com>
Date: Tue, 8 Feb 2022 15:50:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ata: sata_fsl: fix sscanf() and sysfs_emit() format
 strings
Content-Language: en-US
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linux-ide@vger.kernel.org
References: <20220208064601.237582-1-damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220208064601.237582-1-damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/8/22 15:46, Damien Le Moal wrote:
> Use the %u format for unsigned int parameters handling with sscanf() and
> sysfs_emit() to avoid compilation warnings. In
> fsl_sata_rx_watermark_store(), the call to sscanf() to parse a single
> argument is replaced with a call to kstrtouint().
> 
> While at it, also replace the printk(KERN_ERR) calls with dev_err()
> calls and fix blank lines in fsl_sata_rx_watermark_store().
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> ---
>  drivers/ata/sata_fsl.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/ata/sata_fsl.c b/drivers/ata/sata_fsl.c
> index da0152116d9f..556034a15430 100644
> --- a/drivers/ata/sata_fsl.c
> +++ b/drivers/ata/sata_fsl.c
> @@ -322,7 +322,7 @@ static void fsl_sata_set_irq_coalescing(struct ata_host *host,
>  static ssize_t fsl_sata_intr_coalescing_show(struct device *dev,
>  		struct device_attribute *attr, char *buf)
>  {
> -	return sysfs_emit(buf, "%d	%d\n",
> +	return sysfs_emit(buf, "%u	%u\n",
>  			intr_coalescing_count, intr_coalescing_ticks);
>  }
>  
> @@ -332,10 +332,8 @@ static ssize_t fsl_sata_intr_coalescing_store(struct device *dev,
>  {
>  	unsigned int coalescing_count,	coalescing_ticks;
>  
> -	if (sscanf(buf, "%d%d",
> -				&coalescing_count,
> -				&coalescing_ticks) != 2) {
> -		printk(KERN_ERR "fsl-sata: wrong parameter format.\n");
> +	if (sscanf(buf, "%u%u", &coalescing_count, &coalescing_ticks) != 2) {

PPC folks,

The "%u%u" sscanf() format above seems totally bogus to me. How could 2
unsigned int without a separating characters be parsed as such ? Surely,
a separation character is needed, no ?

I cannot find any documentation on what the intr_coalescing sysfs
attribute format should be... Please have a look.


> +		dev_err(dev, "fsl-sata: wrong parameter format.\n");
>  		return -EINVAL;
>  	}
>  
> @@ -359,7 +357,7 @@ static ssize_t fsl_sata_rx_watermark_show(struct device *dev,
>  	rx_watermark &= 0x1f;
>  	spin_unlock_irqrestore(&host->lock, flags);
>  
> -	return sysfs_emit(buf, "%d\n", rx_watermark);
> +	return sysfs_emit(buf, "%u\n", rx_watermark);
>  }
>  
>  static ssize_t fsl_sata_rx_watermark_store(struct device *dev,
> @@ -373,8 +371,8 @@ static ssize_t fsl_sata_rx_watermark_store(struct device *dev,
>  	void __iomem *csr_base = host_priv->csr_base;
>  	u32 temp;
>  
> -	if (sscanf(buf, "%d", &rx_watermark) != 1) {
> -		printk(KERN_ERR "fsl-sata: wrong parameter format.\n");
> +	if (kstrtouint(buf, 10, &rx_watermark) < 0) {
> +		dev_err(dev, "fsl-sata: wrong parameter format.\n");
>  		return -EINVAL;
>  	}
>  
> @@ -382,8 +380,8 @@ static ssize_t fsl_sata_rx_watermark_store(struct device *dev,
>  	temp = ioread32(csr_base + TRANSCFG);
>  	temp &= 0xffffffe0;
>  	iowrite32(temp | rx_watermark, csr_base + TRANSCFG);
> -
>  	spin_unlock_irqrestore(&host->lock, flags);
> +
>  	return strlen(buf);
>  }
>  


-- 
Damien Le Moal
Western Digital Research
