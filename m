Return-Path: <linuxppc-dev+bounces-16212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNd5MxImc2kAswAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 08:41:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F0071E34
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 08:41:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy8xL2zFSz2yFd;
	Fri, 23 Jan 2026 18:40:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769154054;
	cv=none; b=i4VVOotgks+bcWMFss84N1JIcmmdcr9pqtLm9Pfe84wsvfXlirSRRmlq43vccsDLXFbGZRYZFWawHkjlY2yYix9k5LpYdDxNowWc/QdQhCYWCSvKa+20cj7xiuvcsqXe3n4EZ/uttp4GVpi9n7kTYbgSxbwKGF6FCS88OmdxBnn3uYtrQqJAvbXFo0cajwDvveaHJ35v1zsTekXmntopMCeKDcegmLWWC/Mte0jmjRLrCHnHGgdPP2BlVuTx+MocCohIlf2jpNTokAtf3fD51LUK1CtUHQWU1kz+CM1IqfhDvBzV2WDg79K2zx+2xfM+TjrcLUBN77d3II0+un4G5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769154054; c=relaxed/relaxed;
	bh=oSMy7jSCHlk+7wrf49CRz3G29HirD/p7Ikh3c9+dpPE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dU1aziceVt494vKUSdX5UE1VaWG/czXTgknpisJ5LzvbYoIq6lYaWVehsExrYWdY9a6aQeR3AhmCf/mJwcmuVYq1W1ovKIzg0JTzXyIcBwJMH+a1fOBMT973XtrfDi0xI85N+LcoruRR8xolknqV63H1g4nrODG+2834xlwEVewsHPrI6SjU8rjppxO2+6Mkr3buviwnIsZdwpOP+XwxMVhBuXWdNNMzTRBjXpIBQBY1fKMsfK2vd7fgP0Cr96w2ZhNnG4f7JUGrN0aOKouaPjwvjFYfHa+fSnpZuFfXOPI6J+MHUwF8DnBVC0OFRm/Qz1IHCAvjUHdjB4sASs6UMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c5DGdIp9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c5DGdIp9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy8xK4r2kz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 18:40:53 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60MKGTLv028566;
	Fri, 23 Jan 2026 07:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=oSMy7jSCHlk+7wrf4
	9CRz3G29HirD/p7Ikh3c9+dpPE=; b=c5DGdIp9PrQX6Iqjuh9fqgrKnGgMCOE3M
	j5nM1Y/f9xFbJQletZ7Wm6w+BpXJgyQY06qsJX2vHfuqIKoA86c/Y/HqCp7oEFh7
	WqME/IURWq6h7MAEXN8clm43e6/f1sAk5Bil2E5XoZS0uJvp5r4Ol2a2B3xp3JnF
	iW660kkmmdeHoLZn9xj9qbaBM5oxyBP/DSNwyQ2rnPL1o8tE7epzDkPaPYCdpYKg
	LXpBycyFDkJdxpMM0A5n0EOkWRqeX0w6r/Lg7HFKL9lWp7SJtBW/rqry2OyH15lR
	U0HTLBJgsyfBavACkrfS3SIr09rwDAoV3fJkcmZYhMQFaeWRFHwMA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt60f273g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 07:40:14 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60N7blOu012630;
	Fri, 23 Jan 2026 07:40:13 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bt60f273c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 07:40:13 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60N7IDRQ016627;
	Fri, 23 Jan 2026 07:40:12 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4brn4yfxhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 07:40:11 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60N7e7cq53215628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 07:40:08 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D21E82004E;
	Fri, 23 Jan 2026 07:40:07 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1785220043;
	Fri, 23 Jan 2026 07:40:02 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.124.222.171])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 07:40:01 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, ryabinin.a.a@gmail.com, glider@google.com,
        andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        ruanjinjie@huawei.com, sshegde@linux.ibm.com,
        akpm@linux-foundation.org, charlie@rivosinc.com, deller@gmx.de,
        ldv@strace.io, macro@orcam.me.uk, segher@kernel.crashing.org,
        peterz@infradead.org, bigeasy@linutronix.de, namcao@linutronix.de,
        tglx@linutronix.de, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kasan-dev@googlegroups.com
Subject: [PATCH v4 4/8] powerpc: Introduce syscall exit arch functions
Date: Fri, 23 Jan 2026 13:09:12 +0530
Message-ID: <20260123073916.956498-5-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123073916.956498-1-mkchauras@linux.ibm.com>
References: <20260123073916.956498-1-mkchauras@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=WMdyn3sR c=1 sm=1 tr=0 ts=697325de cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=K2hBjdrW4GR3aseOdFMA:9
X-Proofpoint-GUID: xep7M4Oh8a1rGfznsv4u2iiH8eUKcOEV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NSBTYWx0ZWRfXx40x3gp6YmGp
 /n+EX5nrzbWHZJjzNXIgWFFE8C4t64lv3W/C/8dlUbLJ3BtXg97OaFkQlDxxhmsA27TTmbGasYj
 2Sv+k60S6zpdCpLEiXxHfeLBwlGt8VOcKXzfF+6TVS5kf/hcLEc11rTbkvotcHRz9Ej2kbuHrh+
 vSMtg1PqB/Knu2ucjIilw45ACtNsKOWjr3fAOSiuWf5yl57BQykPnOIzqvh1GXzqLxfsoSJQWqZ
 nwn1f8hM2xwrDWLMb4COrkeSfCluqXsIHNIebOqOu4F4Gu713sLwtIiKQUyQF2wN4anWV9n8PCe
 1du01vB+rXeLMZseiLbVbxLSHy6aILFGiMeoxkeSNhaiRHcTf6SXHyN42r0Tdj5bb2hx5BxLJws
 JcMFMFvkZTMpi21g3SR/rBiIJE6Wr4ejb1AJFkuCdkETYftOiARJXcUY/aYXSivJUggkc49Z/w4
 x8na4j0EXSluT5ttQgA==
X-Proofpoint-ORIG-GUID: RAxMs7eKSHxnsMBpZ30WVDw9ZnroqVmc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601230055
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:oleg@redhat.com,m:kees@kernel.org,m:luto@amacapital.net,m:wad@chromium.org,m:mchauras@linux.ibm.com,m:thuth@redhat.com,m:ruanjinjie@huawei.com,m:sshegde@linux.ibm.com,m:akpm@linux-foundation.org,m:charlie@rivosinc.com,m:deller@gmx.de,m:ldv@strace.io,m:macro@orcam.me.uk,m:segher@kernel.crashing.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:namcao@linutronix.de,m:tglx@linutronix.de,m:mark.barnett@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,google.com,arm.com,redhat.com,amacapital.net,chromium.org,huawei.com,linux-foundation.org,rivosinc.com,gmx.de,strace.io,orcam.me.uk,kernel.crashing.org,infradead.org,linutronix.de,lists.ozlabs.org,vger.kernel.org,googlegroups.com];
	FORGED_SENDER(0.00)[mkchauras@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16212-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.833];
	RCPT_COUNT_TWELVE(0.00)[31];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid]
X-Rspamd-Queue-Id: 32F0071E34
X-Rspamd-Action: no action

From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>

Add PowerPC-specific implementations of the generic syscall exit hooks
used by the generic entry/exit framework:

 - arch_exit_to_user_mode_work_prepare()
 - arch_exit_to_user_mode_work()

These helpers handle user state restoration when returning from the
kernel to userspace, including FPU/VMX/VSX state, transactional memory,
KUAP restore, and per-CPU accounting.

Additionally, move check_return_regs_valid() from interrupt.c to
interrupt.h so it can be shared by the new entry/exit logic.

No functional change is intended with this patch.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/entry-common.h | 49 +++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index 837a7e020e82..ff0625e04778 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -6,6 +6,7 @@
 #include <asm/cputime.h>
 #include <asm/interrupt.h>
 #include <asm/stacktrace.h>
+#include <asm/switch_to.h>
 #include <asm/tm.h>
 
 static __always_inline void booke_load_dbcr0(void)
@@ -123,4 +124,52 @@ static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
 
 #define arch_enter_from_user_mode arch_enter_from_user_mode
 
+static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
+						  unsigned long ti_work)
+{
+	unsigned long mathflags;
+
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
+		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+		    unlikely((ti_work & _TIF_RESTORE_TM))) {
+			restore_tm_state(regs);
+		} else {
+			mathflags = MSR_FP;
+
+			if (cpu_has_feature(CPU_FTR_VSX))
+				mathflags |= MSR_VEC | MSR_VSX;
+			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
+				mathflags |= MSR_VEC;
+
+			/*
+			 * If userspace MSR has all available FP bits set,
+			 * then they are live and no need to restore. If not,
+			 * it means the regs were given up and restore_math
+			 * may decide to restore them (to avoid taking an FP
+			 * fault).
+			 */
+			if ((regs->msr & mathflags) != mathflags)
+				restore_math(regs);
+		}
+	}
+
+	check_return_regs_valid(regs);
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	local_paca->tm_scratch = regs->msr;
+#endif
+	/* Restore user access locks last */
+	kuap_user_restore(regs);
+}
+
+#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
+
+static __always_inline void arch_exit_to_user_mode(void)
+{
+	booke_load_dbcr0();
+
+	account_cpu_user_exit();
+}
+
+#define arch_exit_to_user_mode arch_exit_to_user_mode
+
 #endif /* _ASM_PPC_ENTRY_COMMON_H */
-- 
2.52.0


