Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6583D2FE257
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 07:11:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLsV044SfzDqtt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 17:11:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=oBTVnZOa; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLsS80fjDzDqRG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 17:09:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=lZeKd0/0hrDPS8SZ5doWRcY0buqZrAFLpJtW5s5Vcoc=; b=oBTVnZOasjW9P7RU4VtlWCmY/o
 0h8E8P6JpjBDjXG3T3tDAhbLw5i9EwHqCU1dMFlIOT1C31v9VksnteT+FeX5/k18nHjoI3FWTguKT
 fR1t5Hv0GLymg6WM6dHnXR5jLCZNSjDvGe4xIwU+hhdWOeiBsnPbYEDjAwtYJsIeT/bzFduN9S6hd
 YytXSCWcDRJWupfaRzlWT2q4xMtvgiPl3RvuXKHHcnMKs5kJlRl/ZHj/LSllabJmghSMifP9rjIGA
 JhGU8lsITbDrpfXXLE1qjhEqVM0oXIvNBz0mSIrrfpNPtdCHvVDui9mPPxlHRsuruTfEIyjjUEr3F
 K/Za5wVw==;
Received: from [2601:1c0:6280:3f0::9abc]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2TAG-0007vT-6u; Thu, 21 Jan 2021 06:09:52 +0000
Subject: [PATCH] powerpc: fix AKEBONO build failures
To: Yury Norov <yury.norov@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAAH8bW8-6Dp29fe6rrnA4eL1vo+mu0HuAVJ-5yjbwxDSvaHdeQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6c442012-3bef-321b-bbc3-09c54608661f@infradead.org>
Date: Wed, 20 Jan 2021 22:09:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAAH8bW8-6Dp29fe6rrnA4eL1vo+mu0HuAVJ-5yjbwxDSvaHdeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/20/21 1:29 PM, Yury Norov wrote:
> Hi all,
> 
> I found the power pc build broken on today's
> linux-next (647060f3b592).

Darn, I was building linux-5.11-rc4.

I'll try linux-next after I send this.

---
From: Randy Dunlap <rdunlap@infradead.org>

Fulfill AKEBONO Kconfig requirements.

Fixes these Kconfig warnings (and more) and fixes the subsequent
build errors:

WARNING: unmet direct dependencies detected for NETDEVICES
  Depends on [n]: NET [=n]
  Selected by [y]:
  - AKEBONO [=y] && PPC_47x [=y]

WARNING: unmet direct dependencies detected for MMC_SDHCI
  Depends on [n]: MMC [=n] && HAS_DMA [=y]
  Selected by [y]:
  - AKEBONO [=y] && PPC_47x [=y]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Yury Norov <yury.norov@gmail.com>
---
 arch/powerpc/platforms/44x/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

--- lnx-511-rc4.orig/arch/powerpc/platforms/44x/Kconfig
+++ lnx-511-rc4/arch/powerpc/platforms/44x/Kconfig
@@ -206,6 +206,7 @@ config AKEBONO
 	select PPC4xx_HSTA_MSI
 	select I2C
 	select I2C_IBM_IIC
+	select NET
 	select NETDEVICES
 	select ETHERNET
 	select NET_VENDOR_IBM
@@ -213,6 +214,7 @@ config AKEBONO
 	select USB if USB_SUPPORT
 	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
 	select USB_EHCI_HCD_PLATFORM if USB_EHCI_HCD
+	select MMC
 	select MMC_SDHCI
 	select MMC_SDHCI_PLTFM
 	select ATA
