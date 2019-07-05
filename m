Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7066960D37
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 23:42:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gSxf2FWTzDqrj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 07:42:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="ueW/6hnI"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gSbp71TfzDqfZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 07:27:18 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id cl9so5100107plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jul 2019 14:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axYWSsfHOMfaO2yOVtRa+b2+I5xlDCKGZqyLe1hpOGQ=;
 b=ueW/6hnIfsmUUgH/fRZbFjX9Y7mp9bhRbTfhCJjvQ5TeduQVwfDHiG6DgSUi8Npi0B
 cjZfQ8zhSAqgMeBOsv8D+nQKmNSaFjGiLHvzrJtg27zJbCzFfxT1tN7NdadcDdDzcTFK
 1Otvzy9gdEM/mVToLE9p4kHv3VtbVUjGa4dTKkabkyNNGdn9YeFI+Un7ss1tLsHPXWPx
 AEdB8JRhRfOOrSScNJnVEUFFW2W8+7z6CU6pLhZNTqnmfbqxDyDxBzZtDEF7kCo6hNsv
 fhVw966BBvRQT9YuUCAGSEu2To0xeSgyp3PYYQ7vpFjkJBV8eLvoHA1tO9e4HaAr5v7F
 3iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axYWSsfHOMfaO2yOVtRa+b2+I5xlDCKGZqyLe1hpOGQ=;
 b=ZkT21xW1icPiz79IqkLumzbbO2qNRTI0090HqhJZV6h3lX3fYde2iqJRjmdfydXv/w
 wWL3qY+WduJLf+aLmeA9Y6LnzSDn5b1pBf3YAGMpHj5atZlGXUpod+weu8WY/UR9yjPg
 22secJQVgJC031QADGR7S5plfG7UwsPhw/F2gihB0Txwf8wsA9Uwbm7rRQ8UPWYtoNFm
 CoemJpngE3Gx3TgPaX0Q3YTt1VUNjBFYrEnY/EGwRwmzmjjvl0YdKwdICs5d1CWpWKKd
 QN/ltxPib2qnJ90IdzNjFg/+TUDixCNTKx+7r7YVkBJVOWYkt4VBR6V83lNJZJTXxJWN
 KB1g==
X-Gm-Message-State: APjAAAXv3qJC9/rZMkf5zfgRmULMl4lJmPmfPvIum2MH/f961swFFwGj
 GaH2m3BTNtRBrAF3JKyUFYFKmp7wzBE1nA==
X-Google-Smtp-Source: APXvYqwbyGMt0K9SNiXl5mKM9MXzShkZmNSe1NT2RO3Y6uRb6BLqJxKfIk4eEo/iHX2QQuHfxnCDHA==
X-Received: by 2002:a17:902:2868:: with SMTP id
 e95mr7383480plb.319.1562362036934; 
 Fri, 05 Jul 2019 14:27:16 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.217.222])
 by smtp.gmail.com with ESMTPSA id o13sm9321389pje.28.2019.07.05.14.27.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 14:27:16 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v3 7/7] powerpc/64s: save r13 in MCE handler (simulator workaroud)
Date: Sat,  6 Jul 2019 02:56:47 +0530
Message-Id: <20190705212647.21750-8-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705212647.21750-1-santosh@fossix.org>
References: <20190705212647.21750-1-santosh@fossix.org>
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

After debugging we see that the first instruction at vector 200 is skipped by
the simulator, due to which r13 is not saved. Adding a nop at 0x200 fixes the
issue.

(This commit is needed for testing this series. This should not be taken
into the tree)
---
 arch/powerpc/kernel/exceptions-64s.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 73ba246ca11d..8e43abb2a744 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -255,6 +255,7 @@ EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 	 * some code path might still want to branch into the original
 	 * vector
 	 */
+	nop
 	SET_SCRATCH0(r13)		/* save r13 */
 	EXCEPTION_PROLOG_0(PACA_EXMC)
 BEGIN_FTR_SECTION
-- 
2.20.1

