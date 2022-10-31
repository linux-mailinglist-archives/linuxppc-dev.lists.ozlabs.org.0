Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E158F613025
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:07:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12kD57fRz3fJX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:07:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TAmZPd6I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TAmZPd6I;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12SB0cGTz3cJX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:22 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id u6so9832341plq.12
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/LN27NBFxF398waiUnst7q+mm4Lj7tC7QtWnQZ+cDU=;
        b=TAmZPd6INA3+PXEutwGElcpAXVnGnLDVw38DkSB0BF99TtoFsi5DiTkM9pUdJpFUAt
         zjfVklEmrk4PLFca8KN1lYm3VYmtvFMjP/hE6frqHvOTSaGW8mxAw+rEDnIVhpwkfAXX
         s46sDG0avw9e43K3hInn4FmnebyREQQsrhI7d7mKwr0OvSIDJkRKL2D1ctzieC2Vqotq
         ZbKQtaBrQd+CGW59GvFePnNCUp85JGL/n5iq1C7FaO9u3+75jp35rEONCMcs0ooZFRZd
         fBcF8gfHRawLhTvVIT3hd8Ihve7rQ+NHqpYcpp5/5hflk99aNwFSj2Mqd/hWx3weCeIw
         P2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/LN27NBFxF398waiUnst7q+mm4Lj7tC7QtWnQZ+cDU=;
        b=BVJZ/Ygb9Y9dGHEs5sQGz8DX09GuR81dqzozx7Iimgoxpgcr4YeftoxaSL60UL3ZHN
         tDRhBKGMExsaoEbkvUvjcdpjyXGvN62R+iYQy6jBoFMQ44/EjcA+mRHjjYKiwXNhiLzN
         tQXG9bRUNPXWrg7ARdiaKTfiENLbPrhjkSaTYSCSmcX1785E6UXjc5k1YI0SXPxQU88B
         hVK5XV2+nboB7AKRmv/iSeHATYowzdBUuIQX7pp27ZxiJW4z2x0EpXI/j7npmLAxaf3F
         d3+k2XC6MKlP8Pp7K4RvqoTTvdPHbt/iv1mTdOGYWXIMS7C/gA9290Dgj931mDd9+sWV
         TY9g==
X-Gm-Message-State: ACrzQf39N9cyIXOjfsqclKasI16p7OAeb3niMiMDKcce0nVcz+vvW9Ku
	VXnGJfOxDRHjaO/fMsRrv66GJLrCFeY=
X-Google-Smtp-Source: AMsMyM6DthlLpsTzCjbaxA/fvaxpEQwm2jqtli88abfuZys+MoRPObM2Tqf6haK2B81KdtPEFGiptA==
X-Received: by 2002:a17:903:22cb:b0:186:a8ae:d107 with SMTP id y11-20020a17090322cb00b00186a8aed107mr12628150plg.119.1667195721180;
        Sun, 30 Oct 2022 22:55:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 13/19] powerpc: copy_thread add a back chain to the switch stack frame
Date: Mon, 31 Oct 2022 15:54:34 +1000
Message-Id: <20221031055440.3594315-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221031055440.3594315-1-npiggin@gmail.com>
References: <20221031055440.3594315-1-npiggin@gmail.com>
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
that was not filled in, and neither was the back chain.

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

