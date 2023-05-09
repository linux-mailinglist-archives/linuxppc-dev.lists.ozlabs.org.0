Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E8E6FCA7D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 17:47:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QG2cD1Y44z3fQ9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 01:47:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V8ZmyEYM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V8ZmyEYM;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QG2bK51tlz3fKj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 01:47:09 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 349FkYDT007713;
	Tue, 9 May 2023 15:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=FwcBukllKawgB0ZOIUCNkNEv2iYHCWd3IfOpq2naumg=;
 b=V8ZmyEYMrOI/og0Q+GJJrvZ5fJCpK0ataNEplNxYlDfAfB/YHX4oF/EvWh+f+L5Of60p
 W2e3yIWLrq0/i8LgPWwfLBZ+pUTK2PUCMa/H1xne3ZF3w7UMb+5Mw6EEv6yld1HVG0z2
 3NwloFhe5MkKU+WArgcmS/0HWoqXnB1r413jL56y6W9WIpQKh9jcTk4saoh4AOe3uvhO
 MoGoeIL5ViDgGOGiRcth+gWMqoMd9U82XBHKVsF809thiqwCb4szpptkTQfLKzUSny2/
 NtwuasHuvsRngFmTU830vofsqI/ZV0uGFy4JhKaKsfhjVO6BaAKpqhbxbBHbG8T3LEUB aw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfrn5h6ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 15:47:03 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 349Fkpkh008923;
	Tue, 9 May 2023 15:46:51 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfrn5h65s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 15:46:51 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 348Lmpem012909;
	Tue, 9 May 2023 15:46:45 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qf84e8hqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 15:46:44 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 349FkgY445023606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 May 2023 15:46:42 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BED6E20040;
	Tue,  9 May 2023 15:46:42 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F98C20043;
	Tue,  9 May 2023 15:46:42 +0000 (GMT)
Received: from localhost (unknown [9.43.72.246])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 May 2023 15:46:42 +0000 (GMT)
Date: Tue, 09 May 2023 19:34:04 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/64: Use -mprofile-kernel for big endian ELFv2
 kernels
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
References: <20230506011814.8766-1-npiggin@gmail.com>
In-Reply-To: <20230506011814.8766-1-npiggin@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1683640469.r7fu0pmbzi.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9je-AhSU_xWYAor7svZWT2LwxmBmtr86
X-Proofpoint-ORIG-GUID: TXV60TrhSzJ6RvKvSwX4H1DfDHIxNEtG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_09,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0
 mlxscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090128
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin wrote:
> -mprofile-kernel is an optimised calling convention for mcount that
> Linux  has only implemented with the ELFv2 ABI, so it was disabled for
> big endian kernels. However it does work with ELFv2 big endian, so let's
> allow that if the compiler supports it.
>=20
> Cc: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Christophe had the good idea that we could use -mprofile-kernel for
> ELFv2 BE. Unfortunately can't remove -pg due to lack of -mprofile-kernel
> in clang, but this gives BE the nicer ftrace code with GCC at least.
> Function tracer works for me with a BE kernel.

LGTM. With a few minor nits below:
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

>=20
> Thanks,
> Nick
>=20
>  arch/powerpc/Kconfig                            | 6 ++++--
>  arch/powerpc/tools/gcc-check-mprofile-kernel.sh | 4 ++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index a64bfd9b8a1d..bd2ee7af1342 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -547,8 +547,10 @@ config LD_HEAD_STUB_CATCH
>  	  If unsure, say "N".
>=20
>  config MPROFILE_KERNEL
> -	depends on PPC64 && CPU_LITTLE_ENDIAN && FUNCTION_TRACER
> -	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-ker=
nel.sh $(CC) -I$(srctree)/include -D__KERNEL__)
> +	depends on PPC64 && FUNCTION_TRACER
> +	depends on CPU_LITTLE_ENDIAN || PPC64_BIG_ENDIAN_ELF_ABI_V2

Can't we just check for PPC64_ELF_ABI_V2?

> +	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-ker=
nel.sh $(CC) -mlittle-endian) if CPU_LITTLE_ENDIAN
> +	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-ker=
nel.sh $(CC) -mbig-endian) if CPU_BIG_ENDIAN
>=20
>  config HOTPLUG_CPU
>  	bool "Support for enabling/disabling CPUs"
> diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/power=
pc/tools/gcc-check-mprofile-kernel.sh
> index 137f3376ac2b..e78c599251ff 100755
> --- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> +++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> @@ -14,13 +14,13 @@ set -o pipefail

We have this comment before the below code, which should also be updated/re=
moved:
  # -mprofile-kernel is only supported on 64le, so this should not be invok=
ed
  # for other targets. Therefore we can pass in -m64 and -mlittle-endian
  # explicitly, to take care of toolchains defaulting to other targets.

>  # Test whether the compile option -mprofile-kernel exists and generates
>  # profiling code (ie. a call to _mcount()).
>  echo "int func() { return 0; }" | \
> -    $* -m64 -mlittle-endian -S -x c -O2 -p -mprofile-kernel - -o - \
> +    $* -m64 -S -x c -O2 -p -mprofile-kernel - -o - \
>      2> /dev/null | grep -q "_mcount"
>=20
>  # Test whether the notrace attribute correctly suppresses calls to _mcou=
nt().
>=20
>  echo -e "#include <linux/compiler.h>\nnotrace int func() { return 0; }" =
| \
> -    $* -m64 -mlittle-endian -S -x c -O2 -p -mprofile-kernel - -o - \
> +    $* -m64 -S -x c -O2 -p -mprofile-kernel - -o - \
>      2> /dev/null | grep -q "_mcount" && \
>      exit 1
>=20

- Naveen

