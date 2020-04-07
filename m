Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B141A1000
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 17:16:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xWGH67kpzDr7M
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 01:16:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xWBV5rXNzDr3N
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 01:13:22 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 037FDCfh048448
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Apr 2020 11:13:19 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3082hyc6ws-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 11:13:19 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Tue, 7 Apr 2020 16:08:04 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Apr 2020 16:08:00 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 037F7Djk48431584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 15:07:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D721A4C04A;
 Tue,  7 Apr 2020 15:08:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72EAE4C044;
 Tue,  7 Apr 2020 15:08:17 +0000 (GMT)
Received: from localhost (unknown [9.85.74.108])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 15:08:17 +0000 (GMT)
Date: Tue, 07 Apr 2020 20:38:13 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH v6 4/4] powerpc/vdso: Switch VDSO to generic C
 implementation.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>,
 Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
 Paul Mackerras <paulus@samba.org>
References: <cover.1586265010.git.christophe.leroy@c-s.fr>
 <56e0cc4bc8314ee4da87256fcafc03885977f0dd.1586265010.git.christophe.leroy@c-s.fr>
In-Reply-To: <56e0cc4bc8314ee4da87256fcafc03885977f0dd.1586265010.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20040715-0008-0000-0000-0000036C3AB7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040715-0009-0000-0000-00004A8DD4DB
Message-Id: <1586271940.xja63xxjer.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_07:2020-04-07,
 2020-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070127
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, luto@kernel.org,
 tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
> powerpc is a bit special for VDSO as well as system calls in the
> way that it requires setting CR SO bit which cannot be done in C.
> Therefore, entry/exit needs to be performed in ASM.
>=20
> Implementing __arch_get_vdso_data() would clobbers the link register,
> requiring the caller to save it. As the ASM calling function already
> has to set a stack frame and saves the link register before calling
> the C vdso function, retriving the vdso data pointer there is lighter.
>=20
> Implement __arch_vdso_capable() and:
> - When the timebase is used, make it always return true.
> - When the RTC clock is used, make it always return false.
>=20

<snip>

>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
> v6:
> - Added missing prototypes in asm/vdso/gettimeofday.h for __c_kernel_ fun=
ctions.
> - Using STACK_FRAME_OVERHEAD instead of INT_FRAME_SIZE
> - Rebased on powerpc/merge as of 7 Apr 2020
> - Fixed build failure with gcc 9
> - Added a patch to create asm/vdso/processor.h and more cpu_relax() in it
> ---
>  arch/powerpc/Kconfig                         |   2 +
>  arch/powerpc/include/asm/clocksource.h       |   7 +
>  arch/powerpc/include/asm/vdso/clocksource.h  |   7 +
>  arch/powerpc/include/asm/vdso/gettimeofday.h | 175 +++++++++++
>  arch/powerpc/include/asm/vdso/vsyscall.h     |  25 ++
>  arch/powerpc/include/asm/vdso_datapage.h     |  40 +--
>  arch/powerpc/kernel/asm-offsets.c            |  49 +---
>  arch/powerpc/kernel/time.c                   |  91 +-----
>  arch/powerpc/kernel/vdso.c                   |   5 +-
>  arch/powerpc/kernel/vdso32/Makefile          |  32 +-
>  arch/powerpc/kernel/vdso32/config-fake32.h   |  34 +++
>  arch/powerpc/kernel/vdso32/gettimeofday.S    | 291 +------------------
>  arch/powerpc/kernel/vdso32/vgettimeofday.c   |  29 ++
>  arch/powerpc/kernel/vdso64/Makefile          |  23 +-
>  arch/powerpc/kernel/vdso64/gettimeofday.S    | 243 +---------------
>  arch/powerpc/kernel/vdso64/vgettimeofday.c   |  29 ++
>  16 files changed, 391 insertions(+), 691 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/clocksource.h
>  create mode 100644 arch/powerpc/include/asm/vdso/clocksource.h
>  create mode 100644 arch/powerpc/include/asm/vdso/gettimeofday.h
>  create mode 100644 arch/powerpc/include/asm/vdso/vsyscall.h
>  create mode 100644 arch/powerpc/kernel/vdso32/config-fake32.h
>  create mode 100644 arch/powerpc/kernel/vdso32/vgettimeofday.c
>  create mode 100644 arch/powerpc/kernel/vdso64/vgettimeofday.c

You should also consider adding -fasynchronous-unwind-tables. For=20
background, please see:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dba96301ce9be7925cdaee677b1a2ff8eddba9fd4


- Naveen

