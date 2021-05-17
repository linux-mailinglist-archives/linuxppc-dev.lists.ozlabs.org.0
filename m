Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50819382D84
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 15:35:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkKrX1rhHz3bxY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 23:35:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UOWOxux9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UOWOxux9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkKqz1Tc6z302f
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 23:34:54 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14HDY8cc134155; Mon, 17 May 2021 09:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=uxQIAl+YJ2As1gV6dFAs9aQ7vVcZZ6dGBOQ4WkI+VEo=;
 b=UOWOxux9PLKkMtBIOJ24pQt13OANhxuTwZXQac7LOTnr35Cvoj/Fv6H2Y3tVnyHlvLiR
 SdBsQXdyu0gy/DtLI9QIFPcRw0iWbzDOCielaXmuBvFZMHdo181mCZ7l356NXC3MrrzA
 17tsQ95/veYH6Px795sQ+26IQPN3fuM7dSHXTMbZJJtzF8+yMJ3VTF3n8bo1+HHDbFwk
 q+ydRFU3ixIPlsf1BQxQn7fZ/MxtHg9LvNIYFhhZpXKDEKwXeuHezlS4FDPDx8Vcmbjv
 mo+mC1iuMhHDMS+6x02SzrSxFREk7lLaIhp4+g2QZsSd1QUA2aJqdmQRlAGbgfOk2N7M iA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38krrtsmp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 09:34:43 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14HDXadY031504;
 Mon, 17 May 2021 13:34:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 38j5jgru4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 13:34:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14HDYdij31654286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 13:34:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A9DCA4053;
 Mon, 17 May 2021 13:34:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30433A4051;
 Mon, 17 May 2021 13:34:39 +0000 (GMT)
Received: from localhost (unknown [9.85.118.46])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 May 2021 13:34:38 +0000 (GMT)
Date: Mon, 17 May 2021 19:04:38 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] powerpc/sstep: Add tests for setb instruction
To: linuxppc-dev@lists.ozlabs.org, Sathvika Vasireddy
 <sathvika@linux.vnet.ibm.com>
References: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
 <b05b61ccb5f10279d46fed490796f32ea2ccc270.1620727160.git.sathvika@linux.vnet.ibm.com>
In-Reply-To: <b05b61ccb5f10279d46fed490796f32ea2ccc270.1620727160.git.sathvika@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1621258449.ca00c9oo1k.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yQmmQ6_ktnnSCHZoOuFv0Fo2lgYwPqNI
X-Proofpoint-ORIG-GUID: yQmmQ6_ktnnSCHZoOuFv0Fo2lgYwPqNI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_05:2021-05-17,
 2021-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105170096
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
Cc: dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sathvika Vasireddy wrote:
> This adds selftests for setb instruction.
>=20
> Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h |  1 +
>  arch/powerpc/lib/test_emulate_step.c  | 29 +++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)

Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


>=20
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index ac41776661e9..927551dd870b 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -245,6 +245,7 @@
>  #define PPC_INST_STRING			0x7c00042a
>  #define PPC_INST_STRING_MASK		0xfc0007fe
>  #define PPC_INST_STRING_GEN_MASK	0xfc00067e
> +#define PPC_INST_SETB			0x7c000100
>  #define PPC_INST_STSWI			0x7c0005aa
>  #define PPC_INST_STSWX			0x7c00052a
>  #define PPC_INST_TRECHKPT		0x7c0007dd
> diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test=
_emulate_step.c
> index 783d1b85ecfe..a0a52fe5e979 100644
> --- a/arch/powerpc/lib/test_emulate_step.c
> +++ b/arch/powerpc/lib/test_emulate_step.c
> @@ -53,6 +53,8 @@
>  	ppc_inst_prefix(PPC_PREFIX_MLS | __PPC_PRFX_R(pr) | IMM_H(i), \
>  			PPC_RAW_ADDI(t, a, i))
> =20
> +#define TEST_SETB(t, bfa)       ppc_inst(PPC_INST_SETB | ___PPC_RT(t) | =
___PPC_RA((bfa & 0x7) << 2))
> +
> =20
>  static void __init init_pt_regs(struct pt_regs *regs)
>  {
> @@ -929,6 +931,33 @@ static struct compute_test compute_tests[] =3D {
>  			}
>  		}
>  	},
> +	{
> +		.mnemonic =3D "setb",
> +		.cpu_feature =3D CPU_FTR_ARCH_300,
> +		.subtests =3D {
> +			{
> +				.descr =3D "BFA =3D 1, CR =3D GT",
> +				.instr =3D TEST_SETB(20, 1),
> +				.regs =3D {
> +					.ccr =3D 0x4000000,
> +				}
> +			},
> +			{
> +				.descr =3D "BFA =3D 4, CR =3D LT",
> +				.instr =3D TEST_SETB(20, 4),
> +				.regs =3D {
> +					.ccr =3D 0x8000,
> +				}
> +			},
> +			{
> +				.descr =3D "BFA =3D 5, CR =3D EQ",
> +				.instr =3D TEST_SETB(20, 5),
> +				.regs =3D {
> +					.ccr =3D 0x200,
> +				}
> +			}
> +		}
> +	},
>  	{
>  		.mnemonic =3D "add",
>  		.subtests =3D {
> --=20
> 2.16.4
>=20
>=20
