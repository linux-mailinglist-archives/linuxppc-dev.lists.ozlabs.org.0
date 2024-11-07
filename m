Return-Path: <linuxppc-dev+bounces-3023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A57749C0FDD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 21:39:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xkv7m4dhsz3brN;
	Fri,  8 Nov 2024 07:39:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730987213;
	cv=none; b=owaQpDgMXyGqcVni1xZjE4rasQ8R2rq0qzyhe2RXt0FDQ6QMHB42vSde48YK4mAmqX/U04NJQWuISfi4lH00Vp+7yR3t700LHV8fpPkh6Fkxy6AOW9uR4A6Au8KRIlkjhj3lLAxmQ9b7TkoDrH7LzLDKTyBy0sMBOpTCooF+RdFAGsw/fKviTDsK1wFdkWPfUF0VH/0nQxA5o20zAJgvAtS/9EE5jNc0bxiK5I3iew1ImExTD0jjmL9uzI/Yl9ZWEVGVumVs9/9SNAYExRby5TZNTLFc7Y2pqAEyOY70ZnGCR+gJNLth7YxA5yBAGq65hvVMC5g4K3ld4vmMAZ5Z3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730987213; c=relaxed/relaxed;
	bh=6UoKJQhxJqwGgnUzP9A/Tk+WRO+Phuf/yiWZCE/3pMw=;
	h=Content-Type:Subject:From:In-Reply-To:Date:Cc:Message-Id:
	 References:To:MIME-Version; b=WSWrN7rYZ872q6MY2rW2NB6YUC3WwxsIcK9qtD99yzZeCyqBhGdwuDPrR0wYA21XJP/BMMHbj1rG0D17W97KD3mypT3K1slatQFdgezUHliyDd4qdyo0/DQwVGc43EAR7AVv1leh8vB8UmiSpgToggThvEbpJYgY5NjqynS+zERVbBwLyIL8q4JkbQJynR7qLyvHE6TXKX+pSMEojwX8Fs+yuiKtvBPGYn96QngQdu/XtAfTNJpRZAiB+cPH1fxnaRPCbxKQIOXpVLIVgqxIUAcNXAvkIf1sS7ulRgzQ+r4LoXbzppGbGrDh9+oy3wKY9hHhZLLy+iXT1KnR5aPZ/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=guvl25Y9; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=guvl25Y9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkjzc1Tk3z3bcB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 00:46:51 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Cefdu018118;
	Thu, 7 Nov 2024 13:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6UoKJQ
	hxJqwGgnUzP9A/Tk+WRO+Phuf/yiWZCE/3pMw=; b=guvl25Y9EU2ZQoMak7zHUi
	UOeS6lRoP1j0OF6s5CWHXXzSmDW/jKrj/j+aCIHjrGUBEa7RdAS/5lixUK2K3J/J
	4bvWBgCxB8c+QQFioPX6w9ZxOXuSOCVxbaDthTZL8CkKCQY0koFsn/OGlc/vsxU1
	TiiUx8Diia5AEb9rhIx2ixpI5tBYmvKen6A/OfoS2seU4bfMPrZ+vcn/12JUTAVd
	JRi4ZV2u/aZLSJHABuwaOCo0onBZhe9kE8Qw+VjTSVvSLJ9dtb5qxYYk/Q3P0zS7
	eU14uUo5BE2kPITL9NqI1i2rIHiLIvaObDNeIATLvQPUaCIm8V3CGFCHTnMl/V8Q
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42rwrk895s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 13:46:40 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7D4rpb019414;
	Thu, 7 Nov 2024 13:46:39 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42p0mj86k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 13:46:39 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A7DkcEN19399350
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Nov 2024 13:46:38 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3ACB35804B;
	Thu,  7 Nov 2024 13:46:38 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4654158055;
	Thu,  7 Nov 2024 13:46:36 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.254.137])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  7 Nov 2024 13:46:35 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2 1/2] powerpc/fadump: allocate memory for additional
 parameters early
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
Date: Thu, 7 Nov 2024 19:15:56 +0530
Cc: linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Message-Id: <885550F0-5EAF-4BAC-B2F2-8ABA31F40038@linux.ibm.com>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eNyWWuIj_Y5Lpjv5br2IVDo1D0WPldE5
X-Proofpoint-GUID: eNyWWuIj_Y5Lpjv5br2IVDo1D0WPldE5
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
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
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Applied the below patch to 6.12.0-rc6-next20241106 and issue is not seen. R=
esults look good to me.

[root@ltcden8-lp5 ~]# uname -r
6.12.0-rc6-next-20241106-00002-gf374fbb4ee1a
[root@ltcden8-lp5 ~]# =20

Please add below tag.

> Tested-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>






> On 7 Nov 2024, at 11:28=E2=80=AFAM, Sourabh Jain <sourabhjain@linux.ibm.c=
om> wrote:
>=20
> From: Hari Bathini <hbathini@linux.ibm.com>
>=20
> Memory for passing additional parameters to fadump capture kernel
> is allocated during subsys_initcall level, using memblock. But
> as slab is already available by this time, allocation happens via
> the buddy allocator. This may work for radix MMU but is likely to
> fail in most cases for hash MMU as hash MMU needs this memory in
> the first memory block for it to be accessible in real mode in the
> capture kernel (second boot). So, allocate memory for additional
> parameters area as soon as MMU mode is obvious.
>=20
> Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for dum=
p capture kernel")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
> Closes: https://lore.kernel.org/lkml/a70e4064-a040-447b-8556-1fd02f19383d=
@linux.vnet.ibm.com/T/#u
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>=20
> Changelog:
>=20
> Since v1: https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@=
linux.ibm.com/
>  - Drop extern keyword from fadump_setup_param_area function declaration
>  - Don't use __va() while resetting param memory area
>=20
> ---
> arch/powerpc/include/asm/fadump.h |  2 ++
> arch/powerpc/kernel/fadump.c      | 15 ++++++++++-----
> arch/powerpc/kernel/prom.c        |  3 +++
> 3 files changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm=
/fadump.h
> index ef40c9b6972a..7b3473e05273 100644
> --- a/arch/powerpc/include/asm/fadump.h
> +++ b/arch/powerpc/include/asm/fadump.h
> @@ -19,6 +19,7 @@ extern int is_fadump_active(void);
> extern int should_fadump_crash(void);
> extern void crash_fadump(struct pt_regs *, const char *);
> extern void fadump_cleanup(void);
> +void fadump_setup_param_area(void);
> extern void fadump_append_bootargs(void);
>=20
> #else /* CONFIG_FA_DUMP */
> @@ -26,6 +27,7 @@ static inline int is_fadump_active(void) { return 0; }
> static inline int should_fadump_crash(void) { return 0; }
> static inline void crash_fadump(struct pt_regs *regs, const char *str) { }
> static inline void fadump_cleanup(void) { }
> +static inline void fadump_setup_param_area(void) { }
> static inline void fadump_append_bootargs(void) { }
> #endif /* !CONFIG_FA_DUMP */
>=20
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index a612e7513a4f..3a2863307863 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -1586,6 +1586,12 @@ static void __init fadump_init_files(void)
> return;
> }
>=20
> + if (fw_dump.param_area) {
> + rc =3D sysfs_create_file(fadump_kobj, &bootargs_append_attr.attr);
> + if (rc)
> + pr_err("unable to create bootargs_append sysfs file (%d)\n", rc);
> + }
> +
> debugfs_create_file("fadump_region", 0444, arch_debugfs_dir, NULL,
>    &fadump_region_fops);
>=20
> @@ -1740,7 +1746,7 @@ static void __init fadump_process(void)
>  * Reserve memory to store additional parameters to be passed
>  * for fadump/capture kernel.
>  */
> -static void __init fadump_setup_param_area(void)
> +void __init fadump_setup_param_area(void)
> {
> phys_addr_t range_start, range_end;
>=20
> @@ -1748,7 +1754,7 @@ static void __init fadump_setup_param_area(void)
> return;
>=20
> /* This memory can't be used by PFW or bootloader as it is shared across =
kernels */
> - if (radix_enabled()) {
> + if (early_radix_enabled()) {
> /*
> * Anywhere in the upper half should be good enough as all memory
> * is accessible in real mode.
> @@ -1776,12 +1782,12 @@ static void __init fadump_setup_param_area(void)
>       COMMAND_LINE_SIZE,
>       range_start,
>       range_end);
> - if (!fw_dump.param_area || sysfs_create_file(fadump_kobj, &bootargs_app=
end_attr.attr)) {
> + if (!fw_dump.param_area) {
> pr_warn("WARNING: Could not setup area to pass additional parameters!\n");
> return;
> }
>=20
> - memset(phys_to_virt(fw_dump.param_area), 0, COMMAND_LINE_SIZE);
> + memset((void *)fw_dump.param_area, 0, COMMAND_LINE_SIZE);
> }
>=20
> /*
> @@ -1807,7 +1813,6 @@ int __init setup_fadump(void)
> }
> /* Initialize the kernel dump memory structure and register with f/w */
> else if (fw_dump.reserve_dump_area_size) {
> - fadump_setup_param_area();
> fw_dump.ops->fadump_init_mem_struct(&fw_dump);
> register_fadump();
> }
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 0be07ed407c7..47db1b1aef25 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -908,6 +908,9 @@ void __init early_init_devtree(void *params)
>=20
> mmu_early_init_devtree();
>=20
> + /* Setup param area for passing additional parameters to fadump capture=
 kernel. */
> + fadump_setup_param_area();
> +
> #ifdef CONFIG_PPC_POWERNV
> /* Scan and build the list of machine check recoverable ranges */
> of_scan_flat_dt(early_init_dt_scan_recoverable_ranges, NULL);
> --=20
> 2.46.2
>=20


