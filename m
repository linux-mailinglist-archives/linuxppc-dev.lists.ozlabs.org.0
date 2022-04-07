Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C744F7226
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 04:37:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYlsx0MLqz3bcC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:37:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nw5C0wWx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=Nw5C0wWx; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYlsB48Dyz2xVY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 12:37:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=kgDQ0x9PzIJO+UDMqsy6uHWPV2myzYqJHPpaULldhHc=; b=Nw5C0wWx7J6HtbRkZf6yUMPlv/
 lqizwFjhgcu3V2Rpm7giEpd6nq9GKOSnhCN+QapuQ8+FDHIVjDCv3pqR+4bXs6Iv5gi+Ad4JBmg0Z
 WrvulMfEM2/vepzgQi7IIunk7JyM/5yzTsyWdzaajnEPUAWYRO7bWzvBzrkrdpBghyxMxPu2kv0Oq
 QxFGWVIuYdtsszCAnxKxYYPEJ7axiIDC60atrPRWA5aMYTj+++xfuCZ0cyzPYC+9hVJB4RmljOVVk
 XxXtsLoT4beOtkiVMf9Ez8NZ67n2QTRtjjr4Nhh5ecaNg6jYo4o3sSgHDBjMVj4+hUCytIlf8bUIe
 TQQMvNcQ==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncI17-008taA-9K; Thu, 07 Apr 2022 02:37:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] macintosh: fix via-pmu and via-cuda build errors
Date: Wed,  6 Apr 2022 19:37:00 -0700
Message-Id: <20220407023700.7216-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kernel test robot <lkp@intel.com>, Finn Thain <fthain@linux-m68k.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_INPUT=m, the input_*() family of functions is not
available to builtin drivers.

When CONFIG_RTC_CLASS is not set, rtc_tm_to_time64() is not defined.

Fix multiple build errors by making these Kconfig symbols required by
ADB_CUDA (RTC_CLASS) and ADB_PMU (RTC_CLASS and INPUT).

m68k-linux-ld: drivers/macintosh/via-pmu.o: in function `pmu_set_rtc_time':
drivers/macintosh/via-pmu.c:1758: undefined reference to `rtc_tm_to_time64'
m68k-linux-ld: drivers/macintosh/via-pmu-event.o: in function `input_report_key':
include/linux/input.h:425: undefined reference to `input_event'
m68k-linux-ld: drivers/macintosh/via-pmu-event.o: in function `input_report_switch':
include/linux/input.h:445: undefined reference to `input_event'
m68k-linux-ld: drivers/macintosh/via-pmu-event.o: in function `via_pmu_event_init':
drivers/macintosh/via-pmu-event.c:38: undefined reference to `input_allocate_device'
m68k-linux-ld: drivers/macintosh/via-pmu-event.c:53: undefined reference to `input_register_device'
m68k-linux-ld: drivers/macintosh/via-pmu-event.c:55: undefined reference to `input_free_device'
m68k-linux-ld: drivers/macintosh/via-cuda.o: in function `cuda_set_rtc_time':
drivers/macintosh/via-cuda.c:797: undefined reference to `rtc_tm_to_time64'

Fixes: 0792a2c8e0bb ("macintosh: Use common code to access RTC")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
This is a big hammer type of patch. We could possibly do (a) some
conditional code blocks for RTC_CLASS and (b) only build via-pmu-event
if CONFIG_INPUT=y if needed.

 drivers/macintosh/Kconfig |    3 +++
 1 file changed, 3 insertions(+)

--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -44,6 +44,7 @@ config ADB_IOP
 config ADB_CUDA
 	bool "Support for Cuda/Egret based Macs and PowerMacs"
 	depends on (ADB || PPC_PMAC) && !PPC_PMAC64
+	depends on RTC_CLASS
 	help
 	  This provides support for Cuda/Egret based Macintosh and
 	  Power Macintosh systems. This includes most m68k based Macs,
@@ -57,6 +58,8 @@ config ADB_CUDA
 config ADB_PMU
 	bool "Support for PMU based PowerMacs and PowerBooks"
 	depends on PPC_PMAC || MAC
+	depends on INPUT=y
+	depends on RTC_CLASS
 	help
 	  On PowerBooks, iBooks, and recent iMacs and Power Macintoshes, the
 	  PMU is an embedded microprocessor whose primary function is to
