Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EC93C69C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 07:35:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP8Vd6k8lz3dh8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 15:35:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dISpVQdc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dISpVQdc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP8Q64sB7z30G7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 15:31:42 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16D54E49178685; Tue, 13 Jul 2021 01:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vKEraZT2DcYWGa20e9X3P6pRaCJ9BM1O7v7BGAxdmZo=;
 b=dISpVQdcjwwxmh08uEOjp/XvitclPJfCR28CW6ywYF86t6ODU3ZofoC2H+URToWpDe8E
 830Jhrj32tNBqfNTE8XtfvA0PRPbAHA9WPKayAVFmGkVpvl3pZv/C6NFTJy745k5Gi/a
 WYermjpNKOpXhhcPC4KfKeB9RcMzYdE0ioBbD33QKkhfr6rMmhPDAcLzfubg5XN49U3h
 Et3I0+nbJWQ0BrRNxi6Rkxr2ZGlylTb7wrDYSqzlohaQ1DQTqDnho63/wKIiiWAl/rm8
 TDMAtHsnGU+g6OUyHKiejbAmBzUz4Cmz/6CB11ObIE2AbxcZ8mm8ezbYflaMzQEon4gR VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrkwem7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:31:23 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16D5BmLj191832;
 Tue, 13 Jul 2021 01:31:22 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrkwem7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:31:22 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16D5SMIu005687;
 Tue, 13 Jul 2021 05:31:21 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 39q36aqrn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 05:31:21 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16D5VKXE37355784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 05:31:21 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBC06AE060;
 Tue, 13 Jul 2021 05:31:20 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D5E8AE071;
 Tue, 13 Jul 2021 05:31:20 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.163.19.100])
 by b01ledav005.gho.pok.ibm.com (Postfix) with SMTP;
 Tue, 13 Jul 2021 05:31:19 +0000 (GMT)
Received: from oc8246131445.ibm.com (localhost.localdomain [127.0.0.1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 2F3C7BC0B42;
 Tue, 13 Jul 2021 00:31:15 -0500 (CDT)
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 6/8] powerpc: Rework and improve STRICT_KERNEL_RWX patching
Date: Tue, 13 Jul 2021 00:31:11 -0500
Message-Id: <20210713053113.4632-7-cmr@linux.ibm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210713053113.4632-1-cmr@linux.ibm.com>
References: <20210713053113.4632-1-cmr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ECjsolDe6qEUnWRzIsgM-nmy61gmL3Uw
X-Proofpoint-ORIG-GUID: B9H47KRkzfDhVNM7R0btHcTPLGaYrbsW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_03:2021-07-13,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=853 bulkscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107130022
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rework code-patching with STRICT_KERNEL_RWX to prepare for the next
patch which uses a temporary mm for patching under the Book3s64 Radix
MMU. Make improvements by adding a WARN_ON when the patchsite doesn't
match after patching and return the error from __patch_instruction()
properly.

Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>

---

v5:  * New to series.
---
 arch/powerpc/lib/code-patching.c | 51 +++++++++++++++++---------------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-pat=
ching.c
index 3122d8e4cc013..9f2eba9b70ee4 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -102,11 +102,12 @@ static inline void unuse_temporary_mm(struct temp_m=
m *temp_mm)
 }
=20
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
+static DEFINE_PER_CPU(unsigned long, cpu_patching_addr);
=20
 #if IS_BUILTIN(CONFIG_LKDTM)
 unsigned long read_cpu_patching_addr(unsigned int cpu)
 {
-	return (unsigned long)(per_cpu(text_poke_area, cpu))->addr;
+	return per_cpu(cpu_patching_addr, cpu);
 }
 #endif
=20
@@ -121,6 +122,7 @@ static int text_area_cpu_up(unsigned int cpu)
 		return -1;
 	}
 	this_cpu_write(text_poke_area, area);
+	this_cpu_write(cpu_patching_addr, (unsigned long)area->addr);
=20
 	return 0;
 }
@@ -146,7 +148,7 @@ void __init poking_init(void)
 /*
  * This can be called for kernel text or a module.
  */
-static int map_patch_area(void *addr, unsigned long text_poke_addr)
+static int map_patch_area(void *addr)
 {
 	unsigned long pfn;
 	int err;
@@ -156,17 +158,20 @@ static int map_patch_area(void *addr, unsigned long=
 text_poke_addr)
 	else
 		pfn =3D __pa_symbol(addr) >> PAGE_SHIFT;
=20
-	err =3D map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNE=
L);
+	err =3D map_kernel_page(__this_cpu_read(cpu_patching_addr),
+			      (pfn << PAGE_SHIFT), PAGE_KERNEL);
=20
-	pr_devel("Mapped addr %lx with pfn %lx:%d\n", text_poke_addr, pfn, err)=
;
+	pr_devel("Mapped addr %lx with pfn %lx:%d\n",
+		 __this_cpu_read(cpu_patching_addr), pfn, err);
 	if (err)
 		return -1;
=20
 	return 0;
 }
=20
-static inline int unmap_patch_area(unsigned long addr)
+static inline int unmap_patch_area(void)
 {
+	unsigned long addr =3D __this_cpu_read(cpu_patching_addr);
 	pte_t *ptep;
 	pmd_t *pmdp;
 	pud_t *pudp;
@@ -175,23 +180,23 @@ static inline int unmap_patch_area(unsigned long ad=
dr)
=20
 	pgdp =3D pgd_offset_k(addr);
 	if (unlikely(!pgdp))
-		return -EINVAL;
+		goto out_err;
=20
 	p4dp =3D p4d_offset(pgdp, addr);
 	if (unlikely(!p4dp))
-		return -EINVAL;
+		goto out_err;
=20
 	pudp =3D pud_offset(p4dp, addr);
 	if (unlikely(!pudp))
-		return -EINVAL;
+		goto out_err;
=20
 	pmdp =3D pmd_offset(pudp, addr);
 	if (unlikely(!pmdp))
-		return -EINVAL;
+		goto out_err;
=20
 	ptep =3D pte_offset_kernel(pmdp, addr);
 	if (unlikely(!ptep))
-		return -EINVAL;
+		goto out_err;
=20
 	pr_devel("clearing mm %p, pte %p, addr %lx\n", &init_mm, ptep, addr);
=20
@@ -202,15 +207,17 @@ static inline int unmap_patch_area(unsigned long ad=
dr)
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
=20
 	return 0;
+
+out_err:
+	pr_warn("failed to unmap %lx\n", addr);
+	return -EINVAL;
 }
=20
 static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 {
-	int err;
+	int err, rc =3D 0;
 	u32 *patch_addr =3D NULL;
 	unsigned long flags;
-	unsigned long text_poke_addr;
-	unsigned long kaddr =3D (unsigned long)addr;
=20
 	/*
 	 * During early early boot patch_instruction is called
@@ -222,24 +229,20 @@ static int do_patch_instruction(u32 *addr, struct p=
pc_inst instr)
=20
 	local_irq_save(flags);
=20
-	text_poke_addr =3D (unsigned long)__this_cpu_read(text_poke_area)->addr=
;
-	if (map_patch_area(addr, text_poke_addr)) {
-		err =3D -1;
+	err =3D map_patch_area(addr);
+	if (err)
 		goto out;
-	}
-
-	patch_addr =3D (u32 *)(text_poke_addr + (kaddr & ~PAGE_MASK));
=20
-	__patch_instruction(addr, instr, patch_addr);
+	patch_addr =3D (u32 *)(__this_cpu_read(cpu_patching_addr) | offset_in_p=
age(addr));
+	rc =3D __patch_instruction(addr, instr, patch_addr);
=20
-	err =3D unmap_patch_area(text_poke_addr);
-	if (err)
-		pr_warn("failed to unmap %lx\n", text_poke_addr);
+	err =3D unmap_patch_area();
=20
 out:
 	local_irq_restore(flags);
+	WARN_ON(!ppc_inst_equal(ppc_inst_read(addr), instr));
=20
-	return err;
+	return rc ? rc : err;
 }
 #else /* !CONFIG_STRICT_KERNEL_RWX */
=20
--=20
2.26.1

