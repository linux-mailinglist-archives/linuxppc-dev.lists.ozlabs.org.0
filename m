Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 175E717A5AF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 13:51:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Y9bt4KCFzDqbh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 23:51:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Y9WV2jhHzDqW7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 23:47:33 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 025CiBnh150975
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Mar 2020 07:47:31 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmg3n2br-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 07:47:31 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Thu, 5 Mar 2020 12:47:27 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Mar 2020 12:47:24 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 025ClNjc29687814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 12:47:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 617CA11C064;
 Thu,  5 Mar 2020 12:47:23 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 029A011C04C;
 Thu,  5 Mar 2020 12:47:23 +0000 (GMT)
Received: from localhost (unknown [9.199.53.44])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Mar 2020 12:47:22 +0000 (GMT)
Date: Thu, 05 Mar 2020 18:17:21 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: eh_frame confusion
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
 <1583168442.ovqnxu16tp.naveen@linux.ibm.com>
 <1583169883.zo43kx69lm.naveen@linux.ibm.com>
In-Reply-To: <1583169883.zo43kx69lm.naveen@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20030512-0008-0000-0000-0000035998EA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030512-0009-0000-0000-00004A7AD005
Message-Id: <1583412126.fc8zskkv66.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-05_03:2020-03-05,
 2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050082
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

Naveen N. Rao wrote:
> Naveen N. Rao wrote:
>> Rasmus Villemoes wrote:
<snip>
> Can you check if the below patch works? I am yet to test this in more=20
> detail, but would be good to know the implications for ppc32.
>=20
> - Naveen
>=20
>=20
> ---
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index f35730548e42..5b5bf98b8217 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -239,10 +239,7 @@ KBUILD_CFLAGS +=3D $(call cc-option,-mno-vsx)
>  KBUILD_CFLAGS +=3D $(call cc-option,-mno-spe)
>  KBUILD_CFLAGS +=3D $(call cc-option,-mspe=3Dno)
> =20
> -# FIXME: the module load should be taught about the additional relocs
> -# generated by this.
> -# revert to pre-gcc-4.4 behaviour of .eh_frame
> -KBUILD_CFLAGS  +=3D $(call cc-option,-fno-dwarf2-cfi-asm)
> +KBUILD_CFLAGS  +=3D $(call cc-option,-fno-asynchronous-unwind-tables)

In terms of the CFI information, the primary difference I see with=20
-fno-dwarf2-cfi-asm is that when dumping the debug frames, CIE indicates=20
version 3, while otherwise (i.e., without -fno-dwarf2-cfi-asm and=20
with/without -fasynchronous-unwind-tables), it is version 1, regardless=20
of -gdwarf-2/-gdwarf-4. There are few more minor changes, but none of=20
these looked significant to me.

> =20
>  # Never use string load/store instructions as they are
>  # often slow when they are implemented at all
> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vd=
so32/Makefile
> index e147bbdc12cd..d43b0b18137c 100644
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -25,6 +25,7 @@ KCOV_INSTRUMENT :=3D n
>  UBSAN_SANITIZE :=3D n
> =20
>  ccflags-y :=3D -shared -fno-common -fno-builtin -nostdlib \
> +       -fasynchronous-unwind-tables \
>         -Wl,-soname=3Dlinux-vdso32.so.1 -Wl,--hash-style=3Dboth
>  asflags-y :=3D -D__VDSO32__ -s
> =20
> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vd=
so64/Makefile
> index 32ebb3522ea1..b2cbb5c49bad 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -13,6 +13,7 @@ KCOV_INSTRUMENT :=3D n
>  UBSAN_SANITIZE :=3D n
> =20
>  ccflags-y :=3D -shared -fno-common -fno-builtin -nostdlib \
> +       -fasynchronous-unwind-tables \
>         -Wl,-soname=3Dlinux-vdso64.so.1 -Wl,--hash-style=3Dboth
>  asflags-y :=3D -D__VDSO64__ -s

The above vdso hunks can be dropped since all our VDSO are assembly, so=20
the above have no impact.


- Naveen

