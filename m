Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D874B0F84
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 14:59:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvdfW6H3tz3cBq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 00:59:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nl9FUh1D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Nl9FUh1D; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvddp2zbnz306m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 00:59:09 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21ADT72j021064; 
 Thu, 10 Feb 2022 13:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=VDWMsWrWxbsDPhA0EI7LOUpWIIXMiwjLimhCA4kTmxc=;
 b=Nl9FUh1D5C424IIvvPY+Q9i7OxQj1RGrfE7u5TmU2hCzGYbJGhV4jF4ZvNH7eA/J74Lp
 mox0ZoDqfrIWySJejbIgXKFPmLbImmxc21eUt6jstaZ89ienCImeuWJUIvusbWnQynYn
 yZttTPMbguCI0+PN+5UQobk6ExDI7GdrVGAB1U1ipZnPcvtjAMkE8BW+7j7YJZW3t22y
 MwghHGsW80i6YWB6KzFGWi6kVEVLxCBGcFbjXUkol3J7e552abh2tw2V7+ZfgPVG2lU1
 6PidNCCAv9ihdQ9kqhDkqseyzdrnH77LYJ/p94EwhOqwNfoJJgcuY1XjykQ0m6y9pxkb 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e53me8nmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:58:36 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21ADeHoG006076;
 Thu, 10 Feb 2022 13:58:35 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e53me8nky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:58:35 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21ADvm0c022109;
 Thu, 10 Feb 2022 13:58:33 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3e1gv9xp45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 13:58:33 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21ADwVIC40436096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Feb 2022 13:58:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EAD652052;
 Thu, 10 Feb 2022 13:58:31 +0000 (GMT)
Received: from localhost (unknown [9.43.10.20])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8981552050;
 Thu, 10 Feb 2022 13:58:30 +0000 (GMT)
Date: Thu, 10 Feb 2022 13:58:29 +0000
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 2/3] powerpc/ftrace: Override ftrace_location_lookup()
 for MPROFILE_KERNEL
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
 <fadc5f2a295d6cb9f590bbbdd71fc2f78bf3a085.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220207102454.41b1d6b5@gandalf.local.home>
 <1644426751.786cjrgqey.naveen@linux.ibm.com>
 <20220209161017.2bbdb01a@gandalf.local.home>
In-Reply-To: <20220209161017.2bbdb01a@gandalf.local.home>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1644501274.apfdo9z1hy.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OVTWoUo17MfQhhy0Cln3VOlJUnv2IPCS
X-Proofpoint-GUID: rYm6wO9IyGv-xS8HWo1ahtXmOAxFy-84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_06,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202100074
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
 Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 bpf@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Steven Rostedt wrote:
> On Wed, 09 Feb 2022 17:50:09 +0000
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
>> However, I think we will not be able to use a fixed range.  I would like=
=20
>> to reserve instructions from function entry till the branch to=20
>> _mcount(), and it can be two or four instructions depending on whether a=
=20
>> function has a global entry point. For this, I am considering adding a=20
>> field in 'struct dyn_arch_ftrace', and a hook in ftrace_process_locs()=20
>> to initialize the same. I may need to override ftrace_cmp_recs().
>=20
> Be careful about adding anything to dyn_arch_ftrace. powerpc already adds
> the pointer to the module. Anything you add to that gets multiplied by
> thousands of times (which takes up memory).
>=20
> At boot up you may see something like:
>=20
>   ftrace: allocating 45363 entries in 178 pages
>=20
> That's 45,363 dyn_arch_ftrace structures. And each module loads their own
> as well. To see how many total you have after boot up:
>=20
>=20
>   # cat /sys/kernel/tracing/dyn_ftrace_total_info=20
> 55974 pages:295 groups: 89
>=20
> That's from the same kernel. Another 10,000 entries were created by modul=
es.
> (This was for x86_64)
>=20
> What you may be able to do, is to add a way to look at the already saved
> kallsyms, which keeps track of the function entry and exit to know how to
> map an address back to the function.
>=20
>    kallsyms_lookup(addr, NULL, &offset, NULL, NULL);
>=20
> Should give you the offset of addr from the start of the function.

Good point. I should be able to overload the existing field for this=20
purpose. Is something like the below ok?

---
 arch/powerpc/include/asm/ftrace.h  | 13 ++++++
 arch/powerpc/kernel/trace/ftrace.c | 73 ++++++++++++++++++++++++++----
 kernel/trace/ftrace.c              |  2 +
 3 files changed, 78 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/f=
trace.h
index debe8c4f706260..96d6e26cee86af 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -59,6 +59,19 @@ static inline unsigned long ftrace_call_adjust(unsigned =
long addr)
 struct dyn_arch_ftrace {
 	struct module *mod;
 };
+
+struct dyn_ftrace;
+struct module *ftrace_mod_addr_get(struct dyn_ftrace *rec);
+void ftrace_mod_addr_set(struct dyn_ftrace *rec, struct module *mod);
+
+#ifdef CONFIG_MPROFILE_KERNEL
+int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
+#define ftrace_init_nop ftrace_init_nop
+
+int ftrace_cmp_recs(const void *a, const void *b);
+#define ftrace_cmp_recs ftrace_cmp_recs
+#endif
+
 #endif /* __ASSEMBLY__ */
=20
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace=
/ftrace.c
index 80b6285769f27c..d9b6faa4c98a8c 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -428,21 +428,21 @@ int ftrace_make_nop(struct module *mod,
 	 * We should either already have a pointer to the module
 	 * or it has been passed in.
 	 */
-	if (!rec->arch.mod) {
+	if (!ftrace_mod_addr_get(rec)) {
 		if (!mod) {
 			pr_err("No module loaded addr=3D%lx\n", addr);
 			return -EFAULT;
 		}
-		rec->arch.mod =3D mod;
+		ftrace_mod_addr_set(rec, mod);
 	} else if (mod) {
-		if (mod !=3D rec->arch.mod) {
+		if (mod !=3D ftrace_mod_addr_get(rec)) {
 			pr_err("Record mod %p not equal to passed in mod %p\n",
-			       rec->arch.mod, mod);
+			       ftrace_mod_addr_get(rec), mod);
 			return -EINVAL;
 		}
 		/* nothing to do if mod =3D=3D rec->arch.mod */
 	} else
-		mod =3D rec->arch.mod;
+		mod =3D ftrace_mod_addr_get(rec);
=20
 	return __ftrace_make_nop(mod, rec, addr);
 #else
@@ -451,6 +451,59 @@ int ftrace_make_nop(struct module *mod,
 #endif /* CONFIG_MODULES */
 }
=20
+#ifdef CONFIG_MPROFILE_KERNEL
+struct module *ftrace_mod_addr_get(struct dyn_ftrace *rec)
+{
+	return (struct module *)((unsigned long)rec->arch.mod & ~0x1);
+}
+
+void ftrace_mod_addr_set(struct dyn_ftrace *rec, struct module *mod)
+{
+	rec->arch.mod =3D (struct module *)(((unsigned long)rec->arch.mod & 0x1) =
| (unsigned long)mod);
+}
+
+bool ftrace_location_has_gep(const struct dyn_ftrace *rec)
+{
+	return !!((unsigned long)rec->arch.mod & 0x1);
+}
+
+int ftrace_cmp_recs(const void *a, const void *b)
+{
+	const struct dyn_ftrace *key =3D a;
+	const struct dyn_ftrace *rec =3D b;
+	int offset =3D ftrace_location_has_gep(rec) ? 12 : 4;
+
+	if (key->flags < rec->ip - offset)
+		return -1;
+	if (key->ip >=3D rec->ip + MCOUNT_INSN_SIZE)
+		return 1;
+	return 0;
+}
+
+int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
+{
+	unsigned long offset;
+
+	if (!kallsyms_lookup_size_offset(rec->ip, NULL, &offset) || (offset !=3D =
12 && offset !=3D 4)) {
+		/* TODO: implement logic to deduce lep/gep from code */
+	} else if (offset =3D=3D 12) {
+		ftrace_mod_addr_set(rec, (struct module *)1);
+	}
+
+	return ftrace_make_nop(mod, rec, MCOUNT_ADDR);
+}
+#else
+struct module *ftrace_mod_addr_get(struct dyn_ftrace *rec)
+{
+	return rec->arch.mod;
+}
+
+void ftrace_mod_addr_set(struct dyn_ftrace *rec, struct module * mod)
+{
+	rec->arch.mod =3D mod;
+}
+#endif /* CONFIG_MPROFILE_KERNEL */
+
 #ifdef CONFIG_MODULES
 #ifdef CONFIG_PPC64
 /*
@@ -494,7 +547,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned lon=
g addr)
 	ppc_inst_t instr;
 	void *ip =3D (void *)rec->ip;
 	unsigned long entry, ptr, tramp;
-	struct module *mod =3D rec->arch.mod;
+	struct module *mod =3D ftrace_mod_addr_get(rec);
=20
 	/* read where this goes */
 	if (copy_inst_from_kernel_nofault(op, ip))
@@ -561,7 +614,7 @@ __ftrace_make_call(struct dyn_ftrace *rec, unsigned lon=
g addr)
 	int err;
 	ppc_inst_t op;
 	u32 *ip =3D (u32 *)rec->ip;
-	struct module *mod =3D rec->arch.mod;
+	struct module *mod =3D ftrace_mod_addr_get(rec);
 	unsigned long tramp;
=20
 	/* read where this goes */
@@ -678,7 +731,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned l=
ong addr)
 	 * Being that we are converting from nop, it had better
 	 * already have a module defined.
 	 */
-	if (!rec->arch.mod) {
+	if (!ftrace_mod_addr_get(rec)) {
 		pr_err("No module loaded\n");
 		return -EINVAL;
 	}
@@ -699,7 +752,7 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigned l=
ong old_addr,
 	ppc_inst_t op;
 	unsigned long ip =3D rec->ip;
 	unsigned long entry, ptr, tramp;
-	struct module *mod =3D rec->arch.mod;
+	struct module *mod =3D ftrace_mod_addr_get(rec);
=20
 	/* If we never set up ftrace trampolines, then bail */
 	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
@@ -814,7 +867,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned=
 long old_addr,
 	/*
 	 * Out of range jumps are called from modules.
 	 */
-	if (!rec->arch.mod) {
+	if (!ftrace_mod_addr_get(rec)) {
 		pr_err("No module loaded\n");
 		return -EINVAL;
 	}
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index f9feb197b2daaf..68f20cf34b0c47 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1510,6 +1510,7 @@ ftrace_ops_test(struct ftrace_ops *ops, unsigned long=
 ip, void *regs)
 	}
=20
=20
+#ifndef ftrace_cmp_recs
 static int ftrace_cmp_recs(const void *a, const void *b)
 {
 	const struct dyn_ftrace *key =3D a;
@@ -1521,6 +1522,7 @@ static int ftrace_cmp_recs(const void *a, const void =
*b)
 		return 1;
 	return 0;
 }
+#endif
=20
 static struct dyn_ftrace *lookup_rec(unsigned long start, unsigned long en=
d)
 {



Thanks,
Naveen
