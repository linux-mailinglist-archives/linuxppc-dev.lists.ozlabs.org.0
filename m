Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E57D2B3F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 09:27:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JmzlZuOn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDRbZ3dtDz3bX1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 18:27:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JmzlZuOn;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SDRZc2Z0wz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Oct 2023 18:26:32 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SDRZW2Y2pz4wxX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Oct 2023 18:26:27 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SDRZW2KTLz4wx5; Mon, 23 Oct 2023 18:26:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JmzlZuOn;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SDRZV5FqVz4wp0;
	Mon, 23 Oct 2023 18:26:26 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39N79xxC011430;
	Mon, 23 Oct 2023 07:26:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ccBHDWyCvwXZBrHAKJEzmNZW84/H3UyjB+MNW6GS8XA=;
 b=JmzlZuOn1yAMC1WgbXjau8Iu/nR2p8u24qrvcq0/9fLRWaVjD9VL9jUw85vEGIdlqbuu
 T2rYHoNFpg+oTlEtd8A24GVlu04xxr3++kI0CvG4ZYmx8hi3+Zeb81bjooAdIPy+Gw7c
 rUXVoVfAgi/icKJJhmcfJINPuIOHMGxQZF5fMeIhXqQwG60LnUTna8LnlL1WczMXAPFR
 842gw8VMydjWfud15P/0XqaLuWf0otBhaXQmFS4G3p2L34orQWqVyxO+a9BLSbOv0f1B
 wNgS9+FE+A3sxXTef4egziw6Cv4/YFgpAQTyiLdSF8wjhODRYTMrgildvCVT6J4ZIKZU Rg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3twm6trfk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Oct 2023 07:26:22 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39N6P1fp010305;
	Mon, 23 Oct 2023 07:26:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tvsby7af3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Oct 2023 07:26:22 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39N7QJip3146302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Oct 2023 07:26:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22D092004B;
	Mon, 23 Oct 2023 07:26:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C1F220040;
	Mon, 23 Oct 2023 07:26:16 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com.com (unknown [9.171.56.200])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Oct 2023 07:26:16 +0000 (GMT)
From: Aditya Gupta <adityag@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] ppc64: add mmu information to vmcoreinfo
Date: Mon, 23 Oct 2023 12:56:12 +0530
Message-ID: <20231023072612.50874-1-adityag@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K7trIJ5VJIfXGMI2cQ9XNJ-Dgd8-gVTS
X-Proofpoint-ORIG-GUID: K7trIJ5VJIfXGMI2cQ9XNJ-Dgd8-gVTS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_04,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 mlxlogscore=903 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310230065
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
Cc: Sachin Sant <sachinp@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since below commit, address mapping for vmemmap has changed for Radix
MMU, where address mapping is stored in kernel page table itself,
instead of earlier used 'vmemmap_list'.

    commit 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use
    a different vmemmap handling function")

Hence with upstream kernel, in case of Radix MMU, makedumpfile fails to do
address translation for vmemmap addresses, as it depended on vmemmap_list,
which can now be empty.

While fixing the address translation in makedumpfile, it was identified
that currently makedumpfile cannot distinguish between Hash MMU and
Radix MMU, unless VMLINUX is passed with -x flag to makedumpfile.
And hence fails to assign offsets and shifts correctly (such as in L4 to
PGDIR offset calculation in makedumpfile).

For getting the MMU, makedumpfile uses `cur_cpu_spec.mmu_features`.

Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
`cpu_spec` struct, to VMCOREINFO, so that makedumpfile can assign the
offsets correctly, without needing a VMLINUX.

Also, even along with `cur_cpu_spec->mmu_features` makedumpfile has to
depend on the 'MMU_FTR_TYPE_RADIX' flag in mmu_features, implying kernel
developers need to be cautious of changes to 'MMU_FTR_*' defines.

A more stable approach was suggested in the below thread by contributors:
https://lore.kernel.org/linuxppc-dev/20230920105706.853626-1-adityag@linux.ibm.com/

The suggestion was to add whether 'RADIX_MMU' is enabled in vmcoreinfo

This patch also implements the suggestion, by adding 'RADIX_MMU' in
vmcoreinfo, which makedumpfile can use to get whether the crashed system
had RADIX MMU (in which case 'NUMBER(RADIX_MMU)=1') or not (in which
case 'NUMBER(RADIX_MMU)=0')

Fixes: 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function")
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
---
 arch/powerpc/kexec/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index de64c7962991..005269ac3244 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -74,6 +74,9 @@ void arch_crash_save_vmcoreinfo(void)
 	VMCOREINFO_STRUCT_SIZE(mmu_psize_def);
 	VMCOREINFO_OFFSET(mmu_psize_def, shift);
 #endif
+	VMCOREINFO_SYMBOL(cur_cpu_spec);
+	VMCOREINFO_OFFSET(cpu_spec, mmu_features);
+	vmcoreinfo_append_str("NUMBER(RADIX_MMU)=%d\n", early_radix_enabled());
 	vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
 }
 
-- 
2.41.0

