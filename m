Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFE6588876
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 10:07:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyPbn3Zlkz3bXn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 18:07:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s7VdRk7u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s7VdRk7u;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyPb30V59z2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 18:06:54 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2737CGgG005901;
	Wed, 3 Aug 2022 08:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=cD/HLOT1RCr5FLze4xYHuh82tvZmGK0k7ghWRsfmnMs=;
 b=s7VdRk7u/VPgZX+3zRnI5WEBcaEr49EVC9har418PaXIytMUYVl3Z3KmOfxJIUmzvpnn
 IZICnARoFMQEKx0JoHxtdFJMrWwRIYUrCUBwz/WICyuI+vdpRzGrV3ZZ6w9/oNpibLlJ
 ubGoesRJ5TnWxAFJ1NucRrDjTfpbWQqvqgQQ5RLjd/vUyJoy+w2Egg0w2OetFbXcTSto
 vLviHrZ1/Fs92jzv20jzTqK80h6LufA0ilQ7if22I32sGtQIdGJsulcRTz6qiGJCFUPn
 S313xNuwe/0TzqQ6SxdZh9Ohihl/ERzr0/y/NRGcQE2UrUvlDG0CU2Ke6sWQVMgvcSDI EA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hqmdu1bx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Aug 2022 08:06:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27386GEr017991;
	Wed, 3 Aug 2022 08:06:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma02fra.de.ibm.com with ESMTP id 3hmv98vgnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Aug 2022 08:06:39 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27386qMM31326540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Aug 2022 08:06:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E7DF42041;
	Wed,  3 Aug 2022 08:06:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D93E84203F;
	Wed,  3 Aug 2022 08:06:35 +0000 (GMT)
Received: from localhost (unknown [9.43.94.156])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  3 Aug 2022 08:06:35 +0000 (GMT)
Date: Wed, 03 Aug 2022 13:36:34 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/ppc-opcode: Define and use PPC_RAW_TRAP() and
 PPC_RAW_TW()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Christophe Leroy
	<christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>
References: 	<b2d762191b095530789ac8b71b167c6740bb6aed.1657205708.git.christophe.leroy@csgroup.eu>
	<52c7e522e56a38e3ff0363906919445920005a8f.1657205708.git.christophe.leroy@csgroup.eu>
In-Reply-To: 	<52c7e522e56a38e3ff0363906919445920005a8f.1657205708.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1659513939.dxqqwb8mat.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 91osUYcya-v8DiiS0T0UMNk2AIlwaNzq
X-Proofpoint-GUID: 91osUYcya-v8DiiS0T0UMNk2AIlwaNzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_03,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=898 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030037
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> Add and use PPC_RAW_TRAP() instead of opencoding.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h | 2 ++
>  arch/powerpc/include/asm/probes.h     | 3 ++-
>  arch/powerpc/xmon/xmon.c              | 2 +-
>  3 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index 89beabf5325c..5527a955fb4a 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -581,6 +581,8 @@
> =20
>  #define PPC_RAW_BRANCH(offset)		(0x48000000 | PPC_LI(offset))
>  #define PPC_RAW_BL(offset)		(0x48000001 | PPC_LI(offset))
> +#define PPC_RAW_TW(t0, a, b)		(0x7f000008 | ___PPC_RS(t0) | ___PPC_RA(a)=
 | ___PPC_RB(b))

Shouldn't that be 0x7c000008 ?

- Naveen


> +#define PPC_RAW_TRAP()			PPC_RAW_TW(31, 0, 0)
> =20
>  /* Deal with instructions that older assemblers aren't aware of */
>  #define	PPC_BCCTR_FLUSH		stringify_in_c(.long PPC_INST_BCCTR_FLUSH)
> diff --git a/arch/powerpc/include/asm/probes.h b/arch/powerpc/include/asm=
/probes.h
> index 00634e3145e7..e77a2ed7d938 100644
> --- a/arch/powerpc/include/asm/probes.h
> +++ b/arch/powerpc/include/asm/probes.h
> @@ -9,8 +9,9 @@
>   */
>  #include <linux/types.h>
>  #include <asm/disassemble.h>
> +#include <asm/ppc-opcode.h>
> =20
> -#define BREAKPOINT_INSTRUCTION	0x7fe00008	/* trap */
> +#define BREAKPOINT_INSTRUCTION	PPC_RAW_TRAP()	/* trap */
> =20
>  /* Trap definitions per ISA */
>  #define IS_TW(instr)		(((instr) & 0xfc0007fe) =3D=3D 0x7c000008)
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index f80c714f1d49..26ef3388c24c 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -116,7 +116,7 @@ struct bpt {
>  static struct bpt bpts[NBPTS];
>  static struct bpt dabr[HBP_NUM_MAX];
>  static struct bpt *iabr;
> -static unsigned bpinstr =3D 0x7fe00008;	/* trap */
> +static unsigned int bpinstr =3D PPC_RAW_TRAP();
> =20
>  #define BP_NUM(bp)	((bp) - bpts + 1)
> =20
> --=20
> 2.36.1
>=20
>=20
>=20
