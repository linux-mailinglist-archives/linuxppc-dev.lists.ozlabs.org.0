Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2D066532D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 06:07:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsG0C1spdz3c95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 16:07:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=quqU0hzm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=quqU0hzm;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsFzG0Cvzz3bWF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 16:07:05 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30B4P3fw039033;
	Wed, 11 Jan 2023 05:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=9SU9WoSOK3aIHlts/XHuQVQcSDZ+FXckQLKF0OZxZ30=;
 b=quqU0hzmXJGObWcovvGrZCKcRlyaGyMWQC+AcE88npI+a5MrbNm5eoTTbQZSk3EoPjVT
 5BmGUCUfBjHcrVtEI+t95lgfr10n3+0Z6zfrMj6D/OADELHiMaB328ehHSbXz/XQwU6W
 Zuk7dKtq67atTPymPr4jQtyhUR80DmwpUBuwYRSQHASAP0T3taKpNSUMMglXhOC21uEu
 bExqw4B4zcynW07JwF41fcUGInkfYtZRhJqmDWW5Li0sIwg3Wb1QA3+4cNEE0nBZ5NTX
 KrK1I4qSKq13+pE4b2gfizw66EXa7kDv/c1/5VFzrSYxQ8LZvPSo9roGlj3+AEF74Kir 2w== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1p2e8qrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jan 2023 05:07:00 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30B1qvsf025705;
	Wed, 11 Jan 2023 05:06:56 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3n1kuc04k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jan 2023 05:06:56 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30B56qv421758428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Jan 2023 05:06:52 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E57B20043;
	Wed, 11 Jan 2023 05:06:52 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1759120040;
	Wed, 11 Jan 2023 05:06:52 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.16])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Jan 2023 05:06:51 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH 1/2] powerpc/64s/radix: Fix crash with unaligned relocated
 kernel
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20230110124753.1325426-1-mpe@ellerman.id.au>
Date: Wed, 11 Jan 2023 10:36:41 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <9B73F789-1CA1-48AA-B281-04A815903959@linux.ibm.com>
References: <20230110124753.1325426-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Eas8DrygRBto3U1SfiSMG6HlB4rlShaZ
X-Proofpoint-ORIG-GUID: Eas8DrygRBto3U1SfiSMG6HlB4rlShaZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_01,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301110038
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 10-Jan-2023, at 6:17 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> If a relocatable kernel is loaded at an address that is not 2MB =
aligned
> and told not to relocate to zero, the kernel can crash due to
> mark_rodata_ro() incorrectly changing some read-write data to =
read-only.
>=20
> Scenarios where the misalignment can occur are when the kernel is
> loaded by kdump or using the RELOCATABLE_TEST config option.
>=20
> Example crash with the kernel loaded at 5MB:
>=20
>  Run /sbin/init as init process
>  BUG: Unable to handle kernel data access on write at =
0xc000000000452000
>  Faulting instruction address: 0xc0000000005b6730
>  Oops: Kernel access of bad area, sig: 11 [#1]
>  LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeries
>  CPU: 1 PID: 1 Comm: init Not tainted 6.2.0-rc1-00011-g349188be4841 =
#166
>  Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 =
0xf000005 of:SLOF,git-5b4c5a hv:linux,kvm pSeries
>  NIP:  c0000000005b6730 LR: c000000000ae9ab8 CTR: 0000000000000380
>  REGS: c000000004503250 TRAP: 0300   Not tainted  =
(6.2.0-rc1-00011-g349188be4841)
>  MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 44288480  XER: =
00000000
>  CFAR: c0000000005b66ec DAR: c000000000452000 DSISR: 0a000000 IRQMASK: =
0
>  ...
>  NIP memset+0x68/0x104
>  LR  zero_user_segments.constprop.0+0xa8/0xf0
>  Call Trace:
>    ext4_mpage_readpages+0x7f8/0x830
>    ext4_readahead+0x48/0x60
>    read_pages+0xb8/0x380
>    page_cache_ra_unbounded+0x19c/0x250
>    filemap_fault+0x58c/0xae0
>    __do_fault+0x60/0x100
>    __handle_mm_fault+0x1230/0x1a40
>    handle_mm_fault+0x120/0x300
>    ___do_page_fault+0x20c/0xa80
>    do_page_fault+0x30/0xc0
>    data_access_common_virt+0x210/0x220
>=20
> This happens because mark_rodata_ro() tries to change permissions on =
the
> range _stext..__end_rodata, but _stext sits in the middle of the 2MB
> page from 4MB to 6MB:
>=20
>  radix-mmu: Mapped 0x0000000000000000-0x0000000000200000 with 2.00 MiB =
pages (exec)
>  radix-mmu: Mapped 0x0000000000200000-0x0000000000400000 with 2.00 MiB =
pages
>  radix-mmu: Mapped 0x0000000000400000-0x0000000002400000 with 2.00 MiB =
pages (exec)
>=20
> The logic that changes the permissions assumes the linear mapping was
> split correctly at boot, so it marks the entire 2MB page read-only. =
That
> leads to the write fault above.
>=20
> To fix it, the boot time mapping logic needs to consider that if the
> kernel is running at a non-zero address then _stext is a boundary =
where
> it must split the mapping.
>=20
> That leads to the mapping being split correctly, allowing the rodata
> permission change to take happen correctly, with no spillover:
>=20
>  radix-mmu: Mapped 0x0000000000000000-0x0000000000200000 with 2.00 MiB =
pages (exec)
>  radix-mmu: Mapped 0x0000000000200000-0x0000000000400000 with 2.00 MiB =
pages
>  radix-mmu: Mapped 0x0000000000400000-0x0000000000500000 with 64.0 KiB =
pages
>  radix-mmu: Mapped 0x0000000000500000-0x0000000000600000 with 64.0 KiB =
pages (exec)
>  radix-mmu: Mapped 0x0000000000600000-0x0000000002400000 with 2.00 MiB =
pages (exec)
>=20
> If the kernel is loaded at a 2MB aligned address, the mapping =
continues
> to use 2MB pages as before:
>=20
>  radix-mmu: Mapped 0x0000000000000000-0x0000000000200000 with 2.00 MiB =
pages (exec)
>  radix-mmu: Mapped 0x0000000000200000-0x0000000000400000 with 2.00 MiB =
pages
>  radix-mmu: Mapped 0x0000000000400000-0x0000000002c00000 with 2.00 MiB =
pages (exec)
>  radix-mmu: Mapped 0x0000000002c00000-0x0000000100000000 with 2.00 MiB =
pages
>=20
> Fixes: c55d7b5e6426 ("powerpc: Remove STRICT_KERNEL_RWX =
incompatibility with RELOCATABLE")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Tested successfully with different crash kernel memory values
Tested-by : Sachin Sant <sachinp@linux.ibm.com>

- Sachin=
