Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0013B837957
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 01:37:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nG6JIJmh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJp7j6R6Hz3cDt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 11:37:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nG6JIJmh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJp6y1DTfz2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 11:36:23 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6d9344f30caso2312082b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 16:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705970181; x=1706574981; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjTv0JWp2wh4DoATrj62+gp6F7EFeXqYtPy6neelVk8=;
        b=nG6JIJmhjbbcKHSEU3Mq/YU51n8sJ38wBR0ZuDJ5XnqurF/s6U7X3dPS48m02zKGWQ
         /KmcuVppbvPOx2Qj3N2GWMHYvJXCb1ieWf9OsxYRZHaL+RQmFXhBXoUSYKleZvlkgzO3
         Plpv7L/bnM1ZxBsvG4z1Lm48ZuIHuByGvFTdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705970181; x=1706574981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjTv0JWp2wh4DoATrj62+gp6F7EFeXqYtPy6neelVk8=;
        b=nte4obo7Duwa23jh6jLAd/ftwzSM6rqr9K+aPmtH7SH7uEohFZa5n3OskGhSEHO6QB
         WMMBtUSO5d63uqSG9tOpVB0ukmDvcE7tB3EK2ODZWy1zYHFi0O3WWuRj8Tr7Ta3tClfX
         Pf3xzqHkY3foXsof9Omn8DYD1xrBpBZz3rkC6d0JPWBmDTlP0CLkA/LlJJ2l0sMtEa5Q
         SDGaiyHpiU2GG6yz679hPBbyVXpHKSKxUMipSFsws4ShEGYH347ksTzdoQ2HkGmRsnTR
         9A4/Q4vr37nPq8FYL4KNkJZXlM/Nik8mgp2+iCgXO/we/5c7crYntVR2v/vxJ+7lVD0X
         1QtQ==
X-Gm-Message-State: AOJu0YzlJyyQ29teypC4L/5YcK+Yupe/7NVfXIpTkdAiws138J8s9VuM
	kcwLWayY1LqXQtDBxJEFqtLBp9YolTFJmDEowa4YGTvp0MKxVOq1VzIsNLT7zA==
X-Google-Smtp-Source: AGHT+IEdiv0sQvhk5DF6DmJpOnGI+AupQQxjyZFGDT/RapAwhNquQoSG7WtikHFZHphx3/AnNJEzKg==
X-Received: by 2002:a05:6a00:88a:b0:6d9:c0a4:67eb with SMTP id q10-20020a056a00088a00b006d9c0a467ebmr7154515pfj.35.1705970181078;
        Mon, 22 Jan 2024 16:36:21 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id r11-20020a056a00216b00b006dbce4a2136sm4727845pff.142.2024.01.22.16.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 16:36:17 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 60/82] powerpc: Refactor intentional wrap-around test
Date: Mon, 22 Jan 2024 16:27:35 -0800
Message-Id: <20240123002814.1396804-60-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122235208.work.748-kees@kernel.org>
References: <20240122235208.work.748-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2692; i=keescook@chromium.org;
 h=from:subject; bh=gGIR1+eHbOSAQms308Zk1nT40iClIFMbQz6VhnPDbi8=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlrwgKZlRqKBNSnPKaV9Q+qNDqro5fLhpWmnwga
 Q7YzUH80IiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZa8ICgAKCRCJcvTf3G3A
 JrbeEACw9Qm/wbTPg4Z6IKIJQxXVouLRzxfnSHgzNiD276XXnPVJrJiBcSCvmSL7fpJ9SDej5TV
 9PYH7UGkT6J3bCE8PLoBp5JqS24+wSC9f6aqnuqpGLfoi5P3MxHPufDB9EbUyasJgVcGybCxci6
 sMhNpj+acmdoPvOc6m5jx5a7RAAA/ym1iJPdj0+2ccaR5cIeImnNF30sRViNQzozLcnn4DA1H8p
 XENTLdbPf/j0h+wTxLu70B2HUAAQUyBzLfpb9waKCwX03HXJ0lwpxUXvZgA99nbb0tmF717h1lV
 mh1AktyNwBxm0tJEUEWQcHUqY2a19p5L9QI5ZPhhISQsaZIBGWdlB6vjLPvnUgSTZ57SpVnQ+8g
 vENCyDxuI3pWKiz9shHbiKHxOL67K4hYdaQNF9iB3J7KpvCE6JfKuIeBURpd1JrU9S+z3MGRo8V
 Hkk6J4qgEhi5rzMO9I2yhzZGMl2+5U1RhdSdwRY0ol+lsIsKnCKDNTXAbw07S9zoYa4lmNyPvwM
 HT3G5UCgsab2bqAvSQ9I63Fr+lt7BaHqGREuxYKUun/1NWDIQhhH1CFpy8K2kKFqJjqxWDH6wj5
 Yzpr1wcFOCzLytejNRGkB2uIRgzQqhzzbhg+XbUgDUjc/mkGvnLvsVMVLP96m+FIehjUX0J6mJU BDk7KOdYQY3UuXQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, Kees Cook <keescook@chromium.org>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, dingsenjie <dingsenjie@yulong.com>, Nicholas Piggin <npiggin@gmail.com>, Justin Stitt <justinstitt@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In an effort to separate intentional arithmetic wrap-around from
unexpected wrap-around, we need to refactor places that depend on this
kind of math. One of the most common code patterns of this is:

	VAR + value < VAR

Notably, this is considered "undefined behavior" for signed and pointer
types, which the kernel works around by using the -fno-strict-overflow
option in the build[1] (which used to just be -fwrapv). Regardless, we
want to get the kernel source to the position where we can meaningfully
instrument arithmetic wrap-around conditions and catch them when they
are unexpected, regardless of whether they are signed[2], unsigned[3],
or pointer[4] types.

Refactor open-coded wrap-around addition test to use add_would_overflow().
This paves the way to enabling the wrap-around sanitizers in the future.

Link: https://git.kernel.org/linus/68df3755e383e6fecf2354a67b08f92f18536594 [1]
Link: https://github.com/KSPP/linux/issues/26 [2]
Link: https://github.com/KSPP/linux/issues/27 [3]
Link: https://github.com/KSPP/linux/issues/344 [4]
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Cc: dingsenjie <dingsenjie@yulong.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/platforms/powernv/opal-prd.c | 2 +-
 arch/powerpc/xmon/xmon.c                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index b66b06efcef1..eaf95dc82925 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -51,7 +51,7 @@ static bool opal_prd_range_is_valid(uint64_t addr, uint64_t size)
 	struct device_node *parent, *node;
 	bool found;
 
-	if (addr + size < addr)
+	if (add_would_overflow(addr, size))
 		return false;
 
 	parent = of_find_node_by_path("/reserved-memory");
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index b3b94cd37713..b91fdda49434 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3252,7 +3252,7 @@ memzcan(void)
 		} else if (!ok && ook)
 			printf("%.8lx\n", a - mskip);
 		ook = ok;
-		if (a + mskip < a)
+		if (add_would_overflow(a, mskip))
 			break;
 	}
 	if (ook)
-- 
2.34.1

