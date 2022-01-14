Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA748E863
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 11:38:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZySD0Qsfz3bV8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 21:38:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cNO6fcMv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cNO6fcMv; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZyRT6qpwz2xDv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 21:37:25 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20EARjT2012539; 
 Fri, 14 Jan 2022 10:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=EcNXl8/gPzGyv/8m3LUG76Z8ix+1RROrUA5JY9DKowY=;
 b=cNO6fcMvMZpULbIsnVt4/tQy+XJrTIiyLjcUgdrsesE84Y4DkjQuU2DCgAgFM1rE2c9A
 lP46jZDZKCkwRvllrcMw0W5LOxW3vNdvfcweuE39zJab8mAKeMqnzcxCqDnsuC14Ft7y
 CsM7l4STqSd5avc4JDwMOIsjcZJ24omLkCTLxHF1FAlQLJjE21NaRJPa6EfGv67/CHyA
 oBlAXvuqxUQleqsosXM1QDOa2AM2Jr+A9JfB9t4EFmmsDTu1E4aq7ZjqVpINFVWpbK+a
 SpTDyK3qP532l4B28xGrFPH2kBKMUo9OrZZDIgh1mEyETj7xAx2wTQyJZfR0byU5CqFH +Q== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dk620hn8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 10:37:16 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20EAWJt0025957;
 Fri, 14 Jan 2022 10:37:14 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3df289war5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Jan 2022 10:37:14 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20EAbCr948628122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jan 2022 10:37:12 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9890C4207E;
 Fri, 14 Jan 2022 10:37:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D4B842077;
 Fri, 14 Jan 2022 10:37:12 +0000 (GMT)
Received: from localhost (unknown [9.43.21.93])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Jan 2022 10:37:11 +0000 (GMT)
Date: Fri, 14 Jan 2022 16:07:11 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/bpf: Always reallocate BPF_REG_5, BPF_REG_AX and
 TMP_REG when possible
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 =?iso-8859-1?q?Paul=0A?= Mackerras <paulus@samba.org>
References: <b04c246874b716911139c04bc004b3b14eed07ef.1641817763.git.christophe.leroy@csgroup.eu>
 <1642147004.dum5th9cvl.naveen@linux.ibm.com>
 <f6a5027a-6f3b-ee50-3439-56b5948d860a@csgroup.eu>
In-Reply-To: <f6a5027a-6f3b-ee50-3439-56b5948d860a@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1642156339.pkhk6znoh0.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oxcCDnVZOOLuaoYOyK5cgLosAv_uVd0U
X-Proofpoint-GUID: oxcCDnVZOOLuaoYOyK5cgLosAv_uVd0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_04,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201140070
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 14/01/2022 =C3=A0 08:58, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Christophe Leroy wrote:
>>> BPF_REG_5, BPF_REG_AX and TMP_REG are mapped on non volatile registers
>>> because there are not enough volatile registers, but they don't need
>>> to be preserved on function calls.
>>>
>>> So when some volatile registers become available, those registers can
>>> always be reallocated regardless of whether SEEN_FUNC is set or not.
>>>
>>> Suggested-by: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>> =C2=A0arch/powerpc/net/bpf_jit.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 ---
>>> =C2=A0arch/powerpc/net/bpf_jit_comp32.c | 14 +++++++++++---
>>> =C2=A02 files changed, 11 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
>>> index b20a2a83a6e7..b75507fc8f6b 100644
>>> --- a/arch/powerpc/net/bpf_jit.h
>>> +++ b/arch/powerpc/net/bpf_jit.h
>>> @@ -127,9 +127,6 @@
>>> =C2=A0#define SEEN_FUNC=C2=A0=C2=A0=C2=A0 0x20000000 /* might call exte=
rnal helpers */
>>> =C2=A0#define SEEN_TAILCALL=C2=A0=C2=A0=C2=A0 0x40000000 /* uses tail c=
alls */
>>>
>>> -#define SEEN_VREG_MASK=C2=A0=C2=A0=C2=A0 0x1ff80000 /* Volatile regist=
ers r3-r12 */
>>> -#define SEEN_NVREG_MASK=C2=A0=C2=A0=C2=A0 0x0003ffff /* Non volatile r=
egisters=20
>>> r14-r31 */
>>> -
>>> =C2=A0#ifdef CONFIG_PPC64
>>> =C2=A0extern const int b2p[MAX_BPF_JIT_REG + 2];
>>> =C2=A0#else
>>> diff --git a/arch/powerpc/net/bpf_jit_comp32.c=20
>>> b/arch/powerpc/net/bpf_jit_comp32.c
>>> index d3a52cd42f53..cfec42c8a511 100644
>>> --- a/arch/powerpc/net/bpf_jit_comp32.c
>>> +++ b/arch/powerpc/net/bpf_jit_comp32.c
>>> @@ -77,14 +77,22 @@ static int bpf_jit_stack_offsetof(struct=20
>>> codegen_context *ctx, int reg)
>>> =C2=A0=C2=A0=C2=A0=C2=A0 return BPF_PPC_STACKFRAME(ctx) - 4;
>>> =C2=A0}
>>>
>>> +#define SEEN_VREG_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1ff=
80000 /* Volatile registers r3-r12 */
>>> +#define SEEN_NVREG_FULL_MASK=C2=A0=C2=A0=C2=A0 0x0003ffff /* Non volat=
ile registers=20
>>> r14-r31 */
>>> +#define SEEN_NVREG_TEMP_MASK=C2=A0=C2=A0=C2=A0 0x00001e01 /* BPF_REG_5=
, BPF_REG_AX,=20
>>> TMP_REG */
>>=20
>> Could have been named better: SEEN_NVREG_BPF_VGER_MASK, or such.
>=20
> Yes, I was suffering from a lack of inspiration.
>=20
> What does BPF_VGER mean ?

That I was suffering from a lack of caffeine.

I meant to suggest BPF_VREG, to indicate those are BPF volatile=20
registers.


- Naveen

