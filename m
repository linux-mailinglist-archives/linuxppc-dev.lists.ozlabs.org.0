Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C71F1D5EE5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 07:24:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49PDGY1FrDzDr5k
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 15:24:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OVKlP/qq; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49PDDf2l4hzDr2s
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 15:22:25 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id f83so4874707qke.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 22:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iGai4hOvcQ9X3rtvTu3xZbDmHCYKbPB2sPDJuutDN9E=;
 b=OVKlP/qqpZdmsf2tmTqEGRjDtoIzlzp7QDEAlSZJozB+bfjOEpv2EZPc3iSRlE4eFx
 BP0ajzFElW7XkBk+fLUuMj1p3nG4JmNugl+oNFgMuMZP+LqBNl+J8j0+dvhd+EcRuenv
 B9YgNDoRY/mLNlhBn32GouMCwFWokD2ahgaarRmnZMKqZkvqz5pRdkuF4Wk7eGzgQJ46
 cb+f7/mqxuobpmyl3yoik2ji4SH65u1D6wigyqNngMPq6buJunXhJOD10O5rVTmeiQg/
 h90TqTsrSIp9zmMET66Cmp+L3ZzZH4iqNv8US8oaP75AJB2DBQP3pU/bMimx5yEAqyC8
 7ZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iGai4hOvcQ9X3rtvTu3xZbDmHCYKbPB2sPDJuutDN9E=;
 b=jeHpbatimuKR2lpfcUDRQMe7GmsT79aYgiiS/9uguwn8JwUuAgANanLi24qwk1lg15
 GxkI0DRl0cjLFX98SrV20kIbs9vcoh2xeaV2z5ZptYKi0+nisltQMkRSiEj59AMool8X
 g5LYCYXOk3/A01HCWmU+m8r6ttZILTZMvJnEbz0VlxufBJ3yMDCiuKGhmehDOPBkj9Bg
 G1E95SmDC7VkOhXhR9GLKNHx9jhpsaXNvhGV+RbXlQI9sgMVuiUVvH8qAJQc+kRz/p6x
 ZYVvpUASMEhdQTsygLEbB1fY9pys+vMTcB1EPXOvMOf+utm0bbWfb7Nb1OzBkHmmtNsE
 +Xyg==
X-Gm-Message-State: AOAM533EjoY82RVIalbACeryF3S/hdF4sN8VmE6skb50HmnH+MO07FfM
 6G69oC4BsRHW8XXV1omxJvY=
X-Google-Smtp-Source: ABdhPJyyPFsAmnSIf30NB7b8EAHziLzGnBKxyPDTj9U1kLHfm2i97HvSHeIU3NSBesChQIvVmdQ9fw==
X-Received: by 2002:a37:4fd8:: with SMTP id d207mr6259763qkb.345.1589606541964; 
 Fri, 15 May 2020 22:22:21 -0700 (PDT)
Received: from LeoBras.aus.stglabs.ibm.com
 (179-125-143-209.dynamic.desktop.com.br. [179.125.143.209])
 by smtp.gmail.com with ESMTPSA id u20sm3866721qtj.97.2020.05.15.22.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 22:22:21 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Nicholas Piggin <npiggin@gmail.com>,
 Leonardo Bras <leobras.c@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Nadav Amit <namit@vmware.com>
Subject: [PATCH v5 0/2] Implement reentrant rtas call
Date: Sat, 16 May 2020 02:21:35 -0300
Message-Id: <20200516052137.175881-1-leobras.c@gmail.com>
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

