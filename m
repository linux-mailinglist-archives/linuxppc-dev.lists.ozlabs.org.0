Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3367756186C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 12:39:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYZZg0zM5z3f1c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 20:39:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K4KAmi/7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K4KAmi/7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYZYY2Jnsz3dvJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 20:38:24 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25UAGunk016817;
	Thu, 30 Jun 2022 10:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=QJn6VkRqEkntXbZIG+Ms5k+ScpORWHU/7JJwVxhNExM=;
 b=K4KAmi/7CHw52zMH0kZcYAdtLQWVzvmRgzJKnhIkaT5aBYkWh/Qo6v4fg/GWcSRDlQCx
 0aOHmg3kcGJ54nTOVBt5T9YaPVF5mxIdYDSeEbVESmraxjMKemIOfqXs1kGRHukNUdtq
 JEjIuDTnk/bIDXwiKzvpCwarkFL9qZ3u4Q2I3Z/zctX/XDppFpWhCZ7TD88j6HYEs5ln
 6oXB/JKeWuUdg3Bu3+OZTy8XjwMdG61g0I02hILCN9uHIo/UdW1Et1Z0Bx/nGutkC9gk
 gIFisH8VHNiqFQEsLzOvmrXZqJgWQv7rlW+9xaBLBVwG2ahfubEw5KgT25auvQ0f/oJW og== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h19xn0ehg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 10:37:54 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25UAaDNN030701;
	Thu, 30 Jun 2022 10:37:54 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h19xn0eg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 10:37:54 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25UAMqSk007960;
	Thu, 30 Jun 2022 10:37:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3gwt08yxcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 10:37:51 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25UAakiC22872560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 10:36:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6778D42041;
	Thu, 30 Jun 2022 10:37:49 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0C014203F;
	Thu, 30 Jun 2022 10:37:48 +0000 (GMT)
Received: from localhost (unknown [9.43.87.212])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jun 2022 10:37:48 +0000 (GMT)
Date: Thu, 30 Jun 2022 16:07:47 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>,
        Sathvika Vasireddy
	<sv@linux.vnet.ibm.com>
References: <20220624183238.388144-1-sv@linux.ibm.com>
	<20220624183238.388144-12-sv@linux.ibm.com>
	<70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
	<92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com>
	<cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu>
	<1656572413.pbaqjnrrcl.naveen@linux.ibm.com>
	<da86c612-186d-364f-cc36-bcf942a97083@csgroup.eu>
In-Reply-To: <da86c612-186d-364f-cc36-bcf942a97083@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1656583960.0nqsj977sr.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nweieoUX4FCKnidVXKKSpa6ach3WWa7P
X-Proofpoint-ORIG-GUID: zc4cI_kGzE5X1rtwWyht0dYni1htNVYY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_07,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206300040
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
Cc: Marc Zyngier <maz@kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 30/06/2022 =C3=A0 10:05, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Christophe Leroy wrote:
>>>> The builtin variant of unreachable (__builtin_unreachable()) works.
>>>>
>>>> How about using that instead of unreachable() ?
>>>>
>>>>
>>>
>>> In fact the problem comes from the macro annotate_unreachable() which=20
>>> is called by unreachable() before calling __build_unreachable().
>>>
>>> Seems like this macro adds (after the unconditional trap twui) a call=20
>>> to an empty function whose address is listed in section=20
>>> .discard.unreachable
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 1c78:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00 0=
0 e0 0f=C2=A0=C2=A0=C2=A0=C2=A0 twui=C2=A0=C2=A0=C2=A0 r0,0
>>> =C2=A0=C2=A0=C2=A0=C2=A0 1c7c:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 55 e=
7 ff 4b=C2=A0=C2=A0=C2=A0=C2=A0 bl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3d0=20
>>> <qdisc_root_sleeping_lock.part.0>
>>>
>>>
>>> RELOCATION RECORDS FOR [.discard.unreachable]:
>>> OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TYPE=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 VALUE
>>> 0000000000000000 R_PPC64_REL32=C2=A0=C2=A0=C2=A0=C2=A0 .text+0x00000000=
000003d0
>>>
>>> The problem is that that function has size 0:
>>>
>>> 00000000000003d0 l=C2=A0=C2=A0=C2=A0=C2=A0 F .text=C2=A0=C2=A0=C2=A0 00=
00000000000000=20
>>> qdisc_root_sleeping_lock.part.0
>>>
>>>
>>> And objtool is not prepared for a function with size 0.
>>=20
>> annotate_unreachable() seems to have been introduced in commit=20
>> 649ea4d5a624f0 ("objtool: Assume unannotated UD2 instructions are dead=20
>> ends").
>>=20
>> Objtool considers 'ud2' instruction to be fatal, so BUG() has=20
>> __builtin_unreachable(), rather than unreachable(). See commit=20
>> bfb1a7c91fb775 ("x86/bug: Merge annotate_reachable() into _BUG_FLAGS()=20
>> asm"). For the same reason, __WARN_FLAGS() is annotated with=20
>> _ASM_REACHABLE so that objtool can differentiate warnings from a BUG().
>>=20
>> On powerpc, we use trap variants for both and don't have a special=20
>> instruction for a BUG(). As such, for _WARN_FLAGS(), using=20
>> __builtin_unreachable() suffices to achieve optimal code generation from=
=20
>> the compiler. Objtool would consider subsequent instructions to be=20
>> reachable. For BUG(), we can continue to use unreachable() so that=20
>> objtool can differentiate these from traps used in warnings.
>=20
> Not sure I understand what you mean.
>=20
> __WARN_FLAGS() and BUG() both use 'twui' which is unconditionnal trap,=20
> as such both are the same.
>=20
> On the other side, WARN_ON() and BUG_ON() use tlbnei which is a=20
> conditionnel trap.

Objtool classifies 'ud2' as INSN_BUG, and 'int3' as INSN_TRAP. In x86=20
BUG(), there is no need for an annotation since objtool assumes that=20
'ud2' terminates control flow. But, for __WARN_FLAGS(), since 'ud2' is=20
used, an explicit annotate_reachable() is needed. That's _reachable_, to=20
indicate that the control flow can continue with the next instruction.

On powerpc, we should (eventually) classify all trap variants as=20
INSN_TRAP. Even in the absence of that classification today, objtool=20
assumes that control flow continues with the next instruction. With your=20
work to utilize asm goto for __WARN_FLAGS(), with no extra instructions=20
being generated, I think it is appropriate to just use=20
__builtin_unreachable() and to not use the annotation.

In any case, we are only hitting this since gcc is generating a 'bl' due=20
to that annotation. We are not yet enabling full objtool validation on=20
powerpc, so I think we can revisit this at that point.

>=20
>>=20
>>>
>>> The following changes to objtool seem to fix the problem, most warning=20
>>> are gone with that change.
>>>
>>> diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
>>> index 63218f5799c2..37c0a268b7ea 100644
>>> --- a/tools/objtool/elf.c
>>> +++ b/tools/objtool/elf.c
>>> @@ -77,6 +77,8 @@ static int symbol_by_offset(const void *key, const=20
>>> struct rb_node *node)
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*o < s->offset)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -1;
>>> +=C2=A0=C2=A0=C2=A0 if (*o =3D=3D s->offset && !s->len)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*o >=3D s->offset + s->len)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
>>>
>>> @@ -400,7 +402,7 @@ static void elf_add_symbol(struct elf *elf, struct=20
>>> symbol *sym)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Don't store empty STT_NOTYPE sym=
bols in the rbtree.=C2=A0 They
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * can exist within a function, con=
fusing the sorting.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> -=C2=A0=C2=A0=C2=A0 if (!sym->len)
>>> +=C2=A0=C2=A0=C2=A0 if (sym->type =3D=3D STT_NOTYPE && !sym->len)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rb_erase(&sym->n=
ode, &sym->sec->symbol_tree);
>>> =C2=A0 }
>>=20
>> Is there a reason to do this, rather than change __WARN_FLAGS() to use=20
>> __builtin_unreachable()? Or, are you seeing an issue with unreachable()=20
>> elsewhere in the kernel?
>>=20
>=20
> At the moment I'm trying to understand what the issue is, and explore=20
> possible fixes. I guess if we tell objtool that after 'twui' subsequent=20
> instructions are unreachable, then __builtin_unreachable() is enough.

Yes, see my explanation above. Since no 'bl' is emitted with the=20
builtin, objtool won't complain, especially for mcount.

>=20
> I think we should also understand why annotate_unreachable() gives us a=20
> so bad result and see if it can be changed to something cleaner than a=20
> 'bl' to an empty function that has no instructions.

Indeed. Not really sure. annotate_unreachable() wants to take the=20
address of the instruction after the trap. But, in reality, due to use=20
of asm goto for __WARN_FLAGS, no instructions would be generated. I=20
wonder if that combination causes such code to be emitted.


- Naveen

