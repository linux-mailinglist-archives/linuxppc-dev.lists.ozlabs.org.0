Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2560913D892
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 12:08:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z1dw0mcpzDqZF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 22:08:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo6-p01-ob.smtp.rzone.de (client-ip=2a01:238:20a:202:5301::6;
 helo=mo6-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=hH7m43ST; 
 dkim-atps=neutral
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z1b80M0CzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 22:06:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579172761;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:To:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=DzVwqWjiZk9RTH0OHTHksTRoKdVCSVfUgiVNd3dI1vg=;
 b=hH7m43ST1RsITIjaRTXKvXW1twew6TFsS5OU2DW7o+Xk9fx59HTcrGrUQmv+pjbAOI
 o+0px37tEKPk95NlNCluifMH3f/I3ifB4UyQxfRk6mI0LAGpqUInYH9GEpNxIG74ojnH
 5ZlBflhcrWUiPchTsuK8sNPDPNBVrEeyiRy+hXpTnUlivaibBFbNc4Qanveiqxq1ullt
 Tb34+o6Jj7srBY8VJuwSV0IW4mFT8wFtwyIkWzWBeRu+4rhWrNsTMhw5UHUZ8FOh7/mv
 rdEA9lPtlYX5o9zCswHRC7rrMvEop9QXji5Qzidv0XF0y8YXvQykZpQlGIwuj7AylT27
 qRVg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgGJxcR6e0MYA9IZCCrKOhys58/Dg=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:e1db:d4a8:b88d:b34e]
 by smtp.strato.de (RZmta 46.1.4 AUTH) with ESMTPSA id c05c1aw0GB5tghQ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 16 Jan 2020 12:05:55 +0100 (CET)
Subject: [FSL P5020 P5040 PPC] Onboard SD card doesn't work anymore after the
 'mmc-v5.4-2' updates
To: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "contact@a-eon.com" <contact@a-eon.com>, Julian Margetson <runaway@candw.ms>
References: <20200108093903.57620-1-hdegoede@redhat.com>
 <20200108093903.57620-2-hdegoede@redhat.com>
 <61bc9265-ece0-eeb6-d4a1-4631138ecf29@intel.com>
 <8d67882d-04a8-0607-be4e-c1430b7fda21@redhat.com>
 <84a32714-ba08-74a0-0c76-3c36db44dd68@intel.com>
 <93446e09-5f12-800a-62fa-bf3ecea7273d@redhat.com>
 <399ac7d5-2518-799a-595e-f6b6878cf4ab@intel.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <a9ab8946-c599-5f83-7527-2387a9e82e8a@xenosoft.de>
Date: Thu, 16 Jan 2020 12:05:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <399ac7d5-2518-799a-595e-f6b6878cf4ab@intel.com>
Content-Type: multipart/mixed; boundary="------------6FAC0AE0BD11F9177C82AFB8"
Content-Language: de-DE
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

This is a multi-part message in MIME format.
--------------6FAC0AE0BD11F9177C82AFB8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

We still need the attached patch for our onboard SD card interface 
[1,2]. Could you please add this patch to the tree?

Thanks,
Christian

[1] https://www.spinics.net/lists/linux-mmc/msg56211.html
[2] 
http://forum.hyperion-entertainment.com/viewtopic.php?f=58&t=4349&start=20#p49012


--------------6FAC0AE0BD11F9177C82AFB8
Content-Type: text/x-patch; charset=UTF-8;
 name="coherent_cache-v3.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="coherent_cache-v3.patch"

diff -rupN a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
--- a/arch/powerpc/kernel/setup-common.c	2019-12-03 18:05:52.436070217 +0100
+++ b/arch/powerpc/kernel/setup-common.c	2019-12-03 18:03:20.316629696 +0100
@@ -780,6 +780,22 @@ static int __init check_cache_coherency(
 late_initcall(check_cache_coherency);
 #endif /* CONFIG_CHECK_CACHE_COHERENCY */
 
+#ifndef CONFIG_NOT_COHERENT_CACHE
+/*
+ * For historical reasons powerpc kernels are built with hard wired knowledge of
+ * whether or not DMA accesses are cache coherent. Additionally device trees on
+ * powerpc do not typically support the dma-coherent property.
+ *
+ * So when we know that DMA is coherent, override arch_of_dma_is_coherent() to
+ * tell the drivers/of code that all devices are coherent regardless of whether
+ * they have a dma-coherent property.
+ */
+bool arch_of_dma_is_coherent(struct device_node *np)
+{
+	return true;
+}
+#endif
+
 #ifdef CONFIG_DEBUG_FS
 struct dentry *powerpc_debugfs_root;
 EXPORT_SYMBOL(powerpc_debugfs_root);
diff -rupN a/drivers/of/address.c b/drivers/of/address.c
--- a/drivers/of/address.c	2019-12-03 18:05:57.332052212 +0100
+++ b/drivers/of/address.c	2019-12-03 18:03:20.320629681 +0100
@@ -990,6 +990,14 @@ out:
 	return ret;
 }
 
+/*
+ * arch_of_dma_is_coherent - Arch hook to determine if device is coherent for DMA
+ */
+bool __weak arch_of_dma_is_coherent(struct device_node *np)
+{
+	return false;
+}
+
 /**
  * of_dma_is_coherent - Check if device is coherent
  * @np:	device node
@@ -999,8 +1007,12 @@ out:
  */
 bool of_dma_is_coherent(struct device_node *np)
 {
-	struct device_node *node = of_node_get(np);
+	struct device_node *node;
+
+	if (arch_of_dma_is_coherent(np))
+		return true;
 
+	np = of_node_get(np);
 	while (node) {
 		if (of_property_read_bool(node, "dma-coherent")) {
 			of_node_put(node);

--------------6FAC0AE0BD11F9177C82AFB8--
