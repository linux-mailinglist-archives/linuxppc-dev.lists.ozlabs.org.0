Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C446029F16F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 17:29:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMW9s5pjQzDqMV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 03:29:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=gka0bYRv; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMVyp4Z5vzDqZH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 03:20:02 +1100 (AEDT)
Received: by mail-il1-x144.google.com with SMTP id v18so3654855ilg.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 09:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=NWjq0HGXwCwM8GCapDPc+3QPEzvanKKz5772LDgvbZo=;
 b=gka0bYRveej9ZhiSi4Yt7hSWu6vahcvEcAlyd+/Yd7fL/GPMc+OAygxKiLjex9jpzw
 SLYAsFTF3plKLxXTM1FGyV33ySDbn5P9uI4UAD7IUVh0F+3J7d2fZ1nGKFBxOpKPtaLe
 +G4HuDSfvyQs72evf42/51O33hPKdzd1U3Ph+EVoE26Zg44WyOKYwW64iE7sIhXRdydS
 IjFg+PlAWxPix1ZvvK3ibLtSERj9QJwC08P0HJiJfXbtx9M2MRkdVzdrOrUXPQnuzPI0
 zS7HCZa/BXSwYE/apQTMJS4TnVRKNHunYsEhVI7c7XSUJOSXcUIj9qYA9NSb3facumwd
 /bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=NWjq0HGXwCwM8GCapDPc+3QPEzvanKKz5772LDgvbZo=;
 b=Udrlb3mBNXnobWWVwTsRMS+IZ6OHEAJMiQAuMbbsNpjGzn53sG0bUKEM2c6JV5rdyN
 BVgKF/M54JwegD52bHoxaDC6biQf+QwFnxFvux8jg6JI5n8CRWhNTM6WVULMyk17TQ+X
 PeHhl2XcLXaNU83dRaxPINHl0eIQse9IlKWWST1KYhlb2sTw4jGE7ENZZzudCSjV3/uW
 iD+Xv82AJH4vdxPU/7V2AQ1enltJ07QPGceI2Or/NTKDID22vW7w0qEype7cKQ5A3HXK
 DOxotZKKUB1C+g8+jaPN/d2djeH4692kJlNWYg9iJATjFSij/ygAZ1fVCMwR8KUB0bRl
 L8zw==
X-Gm-Message-State: AOAM533S1WgFKVgHJ6Lhy9LRgLprsIvLrM/FYLZO0KksB2gNNuolOBwJ
 wYGrNB7K71WllJXy+gdEOXmyS4PN5lvRvg==
X-Google-Smtp-Source: ABdhPJx/0b1SqpkmlVz4B/yfgHJvCz3QK3INcSUAgPNUHtG0ixjFV1ehCuQwLWmwZL1xaa/3fLnlQg==
X-Received: by 2002:a92:c8c5:: with SMTP id c5mr3822156ilq.269.1603988397068; 
 Thu, 29 Oct 2020 09:19:57 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id n28sm3320645ila.52.2020.10.29.09.19.56
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 09:19:56 -0700 (PDT)
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] powerpc: add support for TIF_NOTIFY_SIGNAL
Message-ID: <7adea1eb-d193-9d31-6244-e8cd5b2084b2@kernel.dk>
Date: Thu, 29 Oct 2020 10:19:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wire up TIF_NOTIFY_SIGNAL handling for powerpc.

Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---

5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
for details:

https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/

As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
as that will enable a set of cleanups once all of them support it. I'm
happy carrying this patch if need be, or it can be funelled through the
arch tree. Let me know.

 arch/powerpc/include/asm/thread_info.h | 5 ++++-
 arch/powerpc/kernel/signal.c           | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 46a210b03d2b..53115ae61495 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -90,6 +90,7 @@ void arch_setup_new_exec(void);
 #define TIF_SYSCALL_TRACE	0	/* syscall trace active */
 #define TIF_SIGPENDING		1	/* signal pending */
 #define TIF_NEED_RESCHED	2	/* rescheduling necessary */
+#define TIF_NOTIFY_SIGNAL	3	/* signal notifications exist */
 #define TIF_SYSCALL_EMU		4	/* syscall emulation active */
 #define TIF_RESTORE_TM		5	/* need to restore TM FP/VEC/VSX */
 #define TIF_PATCH_PENDING	6	/* pending live patching update */
@@ -115,6 +116,7 @@ void arch_setup_new_exec(void);
 #define _TIF_SYSCALL_TRACE	(1<<TIF_SYSCALL_TRACE)
 #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
+#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
 #define _TIF_32BIT		(1<<TIF_32BIT)
 #define _TIF_RESTORE_TM		(1<<TIF_RESTORE_TM)
@@ -136,7 +138,8 @@ void arch_setup_new_exec(void);
 
 #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
 				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
-				 _TIF_RESTORE_TM | _TIF_PATCH_PENDING)
+				 _TIF_RESTORE_TM | _TIF_PATCH_PENDING | \
+				 _TIF_NOTIFY_SIGNAL)
 #define _TIF_PERSYSCALL_MASK	(_TIF_RESTOREALL|_TIF_NOERROR)
 
 /* Bits in local_flags */
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index d2c356f37077..a8bb0aca1d02 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -318,7 +318,7 @@ void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
 	if (thread_info_flags & _TIF_PATCH_PENDING)
 		klp_update_patch_state(current);
 
-	if (thread_info_flags & _TIF_SIGPENDING) {
+	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
 		BUG_ON(regs != current->thread.regs);
 		do_signal(current);
 	}
-- 
2.29.0

-- 
Jens Axboe

