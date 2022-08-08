Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B6458C247
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 06:12:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1N8b4yHZz3bnH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 14:12:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kqix8Fj5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kqix8Fj5;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1N7r5qhLz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 14:12:08 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2784B2Od011455;
	Mon, 8 Aug 2022 04:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kcOQVjtjRnDE0xxAjCWJA7E5Y3xSk5f2gsrFCvrGSqU=;
 b=kqix8Fj5/1pXtNlRBPQor9SCRfX4z4gQdyk1A0SsOFQOrwO7ftxpFqHbqt4B87q6ijiz
 0smobEMGgWW7xMYufdwV8VkGjUyKmygPyFzxZg+BcU90sj7BYYhupgGpcrRwiKXXKGmZ
 3S8FyV1Rxkc4GehY/UbJn4eE8QHX9Pu9aUMCfzazJW19xP7aIwBEuXza68HIFYlmSeWu
 asiqMIMf7PDFKfWRLqsE0VcWqYmOMAr8rG8Feln+1YS5x0hiiDVBavJk2vgV7FyV3A2+
 SQsOD/0C3T+KOJXjhsIdEmbd4LXVmfVJq4zGP5UROtVUgeiZ4QRZH5Qjllb+cymUUTlM Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3htqswc0hy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 04:12:03 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2783tNU2028514;
	Mon, 8 Aug 2022 04:12:02 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3htqswc0h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 04:12:02 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 278469IS009755;
	Mon, 8 Aug 2022 04:12:00 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3hsfx8sn4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 04:12:00 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2784CErk32768476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 04:12:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F1D2A4055;
	Mon,  8 Aug 2022 04:11:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72F55A404D;
	Mon,  8 Aug 2022 04:11:57 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 04:11:57 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A99446010A;
	Mon,  8 Aug 2022 14:11:52 +1000 (AEST)
Message-ID: <df4873ff4be5da5ced4ba72356ec124307861acb.camel@linux.ibm.com>
Subject: Re: [PATCH v2 04/14] powerpc/32: Remove powerpc select
 specialisation
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 Aug 2022 14:11:52 +1000
In-Reply-To: <20220725062621.118988-1-rmclure@linux.ibm.com>
References: <20220725062621.118988-1-rmclure@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7H07jMePgXpBlWuN1yTfgZhOfAKtVTkf
X-Proofpoint-ORIG-GUID: aUMIkPaSAiQm8N6A2GpJfNomrknXsV1K
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_01,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1011 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=899
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080019
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
Cc: christophe.leroy@c-s.fr, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-07-25 at 16:26 +1000, Rohan McLure wrote:
> Syscall #82 has been implemented for 32-bit platforms in a unique way
> on
> powerpc systems. This hack will in effect guess whether the caller is
> expecting new select semantics or old select semantics. It does so
> via a
> guess, based off the first parameter. In new select, this parameter
> represents the length of a user-memory array of file descriptors, and
> in
> old select this is a pointer to an arguments structure.
> 
> The heuristic simply interprets sufficiently large values of its
> first
> parameter as being a call to old select. The following is a
> discussion
> on how this syscall should be handled.
> 
> Link: 
> https://lore.kernel.org/lkml/13737de5-0eb7-e881-9af0-163b0d29a1a0@csgroup.eu/
> 
> As discussed in this thread, the existence of such a hack suggests
> that for
> whatever powerpc binaries may predate glibc, it is most likely that
> they
> would have taken use of the old select semantics. x86 and arm64 both
> implement this syscall with oldselect semantics.
> 
> Remove the powerpc implementation, and update syscall.tbl to refer to
> emit
> a reference to sys_old_select for 32-bit binaries, in keeping with
> how
> other architectures support syscall #82.
> 
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Remove arch-specific select handler
> ---
>  arch/powerpc/kernel/syscalls.c               | 18 ------------------
>  arch/powerpc/kernel/syscalls/syscall.tbl     |  2 +-
>  .../arch/powerpc/entry/syscalls/syscall.tbl  |  2 +-
>  3 files changed, 2 insertions(+), 20 deletions(-)

You should remove the declaration from
arch/powerpc/include/asm/syscalls.h, which I see you end up doing in
patch #6.

Apart from that:

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> 
> diff --git a/arch/powerpc/kernel/syscalls.c
> b/arch/powerpc/kernel/syscalls.c
> index 9f339bcb433d..0afbcbd50433 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -74,24 +74,6 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t,
> len,
>         return do_mmap2(addr, len, prot, flags, fd, offset,
> PAGE_SHIFT);
>  }
>  
> -#ifdef CONFIG_PPC32
> -/*
> - * Due to some executables calling the wrong select we sometimes
> - * get wrong args.  This determines how the args are being passed
> - * (a single ptr to them all args passed) then calls
> - * sys_select() with the appropriate args. -- Cort
> - */
> -SYSCALL_DEFINE5(ppc_select, int, n, fd_set __user *, inp,
> -               fd_set __user *, outp, fd_set __user *, exp,
> -               struct __kernel_old_timeval __user *, tvp)
> -{
> -       if ((unsigned long)n >= 4096)
> -               return sys_old_select((void __user *)n);
> -
> -       return sys_select(n, inp, outp, exp, tvp);
> -}
> -#endif
> -
>  #ifdef CONFIG_PPC64
>  static inline long do_ppc64_personality(unsigned long personality)
>  {
> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl
> b/arch/powerpc/kernel/syscalls/syscall.tbl
> index 59d9259dfbb5..c6cfcdf52c57 100644
> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
> @@ -110,7 +110,7 @@
>  79     common  settimeofday                    sys_settimeofday     
>            compat_sys_settimeofday
>  80     common  getgroups                       sys_getgroups
>  81     common  setgroups                       sys_setgroups
> -
> 82     32      select                          sys_ppc_select         
>          sys_ni_syscall
> +82     32      select                          sys_old_select       
>            sys_ni_syscall
>  82     64      select                          sys_ni_syscall
>  82     spu     select                          sys_ni_syscall
>  83     common  symlink                         sys_symlink
> diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> index 437066f5c4b2..b4c970c9c6b1 100644
> --- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> +++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> @@ -110,7 +110,7 @@
>  79     common  settimeofday                    sys_settimeofday     
>            compat_sys_settimeofday
>  80     common  getgroups                       sys_getgroups
>  81     common  setgroups                       sys_setgroups
> -
> 82     32      select                          sys_ppc_select         
>          sys_ni_syscall
> +82     32      select                          sys_old_select       
>            sys_ni_syscall
>  82     64      select                          sys_ni_syscall
>  82     spu     select                          sys_ni_syscall
>  83     common  symlink                         sys_symlink

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

