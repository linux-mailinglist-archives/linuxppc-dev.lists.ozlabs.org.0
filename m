Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3528F1D2487
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 03:16:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Mtrb4pDFzDqkJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 11:15:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o6lWwHVv; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Mtpb0T9fzDqjM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 11:13:40 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id p12so1532415qtn.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 18:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CJ+UkeznHslDwbeNLir1XZYmQ/0y7hByJcBrFbnYXW4=;
 b=o6lWwHVvKWLLPT7TEcuduO3YEEsc+lC/rZyYhJaHfVLFfMvHyOhX7N65rKnsxIloP7
 6rX4IXEdoPcyUvJqcwsBTGKiqqXZewnlGfD8nqhdYd0BrIXVExU6L1cElhuJQKhTEWnh
 J0u5M7EGH1QOhJjfnUCQoF9urNo6ZdmmN+Hp8NwsKzCqewLsH+Nh/3Qp2/fjJxz9CTe4
 760QALIU5mkk8yLsu6PbBEOX4qGNsdYtcip5Yz/j7b0myP1IEtBjYtCgZTDJzPz9uccI
 drGOYqL6Wc9QtyjeVCoJHTwFZvSBcYGDWrraB8J3Rjp2ddsbP/ZZpqNTqsKwDU6M7JKl
 HrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CJ+UkeznHslDwbeNLir1XZYmQ/0y7hByJcBrFbnYXW4=;
 b=tD6knA4eYi8G0qecMWIWwD6fEtshM+C5mvz4100N/SP0jraxusdhYe/yFTT/nvZ9rO
 4vBXyoZRIrUHUDu5v0r+F3g283dKc1/Mhtz6ClpR6uzxF9uCC+Gt0AYDIKxxMzA2BeZ9
 FOPOCgE2soJFB8rBPunRbdMQ26srNUqY+k82V+1h8Dc4J/MWWv0r0Kh7DP6lISDwAFEO
 Dh4ae/XtQGedzrNBj+nNit3ZzyrbhYzE6cLVVmLEIkrbMVd/QncfAQOZD/UbELk1vW0+
 PcqWB6yM9cthf2CsACG6LmZlWSyVON+K65DuBE78y4l0s+zVgBB7WYUp/QsRXhx0MGuC
 7Alw==
X-Gm-Message-State: AOAM530x6sNTfcMRDch61TI7K08Xpq+ATMkH51BBKOsZX/ahkKJBf+Hm
 3DQznrF197a3HJKhTzpGIZY=
X-Google-Smtp-Source: ABdhPJxQEwtFG+28xOW3LWQtXRD1PCQfChKK6arCzdVJfZ7rBg8XyKCa3dyAhOMM51nPcdhl65BTXQ==
X-Received: by 2002:ac8:688c:: with SMTP id m12mr1972781qtq.238.1589418816846; 
 Wed, 13 May 2020 18:13:36 -0700 (PDT)
Received: from LeoBras.aus.stglabs.ibm.com
 (179-125-143-209.dynamic.desktop.com.br. [179.125.143.209])
 by smtp.gmail.com with ESMTPSA id j11sm1308314qkk.33.2020.05.13.18.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 18:13:36 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Nicholas Piggin <npiggin@gmail.com>,
 Leonardo Bras <leobras.c@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Nadav Amit <namit@vmware.com>
Subject: [PATCH v3 0/2] Implement reentrant rtas call
Date: Wed, 13 May 2020 22:12:43 -0300
Message-Id: <20200514011245.127174-1-leobras.c@gmail.com>
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

---
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

