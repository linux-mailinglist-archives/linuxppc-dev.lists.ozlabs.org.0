Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 389722A98FE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 17:03:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSQCj2mxjzDrPD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 03:03:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZiPkFdL2; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSQ7d2S37zDrJY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 02:59:40 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id r10so1239882pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 07:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBVfM+qy5o6YRpi2SshIsCxJs7nSH1+mXtqtGkaceu8=;
 b=ZiPkFdL2dGeGjFRU6SHNE/gRul3ti3mNdq4e90ZKw1v3sHBayEnJxQRv5Ky2GPt1ui
 GvBO5at1+tnvVps60DvBJjoxhU+IBLa1BT7fmfZbZyIf1myyro0c8iCULQkAB1JNwfCr
 Jljmqivm+rfu7DdQnzOzvlkvYEj2PtvHNqmhCs9C+PXsMa2AOpD53xk0WK+Gyn7s0MXH
 vx3pmosJbX5IOakgZoRyAFYUVOjX7sq6qa/fCsPDnIiswNiWbvLGUWlSQhjNKzvPaOFm
 ojnzcQG+h7t3zGuExbFOemID2197C2nuZF4PIQo08jJOcqMv9ByOzlDP1e8AXQ5qPDEL
 pasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBVfM+qy5o6YRpi2SshIsCxJs7nSH1+mXtqtGkaceu8=;
 b=HXkcD0NielHjklePvtv/mI/9qcWA+8oMLOqbs6YMTu77hAVpgcCpSPvDGUp4Rv6RrF
 SGdDgjDxQ5DWfvsZBOT4DjWOvdrObzIbYf/OqYJ2GSg4efKAC0Nc+LPemkKO8DJN65zv
 D5EiB2v5ZkyLpCO5uV7V+3Wx07jCZ2iPNWTbIvHpdxT6A88kQ2AhIyH20BdL44cQeC7z
 QHW6UjIeiUsJ3tqUvEwuwV9vVQYAQL1zm1s5Uv1YUu9cgLOOElfRdOdpKLFVsScn2Eu0
 wcP+xcZvu85uANCjQ8x92x/mWBmHHeQ4rNtLq6KadpiLTBL0D246Y2zUKnCprGSKNI5p
 f1ug==
X-Gm-Message-State: AOAM530CxhTqfO3vBsFEI9/xU73WQk0+xfosOs6EDKL/Q876mKuMx9nz
 eOPTTKl0fPFhP66ZqzqvgFoQCD3M9go=
X-Google-Smtp-Source: ABdhPJw0zlcjQXvALI43FWtvuRAgYGMNliDkSf4hdVZQTRCRhxbolaLQM4BmLKaX0+tP/tW0XY13DQ==
X-Received: by 2002:a17:90a:7089:: with SMTP id g9mr276670pjk.4.1604678378113; 
 Fri, 06 Nov 2020 07:59:38 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id g7sm2899536pjl.11.2020.11.06.07.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 07:59:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/9] powerpc/64s: syscall real mode entry use mtmsrd
 rather than rfid
Date: Sat,  7 Nov 2020 01:59:21 +1000
Message-Id: <20201106155929.2246055-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201106155929.2246055-1-npiggin@gmail.com>
References: <20201106155929.2246055-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Have the real mode system call entry handler branch to the kernel
0xc000... address and then use mtmsrd to enable the MMU, rather than use
SRRs and rfid.

Commit 8729c26e675c ("powerpc/64s/exception: Move real to virt switch
into the common handler") implemented this style of real mode entry for
other interrupt handlers, so this brings system calls into line with
them, which is the main motivcation for the change.

This tends to be slightly faster due to avoiding the mtsprs, and it also
does not clobber the SRR registers, which becomes important in a
subsequent change. The real mode entry points don't tend to be too
important for performance these days, but it is possible for a
hypervisor to run guests in AIL=0 mode for certian reasons.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S       | 6 ++++++
 arch/powerpc/kernel/exceptions-64s.S | 9 +++------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 479fb58844fa..bd8cc7a214d3 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -225,6 +225,12 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_emulate)
 	b	system_call_vectored_common
 #endif
 
+	.balign IFETCH_ALIGN_BYTES
+	.globl system_call_common_real
+system_call_common_real:
+	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
+	mtmsrd	r10
+
 	.balign IFETCH_ALIGN_BYTES
 	.globl system_call_common
 system_call_common:
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 1db6b3438c88..ea7bb7cc0db1 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1901,12 +1901,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 	HMT_MEDIUM
 
 	.if ! \virt
-	__LOAD_HANDLER(r10, system_call_common)
-	mtspr	SPRN_SRR0,r10
-	ld	r10,PACAKMSR(r13)
-	mtspr	SPRN_SRR1,r10
-	RFI_TO_KERNEL
-	b	.	/* prevent speculative execution */
+	__LOAD_HANDLER(r10, system_call_common_real)
+	mtctr	r10
+	bctr
 	.else
 	li	r10,MSR_RI
 	mtmsrd 	r10,1			/* Set RI (EE=0) */
-- 
2.23.0

