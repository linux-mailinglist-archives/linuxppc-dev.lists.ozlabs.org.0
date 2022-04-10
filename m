Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EE54FAECB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 18:11:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbxnG6wvBz3bk2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 02:11:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b5/otx6c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=b5/otx6c; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kbxmd5zHcz2xnD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 02:10:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=B6tMKYK2Z3xVAw/QxFp/pyz5o32Ek1zRQPrPupjZolk=; b=b5/otx6cfC1w2dFSBG/HnGZhaO
 tknBA+fOo0Hp/JnpVoaXQPxZFNbPcnlfBt7YXqAgB5e6JJ5xJyTvEytgd4jlFTuiV0HgfJPUd/No4
 kFC+8E4oe/V1+x9WZMnR3QgfrS84V5+trt+5+xRUzl3AwXEWfiTWH/3ll6LwfhmaQ6CjDbNOFG96X
 0vqSicky0N46/z/NgADTbnBZLWRimS5zzrETj9HnJcSepPdZ6rKJQ4NW4bPeP96WKhk7dn12UQvOv
 nl7wIQD5cM9J2Y72M5RU7NPOXIWnsuGuzTfUXtReymgkKLHPe912QyVHHZDRt2F3RzATGpY4okyep
 72YPKfdg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nda96-0056Gu-Qt; Sun, 10 Apr 2022 16:10:36 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] macintosh: via-pmu and via-cuda need RTC_LIB
Date: Sun, 10 Apr 2022 09:10:35 -0700
Message-Id: <20220410161035.592-1-rdunlap@infradead.org>
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 Finn Thain <fthain@linux-m68k.org>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix build when RTC_LIB is not set/enabled.
Eliminates these build errors:

m68k-linux-ld: drivers/macintosh/via-pmu.o: in function `pmu_set_rtc_time':
drivers/macintosh/via-pmu.c:1769: undefined reference to `rtc_tm_to_time64'
m68k-linux-ld: drivers/macintosh/via-cuda.o: in function `cuda_set_rtc_time':
drivers/macintosh/via-cuda.c:797: undefined reference to `rtc_tm_to_time64'

Fixes: 0792a2c8e0bb ("macintosh: Use common code to access RTC")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: linuxppc-dev@lists.ozlabs.org
---
v2: use RTC_LIB instead of open-coding the call to rtc_tm_to_time64()

 drivers/macintosh/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -44,6 +44,7 @@ config ADB_IOP
 config ADB_CUDA
 	bool "Support for Cuda/Egret based Macs and PowerMacs"
 	depends on (ADB || PPC_PMAC) && !PPC_PMAC64
+	select RTC_LIB
 	help
 	  This provides support for Cuda/Egret based Macintosh and
 	  Power Macintosh systems. This includes most m68k based Macs,
@@ -57,6 +58,7 @@ config ADB_CUDA
 config ADB_PMU
 	bool "Support for PMU based PowerMacs and PowerBooks"
 	depends on PPC_PMAC || MAC
+	select RTC_LIB
 	help
 	  On PowerBooks, iBooks, and recent iMacs and Power Macintoshes, the
 	  PMU is an embedded microprocessor whose primary function is to
