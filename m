Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B714A382D81
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 15:34:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkKr01gJ0z3bnb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 23:34:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bcLvZc4k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bcLvZc4k; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkKqR1TSlz2yhr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 23:34:26 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14HDYDJo017498; Mon, 17 May 2021 09:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=W1DlbnS0U8AhHJWiOAyleQU0QcIIpNVgr8s9+D5r7CY=;
 b=bcLvZc4kJR4cX9+0MgQc/7Xnpl7JQ2jVrTEqOd115F+esMkE5HwaXr9AC0VaqomQiyvo
 plmIG2m/HYSff6W0DnhDIvzhB6amPE9J/foH3gXnpxgD40rYBi/e34WKUbxU51TOLd+f
 7P50A25ZXM0wa0rfm0hpO/94m580oFUB4dB1PDH8crI9GSf7V6QeCmBo7JIQBvW1rPK4
 wfNmxg58VxWrAz6QWf5PaOfakUVIYn0PEl9mDhNZhoytF+c+FFci3q66YnBi7rtU8yOc
 tMVuCKoro2Uy5ko5YRh0LAK0r25AywN58qdsS47xDhuzwpiPo5jwkEHkPa+j+b8+LSqe KQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38knhqfdqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 09:34:14 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14HDWo10016825;
 Mon, 17 May 2021 13:34:06 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 38j5x88txw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 13:34:06 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14HDY40k28115398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 13:34:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76E374203F;
 Mon, 17 May 2021 13:34:04 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F06FC42041;
 Mon, 17 May 2021 13:34:03 +0000 (GMT)
Received: from localhost (unknown [9.85.118.46])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 May 2021 13:34:03 +0000 (GMT)
Date: Mon, 17 May 2021 19:04:02 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc/sstep: Add emulation support for
 =?CP1251?B?kXNldGKS?= instruction
To: linuxppc-dev@lists.ozlabs.org, Sathvika Vasireddy
 <sathvika@linux.vnet.ibm.com>
References: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
 <7b735b0c898da0db2af8628a64df2f5114596f22.1620727160.git.sathvika@linux.vnet.ibm.com>
In-Reply-To: <7b735b0c898da0db2af8628a64df2f5114596f22.1620727160.git.sathvika@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1621258377.pltyv2jfwk.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q8vOXmpzvVeWhKpc7heaWsAkKeS5fK6s
X-Proofpoint-GUID: Q8vOXmpzvVeWhKpc7heaWsAkKeS5fK6s
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_05:2021-05-17,
 2021-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105170096
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
> This adds emulation support for the following instruction:
>    * Set Boolean (setb)
>=20
> Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
> ---
>  arch/powerpc/lib/sstep.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

>=20
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index 45bda2520755..aee42bcc775b 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1700,6 +1700,28 @@ int analyse_instr(struct instruction_op *op, const=
 struct pt_regs *regs,
>  			op->val =3D regs->ccr & imm;
>  			goto compute_done;
> =20
> +		case 128:	/* setb */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				goto unknown_opcode;
> +			/*
> +			 * 'ra' encodes the CR field number (bfa) in the top 3 bits.
> +			 * Since each CR field is 4 bits,
> +			 * we can simply mask off the bottom two bits (bfa * 4)
> +			 * to yield the first bit in the CR field.
> +			 */
> +			ra =3D ra & ~0x3;
> +			/* 'val' stores bits of the CR field (bfa) */
> +			val =3D regs->ccr >> (CR0_SHIFT - ra);
> +			/* checks if the LT bit of CR field (bfa) is set */
> +			if (val & 8)
> +				op->val =3D -1;
> +			/* checks if the GT bit of CR field (bfa) is set */
> +			else if (val & 4)
> +				op->val =3D 1;
> +			else
> +				op->val =3D 0;
> +			goto compute_done;
> +
>  		case 144:	/* mtcrf */
>  			op->type =3D COMPUTE + SETCC;
>  			imm =3D 0xf0000000UL;
> --=20
> 2.16.4
>=20
>=20
