Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F214B5F9DB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 13:36:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmH1M2kxkz3drY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 22:36:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=boa4NV24;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=boa4NV24;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmH0M4byrz3bjF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 22:35:31 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29A9dGlK013346;
	Mon, 10 Oct 2022 11:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=pro5IwMV37H4iYj1hKmpiCs/G8mBdxNp+Mtv7VqRIV4=;
 b=boa4NV24vVGPuZz/9fjuYqcPIAUlftn4kMBao4Z2gu9Rn5rv11jzayqsi0J14cyUsI1m
 M43Wj241VHWdvinB/0+fNCVOH1qMggjiNUtNY1Ku8YVjvMGSFK3U+WLzIXHMHH1Czlu2
 E5d7WroQjJOTGaL8EVSBVOjrzk2FQ+o1dPLTmu9dxDfwPZVSbuNuUw8P+Zw4/vD8XE49
 Zp/BqlxdMsRyvnOJENM4eTSg3UF93IXhqD5KGTjEIJHSofEllqnuaKX8caHVbb0iE+iW
 T+PoU50DlFqtgRN3czwWawUxsqFRHCAubdmQvJ9epC+njIFAsik/kSrkGf4zNT06KBeJ TA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3k4jtcu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 11:35:06 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29A9pKMZ006719;
	Mon, 10 Oct 2022 11:35:06 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3k4jtcsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 11:35:05 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29ABLwX3026239;
	Mon, 10 Oct 2022 11:35:03 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma02fra.de.ibm.com with ESMTP id 3k30u9204x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 11:35:03 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29ABZ1du59769284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Oct 2022 11:35:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0065FAE04D;
	Mon, 10 Oct 2022 11:35:01 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B3ACAE045;
	Mon, 10 Oct 2022 11:34:59 +0000 (GMT)
Received: from localhost (unknown [9.43.23.98])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 10 Oct 2022 11:34:59 +0000 (GMT)
Date: Mon, 10 Oct 2022 17:04:57 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 03/16] powerpc: Fix objtool unannotated intra-function
 call warnings
To: linuxppc-dev@lists.ozlabs.org, Sathvika Vasireddy <sv@linux.ibm.com>
References: <20221002104240.1316480-1-sv@linux.ibm.com>
	<20221002104240.1316480-4-sv@linux.ibm.com>
In-Reply-To: <20221002104240.1316480-4-sv@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1665399265.kd8db2hfm4.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qI7D2V6oeWitRbKYk2lHHozViRW3lFdX
X-Proofpoint-ORIG-GUID: NoWLpqNfS6-jbZWhE5jtTnRLWKWuLnwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-10_06,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1011 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100067
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
Cc: aik@ozlabs.ru, linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, rostedt@goodmis.org, npiggin@gmail.com, jpoimboe@redhat.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sathvika Vasireddy wrote:
> Objtool throws unannotated intra-function call warnings in the following
> assembly files:
>=20
> arch/powerpc/kernel/vector.o: warning: objtool: .text+0x53c: unannotated =
intra-function call
>=20
> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x60: un=
annotated intra-function call
> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x124: u=
nannotated intra-function call
> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x5d4: u=
nannotated intra-function call
> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x5dc: u=
nannotated intra-function call
> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xcb8: u=
nannotated intra-function call
> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xd0c: u=
nannotated intra-function call
> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x1030: =
unannotated intra-function call
>=20
> arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x358: unannotated=
 intra-function call
> arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x728: unannotated=
 intra-function call
> arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x4d94: unannotate=
d intra-function call
> arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x4ec4: unannotate=
d intra-function call
>=20
> arch/powerpc/kvm/book3s_hv_interrupts.o: warning: objtool: .text+0x6c: un=
annotated intra-function call
> arch/powerpc/kernel/misc_64.o: warning: objtool: .text+0x64: unannotated =
intra-function call
>=20
> Objtool does not add STT_NOTYPE symbols with size 0 to the rbtree, which
> is why find_call_destination() function is not able to find the
> destination symbol for 'bl' instruction. For such symbols, objtool is
> throwing unannotated intra-function call warnings in assembly files. Fix
> these warnings by annotating those symbols with SYM_FUNC_START_LOCAL and
> SYM_FUNC_END macros, inorder to set symbol type to STT_FUNC and symbol
> size accordingly.
>=20
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S    |  7 +++++--
>  arch/powerpc/kernel/head_64.S           |  7 +++++--
>  arch/powerpc/kernel/misc_64.S           |  4 +++-
>  arch/powerpc/kernel/vector.S            |  4 +++-
>  arch/powerpc/kvm/book3s_hv_interrupts.S |  4 +++-
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 22 +++++++++++++++-------
>  6 files changed, 34 insertions(+), 14 deletions(-)

Applying this to powerpc/merge today shows two small conflicts:

>=20
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index 3d0dc133a9ae..56a31424c8b0 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -13,6 +13,7 @@
>   *
>   */
>=20
> +#include <linux/linkage.h>
>  #include <asm/hw_irq.h>
>  #include <asm/exception-64s.h>
>  #include <asm/ptrace.h>
> @@ -3075,7 +3076,7 @@ CLOSE_FIXED_SECTION(virt_trampolines);
>  USE_TEXT_SECTION()
>=20
>  /* MSR[RI] should be clear because this uses SRR[01] */
> -enable_machine_check:
> +SYM_FUNC_START_LOCAL(enable_machine_check)

This is now a _GLOBAL(), so this hunk and the below=20
SYM_FUNC_END(enable_machine_check) change can be dropped.

>  	mflr	r0
>  	bcl	20,31,$+4
>  0:	mflr	r3
> @@ -3087,9 +3088,10 @@ enable_machine_check:
>  	RFI_TO_KERNEL
>  1:	mtlr	r0
>  	blr
> +SYM_FUNC_END(enable_machine_check)
>=20
>  /* MSR[RI] should be clear because this uses SRR[01] */
> -disable_machine_check:
> +SYM_FUNC_START_LOCAL(disable_machine_check)
>  	mflr	r0
>  	bcl	20,31,$+4
>  0:	mflr	r3
> @@ -3102,3 +3104,4 @@ disable_machine_check:
>  	RFI_TO_KERNEL
>  1:	mtlr	r0
>  	blr
> +SYM_FUNC_END(disable_machine_check)
> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.=
S
> index cf2c08902c05..10e2d43420d0 100644
> --- a/arch/powerpc/kernel/head_64.S
> +++ b/arch/powerpc/kernel/head_64.S
> @@ -18,6 +18,7 @@
>   *  variants.
>   */
>=20
> +#include <linux/linkage.h>
>  #include <linux/threads.h>
>  #include <linux/init.h>
>  #include <asm/reg.h>
> @@ -465,7 +466,7 @@ generic_secondary_common_init:
>   * Assumes we're mapped EA =3D=3D RA if the MMU is on.
>   */
>  #ifdef CONFIG_PPC_BOOK3S
> -__mmu_off:
> +SYM_FUNC_START_LOCAL(__mmu_off)
>  	mfmsr	r3
>  	andi.	r0,r3,MSR_IR|MSR_DR
>  	beqlr
> @@ -476,6 +477,7 @@ __mmu_off:
>  	sync
>  	rfid
>  	b	.	/* prevent speculative execution */
> +SYM_FUNC_END(__mmu_off)
>  #endif
>=20
>=20
> @@ -869,7 +871,7 @@ _GLOBAL(start_secondary_resume)
>  /*
>   * This subroutine clobbers r11 and r12
>   */
> -enable_64b_mode:
> +SYM_FUNC_START_LOCAL(enable_64b_mode)
>  	mfmsr	r11			/* grab the current MSR */
>  #ifdef CONFIG_PPC_BOOK3E
>  	oris	r11,r11,0x8000		/* CM bit set, we'll set ICM later */
> @@ -881,6 +883,7 @@ enable_64b_mode:
>  	isync
>  #endif
>  	blr
> +SYM_FUNC_END(enable_64b_mode)
>=20
>  /*
>   * This puts the TOC pointer into r2, offset by 0x8000 (as expected
> diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.=
S
> index fd6d8d3a548e..b36fb89ff718 100644
> --- a/arch/powerpc/kernel/misc_64.S
> +++ b/arch/powerpc/kernel/misc_64.S
> @@ -9,6 +9,7 @@
>   * PPC64 updates by Dave Engebretsen (engebret@us.ibm.com)
>   */
>=20
> +#include <linux/linkage.h>
>  #include <linux/sys.h>
>  #include <asm/unistd.h>
>  #include <asm/errno.h>
> @@ -353,7 +354,7 @@ _GLOBAL(kexec_smp_wait)
>   *
>   * don't overwrite r3 here, it is live for kexec_wait above.
>   */
> -real_mode:	/* assume normal blr return */
> +SYM_FUNC_START_LOCAL(real_mode)	/* assume normal blr return */
>  #ifdef CONFIG_PPC_BOOK3E

The #ifdef is now for CONFIG_PPC_BOOK3E_64.

The rest of the series apply properly.


- Naveen
