Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6584978C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 06:59:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhzpV3nRGz3cY3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 16:59:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TzhHPxiy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TzhHPxiy; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhzmL70CQz302S
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 16:57:54 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id h23so14374505pgk.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 21:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K4UGhOlvE88N1S5cU0LFS2HJSd8wREBKqQwlVTnpg+c=;
 b=TzhHPxiycmtzBgSrm53Y7P0HofAMeW6++AuQakzGWptN0XInY9TL2pYZOL4PBC6vOp
 qPiIrfQSxXHaQVt1JunfxT4lrIcNxg9Tm5BIFIOQlJNiG2wqRrhyu1wwd6/P7yhkSNIY
 mpIDKcLx0dZKeF/1Eg4QObk2VH5Vpi6WJWGbra0SWUoVZ1SepmAL5LdzQKEWf1vq0rxY
 nm31KlgBAvjtpGXUP+R/CjKvoFngX8hR7U9zgavQ8xsL2rTE1SCRYVx5r06dAPSwi+++
 paMZDhf80f231ukZwZEwwqunS7VcH5RmsbLQpS5h8/TQtfFofckOKkJVlstSuZQU9KZl
 QN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K4UGhOlvE88N1S5cU0LFS2HJSd8wREBKqQwlVTnpg+c=;
 b=3WufaXU06XSsy0lwEIKuyXwq57uUEKtGc6t4TOvDyC1Ra8sgBCovM50tPwBW0v9ya6
 Lq62SLbm7ZkozjEKgFrsB2ElHTQe+rT2fjqzJB80DDwQnGhBAjkBK4CKztsadHxsBE7m
 kpY9AiYanYpLKDuf14hoTkVb/PoBpmJafgYc7ZvHJkgr9dvigft+WmmeSA6yFyiZmLTd
 Din+S83qtnD3GH3jsypVRyzog6nTpL3uXPlVs12hNhsVZXKJcdHkDYZswjutFhx+NU9t
 advD3w769uURZsInqPadSGC18XW2VXNsBy7q66yrGJZRyR2VggBMogbJT6m11ZmZy1uF
 jE1w==
X-Gm-Message-State: AOAM532R22iC0Rp/z7lqcdxoAlm/Rhk7QHo/2mpnXTNVtZOW/9Rfv633
 y8HqlWkyFEidFBeklPYTaN4RolfORpY=
X-Google-Smtp-Source: ABdhPJzoHn0CCdlc3wReLoXSFi26FBk0YtDFzWmtxQqlUKkk8CB3yW2YNexupEopxS9EwXGUvrSL1g==
X-Received: by 2002:a62:cf43:0:b0:4c7:e70:c163 with SMTP id
 b64-20020a62cf43000000b004c70e70c163mr12787687pfg.48.1643003872507; 
 Sun, 23 Jan 2022 21:57:52 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id f8sm15045859pfe.67.2022.01.23.21.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 21:57:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/uprobes: Reject uprobe on a system call
 instruction
Date: Mon, 24 Jan 2022 15:57:41 +1000
Message-Id: <20220124055741.3686496-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220124055741.3686496-1-npiggin@gmail.com>
References: <20220124055741.3686496-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Per the ISA, a Trace interrupt is not generated for a system call
[vectored] instruction. Reject uprobes on such instructions as we are
not emulating a system call [vectored] instruction anymore.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
[np: Switch to pr_info_ratelimited]
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 1 +
 arch/powerpc/kernel/uprobes.c         | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 9675303b724e..8bbe16ce5173 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -411,6 +411,7 @@
 #define PPC_RAW_DCBFPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | ___PPC_RB(b) | (4 << 21))
 #define PPC_RAW_DCBSTPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | ___PPC_RB(b) | (6 << 21))
 #define PPC_RAW_SC()			(0x44000002)
+#define PPC_RAW_SCV()			(0x44000001)
 #define PPC_RAW_SYNC()			(0x7c0004ac)
 #define PPC_RAW_ISYNC()			(0x4c00012c)
 
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index c6975467d9ff..3779fde804bd 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -41,6 +41,12 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
 	if (addr & 0x03)
 		return -EINVAL;
 
+	if (ppc_inst_val(ppc_inst_read(auprobe->insn)) == PPC_RAW_SC() ||
+	    ppc_inst_val(ppc_inst_read(auprobe->insn)) == PPC_RAW_SCV()) {
+		pr_info_ratelimited("Rejecting uprobe on system call instruction\n");
+		return -EINVAL;
+	}
+
 	if (cpu_has_feature(CPU_FTR_ARCH_31) &&
 	    ppc_inst_prefixed(ppc_inst_read(auprobe->insn)) &&
 	    (addr & 0x3f) == 60) {
-- 
2.23.0

