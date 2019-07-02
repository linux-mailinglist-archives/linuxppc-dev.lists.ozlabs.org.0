Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C195C8DE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 07:37:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCgF32F0zDqCD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:37:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="EmpbRWay"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCHY2QnHzDqJ7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:20:25 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 19so7671053pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yzt9XRFLbxP/LrXAtCfoTzO098TseTzVOH+EfWjGDpI=;
 b=EmpbRWayGZDos32dyS/J+VEpgt5Q8jrsvkOQuD9wC5a9ITo8nJw9DGn6sAxSlECCQ6
 ZfEMXfonP1ABNDolQkIHsHDzeog80hw6r8clIG/+BzUanhCfRrAVMOPmHvxEyrGMKWm4
 TfGXtueZgCNX4r6d60Pnwi7hjluNBNfBb+69r6rHSY2l2PjMzvwW7IbPCoey2lW4RJCk
 vRGUHviEPHazgo5FFNzIcoE5CZbcV+Uwi7Y727IJxYG+zzz5cz3SSZAFfOJA+C2sW/GB
 pbtYRCv9VGavmW3eJR+JuQqY3kotDakmmbmsagXkVCNrDqapoAfitD97q4GS2xGt5tdn
 rcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yzt9XRFLbxP/LrXAtCfoTzO098TseTzVOH+EfWjGDpI=;
 b=NnqGQOAXJdDL13k870usYcoPMSWgQZCd6blthHYl3typif8ZLR+qK536TMT9HcB4zl
 iao5sbjBqG3wpW/nvkcaJKWQ/mR5TGN5SGTtYOVFjfD0Sm6qdu6LgSJ1FAVSocpjPMKT
 xsI4BZ7lvSQbcv4sK0hZpGahvy4Hpx17OfDCjcXPG8BKSCIqhfix6qEI0F0ITYP9C1j1
 603kzFGDPocHp8o2D2lTQRuTKBFAeLQeWeqYLYZM0vyJ0iLoDkihTB9qfdOTNNTQw2yC
 t1HIAONMlTBkmYvUD553rX3kNtD8GnNvSU0r+uzEIvGQ/3ZD3W/kyrRNIhSrLNWOIOsl
 jP/Q==
X-Gm-Message-State: APjAAAUpiqN4xWGtO1uiRs39p11GdhQ0iQPXMYwm8n0t7Xabs2ZraP4o
 bLjjE6gi0eVM3aBsWEPm8OCXjnPWd+bzZw==
X-Google-Smtp-Source: APXvYqysBgsXbPVHa9yJjCloh7fWyfD+Tmodc3S42n4y9VA3+kryJ2T9XjyJs6jEGHViZN7zoE3L5Q==
X-Received: by 2002:a63:6cc3:: with SMTP id
 h186mr28212296pgc.292.1562044822498; 
 Mon, 01 Jul 2019 22:20:22 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.67])
 by smtp.gmail.com with ESMTPSA id t9sm1106898pji.18.2019.07.01.22.20.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:20:21 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v2 12/12] powerpc/64s: Save r13 in machine_check_common_early
Date: Tue,  2 Jul 2019 10:49:32 +0530
Message-Id: <20190702051932.511-13-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702051932.511-1-santosh@fossix.org>
References: <20190702051932.511-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Reza Arbab <arbab@linux.ibm.com>

Testing my memcpy_mcsafe() work in progress with an injected UE, I get
an error like this immediately after the function returns:

BUG: Unable to handle kernel data access at 0x7fff84dec8f8
Faulting instruction address: 0xc0080000009c00b0
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Radix MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
Modules linked in: mce(O+) vmx_crypto crc32c_vpmsum
CPU: 0 PID: 1375 Comm: modprobe Tainted: G           O      5.1.0-rc6 #267
NIP:  c0080000009c00b0 LR: c0080000009c00a8 CTR: c000000000095f90
REGS: c0000000ee197790 TRAP: 0300   Tainted: G           O       (5.1.0-rc6)
MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88002826  XER: 00040000
CFAR: c000000000095f8c DAR: 00007fff84dec8f8 DSISR: 40000000 IRQMASK: 0
GPR00: 000000006c6c6568 c0000000ee197a20 c0080000009c8400 fffffffffffffff2
GPR04: c0080000009c02e0 0000000000000006 0000000000000000 c000000003c834c8
GPR08: 0080000000000000 776a6681b7fb5100 0000000000000000 c0080000009c01c8
GPR12: c000000000095f90 00007fff84debc00 000000004d071440 0000000000000000
GPR16: 0000000100000601 c0080000009e0000 c000000000c98dd8 c000000000c98d98
GPR20: c000000003bba970 c0080000009c04d0 c0080000009c0618 c0000000001e5820
GPR24: 0000000000000000 0000000000000100 0000000000000001 c000000003bba958
GPR28: c0080000009c02e8 c0080000009c0318 c0080000009c02e0 0000000000000000
NIP [c0080000009c00b0] cause_ue+0xa8/0xe8 [mce]
LR [c0080000009c00a8] cause_ue+0xa0/0xe8 [mce]

To fix, ensure that r13 is properly restored after an MCE.

This commit is needed for testing this series, this is a possible simulator
bug.
---
 arch/powerpc/kernel/exceptions-64s.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 311f1392a2ec..932d8d05892c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -265,6 +265,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
 TRAMP_REAL_BEGIN(machine_check_common_early)
+	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_1(PACA_EXMC, NOTEST, 0x200)
 	/*
 	 * Register contents:
-- 
2.20.1

