Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2744504C90
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 08:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhcKv5xm8z3bc4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 16:22:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=leUKqGQ5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=leUKqGQ5; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhcKD5gV4z2xDV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 16:21:51 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23I5XhN8026855; 
 Mon, 18 Apr 2022 06:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=yG3tvuh/wkbdNu2Hnn37iYqP01H/spW/kJNWBKIP3Mk=;
 b=leUKqGQ5W4plr1aH07/FRL8t6grvfVdzUi+h/WxVbY9vFGPPUJFAMBY3iYtYeIEY3VVB
 zlEwkvQXg3scKFszCrQC0q+6X8gY946s9Ow4NYzkNvApuUbtFqZNAvKF6HfI6hjJijqv
 0pL+94eUi85w87f3LnQHUfXClLx5VhHuuXh+G6uZlC9TvFcMFFqPK3uPK6MrBPRpjl7x
 NVEvDnb1hbZ0pJnYEn+YD1zFXJirAp28iRQGhGBcVP0jwx5MClARDMoqg6ZeEdfz+IIE
 ycQIZm38sBepwl+2Fyf/sItqyV3szPQuAu1YtyE12ZNshwd/tQkJRVxmNHj9v0ZAzdyx Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7k9dmmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:21:22 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23I6LJ2e024528;
 Mon, 18 Apr 2022 06:21:22 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7k9dmky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:21:22 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23I69d5g030270;
 Mon, 18 Apr 2022 06:21:20 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3ffne8jb96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 06:21:20 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23I6LINc44040660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 06:21:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE920AE045;
 Mon, 18 Apr 2022 06:21:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82F03AE04D;
 Mon, 18 Apr 2022 06:21:17 +0000 (GMT)
Received: from localhost (unknown [9.43.2.186])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Apr 2022 06:21:17 +0000 (GMT)
Date: Mon, 18 Apr 2022 11:51:16 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v1 07/22] powerpc/ftrace: Use patch_instruction() return
 directly
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
 <b4505e936e1aee411f7132a27791cf138102f35f.1648131740.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b4505e936e1aee411f7132a27791cf138102f35f.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1650262058.altfknhzto.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LCSBoDByS4Ci7hB89TZFIQrU8zICUT7R
X-Proofpoint-GUID: Wn_hlXc4xkSYL9KmNaiODcLR1pcf1JUy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=802 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204180035
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> Instead of returning -EPERM when patch_instruction() fails,
> just return what patch_instruction returns.
>=20
> That simplifies ftrace_modify_code():
>=20
> 	   0:	94 21 ff c0 	stwu    r1,-64(r1)
> 	   4:	93 e1 00 3c 	stw     r31,60(r1)
> 	   8:	7c 7f 1b 79 	mr.     r31,r3
> 	   c:	40 80 00 30 	bge     3c <ftrace_modify_code+0x3c>
> 	  10:	93 c1 00 38 	stw     r30,56(r1)
> 	  14:	7c 9e 23 78 	mr      r30,r4
> 	  18:	7c a4 2b 78 	mr      r4,r5
> 	  1c:	80 bf 00 00 	lwz     r5,0(r31)
> 	  20:	7c 1e 28 40 	cmplw   r30,r5
> 	  24:	40 82 00 34 	bne     58 <ftrace_modify_code+0x58>
> 	  28:	83 c1 00 38 	lwz     r30,56(r1)
> 	  2c:	7f e3 fb 78 	mr      r3,r31
> 	  30:	83 e1 00 3c 	lwz     r31,60(r1)
> 	  34:	38 21 00 40 	addi    r1,r1,64
> 	  38:	48 00 00 00 	b       38 <ftrace_modify_code+0x38>
> 				38: R_PPC_REL24	patch_instruction
>=20
> Before:
>=20
> 	   0:	94 21 ff c0 	stwu    r1,-64(r1)
> 	   4:	93 e1 00 3c 	stw     r31,60(r1)
> 	   8:	7c 7f 1b 79 	mr.     r31,r3
> 	   c:	40 80 00 4c 	bge     58 <ftrace_modify_code+0x58>
> 	  10:	93 c1 00 38 	stw     r30,56(r1)
> 	  14:	7c 9e 23 78 	mr      r30,r4
> 	  18:	7c a4 2b 78 	mr      r4,r5
> 	  1c:	80 bf 00 00 	lwz     r5,0(r31)
> 	  20:	7c 08 02 a6 	mflr    r0
> 	  24:	90 01 00 44 	stw     r0,68(r1)
> 	  28:	7c 1e 28 40 	cmplw   r30,r5
> 	  2c:	40 82 00 48 	bne     74 <ftrace_modify_code+0x74>
> 	  30:	7f e3 fb 78 	mr      r3,r31
> 	  34:	48 00 00 01 	bl      34 <ftrace_modify_code+0x34>
> 				34: R_PPC_REL24	patch_instruction
> 	  38:	80 01 00 44 	lwz     r0,68(r1)
> 	  3c:	20 63 00 00 	subfic  r3,r3,0
> 	  40:	83 c1 00 38 	lwz     r30,56(r1)
> 	  44:	7c 63 19 10 	subfe   r3,r3,r3
> 	  48:	7c 08 03 a6 	mtlr    r0
> 	  4c:	83 e1 00 3c 	lwz     r31,60(r1)
> 	  50:	38 21 00 40 	addi    r1,r1,64
> 	  54:	4e 80 00 20 	blr
>=20
> It improves ftrace activation/deactivation duration by about 3%.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/trace/ftrace.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index 98e82fa4980f..1b05d33f96c6 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -78,10 +78,7 @@ ftrace_modify_code(unsigned long ip, ppc_inst_t old, p=
pc_inst_t new)
>  	}
>=20
>  	/* replace the text with the new text */
> -	if (patch_instruction((u32 *)ip, new))
> -		return -EPERM;
> -
> -	return 0;
> +	return patch_instruction((u32 *)ip, new);

I think the reason we were returning -EPERM is so that ftrace_bug() can=20
throw the right error message. That will change due to this patch,=20
though I'm not sure how much it matters. -EFAULT and -EPERM seem to=20
print almost the same error message.

- Naveen
