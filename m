Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FEB63CAEA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 23:05:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMGbv089Sz3bWV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 09:05:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YDt/sRLO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YDt/sRLO;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMGZw333tz2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 09:04:24 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATKZ2Of014057;
	Tue, 29 Nov 2022 22:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=f9mI2EBvu8nr25/8LzdML+KOEqFBwP1Q3nhzFVYjJvM=;
 b=YDt/sRLOKkjcRN/SKr1ZGxRXcY7OibX78Fa0B6E4CGdoRR+AGkESJ5uoC3n4rH0ZJ6uJ
 PSOxu0j0g0K4L9VvLGS0tEkjFNZUrJXh9jwNcbGNS51emMdCx0WdwNsBZc3rO/pf+nk6
 +A9qtY5UY3xJqwtgU1FROleKcVe/4Qku+41b3ijyxwk86zqt6pCyZwDJCd/I9uNRi1Yf
 yy6sDZwXdUonXjt8ZKrNH+tgU1uQKkaOfWqHBBiYcNYjpOMbMuwUbiy66Zu3ACWhyspF
 iPrD3f40geTdMAoR12Eaa66Sqx3jecO150kyDt+jVYi9mlVMlFujy495KLau6sdtEZmx Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5q9yn5c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 22:04:14 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ATK30NZ020375;
	Tue, 29 Nov 2022 22:04:14 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5q9yn5aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 22:04:14 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATLoM2O015464;
	Tue, 29 Nov 2022 22:04:12 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3m3a2hvsg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 22:04:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ATM4qxR64422328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 22:04:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE9C842041;
	Tue, 29 Nov 2022 22:04:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F73E4203F;
	Tue, 29 Nov 2022 22:04:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2022 22:04:09 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1FB33602FD;
	Wed, 30 Nov 2022 09:04:03 +1100 (AEDT)
Message-ID: <53d5c0793e3eb2176a19b4fe75d23cc3bc675329.camel@linux.ibm.com>
Subject: Re: [RFC PATCH 03/13] powerpc/dexcr: Handle hashchk exception
From: Benjamin Gray <bgray@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 30 Nov 2022 09:04:02 +1100
In-Reply-To: <COOPRF72WR3V.1WPE5NI7M8V7J@bobo>
References: <20221128024458.46121-1-bgray@linux.ibm.com>
	 <20221128024458.46121-4-bgray@linux.ibm.com>
	 <COOPRF72WR3V.1WPE5NI7M8V7J@bobo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6CgXXraI-ooQGJEur6jiiOW1aaHD4ZBs
X-Proofpoint-ORIG-GUID: pPnkiAmnPiZpEMBTo77ku2XtFvADPSYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_13,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290131
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
Cc: linux-hardening@vger.kernel.org, ajd@linux.ibm.com, cmr@bluescreens.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2022-11-29 at 20:39 +1000, Nicholas Piggin wrote:
> On Mon Nov 28, 2022 at 12:44 PM AEST, Benjamin Gray wrote:
> > Recognise and pass the appropriate signal to the user program when
> > a
> > hashchk instruction triggers. This is independent of allowing
> > configuration of DEXCR[NPHIE], as a hypervisor can enforce this
> > aspect
> > regardless of the kernel.
> >=20
> > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > ---
> > =C2=A0arch/powerpc/include/asm/ppc-opcode.h |=C2=A0 1 +
> > =C2=A0arch/powerpc/include/asm/processor.h=C2=A0 |=C2=A0 6 ++++++
> > =C2=A0arch/powerpc/kernel/dexcr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 22 ++++++++++++++++++++++
> > =C2=A0arch/powerpc/kernel/traps.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++++
> > =C2=A04 files changed, 35 insertions(+)
> >=20
> > diff --git a/arch/powerpc/include/asm/ppc-opcode.h
> > b/arch/powerpc/include/asm/ppc-opcode.h
> > index 21e33e46f4b8..89b316466ed1 100644
> > --- a/arch/powerpc/include/asm/ppc-opcode.h
> > +++ b/arch/powerpc/include/asm/ppc-opcode.h
> > @@ -215,6 +215,7 @@
> > =C2=A0#define OP_31_XOP_STFSX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 663
> > =C2=A0#define OP_31_XOP_STFSUX=C2=A0=C2=A0=C2=A0 695
> > =C2=A0#define OP_31_XOP_STFDX=C2=A0=C2=A0=C2=A0=C2=A0 727
> > +#define OP_31_XOP_HASHCHK=C2=A0=C2=A0 754
> > =C2=A0#define OP_31_XOP_STFDUX=C2=A0=C2=A0=C2=A0 759
> > =C2=A0#define OP_31_XOP_LHBRX=C2=A0=C2=A0=C2=A0=C2=A0 790
> > =C2=A0#define OP_31_XOP_LFIWAX=C2=A0=C2=A0=C2=A0 855
> > diff --git a/arch/powerpc/include/asm/processor.h
> > b/arch/powerpc/include/asm/processor.h
> > index 0a8a793b8b8b..c17ec1e44c86 100644
> > --- a/arch/powerpc/include/asm/processor.h
> > +++ b/arch/powerpc/include/asm/processor.h
> > @@ -448,10 +448,16 @@ void *exit_vmx_ops(void *dest);
> > =C2=A0
> > =C2=A0#ifdef CONFIG_PPC_BOOK3S_64
> > =C2=A0
> > +bool is_hashchk_trap(struct pt_regs const *regs);
> > =C2=A0unsigned long get_thread_dexcr(struct thread_struct const *t);
> > =C2=A0
> > =C2=A0#else
> > =C2=A0
> > +static inline bool is_hashchk_trap(struct pt_regs const *regs)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
> > +}
> > +
> > =C2=A0static inline unsigned long get_thread_dexcr(struct thread_struct
> > const *t)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > diff --git a/arch/powerpc/kernel/dexcr.c
> > b/arch/powerpc/kernel/dexcr.c
> > index 32a0a69ff638..11515e67afac 100644
> > --- a/arch/powerpc/kernel/dexcr.c
> > +++ b/arch/powerpc/kernel/dexcr.c
> > @@ -3,6 +3,9 @@
> > =C2=A0
> > =C2=A0#include <asm/cpu_has_feature.h>
> > =C2=A0#include <asm/cputable.h>
> > +#include <asm/disassemble.h>
> > +#include <asm/inst.h>
> > +#include <asm/ppc-opcode.h>
> > =C2=A0#include <asm/processor.h>
> > =C2=A0#include <asm/reg.h>
> > =C2=A0
> > @@ -19,6 +22,25 @@ static int __init dexcr_init(void)
> > =C2=A0}
> > =C2=A0early_initcall(dexcr_init);
> > =C2=A0
> > +bool is_hashchk_trap(struct pt_regs const *regs)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ppc_inst_t insn;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!cpu_has_feature(CPU_FTR=
_DEXCR_NPHIE))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return false;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (get_user_instr(insn, (vo=
id __user *)regs->nip)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0WARN_ON(1);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> Nice series, just starting to have a look at it.
>=20
> You probably don't want a WARN_ON() here because it's user
> triggerable
> and isn't necessarily even indiciating a problem or attack if the app
> is doing code unmapping in order to get faults.
>=20
> Check some of the other instruction emulation for what to do in case
> of
> an EFAULT.

Alright, I'll take a look

> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ppc_inst_primary_opcode(=
insn) =3D=3D 31 &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_xop(p=
pc_inst_val(insn)) =3D=3D OP_31_XOP_HASHCHK)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return true;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return false;
> > +}
> > +
> > =C2=A0unsigned long get_thread_dexcr(struct thread_struct const *t)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return DEFAULT_DEXCR;
> > diff --git a/arch/powerpc/kernel/traps.c
> > b/arch/powerpc/kernel/traps.c
> > index 9bdd79aa51cf..b83f5b382f24 100644
> > --- a/arch/powerpc/kernel/traps.c
> > +++ b/arch/powerpc/kernel/traps.c
> > @@ -1516,6 +1516,12 @@ static void do_program_check(struct pt_regs
> > *regs)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
}
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (user_mode(regs) && is_hashchk_trap(regs)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0_excep=
tion(SIGILL, regs, ILL_ILLOPN, regs-
> > >nip);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return=
;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0}
>=20
> I guess ILLOPN makes sense. Do you know if any other archs do
> similar?

Ah sorry, when refactoring Chris' patches I forgot to put back in the
commit message that this is how ARM reports their similar check
failure. For example, their FPAC handler in
arch/arm64/kernel/traps.c:518 does this.
