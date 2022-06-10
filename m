Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B69E0546593
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:30:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJfS4qHsz3gQs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:30:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JLgr0kTD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=ariel.miculas@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JLgr0kTD;
	dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKGsX1Z7Gz3brR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 20:09:34 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id k19so35831039wrd.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FBM65lOE0QCie1fmK0Dd5CZzENs7e6mZHCY1s9tNCus=;
        b=JLgr0kTD1+Pfn86kyTGt+BZ7QYhM9EPNu4OaAaK3IMPyDg3solmPi4PwoLol34y+Oq
         cSTlvs5FKYPBq/2mP1lrBRpfCGtd6MFQRx3p+q/zb78Cv6feApnc9M27wPTAHMzcvfgi
         znKSTaLGzHXptMPAvNZyYrLPD4oLabCOMFBIZE5z3jGXbQIlQJWbsURdMq1/j4t0Uwgh
         hekiSHCG6mc9mkWyiPeGOVFC2Kk33nNHmtKQZNg7fYT8hbRFK2WZlpAHCsqu7sWEhKsJ
         2L3xvRVQbY3CrLtgQqr/yIdUNyGUsj8nB5CMw3Dj1PBtm6omf3FHf//g3FSQUppLniYQ
         RKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FBM65lOE0QCie1fmK0Dd5CZzENs7e6mZHCY1s9tNCus=;
        b=tAHlne/OkN+uNVO+ccTXIipfWYpqA6eoos/cGj1+0+RguQnQxDPVP6hQMJRgcNGQIV
         YX10qXu5wqKXGLbyYSUrcaiiI4853eZqGnQX59PDtFJ8eF9bc2B4qxUoTiYaqm6TijGI
         /MXIiy3eB4mTQwDbrhPEOAEK22f6jk/IHPKehPQ2pPNSutlE2gYX46sDvVfI21Lhtczu
         X3a7gK1oWpQFGGhmn3UNQiCkqOGpUR2viie4Ram5t2a/3aIay9U0/ayfo4ydfpPajl4/
         X3P0P87SFaI/HPdb16Py0F2rD9MXUNMtrPf67wua0LaMCV5aEaRlNsFc4s8KMWk/7n5N
         A7jw==
X-Gm-Message-State: AOAM5338pmvD12qLF0WIh2CtKrMmvCwrZXHNr2Jvg30mZc1437QX6TYO
	Tn7ZlJKsVXRBBybKAPxeDFea/rfqBzg=
X-Google-Smtp-Source: ABdhPJyesuFob34J6DQzDgHeih7ls8OE8R4gjX3wI3NBSjEJ4UpQ6UxyoMPQZfEpD5BsIQuGufdlmA==
X-Received: by 2002:a05:6000:12c8:b0:213:584:3d7 with SMTP id l8-20020a05600012c800b00213058403d7mr43461512wrx.125.1654855766835;
        Fri, 10 Jun 2022 03:09:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:300a:9e00:2481:9781:af4:1fd0])
        by smtp.gmail.com with ESMTPSA id l14-20020adfe58e000000b002117ef160fbsm26913767wrm.21.2022.06.10.03.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 03:09:26 -0700 (PDT)
From: Ariel Miculas <ariel.miculas@gmail.com>
X-Google-Original-From: Ariel Miculas <ariel.miculas@belden.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/32: Fix FPR index validation and fpscr access
Date: Fri, 10 Jun 2022 13:09:19 +0300
Message-Id: <20220610100919.240777-1-ariel.miculas@belden.com>
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

