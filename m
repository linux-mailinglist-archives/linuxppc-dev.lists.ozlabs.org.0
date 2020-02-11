Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 129011589E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 07:00:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GsZ43MJyzDqGG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 17:00:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Jea2t7Sx; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gs3W6SPDzDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:37:11 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id j17so751602pjz.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 21:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SwaMwZKcMmVHXoGGrTp6uh8O/gB56OwcABr8TDUPUvw=;
 b=Jea2t7SxAVuDsCDEW2xvagz1AJOgKUszLhUM+cWhGJK5aUNrceYc/rWE8aFHAQWYmD
 Q519GBbd0Twx9MJHMw7ik5GeLKyI3XUJSFnnj7CRdwUZD5qCGVZhQRp1wOqODlcYzQMQ
 zVr52akHBq5OZOMkwkDVMeGFCMyIB2ik0p/B9ysnm9SF1/Lnz164lEqtTRGMpT7PnKur
 h5Pi8a5eE93AdZp2lIiBxfXIdUxRAxYtTNiK9Clho5kBPb3S6VCf/1Uyu6LA5My6hOn/
 sK9lEayaQeK8uSuBENGF81w74SoX647VGSq5+kdC5N+Ac4BV3sH5HrdrRZqQClMZ7zNe
 Ivhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SwaMwZKcMmVHXoGGrTp6uh8O/gB56OwcABr8TDUPUvw=;
 b=VB1lSQOf2Vb8ToYdoGNEoM4iupIN/U6IDnObtjG+iI1odgqhzfnTGwlQMpQI3xcpV5
 zMtRs10PjFJBBHKqxwBcIKpxmYm9+tXkBrR7bej9YGKSOoW0KPtk4aCT/gtxD9fjiYg7
 PooddOT3Mun/7BzvxR/NyYv7DVD7KEQQEAhXF/ubcuNZHc1EaLH9+gWIcvGMsdqulWxk
 UPeFXvzIcPCY4roPjVC9Lh5MKLktb4ewORQIXkqtyJi4TKgSBg1ghvEUgBEcrJJNqWhq
 Jp4qvEmYcwGVnXjms2DHH1a7eqZZzIfiQwe2wjEkHkCae6/NKZpNAbfv0zottRVzM2Fb
 n1Zw==
X-Gm-Message-State: APjAAAUH/EOdTH7bJTnzElT7pGsF7hNc6ACCIpDkCF//D+4V1DJrHxb0
 mZY70c4VHVPxWAgQ4Ayt1rI2Zt1Oxt22bg==
X-Google-Smtp-Source: APXvYqz5QPUkzl7qQ6lk4hqr7wZRWS7MIQ2vK6pB+5VME72PSXVy1svGdZttyvyJzyhH6u/np0URrg==
X-Received: by 2002:a17:902:bb88:: with SMTP id
 m8mr1581292pls.63.1581399428601; 
 Mon, 10 Feb 2020 21:37:08 -0800 (PST)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a19sm1189025pju.11.2020.02.10.21.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:37:08 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/13] powerpc/hw_breakpoints: Initial support for prefixed
 instructions
Date: Tue, 11 Feb 2020 16:33:54 +1100
Message-Id: <20200211053355.21574-13-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211053355.21574-1-jniethe5@gmail.com>
References: <20200211053355.21574-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, mpe@ellerman.id.a,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently when getting an instruction to emulate in
hw_breakpoint_handler() we do not load the suffix of a prefixed
instruction. Ensure we load the suffix if the instruction we need to
emulate is a prefixed instruction.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: Rename sufx to suffix
---
 arch/powerpc/kernel/hw_breakpoint.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 3a7ec6760dab..c69189641b05 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -243,15 +243,15 @@ dar_range_overlaps(unsigned long dar, int size, struct arch_hw_breakpoint *info)
 static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
 			     struct arch_hw_breakpoint *info)
 {
-	unsigned int instr = 0;
+	unsigned int instr = 0, suffix = 0;
 	int ret, type, size;
 	struct instruction_op op;
 	unsigned long addr = info->address;
 
-	if (__get_user_inatomic(instr, (unsigned int *)regs->nip))
+	if (__get_user_instr_inatomic(instr, suffix, (unsigned int *)regs->nip))
 		goto fail;
 
-	ret = analyse_instr(&op, regs, instr, PPC_NO_SUFFIX);
+	ret = analyse_instr(&op, regs, instr, suffix);
 	type = GETTYPE(op.type);
 	size = GETSIZE(op.type);
 
@@ -275,7 +275,7 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event *bp,
 		return false;
 	}
 
-	if (!emulate_step(regs, instr, PPC_NO_SUFFIX))
+	if (!emulate_step(regs, instr, suffix))
 		goto fail;
 
 	return true;
-- 
2.17.1

