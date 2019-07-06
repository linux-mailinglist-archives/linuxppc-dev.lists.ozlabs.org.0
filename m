Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE5F60FB1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 11:58:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gnGX4N8rzDqfY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 19:58:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="rVhRABMD"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gn1f4ql3zDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 19:47:18 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id t16so5297189pfe.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Jul 2019 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axYWSsfHOMfaO2yOVtRa+b2+I5xlDCKGZqyLe1hpOGQ=;
 b=rVhRABMDpD9T5JamWIhVaEFYlbCkwNUrQof/mr0LiGMs7uAfClhKF0Z2AVQ5FM40py
 OPGjR3bcOrfu/LaMHNJDrDTRRrbspUm6iPQfdGMRbgQdEiI658gvgNJ5K3d5wr6tscTG
 izU2A7QMFDiHmYCuAJ1Hq7xKT+mW6gsHdYP+DHAzmxBQbG2JOis6lsHHmYgA2xgeKdeO
 ywX6GxytPxyl2XlwyMfKDFfJkCQUiFI9FAOq5GLWOl1UmXKZ/rEr7YocmKNeK4D8xlPh
 3wfafUyt85xCeVeydCGMMAOofpok4feLA74G/f1ZZBO1B9dhtfNdtHyso9glUIuDkKiD
 c+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axYWSsfHOMfaO2yOVtRa+b2+I5xlDCKGZqyLe1hpOGQ=;
 b=QS93K3qzOF9Do2So+DJmHj5g/jtf9VFx+Hr4BtIx6RDsDibLM8e3QzxC0A4tdcZu4t
 2m6DpEghAE/Ixm6qPr8s7yzSvpfJ+9nBi1xAkML9r+5cWH2/5YOECC6qc3tLubUlglTN
 ac1gpdbmBvYbXzqqmDOegHIPhJp287h44iTaEGJQASFfrHYz8qMwjdRBTFGZev8Lrg5d
 bKVl7PSoB1UBclW5HifELcroTst/ntEmfyE38sa4xDV8xXVQCeyxHdFjtUYzljP6So3d
 1ckfqx8W+joR/OqiN6cma4Y2lwgkVwzYC0VJHy4pG3i99oPsU3tkG888ZUmGd2YrW0MD
 2Sjw==
X-Gm-Message-State: APjAAAUSQPR+hwo0HAOd1nH0HsF7K+wFLDm/9UAGjr64EM4Wc/1zTqOd
 NdSmLzg/WaDLv3PPFqeHVyq1sU+RpeCfYA==
X-Google-Smtp-Source: APXvYqx+QqRytYA6OUtQJqLO8iyrz6M6RPMCxSxEGTy7v2Yrt/C52pTJEt9I8lc6sFGtx4+OXOsZpQ==
X-Received: by 2002:a17:90a:b00b:: with SMTP id
 x11mr10853784pjq.120.1562406436503; 
 Sat, 06 Jul 2019 02:47:16 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.217.222])
 by smtp.gmail.com with ESMTPSA id p23sm13493091pfn.10.2019.07.06.02.47.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 02:47:16 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v4 6/6] powerpc/64s: save r13 in MCE handler (simulator workaroud)
Date: Sat,  6 Jul 2019 15:16:47 +0530
Message-Id: <20190706094647.15427-7-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190706094647.15427-1-santosh@fossix.org>
References: <20190706094647.15427-1-santosh@fossix.org>
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

