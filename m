Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3E8546594
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:30:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJg72xctz3cdK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:30:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PwDM2JUn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=ariel.miculas@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PwDM2JUn;
	dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKH4n2JVhz3bqL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 20:19:20 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id o37-20020a05600c512500b0039c4ba4c64dso909657wms.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 03:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zY4+lp4pr5IsVeoihGvcsTPoBE5AuFSkdFxCMhcJJms=;
        b=PwDM2JUnFEg5SXKPkVZFXUed/iQepRi3fhrX5fTC0ZbKzUVcRoRvQ0ObJBJyOfdJH5
         n0zZDX0++SMA6eNPiGh3D1oQCOTRzekjv6RQgqy7HIqvfMk6as6LmeVq4sWCFRLV/SGW
         oa08ibq99cz7dQDGqCgQx5KD/DiU0YbEMWpDlcw13Reudl7lWrCdAeMnViUnlw7GoZ+L
         yEsHQma8lQv9/8/+YA+D6KKW0EDPaUfeFrJmjpCdoQG1gtOsdaeHqSJRLxPvf0/7hqcm
         mswywPvFxqRKuQwSayEx9+kE6WL6EJpB7XLNPLM/TZD496KY93qpAZTvGP3zv4y4JZZe
         YyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zY4+lp4pr5IsVeoihGvcsTPoBE5AuFSkdFxCMhcJJms=;
        b=48wQS3QXyDQjDbZQksR/7Y7qTfDDbg4mR+ee+JX4BqpcqlmzCE9gkKkS2nczCsLW25
         LKM+BqUBuDre2WxGiLZgnroApp4GsVBUxUmTzoD7BzbaSmx56JIiZmSKL0UYabsOXALb
         bPdxQ/MZOwgoNH+9bRcCPOZmoo5sRZlynfc/FxjP144DvYFiMcqGkI6sFFjy+6BKsTUp
         xP9B7qxZIXUWJ2sZ7eaYZ2GxICo8XgxAsTmG/X1ahARM31cLpaq1yu8UOmmWQr1eVoJ5
         WIo+zKyqYf7AkkKLnhQWNH1a5RA5Ks5lMoqJXFO4tKaCa/IYVcIIfy1LerTwGeliV43b
         SMNg==
X-Gm-Message-State: AOAM532O2A+qRgiW/HpBbQyITl8nXvMtU+1RS9ukHoFRysaxO1rJhEj9
	3EdIlG2XCfsgL2/3agwJ5MankqpO40E=
X-Google-Smtp-Source: ABdhPJwf7CDUtQoUsJZJbW+H7opSdPv6O/trfif88NXCUpZ/1Fc5o3TE5mQ+fD/nRNIDK1j03eO+Sg==
X-Received: by 2002:a05:600c:3b20:b0:397:6311:c0c7 with SMTP id m32-20020a05600c3b2000b003976311c0c7mr7914901wms.69.1654856355942;
        Fri, 10 Jun 2022 03:19:15 -0700 (PDT)
Received: from arch-luxoft.luxoft.com ([2a02:2f0e:300a:9e00:2481:9781:af4:1fd0])
        by smtp.gmail.com with ESMTPSA id f62-20020a1c3841000000b0039746638d6esm2437080wma.33.2022.06.10.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 03:19:15 -0700 (PDT)
From: Ariel Miculas <ariel.miculas@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/32: Fix FPR index validation and fpscr access
Date: Fri, 10 Jun 2022 13:18:51 +0300
Message-Id: <20220610101851.246538-1-ariel.miculas@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 10 Jun 2022 21:09:20 +1000
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
Cc: Ariel Miculas <ariel.miculas@belden.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ariel Miculas <ariel.miculas@belden.com>

On PPC32, there are two indexes used for each FPR.

The last two indexes into the imaginary address space "USER area" are
used to access fpscr instead of the FPR registers. Fix the validation
condition so that the access of the FPR array doesn't overflow into
fpscr.  Also split the access of fpscr into high part and low part.

Signed-off-by: Ariel Miculas <ariel.miculas@belden.com>
---
 arch/powerpc/kernel/ptrace/ptrace-fpu.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-fpu.c b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
index 09c49632bfe5..eabc05b439f1 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-fpu.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
@@ -17,14 +17,18 @@ int ptrace_get_fpr(struct task_struct *child, int index, unsigned long *data)
 
 #ifdef CONFIG_PPC_FPU_REGS
 	flush_fp_to_thread(child);
-	if (fpidx < (PT_FPSCR - PT_FPR0)) {
-		if (IS_ENABLED(CONFIG_PPC32))
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		if ((fpidx >> 1) < (PT_FPSCR - PT_FPR0) >> 1)
 			// On 32-bit the index we are passed refers to 32-bit words
 			*data = ((u32 *)child->thread.fp_state.fpr)[fpidx];
 		else
+			*data = ((u32 *)&child->thread.fp_state.fpscr)[fpidx & 1];
+	} else {
+		if (fpidx < (PT_FPSCR - PT_FPR0))
 			memcpy(data, &child->thread.TS_FPR(fpidx), sizeof(long));
-	} else
-		*data = child->thread.fp_state.fpscr;
+		else
+			*data = child->thread.fp_state.fpscr;
+	}
 #else
 	*data = 0;
 #endif
@@ -43,14 +47,18 @@ int ptrace_put_fpr(struct task_struct *child, int index, unsigned long data)
 
 #ifdef CONFIG_PPC_FPU_REGS
 	flush_fp_to_thread(child);
-	if (fpidx < (PT_FPSCR - PT_FPR0)) {
-		if (IS_ENABLED(CONFIG_PPC32))
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		if ((fpidx >> 1) < (PT_FPSCR - PT_FPR0) >> 1)
 			// On 32-bit the index we are passed refers to 32-bit words
 			((u32 *)child->thread.fp_state.fpr)[fpidx] = data;
 		else
+			((u32 *)&child->thread.fp_state.fpscr)[fpidx & 1] = data;
+	} else {
+		if (fpidx < (PT_FPSCR - PT_FPR0))
 			memcpy(&child->thread.TS_FPR(fpidx), &data, sizeof(long));
-	} else
-		child->thread.fp_state.fpscr = data;
+		else
+			child->thread.fp_state.fpscr = data;
+	}
 #endif
 
 	return 0;
-- 
2.36.1

