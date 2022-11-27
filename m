Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A525639AC2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 14:02:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpfh25Fvz3fF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 00:02:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gTzOu+3X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gTzOu+3X;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpNZ63x0z3f3P
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:22 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id o1so3510750pfp.12
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJIbJAVTTif0O1cr23iUnFe372CAkFEGc2PteNjak9A=;
        b=gTzOu+3XOf9UK6mQ4MZKHjFGCKiEXRdrc/GZGFrq6EWM1Hmgw3qDjIFvLDGAWIYRYR
         NCLEnx3eUp/FjyTMF2DREekW+ysnMH7adhKIN5BYuz0k/mS1bp7cLFSmd7pO4krxf+vr
         o0RGCFqKf+pW189Qv0XmU2CdNf2FlAr3Gv/CEYud9PicvqpCzhhgQfyEtxgK/gxAunk/
         ssh7TZxHSRcDPCu7Fjk1nqhKJ9IwEAw1siNVIEXvyTZr/HYn9nSSpDGYCFWB06fWijln
         hT53Jhb6UEjHdjFZIh8KUxqiXHashteG9l+rCA1YjvB2YLcUw4JH/xJHg5JrvLV/ogJO
         IKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJIbJAVTTif0O1cr23iUnFe372CAkFEGc2PteNjak9A=;
        b=y6IPfT+MKGBDiOWVh6g1PaVztKypNrUZYyWv8TVqdrmG1gTo4y9vwqVrtTMOs3a0qg
         yN1HKGak55oPptHWlu/eO4lmao2SY/wJPkSk0bp+Ju2XWB1FkchtZykuZ8CKUNvOR/ns
         RSeEqSYkEqsQ3E/ZUCV09TDLR60uSP6W5cHPoN/fJFNvnSh8XXvTFUretSyj/yExS7Fr
         faw1DlnxIjg4oMDPIMp2gdm3s3a5cxg1/5Qy9DxwZ3NfYX7Jdh2M9ax/BIuVXbYw2B01
         2u2xnUKHfweVj3gIPTqUgNUDSaMjrSQX08uJNC5xYuNkzjM1hBh2mSMBQ2MRcGhY0AOO
         8nGw==
X-Gm-Message-State: ANoB5pnmRLZC2XGZ1hsK/tUtbza6CRZ7E1jIQWRlHcH61+YT2ylnxZF/
	AM1ufJp2orgThKCQyF3u3oQtoVE1zk4uWQ==
X-Google-Smtp-Source: AA0mqf5S+OCql1IPB/EUsEzTwP0IJZKrtR+keTeOfmdRzWqTW0caZfv6VV7RH1Xj1TW+yB1eP9sbKg==
X-Received: by 2002:a62:be16:0:b0:56b:676e:1815 with SMTP id l22-20020a62be16000000b0056b676e1815mr28402740pff.66.1669553420288;
        Sun, 27 Nov 2022 04:50:20 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:50:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/17] powerpc: copy_thread add a back chain to the switch stack frame
Date: Sun, 27 Nov 2022 22:49:38 +1000
Message-Id: <20221127124942.1665522-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127124942.1665522-1-npiggin@gmail.com>
References: <20221127124942.1665522-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stack unwinders need LR and the back chain as a minimum. The switch
stack uses regs->nip for its return pointer rather than lrsave, so
that was not set in the fork frame, and neither was the back chain.
This change sets those fields in the stack.

With this and the previous change, a stack trace in the switch or
interrupt stack goes from looking like this:

  Oops: Exception in kernel mode, sig: 5 [#1]
  LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
  Modules linked in:
  CPU: 3 PID: 90 Comm: systemd Not tainted
  NIP:  c000000000011060 LR: c000000000010f68 CTR: 0000000000007fff
  [ ... regs ... ]
  NIP [c000000000011060] _switch+0x160/0x17c
  LR [c000000000010f68] _switch+0x68/0x17c
  Call Trace:

To this:

  Oops: Exception in kernel mode, sig: 5 [#1]
  LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
  CPU: 0 PID: 93 Comm: systemd Not tainted
  NIP:  c000000000011060 LR: c000000000010f68 CTR: 0000000000007fff
  [ ... regs ... ]
  NIP [c000000000011060] _switch+0x160/0x17c
  LR [c000000000010f68] _switch+0x68/0x17c
  Call Trace:
  [c000000005a93e10] [c00000000000cdbc] ret_from_fork_scv+0x0/0x54
  --- interrupt: 3000 at 0x7fffa72f56d8
  NIP:  00007fffa72f56d8 LR: 0000000000000000 CTR: 0000000000000000
  [ ... regs ... ]
  NIP [00007fffa72f56d8] 0x7fffa72f56d8
  LR [0000000000000000] 0x0
  --- interrupt: 3000

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 27956831fa5d..6cb3982a11ef 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1781,7 +1781,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	 * do some house keeping and then return from the fork or clone
 	 * system call, using the stack frame created above.
 	 */
+	((unsigned long *)sp)[STACK_FRAME_LR_SAVE] = (unsigned long)f;
 	sp -= STACK_SWITCH_FRAME_SIZE;
+	((unsigned long *)sp)[0] = sp + STACK_SWITCH_FRAME_SIZE;
 	kregs = (struct pt_regs *)(sp + STACK_SWITCH_FRAME_REGS);
 	p->thread.ksp = sp;
 
-- 
2.37.2

