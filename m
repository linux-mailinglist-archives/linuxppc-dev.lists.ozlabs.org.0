Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C153D5A0DEB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 12:31:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCzm03bgkz3cB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 20:31:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iS3QrL0t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iS3QrL0t;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCzlF3j5Jz3bXR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 20:31:04 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P9VCVZ007511;
	Thu, 25 Aug 2022 10:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=JYz6yE+IBR3ZxjEeajtj3nlaitgP+ytBhZUlKrF/UKo=;
 b=iS3QrL0tZWDc6uYpYPViW5WlG2UzsQ99/HUCpuBBxBjzfOn0xNu0n+ZXwzYQenMuxEMh
 RXkvZbCAjuHKeWy6kil9YSZPcg+qivr/B4IJ1sr6V3RDyFEamckcUbQpojypJDkSk5qn
 qH+hxWA6rgJ2NuKJ3C1ntR9O0l9kVdb7ZmgcFVYw8cTg76ZmyDaFBN65DnsFSp+uhQSx
 iGpUtesQEr3m7YtUj5xCGPlndQ3gfkY/KODi8jACWHBUsgLJH+cITVcUvTsH5jcobr0t
 33lVUk87x7AVVhaAYJ5f3fyzFVIREGOIA+B3FiO2pBvtRQVopmd//o6zthzogyT/5P2K Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j64xjfnwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Aug 2022 10:30:58 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27PAUoQZ020035;
	Thu, 25 Aug 2022 10:30:58 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j64xjfnw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Aug 2022 10:30:58 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27PANPba023805;
	Thu, 25 Aug 2022 10:30:56 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3j2pvj6a0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Aug 2022 10:30:56 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27PARpiO43385310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Aug 2022 10:27:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6B3F52050;
	Thu, 25 Aug 2022 10:30:53 +0000 (GMT)
Received: from localhost (unknown [9.43.41.198])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 63E8A5204F;
	Thu, 25 Aug 2022 10:30:53 +0000 (GMT)
Date: Thu, 25 Aug 2022 16:00:52 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] compiler-gcc.h: Remove ancient workaround for gcc PR
 58670
To: linux-kernel@vger.kernel.org, Uros Bizjak <ubizjak@gmail.com>,
        x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <20220624141412.72274-1-ubizjak@gmail.com>
In-Reply-To: <20220624141412.72274-1-ubizjak@gmail.com>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1661422971.cqtahfm22j.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n4nPEr4_DKqV7t7Sbq939YhBxWNh-F8C
X-Proofpoint-ORIG-GUID: dArQoAqUYuj9ZjLsB45xWWI8Z16dfYen
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_05,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1011 mlxlogscore=863
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208250037
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
Cc: linuxppc-dev@lists.ozlabs.org, sv@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Uros Bizjak wrote:
> The workaround for 'asm goto' miscompilation introduces a compiler
> barrier quirk that inhibits many useful compiler optimizations. For
> example, __try_cmpxchg_user compiles to:
>=20
>    11375:	41 8b 4d 00          	mov    0x0(%r13),%ecx
>    11379:	41 8b 02             	mov    (%r10),%eax
>    1137c:	f0 0f b1 0a          	lock cmpxchg %ecx,(%rdx)
>    11380:	0f 94 c2             	sete   %dl
>    11383:	84 d2                	test   %dl,%dl
>    11385:	75 c4                	jne    1134b <...>
>    11387:	41 89 02             	mov    %eax,(%r10)
>=20
> where the barrier inhibits flags propagation from asm when
> compiled with gcc-12.
>=20
> When the mentioned quirk is removed, the following code is generated:
>=20
>    11553:	41 8b 4d 00          	mov    0x0(%r13),%ecx
>    11557:	41 8b 02             	mov    (%r10),%eax
>    1155a:	f0 0f b1 0a          	lock cmpxchg %ecx,(%rdx)
>    1155e:	74 c9                	je     11529 <...>
>    11560:	41 89 02             	mov    %eax,(%r10)
>=20
> The refered compiler bug:
>=20
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D58670
>=20
> was fixed for gcc-4.8.2.
>=20
> Current minimum required version of GCC is version 5.1 which has
> the above 'asm goto' miscompilation fixed, so remove the workaround.
>=20
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  include/linux/compiler-gcc.h | 11 -----------
>  1 file changed, 11 deletions(-)
>=20
> diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> index a0c55eeaeaf1..9b157b71036f 100644
> --- a/include/linux/compiler-gcc.h
> +++ b/include/linux/compiler-gcc.h
> @@ -66,17 +66,6 @@
>  		__builtin_unreachable();	\
>  	} while (0)
>=20=20
> -/*
> - * GCC 'asm goto' miscompiles certain code sequences:
> - *
> - *   http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D58670
> - *
> - * Work it around via a compiler barrier quirk suggested by Jakub Jeline=
k.
> - *
> - * (asm goto is automatically volatile - the naming reflects this.)
> - */
> -#define asm_volatile_goto(x...)	do { asm goto(x); asm (""); } while (0)
> -
>  #if defined(CONFIG_ARCH_USE_BUILTIN_BSWAP)
>  #define __HAVE_BUILTIN_BSWAP32__
>  #define __HAVE_BUILTIN_BSWAP64__

This is causing a build issue on ppc64le with a new patch replacing use=20
of unreachable() with __builtin_unreachable() in __WARN_FLAGS():
https://lore.kernel.org/linuxppc-dev/20220808114908.240813-2-sv@linux.ibm.c=
om/

during RTL pass: combine
In file included from /linux/kernel/locking/rtmutex_api.c:9:
/linux/kernel/locking/rtmutex.c: In function '__rt_mutex_slowlock.constprop=
':
/linux/kernel/locking/rtmutex.c:1612:1: internal compiler error: in purge_d=
ead_edges, at cfgrtl.c:3369
 1612 | }
      | ^
0x142817c internal_error(char const*, ...)
	???:0
0x5c8a1b fancy_abort(char const*, int, char const*)
	???:0
0x72017f purge_all_dead_edges()
	???:0
Please submit a full bug report,
with preprocessed source if appropriate.
Please include the complete backtrace with any bug report.
See <file:///usr/share/doc/gcc-11/README.Bugs> for instructions.


So, it looks like gcc still has issues with certain uses of asm goto.


- Naveen

