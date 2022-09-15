Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDAA5B93B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 06:37:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSkvY1tRLz3bnY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 14:37:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IFO1ukWr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IFO1ukWr;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSktj6Ytfz307g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 14:36:44 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28F3TvF1025913
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 04:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=/lArB8b+99lMXrsd31kancuoOQCmgzLHk157E/Ll+ow=;
 b=IFO1ukWr7JIVtUnxrf3p+P4CQ0li2YkrulIzxQ5IrUSKFDgch2qblHTedVRfNrfACrTR
 vOcMyIgewIiqs2rFGSh7pvyhaq14fKXRl8m2Iog0at+3wfwrirAX2WlLtWEquJPRdkTO
 kLEg4Rjp8wJVkJvkv96gh062wwdoe0YGCUpezl4zt1ryZPYclF/x6BzWIX/xarwkkJBe
 coHP2OumdAE12oiQeLv2Ji/OotaUgriYl6DIHznoheKNcqVMrLK+yEdT4BuHmL7VaIKg
 NuRlQhTXIxxMiiYfAeFtDBjFtGh/bqPqM//a31aMPo4qR3JaBQYE3t0pWU4SnZzU23zG cg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkv6v9fhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 04:36:41 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28F4TlRv002344
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 04:36:41 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkv6v9fh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 04:36:40 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28F4YqxV017675;
	Thu, 15 Sep 2022 04:36:39 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3jjy95sub1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 04:36:38 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28F4aac336045246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Sep 2022 04:36:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2F2BA405C;
	Thu, 15 Sep 2022 04:36:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14A02A4054;
	Thu, 15 Sep 2022 04:36:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 15 Sep 2022 04:36:36 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 99F966010D;
	Thu, 15 Sep 2022 14:36:26 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v4 03/20] powerpc/32: Remove powerpc select specialisation
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <CMUAVMDUD1XS.9X8HB8W4YK1I@bobo>
Date: Thu, 15 Sep 2022 14:36:26 +1000
Message-Id: <259C7BA3-CB32-4385-9E05-FCBF33599B98@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-4-rmclure@linux.ibm.com>
 <CMUAVMDUD1XS.9X8HB8W4YK1I@bobo>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3uyE83k8JMbK-8W-n8KyYnQ0dt6xac7C
X-Proofpoint-ORIG-GUID: Ukl_CONIkT0slF0571hYmlAt2YJQdFMq
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_01,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209150022
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 12 Sep 2022, at 7:03 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
>> Syscall #82 has been implemented for 32-bit platforms in a unique way on
>> powerpc systems. This hack will in effect guess whether the caller is
>> expecting new select semantics or old select semantics. It does so via a
>> guess, based off the first parameter. In new select, this parameter
>> represents the length of a user-memory array of file descriptors, and in
>> old select this is a pointer to an arguments structure.
>>=20
>> The heuristic simply interprets sufficiently large values of its first
>> parameter as being a call to old select. The following is a discussion
>> on how this syscall should be handled.
>>=20
>> Link: https://lore.kernel.org/lkml/13737de5-0eb7-e881-9af0-163b0d29a1a0@=
csgroup.eu/
>=20
> Seems okay to me, probably Christophe needs to ack it.
> Should some of that history be included directly in this changelog?
>=20
> Should ppc64 compat be added back too, if this is being updated instead
> of removed? I don't know much about compat but it seems odd not provide
> it (considering it's just using compat_sys_old_select, isn't it?

That would make sense to me. I=E2=80=99ll put that in syscall.tbl.

> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>=20
>>=20
>> As discussed in this thread, the existence of such a hack suggests that =
for
>> whatever powerpc binaries may predate glibc, it is most likely that they
>> would have taken use of the old select semantics. x86 and arm64 both
>> implement this syscall with oldselect semantics.
>>=20
>> Remove the powerpc implementation, and update syscall.tbl to refer to em=
it
>> a reference to sys_old_select for 32-bit binaries, in keeping with how
>> other architectures support syscall #82.
>>=20
>> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
>> ---
>> V1 -> V2: Remove arch-specific select handler
>> V2 -> V3: Remove ppc_old_select prototype in <asm/syscalls.h>. Move to
>> earlier in patch series
>> ---
>> arch/powerpc/include/asm/syscalls.h           |  2 --
>> arch/powerpc/kernel/syscalls.c                | 17 -----------------
>> arch/powerpc/kernel/syscalls/syscall.tbl      |  2 +-
>> .../arch/powerpc/entry/syscalls/syscall.tbl   |  2 +-
>> 4 files changed, 2 insertions(+), 21 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/=
asm/syscalls.h
>> index 675a8f5ec3ca..739498c358a1 100644
>> --- a/arch/powerpc/include/asm/syscalls.h
>> +++ b/arch/powerpc/include/asm/syscalls.h
>> @@ -18,8 +18,6 @@ long sys_mmap2(unsigned long addr, size_t len,
>> 	       unsigned long fd, unsigned long pgoff);
>> long ppc64_personality(unsigned long personality);
>> long sys_rtas(struct rtas_args __user *uargs);
>> -int ppc_select(int n, fd_set __user *inp, fd_set __user *outp,
>> -	       fd_set __user *exp, struct __kernel_old_timeval __user *tvp);
>> long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_lo=
w,
>> 		      u32 len_high, u32 len_low);
>>=20
>> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscal=
ls.c
>> index fc999140bc27..ef5896bee818 100644
>> --- a/arch/powerpc/kernel/syscalls.c
>> +++ b/arch/powerpc/kernel/syscalls.c
>> @@ -63,23 +63,6 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, le=
n,
>> 	return do_mmap2(addr, len, prot, flags, fd, offset, PAGE_SHIFT);
>> }
>>=20
>> -#ifdef CONFIG_PPC32
>> -/*
>> - * Due to some executables calling the wrong select we sometimes
>> - * get wrong args.  This determines how the args are being passed
>> - * (a single ptr to them all args passed) then calls
>> - * sys_select() with the appropriate args. -- Cort
>> - */
>> -int
>> -ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __use=
r *exp, struct __kernel_old_timeval __user *tvp)
>> -{
>> -	if ((unsigned long)n >=3D 4096)
>> -		return sys_old_select((void __user *)n);
>> -
>> -	return sys_select(n, inp, outp, exp, tvp);
>> -}
>> -#endif
>> -
>> #ifdef CONFIG_PPC64
>> long ppc64_personality(unsigned long personality)
>> {
>> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/ker=
nel/syscalls/syscall.tbl
>> index 2600b4237292..4cbbb810ae10 100644
>> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
>> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
>> @@ -110,7 +110,7 @@
>> 79	common	settimeofday			sys_settimeofday		compat_sys_settimeofday
>> 80	common	getgroups			sys_getgroups
>> 81	common	setgroups			sys_setgroups
>> -82	32	select				ppc_select			sys_ni_syscall
>> +82	32	select				sys_old_select			sys_ni_syscall
>> 82	64	select				sys_ni_syscall
>> 82	spu	select				sys_ni_syscall
>> 83	common	symlink				sys_symlink
>> diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/=
perf/arch/powerpc/entry/syscalls/syscall.tbl
>> index 2600b4237292..4cbbb810ae10 100644
>> --- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
>> +++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
>> @@ -110,7 +110,7 @@
>> 79	common	settimeofday			sys_settimeofday		compat_sys_settimeofday
>> 80	common	getgroups			sys_getgroups
>> 81	common	setgroups			sys_setgroups
>> -82	32	select				ppc_select			sys_ni_syscall
>> +82	32	select				sys_old_select			sys_ni_syscall
>> 82	64	select				sys_ni_syscall
>> 82	spu	select				sys_ni_syscall
>> 83	common	symlink				sys_symlink
>> --=20
>> 2.34.1

