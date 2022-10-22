Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8D1608368
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 03:49:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvPQv74gWz3f2R
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 12:49:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GMIwnwq1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=nrlw=2x=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GMIwnwq1;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvPK40bgZz3drc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 12:44:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D47A4B82DB8;
	Sat, 22 Oct 2022 01:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC1BC43143;
	Sat, 22 Oct 2022 01:44:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GMIwnwq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1666403063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pgAGvtfWFBepSErNnmOiCogblep8pK7WSNMDWQtrNSg=;
	b=GMIwnwq1awcpUW/3bcqRLII9Ls9FFpGfdnmMIcvGbiEtdgTfYCtyHBxD9yKHQ7iLoU7MWe
	oedm6GH5CEx+hIfF88+NdonBLSB3Qlk4BllZXEvDgVRGj4TJT9CbyQxCoDz8OaY8tqxGTj
	zGaJgSvm0ym+4US4UBRtlbzQYNmOeTE=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e102b3b6 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 22 Oct 2022 01:44:23 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] random: add helpers for random numbers with given floor or range
Date: Fri, 21 Oct 2022 21:44:01 -0400
Message-Id: <20221022014403.3881893-4-Jason@zx2c4.com>
In-Reply-To: <20221022014403.3881893-1-Jason@zx2c4.com>
References: <20221022014403.3881893-1-Jason@zx2c4.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Darrick J . Wong" <djwong@kernel.org>, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-mips@
 vger.kernel.org, =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that we have get_random_u32_below(), it's trivial to make inline
helpers to compute get_random_u32_above() and get_random_u32_between(),
which will help clean up open coded loops and manual computations
throughout the tree.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 include/linux/random.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/random.h b/include/linux/random.h
index 3a82c0a8bc46..92188a74e50e 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -91,6 +91,30 @@ static inline u32 get_random_u32_below(u32 ceil)
 	}
 }
 
+/*
+ * Returns a random integer in the interval (floor, U32_MAX], with uniform
+ * distribution, suitable for all uses. Fastest when floor is a constant, but
+ * still fast for variable floor as well.
+ */
+static inline u32 get_random_u32_above(u32 floor)
+{
+	BUILD_BUG_ON_MSG(__builtin_constant_p(floor) && floor == U32_MAX,
+			 "get_random_u32_above() must take floor < U32_MAX");
+	return floor + 1 + get_random_u32_below(U32_MAX - floor);
+}
+
+/*
+ * Returns a random integer in the interval [floor, ceil), with uniform
+ * distribution, suitable for all uses. Fastest when floor and ceil are
+ * constant, but still fast for variable floor and ceil as well.
+ */
+static inline u32 get_random_u32_between(u32 floor, u32 ceil)
+{
+	BUILD_BUG_ON_MSG(__builtin_constant_p(floor) && __builtin_constant_p(ceil) &&
+			 floor >= ceil, "get_random_u32_above() must take floor < ceil");
+	return floor + get_random_u32_below(ceil - floor);
+}
+
 /*
  * On 64-bit architectures, protect against non-terminated C string overflows
  * by zeroing out the first byte of the canary; this leaves 56 bits of entropy.
-- 
2.38.1

