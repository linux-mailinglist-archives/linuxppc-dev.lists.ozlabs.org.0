Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1E759B11F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 03:01:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M9HHs6p2Cz3dB4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 11:01:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AXPnI89T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AXPnI89T;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M9HHD1bc0z3bdN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 11:00:54 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id r16so9179545wrm.6
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 18:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=a4jNHFHiClDdq/v49nsMbA8I7HwKAy8R6hrK4YLcETg=;
        b=AXPnI89Txz85BoWVYAFCMtMPbQcGFSRW9UnKTu6iScu4HS0WqlGWSD9JtoSlTj70EP
         mZiagAyiMBkanQ7JZ7mBCJueCAvdX0+/UkZ5D5VPGYEnOaqT1tXH7H/xw0T3hQwXlC4b
         vl3orITND69HNkgeXNp56lMh5QVGVWA5jAYDKERihJAGkVIx2trU73w2i7dh/BNDJG82
         Ep9cwajpDz7iBIOmLCm7ODT7JtrbCTr+rduE9jiQ8cfpX/PEGHjP6Aai1P6VFTImcO66
         kcYtnqjcC7Pzq/JWMdynbGRSoowQgEZszBEltfRK6NHhRu5PdcmWfqmcUQpXi9TGhooV
         Wu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=a4jNHFHiClDdq/v49nsMbA8I7HwKAy8R6hrK4YLcETg=;
        b=BF/fiCPaPpK53wNBdKHR01S5YHCj+16HvdyZ/xJgrNY575OCqFIEeLOXQjj65q0plN
         kdgE5Z8UuPaLIOzOeCBErhXq0jjzUmQuzAoEvv4B2zvcZilLK0MTxl7wqv8qWrphnSlV
         46xYDdVk+XWJKyqC66NWR28vKifsX+IVIQLLDTkm3GkLp4aEX+8HSOswTQmqis/fyhu9
         1cSdAu7ANNWSfBL1hRFRyGVSGEZiRKNrcNDaVfTnJyTVqL4Qa33gLPsxsGdr3Btw1Is5
         orW+pbqWM0nF2nkAobvbcMdYKOjxYp6y0O0kl/Z3PKykkZr47jXprno98CyTkWnOroWN
         rAcw==
X-Gm-Message-State: ACgBeo11P1AizoM0ZiA+MKfVoQV1GgEUC4bVUQnDfnigCbR7yZuPcpoW
	8FJrromraBf5sPtJqkrY2xI=
X-Google-Smtp-Source: AA6agR5zLE9kQ65fXHG6rjjR2ZpdPg7mUbxbgX8Wf/KmxTkJHk+7GWOjEPvnFelVMh/hMofl4rxKbg==
X-Received: by 2002:adf:f208:0:b0:225:25e6:c964 with SMTP id p8-20020adff208000000b0022525e6c964mr7555213wro.531.1661043647749;
        Sat, 20 Aug 2022 18:00:47 -0700 (PDT)
Received: from localhost.localdomain ([185.192.68.223])
        by smtp.gmail.com with ESMTPSA id r38-20020a05600c322600b003a2e92edeccsm12148515wmp.46.2022.08.20.18.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 18:00:44 -0700 (PDT)
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	atrajeev@linux.vnet.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	lance@osuosl.org,
	paulmck@kernel.org,
	rcu@vger.kernel.org
Subject: [PATCH linux-next] powerpc: disable sanitizer in irq_soft_mask_set
Date: Sun, 21 Aug 2022 09:00:30 +0800
Message-Id: <20220821010030.97539-1-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In ppc, compiler based sanitizer will generate instrument instructions
around statement WRITE_ONCE(local_paca->irq_soft_mask, mask):

   0xc000000000295cb0 <+0>:	addis   r2,r12,774
   0xc000000000295cb4 <+4>:	addi    r2,r2,16464
   0xc000000000295cb8 <+8>:	mflr    r0
   0xc000000000295cbc <+12>:	bl      0xc00000000008bb4c <mcount>
   0xc000000000295cc0 <+16>:	mflr    r0
   0xc000000000295cc4 <+20>:	std     r31,-8(r1)
   0xc000000000295cc8 <+24>:	addi    r3,r13,2354
   0xc000000000295ccc <+28>:	mr      r31,r13
   0xc000000000295cd0 <+32>:	std     r0,16(r1)
   0xc000000000295cd4 <+36>:	stdu    r1,-48(r1)
   0xc000000000295cd8 <+40>:	bl      0xc000000000609b98 <__asan_store1+8>
   0xc000000000295cdc <+44>:	nop
   0xc000000000295ce0 <+48>:	li      r9,1
   0xc000000000295ce4 <+52>:	stb     r9,2354(r31)
   0xc000000000295ce8 <+56>:	addi    r1,r1,48
   0xc000000000295cec <+60>:	ld      r0,16(r1)
   0xc000000000295cf0 <+64>:	ld      r31,-8(r1)
   0xc000000000295cf4 <+68>:	mtlr    r0

If there is a context switch before "stb     r9,2354(r31)", r31 may
not equal to r13, in such case, irq soft mask will not work.

This patch disable sanitizer in irq_soft_mask_set.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Dear PPC developers

I found this bug when trying to do rcutorture tests in ppc VM of
Open Source Lab of Oregon State University following Paul E. McKenny's guidance.

console.log report following bug:

[  346.527467][  T100] BUG: using smp_processor_id() in preemptible [00000000] code: rcu_torture_rea/100^M
[  346.529416][  T100] caller is rcu_preempt_deferred_qs_irqrestore+0x74/0xed0^M
[  346.531157][  T100] CPU: 4 PID: 100 Comm: rcu_torture_rea Tainted: G        W          5.19.0-rc5-next-20220708-dirty #253^M
[  346.533620][  T100] Call Trace:^M
[  346.534449][  T100] [c0000000094876c0] [c000000000ce2b68] dump_stack_lvl+0xbc/0x108 (unreliable)^M
[  346.536632][  T100] [c000000009487710] [c000000001712954] check_preemption_disabled+0x154/0x160^M
[  346.538665][  T100] [c0000000094877a0] [c0000000002ce2d4] rcu_preempt_deferred_qs_irqrestore+0x74/0xed0^M
[  346.540830][  T100] [c0000000094878b0] [c0000000002cf3c0] __rcu_read_unlock+0x290/0x3b0^M
[  346.542746][  T100] [c000000009487910] [c0000000002bb330] rcu_torture_read_unlock+0x30/0xb0^M
[  346.544779][  T100] [c000000009487930] [c0000000002b7ff8] rcutorture_one_extend+0x198/0x810^M
[  346.546851][  T100] [c000000009487a10] [c0000000002b8bfc] rcu_torture_one_read+0x58c/0xc90^M
[  346.548844][  T100] [c000000009487ca0] [c0000000002b942c] rcu_torture_reader+0x12c/0x360^M
[  346.550784][  T100] [c000000009487db0] [c0000000001de978] kthread+0x1e8/0x220^M
[  346.552555][  T100] [c000000009487e10] [c00000000000cd54] ret_from_kernel_thread+0x5c/0x64^M

After 12 days debugging, I finally narrow the problem to irq_soft_mask_set.

I am a beginner, hope I can be of some beneficial to the community ;-)

Thanks
Zhouyi
--
 arch/powerpc/include/asm/hw_irq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 26ede09c521d..a5ae8d82cc9d 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -121,7 +121,7 @@ static inline notrace unsigned long irq_soft_mask_return(void)
  * for the critical section and as a clobber because
  * we changed paca->irq_soft_mask
  */
-static inline notrace void irq_soft_mask_set(unsigned long mask)
+static inline notrace __no_kcsan __no_sanitize_address void irq_soft_mask_set(unsigned long mask)
 {
 	/*
 	 * The irq mask must always include the STD bit if any are set.
-- 
2.34.1

