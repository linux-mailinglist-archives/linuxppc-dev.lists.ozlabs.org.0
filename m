Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ABD374EA4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 06:40:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbLVd1F9Rz3c0Q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 14:40:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V2mar2OU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V2mar2OU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbLNQ6NDdz2yxT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 14:35:18 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1464YcZ6143938; Thu, 6 May 2021 00:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/xuNTIbov9Ffm0oQ2GraQ1nPQ+d3yhjs9T30ZtZjFHs=;
 b=V2mar2OUzL/Ad3CBBOMBwSJTLv1dmlEArDPM92pDvBm+h1khNwBBV0qmHwu2eTi7T+cz
 00c6XG3mxHBxKkfi2klz1m+emuE/TLrmsPgaslXrUANzIImY+hTg7YMZw05D0Q2tKmLe
 hEtEWZK0IPYyTjKzzE+0qBEm0g6XA0+iWkZqjvoSCqz4UaVVwP+HNM458iRPqVrvkRv2
 0DEPxYQ1X8lJCbaE4dqne+DqgrfIJsnhsC8pCB/9K5PwcaCwaeXKDngxL3UZNN72BZHw
 dzF1Ymptvb2hdGojIzy3RSV0Y7MEcpXyFnGtivqMnR+ngFQWURADx0cLw9+XAnY8mVYO FQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38c9dpg528-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 00:35:05 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1464XS8X027181;
 Thu, 6 May 2021 04:35:05 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 38beha15p4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 04:35:04 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1464Z3tg50332262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 04:35:03 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94EEEBE04F;
 Thu,  6 May 2021 04:35:03 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D80BBE053;
 Thu,  6 May 2021 04:35:02 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.160.168.222])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP;
 Thu,  6 May 2021 04:35:02 +0000 (GMT)
Received: from oc8246131445.ibm.com (localhost.localdomain [127.0.0.1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id F25BABC1EF4;
 Wed,  5 May 2021 23:34:53 -0500 (CDT)
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RESEND PATCH v4 11/11] powerpc: Use patch_instruction_unlocked() in
 loops
Date: Wed,  5 May 2021 23:34:52 -0500
Message-Id: <20210506043452.9674-12-cmr@linux.ibm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210506043452.9674-1-cmr@linux.ibm.com>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GDjFHpZA9hINx9STeAmEkqmIByPAF51R
X-Proofpoint-ORIG-GUID: GDjFHpZA9hINx9STeAmEkqmIByPAF51R
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_03:2021-05-05,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060029
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that patching requires a lock to prevent concurrent access to
patching_mm, every call to patch_instruction() acquires and releases a
spinlock. There are several places where patch_instruction() is called
in a loop. Convert these to acquire the lock once before the loop, call
patch_instruction_unlocked() in the loop body, and then release the lock
again after the loop terminates - as in:

	for (i =3D 0; i < n; ++i)
		patch_instruction(...); <-- lock/unlock every iteration

changes to:

	flags =3D lock_patching(); <-- lock once

	for (i =3D 0; i < n; ++i)
		patch_instruction_unlocked(...);

	unlock_patching(flags); <-- unlock once

Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>

---

v4:  * New to series.
---
 arch/powerpc/kernel/epapr_paravirt.c |   9 ++-
 arch/powerpc/kernel/optprobes.c      |  22 ++++--
 arch/powerpc/lib/feature-fixups.c    | 114 +++++++++++++++++++--------
 arch/powerpc/xmon/xmon.c             |  22 ++++--
 4 files changed, 120 insertions(+), 47 deletions(-)

diff --git a/arch/powerpc/kernel/epapr_paravirt.c b/arch/powerpc/kernel/e=
papr_paravirt.c
index 2ed14d4a47f59..b639e71cf9dec 100644
--- a/arch/powerpc/kernel/epapr_paravirt.c
+++ b/arch/powerpc/kernel/epapr_paravirt.c
@@ -28,6 +28,7 @@ static int __init early_init_dt_scan_epapr(unsigned lon=
g node,
 	const u32 *insts;
 	int len;
 	int i;
+	unsigned long flags;
=20
 	insts =3D of_get_flat_dt_prop(node, "hcall-instructions", &len);
 	if (!insts)
@@ -36,14 +37,18 @@ static int __init early_init_dt_scan_epapr(unsigned l=
ong node,
 	if (len % 4 || len > (4 * 4))
 		return -1;
=20
+	flags =3D lock_patching();
+
 	for (i =3D 0; i < (len / 4); i++) {
 		struct ppc_inst inst =3D ppc_inst(be32_to_cpu(insts[i]));
-		patch_instruction((struct ppc_inst *)(epapr_hypercall_start + i), inst=
);
+		patch_instruction_unlocked((struct ppc_inst *)(epapr_hypercall_start +=
 i), inst);
 #if !defined(CONFIG_64BIT) || defined(CONFIG_PPC_BOOK3E_64)
-		patch_instruction((struct ppc_inst *)(epapr_ev_idle_start + i), inst);
+		patch_instruction_unlocked((struct ppc_inst *)(epapr_ev_idle_start + i=
), inst);
 #endif
 	}
=20
+	unlock_patching(flags);
+
 #if !defined(CONFIG_64BIT) || defined(CONFIG_PPC_BOOK3E_64)
 	if (of_get_flat_dt_prop(node, "has-idle", NULL))
 		epapr_has_idle =3D true;
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optpro=
bes.c
index cdf87086fa33a..deaeb6e8d1a00 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -200,7 +200,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kp=
robe *op, struct kprobe *p)
 	struct ppc_inst branch_op_callback, branch_emulate_step, temp;
 	kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
 	long b_offset;
-	unsigned long nip, size;
+	unsigned long nip, size, flags;
 	int rc, i;
=20
 	kprobe_ppc_optinsn_slots.insn_size =3D MAX_OPTINSN_SIZE;
@@ -237,13 +237,20 @@ int arch_prepare_optimized_kprobe(struct optimized_=
kprobe *op, struct kprobe *p)
 	/* We can optimize this via patch_instruction_window later */
 	size =3D (TMPL_END_IDX * sizeof(kprobe_opcode_t)) / sizeof(int);
 	pr_devel("Copying template to %p, size %lu\n", buff, size);
+
+	flags =3D lock_patching();
+
 	for (i =3D 0; i < size; i++) {
-		rc =3D patch_instruction((struct ppc_inst *)(buff + i),
-				       ppc_inst(*(optprobe_template_entry + i)));
-		if (rc < 0)
+		rc =3D patch_instruction_unlocked((struct ppc_inst *)(buff + i),
+						ppc_inst(*(optprobe_template_entry + i)));
+		if (rc < 0) {
+			unlock_patching(flags);
 			goto error;
+		}
 	}
=20
+	unlock_patching(flags);
+
 	/*
 	 * Fixup the template with instructions to:
 	 * 1. load the address of the actual probepoint
@@ -322,6 +329,9 @@ void arch_optimize_kprobes(struct list_head *oplist)
 	struct ppc_inst instr;
 	struct optimized_kprobe *op;
 	struct optimized_kprobe *tmp;
+	unsigned long flags;
+
+	flags =3D lock_patching();
=20
 	list_for_each_entry_safe(op, tmp, oplist, list) {
 		/*
@@ -333,9 +343,11 @@ void arch_optimize_kprobes(struct list_head *oplist)
 		create_branch(&instr,
 			      (struct ppc_inst *)op->kp.addr,
 			      (unsigned long)op->optinsn.insn, 0);
-		patch_instruction((struct ppc_inst *)op->kp.addr, instr);
+		patch_instruction_unlocked((struct ppc_inst *)op->kp.addr, instr);
 		list_del_init(&op->list);
 	}
+
+	unlock_patching(flags);
 }
=20
 void arch_unoptimize_kprobe(struct optimized_kprobe *op)
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature=
-fixups.c
index 1fd31b4b0e139..2c3d413c9d9b3 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -123,6 +123,7 @@ static void do_stf_entry_barrier_fixups(enum stf_barr=
ier_type types)
 	unsigned int instrs[3], *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
=20
 	start =3D PTRRELOC(&__start___stf_entry_barrier_fixup);
 	end =3D PTRRELOC(&__stop___stf_entry_barrier_fixup);
@@ -144,24 +145,29 @@ static void do_stf_entry_barrier_fixups(enum stf_ba=
rrier_type types)
 		instrs[i++] =3D 0x63ff0000; /* ori 31,31,0 speculation barrier */
 	}
=20
+	flags =3D lock_patching();
+
 	for (i =3D 0; start < end; start++, i++) {
 		dest =3D (void *)start + *start;
=20
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
=20
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instrs[0]=
));
=20
 		if (types & STF_BARRIER_FALLBACK)
-			patch_branch((struct ppc_inst *)(dest + 1),
-				     (unsigned long)&stf_barrier_fallback,
-				     BRANCH_SET_LINK);
+			patch_branch_unlocked((struct ppc_inst *)(dest + 1),
+					      (unsigned long)&stf_barrier_fallback,
+					      BRANCH_SET_LINK);
 		else
-			patch_instruction((struct ppc_inst *)(dest + 1),
-					  ppc_inst(instrs[1]));
+			patch_instruction_unlocked((struct ppc_inst *)(dest + 1),
+						   ppc_inst(instrs[1]));
=20
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 2),
+					   ppc_inst(instrs[2]));
 	}
=20
+	unlock_patching(flags);
+
 	printk(KERN_DEBUG "stf-barrier: patched %d entry locations (%s barrier)=
\n", i,
 		(types =3D=3D STF_BARRIER_NONE)                  ? "no" :
 		(types =3D=3D STF_BARRIER_FALLBACK)              ? "fallback" :
@@ -175,6 +181,7 @@ static void do_stf_exit_barrier_fixups(enum stf_barri=
er_type types)
 	unsigned int instrs[6], *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
=20
 	start =3D PTRRELOC(&__start___stf_exit_barrier_fixup);
 	end =3D PTRRELOC(&__stop___stf_exit_barrier_fixup);
@@ -207,18 +214,23 @@ static void do_stf_exit_barrier_fixups(enum stf_bar=
rier_type types)
 		instrs[i++] =3D 0x7e0006ac; /* eieio + bit 6 hint */
 	}
=20
+	flags =3D lock_patching();
+
 	for (i =3D 0; start < end; start++, i++) {
 		dest =3D (void *)start + *start;
=20
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
=20
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-		patch_instruction((struct ppc_inst *)(dest + 3), ppc_inst(instrs[3]));
-		patch_instruction((struct ppc_inst *)(dest + 4), ppc_inst(instrs[4]));
-		patch_instruction((struct ppc_inst *)(dest + 5), ppc_inst(instrs[5]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instrs[0]=
));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 1), ppc_inst(ins=
trs[1]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 2), ppc_inst(ins=
trs[2]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 3), ppc_inst(ins=
trs[3]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 4), ppc_inst(ins=
trs[4]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 5), ppc_inst(ins=
trs[5]));
 	}
+
+	unlock_patching(flags);
+
 	printk(KERN_DEBUG "stf-barrier: patched %d exit locations (%s barrier)\=
n", i,
 		(types =3D=3D STF_BARRIER_NONE)                  ? "no" :
 		(types =3D=3D STF_BARRIER_FALLBACK)              ? "fallback" :
@@ -239,6 +251,7 @@ void do_uaccess_flush_fixups(enum l1d_flush_type type=
s)
 	unsigned int instrs[4], *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
=20
 	start =3D PTRRELOC(&__start___uaccess_flush_fixup);
 	end =3D PTRRELOC(&__stop___uaccess_flush_fixup);
@@ -262,18 +275,22 @@ void do_uaccess_flush_fixups(enum l1d_flush_type ty=
pes)
 	if (types & L1D_FLUSH_MTTRIG)
 		instrs[i++] =3D 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
=20
+	flags =3D lock_patching();
+
 	for (i =3D 0; start < end; start++, i++) {
 		dest =3D (void *)start + *start;
=20
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
=20
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instrs[0]=
));
=20
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
-		patch_instruction((struct ppc_inst *)(dest + 3), ppc_inst(instrs[3]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 1), ppc_inst(ins=
trs[1]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 2), ppc_inst(ins=
trs[2]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 3), ppc_inst(ins=
trs[3]));
 	}
=20
+	unlock_patching(flags);
+
 	printk(KERN_DEBUG "uaccess-flush: patched %d locations (%s flush)\n", i=
,
 		(types =3D=3D L1D_FLUSH_NONE)       ? "no" :
 		(types =3D=3D L1D_FLUSH_FALLBACK)   ? "fallback displacement" :
@@ -289,6 +306,7 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 	unsigned int instrs[3], *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
=20
 	instrs[0] =3D 0x60000000; /* nop */
 	instrs[1] =3D 0x60000000; /* nop */
@@ -309,6 +327,8 @@ void do_entry_flush_fixups(enum l1d_flush_type types)
 	if (types & L1D_FLUSH_MTTRIG)
 		instrs[i++] =3D 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
=20
+	flags =3D lock_patching();
+
 	start =3D PTRRELOC(&__start___entry_flush_fixup);
 	end =3D PTRRELOC(&__stop___entry_flush_fixup);
 	for (i =3D 0; start < end; start++, i++) {
@@ -316,15 +336,17 @@ void do_entry_flush_fixups(enum l1d_flush_type type=
s)
=20
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
=20
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instrs[0]=
));
=20
 		if (types =3D=3D L1D_FLUSH_FALLBACK)
-			patch_branch((struct ppc_inst *)(dest + 1), (unsigned long)&entry_flu=
sh_fallback,
-				     BRANCH_SET_LINK);
+			patch_branch_unlocked((struct ppc_inst *)(dest + 1),
+					      (unsigned long)&entry_flush_fallback,
+					      BRANCH_SET_LINK);
 		else
-			patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]))=
;
+			patch_instruction_unlocked((struct ppc_inst *)(dest + 1),
+						   ppc_inst(instrs[1]));
=20
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 2), ppc_inst(ins=
trs[2]));
 	}
=20
 	start =3D PTRRELOC(&__start___scv_entry_flush_fixup);
@@ -334,17 +356,20 @@ void do_entry_flush_fixups(enum l1d_flush_type type=
s)
=20
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
=20
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instrs[0]=
));
=20
 		if (types =3D=3D L1D_FLUSH_FALLBACK)
-			patch_branch((struct ppc_inst *)(dest + 1), (unsigned long)&scv_entry=
_flush_fallback,
-				     BRANCH_SET_LINK);
+			patch_branch_unlocked((struct ppc_inst *)(dest + 1),
+					      (unsigned long)&scv_entry_flush_fallback,
+					      BRANCH_SET_LINK);
 		else
-			patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]))=
;
+			patch_instruction_unlocked((struct ppc_inst *)(dest + 1),
+						   ppc_inst(instrs[1]));
=20
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 2), ppc_inst(ins=
trs[2]));
 	}
=20
+	unlock_patching(flags);
=20
 	printk(KERN_DEBUG "entry-flush: patched %d locations (%s flush)\n", i,
 		(types =3D=3D L1D_FLUSH_NONE)       ? "no" :
@@ -361,6 +386,7 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 	unsigned int instrs[3], *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
=20
 	start =3D PTRRELOC(&__start___rfi_flush_fixup);
 	end =3D PTRRELOC(&__stop___rfi_flush_fixup);
@@ -382,16 +408,20 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 	if (types & L1D_FLUSH_MTTRIG)
 		instrs[i++] =3D 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
=20
+	flags =3D lock_patching();
+
 	for (i =3D 0; start < end; start++, i++) {
 		dest =3D (void *)start + *start;
=20
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
=20
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instrs[0]));
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instrs[1]));
-		patch_instruction((struct ppc_inst *)(dest + 2), ppc_inst(instrs[2]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instrs[0]=
));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 1), ppc_inst(ins=
trs[1]));
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 2), ppc_inst(ins=
trs[2]));
 	}
=20
+	unlock_patching(flags);
+
 	printk(KERN_DEBUG "rfi-flush: patched %d locations (%s flush)\n", i,
 		(types =3D=3D L1D_FLUSH_NONE)       ? "no" :
 		(types =3D=3D L1D_FLUSH_FALLBACK)   ? "fallback displacement" :
@@ -407,6 +437,7 @@ void do_barrier_nospec_fixups_range(bool enable, void=
 *fixup_start, void *fixup_
 	unsigned int instr, *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
=20
 	start =3D fixup_start;
 	end =3D fixup_end;
@@ -418,13 +449,17 @@ void do_barrier_nospec_fixups_range(bool enable, vo=
id *fixup_start, void *fixup_
 		instr =3D 0x63ff0000; /* ori 31,31,0 speculation barrier */
 	}
=20
+	flags =3D lock_patching();
+
 	for (i =3D 0; start < end; start++, i++) {
 		dest =3D (void *)start + *start;
=20
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instr));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instr));
 	}
=20
+	unlock_patching(flags);
+
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
 }
=20
@@ -448,6 +483,7 @@ void do_barrier_nospec_fixups_range(bool enable, void=
 *fixup_start, void *fixup_
 	unsigned int instr[2], *dest;
 	long *start, *end;
 	int i;
+	unsigned long flags;
=20
 	start =3D fixup_start;
 	end =3D fixup_end;
@@ -461,27 +497,37 @@ void do_barrier_nospec_fixups_range(bool enable, vo=
id *fixup_start, void *fixup_
 		instr[1] =3D PPC_INST_SYNC;
 	}
=20
+	flags =3D lock_patching();
+
 	for (i =3D 0; start < end; start++, i++) {
 		dest =3D (void *)start + *start;
=20
 		pr_devel("patching dest %lx\n", (unsigned long)dest);
-		patch_instruction((struct ppc_inst *)dest, ppc_inst(instr[0]));
-		patch_instruction((struct ppc_inst *)(dest + 1), ppc_inst(instr[1]));
+		patch_instruction_unlocked((struct ppc_inst *)dest, ppc_inst(instr[0])=
);
+		patch_instruction_unlocked((struct ppc_inst *)(dest + 1), ppc_inst(ins=
tr[1]));
 	}
=20
+	unlock_patching(flags);
+
 	printk(KERN_DEBUG "barrier-nospec: patched %d locations\n", i);
 }
=20
 static void patch_btb_flush_section(long *curr)
 {
 	unsigned int *start, *end;
+	unsigned long flags;
=20
 	start =3D (void *)curr + *curr;
 	end =3D (void *)curr + *(curr + 1);
+
+	flags =3D lock_patching();
+
 	for (; start < end; start++) {
 		pr_devel("patching dest %lx\n", (unsigned long)start);
-		patch_instruction((struct ppc_inst *)start, ppc_inst(PPC_INST_NOP));
+		patch_instruction_unlocked((struct ppc_inst *)start, ppc_inst(PPC_INST=
_NOP));
 	}
+
+	unlock_patching(flags);
 }
=20
 void do_btb_flush_fixups(void)
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index ff2b92bfeedcc..e8a00041c04bf 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -905,6 +905,9 @@ static void insert_bpts(void)
 	int i;
 	struct ppc_inst instr, instr2;
 	struct bpt *bp, *bp2;
+	unsigned long flags;
+
+	flags =3D lock_patching();
=20
 	bp =3D bpts;
 	for (i =3D 0; i < NBPTS; ++i, ++bp) {
@@ -945,19 +948,21 @@ static void insert_bpts(void)
 			continue;
 		}
=20
-		patch_instruction(bp->instr, instr);
-		patch_instruction(ppc_inst_next(bp->instr, &instr),
-				  ppc_inst(bpinstr));
+		patch_instruction_unlocked(bp->instr, instr);
+		patch_instruction_unlocked(ppc_inst_next(bp->instr, &instr),
+					   ppc_inst(bpinstr));
 		if (bp->enabled & BP_CIABR)
 			continue;
-		if (patch_instruction((struct ppc_inst *)bp->address,
-				      ppc_inst(bpinstr)) !=3D 0) {
+		if (patch_instruction_unlocked((struct ppc_inst *)bp->address,
+						ppc_inst(bpinstr)) !=3D 0) {
 			printf("Couldn't write instruction at %lx, "
 			       "disabling breakpoint there\n", bp->address);
 			bp->enabled &=3D ~BP_TRAP;
 			continue;
 		}
 	}
+
+	unlock_patching(flags);
 }
=20
 static void insert_cpu_bpts(void)
@@ -984,6 +989,9 @@ static void remove_bpts(void)
 	int i;
 	struct bpt *bp;
 	struct ppc_inst instr;
+	unsigned long flags;
+
+	flags =3D lock_patching();
=20
 	bp =3D bpts;
 	for (i =3D 0; i < NBPTS; ++i, ++bp) {
@@ -991,11 +999,13 @@ static void remove_bpts(void)
 			continue;
 		if (mread_instr(bp->address, &instr)
 		    && ppc_inst_equal(instr, ppc_inst(bpinstr))
-		    && patch_instruction(
+		    && patch_instruction_unlocked(
 			(struct ppc_inst *)bp->address, ppc_inst_read(bp->instr)) !=3D 0)
 			printf("Couldn't remove breakpoint at %lx\n",
 			       bp->address);
 	}
+
+	unlock_patching(flags);
 }
=20
 static void remove_cpu_bpts(void)
--=20
2.26.1

