Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A961D8BC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 01:46:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qwdd52XhzDqnf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 09:46:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZCUbSwtP; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QwZ82T7KzDqkx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 09:43:28 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id f189so12498789qkd.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 16:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s/BUTFWn5tjRK73c5c6DPEmUZHTVf4XstVliLRILe5w=;
 b=ZCUbSwtPCuF4NIgCIGuEqn70DPQqUz32xVhcv4TDzPsN/k3+ij3z61pgBvxWGkJ9fB
 ntR1/FjZyAeOL04hWOzK6/cxhIPOhwjlHEVxZDHqPblGHkP8szZuHk1kIKXI6R4qsOFY
 BNOLuJvxUHv05n05OBIenTnitjMrwZhXn3r04JXXGSgm/bP05n6dvfT3pOvU3jNoYLrE
 1O4KwyBo/N2xD8c2tCWr/aMMiTsT5HHbaqig/SqC20NBtDJsIucaOP9SU0yDHsIcK7K6
 iaMEBtUlnHbwejUnbu4EPiAfv8lI6fRx4/ow/8L5xPlaUFbLEK695m4GgkxwQoXg5ryy
 PkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s/BUTFWn5tjRK73c5c6DPEmUZHTVf4XstVliLRILe5w=;
 b=rRxuWzL6TiLOOd3Uew0FDMTQndZ0P60hmbEhpe5p8Qw3RR/+p/VUrRGfh65lDZ5ZNi
 OrVXJIXWCFMkicKj4WSuxJki9Zylaj2hoHLcxlz1WOulBRji5FjKWq1MApVAUuD174rM
 80ikSM5yMFaebS6sQggLlb06XW3TdCbsxYKjTwkDQWlx48RDQIF3Xp05LcrLr/DPJeS5
 AhDVNz+LiXkBn5eySB3PUPfyb952AEnCuYKBqgkAlolgKSk3SN03lCnehkwEd6J9QROE
 lFCrWhpL8uxQpcKMpgZAE+eJjnzg7xBJt0xQhYYlfhwjpPT76on+QvYmY/ns7mNvRfZe
 2MhA==
X-Gm-Message-State: AOAM532Od5wwWeGUPEN3vk6gmse7xmvmkcv/AKKLjDtLIiy0sbWZXEVs
 8prGK13mJv5NeWswgxe8bR8=
X-Google-Smtp-Source: ABdhPJyT8AKxWIpnr+Aac7V1r5WQmrYgwAqTbmGOqqa0qW7AR0PzEgVaFSLZiKr6BStMnrw33p02oQ==
X-Received: by 2002:a37:7904:: with SMTP id u4mr18362247qkc.297.1589845404813; 
 Mon, 18 May 2020 16:43:24 -0700 (PDT)
Received: from LeoBras.aus.stglabs.ibm.com
 (177-131-65-239.dynamic.desktop.com.br. [177.131.65.239])
 by smtp.gmail.com with ESMTPSA id 145sm9135772qkm.110.2020.05.18.16.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 16:43:24 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Nicholas Piggin <npiggin@gmail.com>,
 Leonardo Bras <leobras.c@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Nadav Amit <namit@vmware.com>
Subject: [PATCH v6 0/2] Implement reentrant rtas call
Date: Mon, 18 May 2020 20:42:43 -0300
Message-Id: <20200518234245.200672-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch 2 implement rtas_call_reentrant() for reentrant rtas-calls:
"ibm,int-on", "ibm,int-off",ibm,get-xive" and  "ibm,set-xive",
according to LoPAPR Version 1.1 (March 24, 2016).

For that, it's necessary that every call uses a different
rtas buffer (rtas_args). Paul Mackerras suggested using the PACA
structure for creating a per-cpu buffer for these calls.

Patch 1 was necessary to make PACA have a 'struct rtas_args' member.

Reentrant rtas calls can be useful to avoid deadlocks in crashing,
where rtas-calls are needed, but some other thread crashed holding
the rtas.lock.

This is a backtrace of a deadlock from a kdump testing environment:

  #0 arch_spin_lock
  #1  lock_rtas () 
  #2  rtas_call (token=8204, nargs=1, nret=1, outputs=0x0)
  #3  ics_rtas_mask_real_irq (hw_irq=4100) 
  #4  machine_kexec_mask_interrupts
  #5  default_machine_crash_shutdown
  #6  machine_crash_shutdown 
  #7  __crash_kexec
  #8  crash_kexec
  #9  oops_end

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Special thanks to Nick Piggin, who have been helping me a lot with
this series!

---
Changes since v5:
- Renames new paca member from reentrant_args to rtas_args_reentrant
- Compile out rtas_args_reentrant if CONFIG_PPC_RTAS=n
- new_rtas_args() is skipped (returns NULL) if CPU_FTR_HVMODE

Changes since v4:
- Insted of having the full buffer on PACA, adds only a pointer and
  allocate it during allocate_paca(), making sure it's in a memory
  range available for RTAS (32-bit). (Thanks Nick Piggin!)

Changes since v3:
- Adds protection from preemption and interruption

Changes since v2:
- Fixed build failure from ppc64e, by including spinlock_types.h on 
  rtas-types.h
- Improved commit messages

Changes since v1:
- Moved buffer from stack to PACA (as suggested by Paul Mackerras)
- Added missing output bits
- Improve documentation following kernel-doc format (as suggested by
  Nathan Lynch)


Leonardo Bras (2):
  powerpc/rtas: Move type/struct definitions from rtas.h into
    rtas-types.h
  powerpc/rtas: Implement reentrant rtas call

 arch/powerpc/include/asm/paca.h       |   2 +
 arch/powerpc/include/asm/rtas-types.h | 126 ++++++++++++++++++++++++++
 arch/powerpc/include/asm/rtas.h       | 119 +-----------------------
 arch/powerpc/kernel/rtas.c            |  42 +++++++++
 arch/powerpc/sysdev/xics/ics-rtas.c   |  22 ++---
 5 files changed, 183 insertions(+), 128 deletions(-)
 create mode 100644 arch/powerpc/include/asm/rtas-types.h

-- 
2.25.4

