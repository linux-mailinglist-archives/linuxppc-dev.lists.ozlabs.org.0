Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F07365EB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 19:38:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPrWD5sHdz303H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 03:38:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z6OPgaOL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Z6OPgaOL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPrVm4ZP8z2yR2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 03:37:51 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13KHYOA2017672
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 13:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : references : in-reply-to : mime-version : message-id : content-type :
 content-transfer-encoding; s=pp1;
 bh=7FLVB13M4DBERIGV4W4y7kKjkzZgpq+arhjF3qUUe10=;
 b=Z6OPgaOLuvwJfoC1fsJUJEhdvX+Cs4pj4l0QfHQNVg1BSmsAqqbtZySRSJ1oS6CpW1LM
 YBLBU+yRmUSJQztw3aYbCgrOWWIrSRx46DEYQ3N6gsu/TarI68HvpU+yMVSmmpC75Iyw
 6Xsjlawb2wmH+0ow1yRmVuC9u5Qu5BQ93IbLH0fawm49tQUv6ImSS3fQ6fuMFLzB6Vou
 xGsDM30kNiRCHYWKFQ/kYDqStW4ua79XgmdabuaRqVw7IuMUm/eL3LoDhz8N3GMtXKBQ
 Cn172F9at8oV5kMn9DTvQtaQC9P7N9Q5EhB9N8ds0d9fa1bw9YjSu0LwEqQyeZaiW2DQ BQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3823en83u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 13:37:47 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13KHXRgY025771
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 17:37:45 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 37yqa8hvdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 17:37:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13KHbK6G29622622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 17:37:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76F284C044;
 Tue, 20 Apr 2021 17:37:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08F8A4C046;
 Tue, 20 Apr 2021 17:37:43 +0000 (GMT)
Received: from localhost (unknown [9.85.73.109])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Apr 2021 17:37:42 +0000 (GMT)
Date: Tue, 20 Apr 2021 23:07:41 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/sstep: Add tests for setb instruction
To: linuxppc-dev@lists.ozlabs.org, Sathvika Vasireddy
 <sathvika@linux.vnet.ibm.com>
References: <cover.1618469454.git.sathvika@linux.vnet.ibm.com>
 <ab1756406a5c39c32b809a0699a22c10425030ae.1618469454.git.sathvika@linux.vnet.ibm.com>
In-Reply-To: <ab1756406a5c39c32b809a0699a22c10425030ae.1618469454.git.sathvika@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1618940194.cdrexxd77i.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z7iaAueAJkYAS0v7UYY8s4w0L57P5jNw
X-Proofpoint-ORIG-GUID: z7iaAueAJkYAS0v7UYY8s4w0L57P5jNw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_08:2021-04-20,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200121
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sathvika Vasireddy wrote:
> This adds selftests for setb instruction.
>=20
> Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h |  1 +
>  arch/powerpc/lib/test_emulate_step.c  | 28 +++++++++++++++++++++++++++++=
++++++
>  2 files changed, 29 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index ed161ef2b3ca..32bf53260737 100644
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
> index 783d1b85ecfe..c338e35b627c 100644
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
> @@ -929,6 +931,67 @@ static struct compute_test compute_tests[] =3D {
>  			}
>  		}
>  	},
> +	{
> +		.mnemonic =3D "setb",
> +		.subtests =3D {

Since this is ISA v3.0, you also need to restrict these tests. You can=20
do that by setting cpu_feature.

- Naveen

