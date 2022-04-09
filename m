Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 003744FA18E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 04:09:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZz840RzDz3bZZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 12:09:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lyXLxby7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=lyXLxby7; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZz7N1qjgz2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 12:08:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=F75WgLKYZWUeJINf8+Yays5uvhvJJCETxcO2mCDDMP8=; b=lyXLxby7leOtzEIBGgGdvhg9aI
 ppN1Ti3FCmXWfMEATse9V55cNyhMl5ie97YyCk3Me6nN+EeaeKZ2J0m8RX0mbgcWnlGkpah08S0iN
 sT2I3qLUVQBzSMDV77n/r80NjnenKYglKrA0fpcymAdAentilrJMUtYmoiaei0oJngUxsotetB99X
 ICMzQgBdyltZuIYaSYsf7+zNQ3WVApWi5yjMghYG81YdO0KyR9/fjW3l231YCgebN8equojEHbBTt
 MRWS25GkXuVN9SCNlPeq43tcungXlKhRsv+LbCSIbLF5gngIjY+RO+fHi8CzTeSDHl/vkKs+0tdIn
 Ah0X6acA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd0WV-001hkH-Ma; Sat, 09 Apr 2022 02:08:23 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] macintosh: fix via-pmu and via-cuda build without RTC_CLASS
Date: Fri,  8 Apr 2022 19:08:21 -0700
Message-Id: <20220409020821.10229-1-rdunlap@infradead.org>
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

Fix build when RTC_CLASS is not set/enabled.
Eliminates these build errors:

m68k-linux-ld: drivers/macintosh/via-pmu.o: in function `pmu_set_rtc_time':
drivers/macintosh/via-pmu.c:1769: undefined reference to `rtc_tm_to_time64'
m68k-linux-ld: drivers/macintosh/via-cuda.o: in function `cuda_set_rtc_time':
drivers/macintosh/via-cuda.c:797: undefined reference to `rtc_tm_to_time64'

Fixes: 0792a2c8e0bb ("macintosh: Use common code to access RTC")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Finn Thain <fthain@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: linuxppc-dev@lists.ozlabs.org
---
 drivers/macintosh/via-cuda.c |    5 ++++-
 drivers/macintosh/via-pmu.c  |    5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

--- a/drivers/macintosh/via-cuda.c
+++ b/drivers/macintosh/via-cuda.c
@@ -794,7 +794,10 @@ int cuda_set_rtc_time(struct rtc_time *t
 	u32 now;
 	struct adb_request req;
 
-	now = lower_32_bits(rtc_tm_to_time64(tm) + RTC_OFFSET);
+	now = lower_32_bits(mktime64(((unsigned int)tm->tm_year + 1900),
+			    tm->tm_mon + 1, tm->tm_mday, tm->tm_hour,
+			    tm->tm_min, tm->tm_sec)
+			    + RTC_OFFSET);
 	if (cuda_request(&req, NULL, 6, CUDA_PACKET, CUDA_SET_TIME,
 	                 now >> 24, now >> 16, now >> 8, now) < 0)
 		return -ENXIO;
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -1766,7 +1766,10 @@ int pmu_set_rtc_time(struct rtc_time *tm
 	u32 now;
 	struct adb_request req;
 
-	now = lower_32_bits(rtc_tm_to_time64(tm) + RTC_OFFSET);
+	now = lower_32_bits(mktime64(((unsigned int)tm->tm_year + 1900),
+			    tm->tm_mon + 1, tm->tm_mday, tm->tm_hour,
+			    tm->tm_min, tm->tm_sec)
+			    + RTC_OFFSET);
 	if (pmu_request(&req, NULL, 5, PMU_SET_RTC,
 	                now >> 24, now >> 16, now >> 8, now) < 0)
 		return -ENXIO;
