Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A4198C30
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 08:19:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rzgX1HHJzDqqK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 17:19:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rzdn5m0gzDqpy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 17:17:49 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02V64srO042705
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 02:17:47 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022nn1chp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 02:17:47 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 31 Mar 2020 07:17:38 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 31 Mar 2020 07:17:36 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02V6HftA45285860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Mar 2020 06:17:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5853FAE05A;
 Tue, 31 Mar 2020 06:17:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8F25AE04D;
 Tue, 31 Mar 2020 06:17:40 +0000 (GMT)
Received: from localhost (unknown [9.85.74.140])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 31 Mar 2020 06:17:40 +0000 (GMT)
Date: Tue, 31 Mar 2020 11:47:39 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 10/12] powerpc/entry32: Blacklist exception entry points
 for kprobe.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <dff05b59a161434a546010507000816750073f28.1585474724.git.christophe.leroy@c-s.fr>
 <aea027844b12fcbc29ea78d26c5848a6794d1688.1585474724.git.christophe.leroy@c-s.fr>
 <1585588031.jvow7mwq4x.naveen@linux.ibm.com>
 <7f367f35-1bb8-bbb6-f399-8e911f76e043@c-s.fr>
 <83053ddf-9ba6-d551-6711-890c3f3810b5@c-s.fr>
In-Reply-To: <83053ddf-9ba6-d551-6711-890c3f3810b5@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20033106-0012-0000-0000-0000039B6A12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033106-0013-0000-0000-000021D874DA
Message-Id: <1585635379.0xixuk2jdc.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_02:2020-03-30,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310053
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
>=20
>=20
> Le 30/03/2020 =C3=A0 20:33, Christophe Leroy a =C3=A9crit=C2=A0:
>>=20
>>=20
>> Le 30/03/2020 =C3=A0 19:08, Naveen N. Rao a =C3=A9crit=C2=A0:
>>> Christophe Leroy wrote:
>>>> kprobe does not handle events happening in real mode.
>>>>
>>>> As exception entry points are running with MMU disabled,
>>>> blacklist them.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>>>> ---
>>>> =C2=A0arch/powerpc/kernel/entry_32.S | 7 +++++++
>>>> =C2=A01 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/powerpc/kernel/entry_32.S=20
>>>> b/arch/powerpc/kernel/entry_32.S
>>>> index 94f78c03cb79..9a1a45d6038a 100644
>>>> --- a/arch/powerpc/kernel/entry_32.S
>>>> +++ b/arch/powerpc/kernel/entry_32.S
>>>> @@ -51,6 +51,7 @@ mcheck_transfer_to_handler:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 mfspr=C2=A0=C2=A0=C2=A0 r0,SPRN_DSRR1
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 stw=C2=A0=C2=A0=C2=A0 r0,_DSRR1(r11)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 /* fall through */
>>>> +_ASM_NOKPROBE_SYMBOL(mcheck_transfer_to_handler)
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 .globl=C2=A0=C2=A0=C2=A0 debug_transfer_to_ha=
ndler
>>>> =C2=A0debug_transfer_to_handler:
>>>> @@ -59,6 +60,7 @@ debug_transfer_to_handler:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 mfspr=C2=A0=C2=A0=C2=A0 r0,SPRN_CSRR1
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 stw=C2=A0=C2=A0=C2=A0 r0,_CSRR1(r11)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 /* fall through */
>>>> +_ASM_NOKPROBE_SYMBOL(debug_transfer_to_handler)
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 .globl=C2=A0=C2=A0=C2=A0 crit_transfer_to_han=
dler
>>>> =C2=A0crit_transfer_to_handler:
>>>> @@ -94,6 +96,7 @@ crit_transfer_to_handler:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 rlwinm=C2=A0=C2=A0=C2=A0 r0,r1,0,0,(31 - THRE=
AD_SHIFT)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 stw=C2=A0=C2=A0=C2=A0 r0,KSP_LIMIT(r8)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 /* fall through */
>>>> +_ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
>>>> =C2=A0#endif
>>>>
>>>> =C2=A0#ifdef CONFIG_40x
>>>> @@ -115,6 +118,7 @@ crit_transfer_to_handler:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 rlwinm=C2=A0=C2=A0=C2=A0 r0,r1,0,0,(31 - THRE=
AD_SHIFT)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 stw=C2=A0=C2=A0=C2=A0 r0,KSP_LIMIT(r8)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 /* fall through */
>>>> +_ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
>>>> =C2=A0#endif
>>>>
>>>> =C2=A0/*
>>>> @@ -127,6 +131,7 @@ crit_transfer_to_handler:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 .globl=C2=A0=C2=A0=C2=A0 transfer_to_handler_=
full
>>>> =C2=A0transfer_to_handler_full:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 SAVE_NVGPRS(r11)
>>>> +_ASM_NOKPROBE_SYMBOL(transfer_to_handler_full)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 /* fall through */
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 .globl=C2=A0=C2=A0=C2=A0 transfer_to_handler
>>>> @@ -286,6 +291,8 @@ reenable_mmu:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 lwz=C2=A0=C2=A0=C2=A0 r2, GPR2(r11)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 b=C2=A0=C2=A0=C2=A0 fast_exception_return
>>>> =C2=A0#endif
>>>> +_ASM_NOKPROBE_SYMBOL(transfer_to_handler)
>>>> +_ASM_NOKPROBE_SYMBOL(transfer_to_handler_cont)
>>>
>>> These are added after 'reenable_mmu', which is itself not blacklisted.=20
>>> Is that intentional?
>>=20
>> Yes I put it as the complete end of the entry part, ie just before=20
>> stack_ovf which is a function by itself.
>>=20
>> Note that reenable_mmu is inside an #ifdef CONFIG_TRACE_IRQFLAGS.
>>=20
>> I'm not completely sure where to put the _ASM_NOKPROBE_SYMBOL()s, that's=
=20
>> the reason why I put it close to the symbol itself in my first series.
>>=20
>> Could you have a look at the code and tell me what looks the most=20
>> appropriate as a location to you ?
>>=20
>> https://elixir.bootlin.com/linux/v5.6/source/arch/powerpc/kernel/entry_3=
2.S#L230=20
>=20
> Ok, thinking about it once more, I guess we have a problem as everything=20
> after that reenable_mmu will be visible.

I see that we reach reenable_mmu through a 'rfi' with MSR_KERNEL, which=20
seems safe to me. So, I figured it can be probed without issues?

- Naveen

