Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C6167AAE3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 08:28:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1wSK0Wd1z3cf1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 18:28:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LL+hoXim;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LL+hoXim;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1wRL27l0z3c63
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 18:27:57 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30P7OXQb005783;
	Wed, 25 Jan 2023 07:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=FfhVjFCYsJ7dAlAMtp/34XlGJFtHr6re2RiJOsHNLGg=;
 b=LL+hoXimFDg7XgnRP7HNG7peBxxa4Lk9s/+dlusdxfJ0opDC5BAkOSX9NHf2vFMCBsp1
 uHzFGGN7pXKFN9EwWQXa8Jx7r8QrBHfXxgpg0YNaE8q8mwOysrHlHS2OKag+5/RQePBe
 NweMQylOz0IZqwdU+irh4l2HFPhhU1xN916UvUCkYxBhlu6RRyf88JyMUIWB+S/OQSP4
 KvN09MsYQFnhZuYAOq2chVT0GYL+yh+2X3nz06H68Cit/SXWFdxMtY/Z7rzHI3SXizCy
 /Vd9hX4b+pyBqsSIIQHMcKRR7IXP0JRZBIa1q3yse7H+xVOYihW9kGVvsYM+8mgAdX/3 jA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3na9vcfxrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 07:27:43 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30P7K44t012765;
	Wed, 25 Jan 2023 07:27:43 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3na9vcfxr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 07:27:43 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30P0hr78004576;
	Wed, 25 Jan 2023 07:27:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3n87afbg31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 07:27:41 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30P7RcdH43713006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 07:27:38 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE1D42004B;
	Wed, 25 Jan 2023 07:27:38 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0369420043;
	Wed, 25 Jan 2023 07:27:38 +0000 (GMT)
Received: from localhost (unknown [9.43.44.248])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jan 2023 07:27:37 +0000 (GMT)
Date: Wed, 25 Jan 2023 12:57:35 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: arch/powerpc/kernel/head_85xx.o: warning: objtool:
 .head.text+0x1a6c: unannotated intra-function call
To: kernel test robot <lkp@intel.com>, Sathvika Vasireddy <sv@linux.ibm.com>
References: <202301161955.38kK6ksW-lkp@intel.com>
	<b2273730-f885-7658-7ec4-12fb5bfc515b@linux.ibm.com>
In-Reply-To: <b2273730-f885-7658-7ec4-12fb5bfc515b@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1674631223.9e09lbzzb6.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: diT2iJU4YjmWzYK-pl-jDh7d03PW7NzN
X-Proofpoint-ORIG-GUID: dVxg2tl4LVOhYt4gQaRSdeIE_d5GI_xr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_02,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1011 spamscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250064
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sathvika Vasireddy wrote:
>=20
>>>> arch/powerpc/kvm/booke.o: warning: objtool: kvmppc_fill_pt_regs+0x30: =
unannotated intra-function call
>=20
> As an attempt to fix it, I tried expanding ANNOTATE_INTRA_FUNCTION_CALL=20
> macro to indicate that the branch target is valid. It then threw another=20
> warning (arch/powerpc/kvm/booke.o: warning: objtool:=20
> kvmppc_fill_pt_regs+0x38: intra_function_call not a direct call). The=20
> below diff just removes the warnings for me, but I'm not very sure if=20
> this is the best way to fix the objtool warnings seen with this=20
> particular file. Please let me know if there are any better ways to fix i=
t.
>=20
> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
> index 0dce93ccaadf..b6a413824b98 100644
> --- a/arch/powerpc/kvm/booke.c
> +++ b/arch/powerpc/kvm/booke.c
> @@ -917,7 +917,9 @@ static void kvmppc_fill_pt_regs(struct pt_regs *regs)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm("mr %0, 1" : "=3Dr"(r1));
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm("mflr %0" : "=3Dr"(lr));
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm("mfmsr %0" : "=3Dr"(msr))=
;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm(".pushsection .discard.intra_fu=
nction_calls; .long 999f;=20
> .popsection; 999:");
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm("bl 1f; 1: mflr %0" : "=
=3Dr"(ip));

I don't think you can assume that there won't be anything in between two=20
asm statements. Does it work if you combine both the above asm=20
statements into a single one?

Even if that works, I don't think it is good to expand the macro here. =20
That asm statement looks to be trying to grab the current nip. I don't=20
know enough about that code, and someone who knows more about KVM may be=20
able to help, but it looks like we should be able to simply set 'ip' to=20
the address of kvmppc_fill_pt_regs()?


- Naveen

