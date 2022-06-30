Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 812A4561461
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 10:12:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYWJm6MHJz3dph
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 18:12:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nq4afHf3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nq4afHf3;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYWJ12MSyz3c9B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 18:11:28 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U89KN6006373;
	Thu, 30 Jun 2022 08:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yEtqezDZbPfGWcbcHn8kTWhmCp1eMfHZ8CewXlyvgwU=;
 b=Nq4afHf3e5j0bFRvHSNKUNIEJ2GAMYbf3M8SKnJjUIgn6UWiiti6WjPvPCldh274pACg
 ZGejR9++viTFivh9Ff0F5v4aMjmgBZTMn7kEbb+U0jMOGWV/QB7FYIhWBkXLCUDMmmiq
 +AyAhlr/dWkl91NyuoagEexjBlNDbi+/Bydx6xxrql/uDNZHAqMjxRY9SfeJHuRsFPQt
 FkqdgBYSh4awC9r/JXEm18Kwp5s5ghrdpr5TT1nQlZoO/guc/IMDfkepUVHYXCQB+IL8
 j/5UwKw6/UAQE7LhKROPJ+E/287WlVHLoC/6xqLwST0aBCgXv4e8N6ysZSuSSJnYC5Pz 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h17rp0cu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 08:10:58 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25U8AvpA011361;
	Thu, 30 Jun 2022 08:10:57 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h17rp0bsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 08:10:57 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25U7o6jA009212;
	Thu, 30 Jun 2022 08:05:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma05fra.de.ibm.com with ESMTP id 3gwt095sem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 08:05:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25U85AXU17105272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 08:05:10 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A6F542045;
	Thu, 30 Jun 2022 08:05:10 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE43A42041;
	Thu, 30 Jun 2022 08:05:09 +0000 (GMT)
Received: from localhost (unknown [9.43.87.212])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jun 2022 08:05:09 +0000 (GMT)
Date: Thu, 30 Jun 2022 13:35:08 +0530
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
In-Reply-To: <cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1656572413.pbaqjnrrcl.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bOQhnIeOkTwX0KzFohbnqCvDxF9f_wp9
X-Proofpoint-GUID: 7JkAs9pqNeIiJt33LfOOdR43g2dYGJIO
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_04,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206300030
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
> Hi Sathvika,
>=20
> Adding ARM people as they seem to face the same kind of problem (see=20
> https://patchwork.kernel.org/project/linux-kbuild/patch/20220623014917.19=
9563-33-chenzhongjin@huawei.com/)
>=20
> Le 27/06/2022 =C3=A0 17:35, Sathvika Vasireddy a =C3=A9crit=C2=A0:
>>=20
>> On 25/06/22 12:16, Christophe Leroy wrote:
>>>
>>> Le 24/06/2022 =C3=A0 20:32, Sathvika Vasireddy a =C3=A9crit=C2=A0:
>>>> objtool is throwing *unannotated intra-function call*
>>>> warnings with a few instructions that are marked
>>>> unreachable. Remove unreachable() from WARN_ON()
>>>> to fix these warnings, as the codegen remains same
>>>> with and without unreachable() in WARN_ON().
>>> Did you try the two exemples described in commit 1e688dd2a3d6
>>> ("powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with
>>> asm goto") ?
>>>
>>> Without your patch:
>>>
>>> 00000640 <test>:
>>> =C2=A0=C2=A0 640:=C2=A0=C2=A0=C2=A0 81 23 00 84=C2=A0=C2=A0=C2=A0=C2=A0=
 lwz=C2=A0=C2=A0=C2=A0=C2=A0 r9,132(r3)
>>> =C2=A0=C2=A0 644:=C2=A0=C2=A0=C2=A0 71 29 40 00=C2=A0=C2=A0=C2=A0=C2=A0=
 andi.=C2=A0=C2=A0 r9,r9,16384
>>> =C2=A0=C2=A0 648:=C2=A0=C2=A0=C2=A0 40 82 00 0c=C2=A0=C2=A0=C2=A0=C2=A0=
 bne=C2=A0=C2=A0=C2=A0=C2=A0 654 <test+0x14>
>>> =C2=A0=C2=A0 64c:=C2=A0=C2=A0=C2=A0 80 63 00 0c=C2=A0=C2=A0=C2=A0=C2=A0=
 lwz=C2=A0=C2=A0=C2=A0=C2=A0 r3,12(r3)
>>> =C2=A0=C2=A0 650:=C2=A0=C2=A0=C2=A0 4e 80 00 20=C2=A0=C2=A0=C2=A0=C2=A0=
 blr
>>> =C2=A0=C2=A0 654:=C2=A0=C2=A0=C2=A0 0f e0 00 00=C2=A0=C2=A0=C2=A0=C2=A0=
 twui=C2=A0=C2=A0=C2=A0 r0,0
>>>
>>> 00000658 <test9w>:
>>> =C2=A0=C2=A0 658:=C2=A0=C2=A0=C2=A0 2c 04 00 00=C2=A0=C2=A0=C2=A0=C2=A0=
 cmpwi=C2=A0=C2=A0 r4,0
>>> =C2=A0=C2=A0 65c:=C2=A0=C2=A0=C2=A0 41 82 00 0c=C2=A0=C2=A0=C2=A0=C2=A0=
 beq=C2=A0=C2=A0=C2=A0=C2=A0 668 <test9w+0x10>
>>> =C2=A0=C2=A0 660:=C2=A0=C2=A0=C2=A0 7c 63 23 96=C2=A0=C2=A0=C2=A0=C2=A0=
 divwu=C2=A0=C2=A0 r3,r3,r4
>>> =C2=A0=C2=A0 664:=C2=A0=C2=A0=C2=A0 4e 80 00 20=C2=A0=C2=A0=C2=A0=C2=A0=
 blr
>>> =C2=A0=C2=A0 668:=C2=A0=C2=A0=C2=A0 0f e0 00 00=C2=A0=C2=A0=C2=A0=C2=A0=
 twui=C2=A0=C2=A0=C2=A0 r0,0
>>> =C2=A0=C2=A0 66c:=C2=A0=C2=A0=C2=A0 38 60 00 00=C2=A0=C2=A0=C2=A0=C2=A0=
 li=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r3,0
>>> =C2=A0=C2=A0 670:=C2=A0=C2=A0=C2=A0 4e 80 00 20=C2=A0=C2=A0=C2=A0=C2=A0=
 blr
>>>
>>>
>>> With your patch:
>>>
>>> 00000640 <test>:
>>> =C2=A0=C2=A0 640:=C2=A0=C2=A0=C2=A0 81 23 00 84=C2=A0=C2=A0=C2=A0=C2=A0=
 lwz=C2=A0=C2=A0=C2=A0=C2=A0 r9,132(r3)
>>> =C2=A0=C2=A0 644:=C2=A0=C2=A0=C2=A0 71 29 40 00=C2=A0=C2=A0=C2=A0=C2=A0=
 andi.=C2=A0=C2=A0 r9,r9,16384
>>> =C2=A0=C2=A0 648:=C2=A0=C2=A0=C2=A0 40 82 00 0c=C2=A0=C2=A0=C2=A0=C2=A0=
 bne=C2=A0=C2=A0=C2=A0=C2=A0 654 <test+0x14>
>>> =C2=A0=C2=A0 64c:=C2=A0=C2=A0=C2=A0 80 63 00 0c=C2=A0=C2=A0=C2=A0=C2=A0=
 lwz=C2=A0=C2=A0=C2=A0=C2=A0 r3,12(r3)
>>> =C2=A0=C2=A0 650:=C2=A0=C2=A0=C2=A0 4e 80 00 20=C2=A0=C2=A0=C2=A0=C2=A0=
 blr
>>> =C2=A0=C2=A0 654:=C2=A0=C2=A0=C2=A0 0f e0 00 00=C2=A0=C2=A0=C2=A0=C2=A0=
 twui=C2=A0=C2=A0=C2=A0 r0,0
>>> =C2=A0=C2=A0 658:=C2=A0=C2=A0=C2=A0 4b ff ff f4=C2=A0=C2=A0=C2=A0=C2=A0=
 b=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 64c <test+0xc>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <=3D=3D
>>>
>>> 0000065c <test9w>:
>>> =C2=A0=C2=A0 65c:=C2=A0=C2=A0=C2=A0 2c 04 00 00=C2=A0=C2=A0=C2=A0=C2=A0=
 cmpwi=C2=A0=C2=A0 r4,0
>>> =C2=A0=C2=A0 660:=C2=A0=C2=A0=C2=A0 41 82 00 0c=C2=A0=C2=A0=C2=A0=C2=A0=
 beq=C2=A0=C2=A0=C2=A0=C2=A0 66c <test9w+0x10>
>>> =C2=A0=C2=A0 664:=C2=A0=C2=A0=C2=A0 7c 63 23 96=C2=A0=C2=A0=C2=A0=C2=A0=
 divwu=C2=A0=C2=A0 r3,r3,r4
>>> =C2=A0=C2=A0 668:=C2=A0=C2=A0=C2=A0 4e 80 00 20=C2=A0=C2=A0=C2=A0=C2=A0=
 blr
>>> =C2=A0=C2=A0 66c:=C2=A0=C2=A0=C2=A0 0f e0 00 00=C2=A0=C2=A0=C2=A0=C2=A0=
 twui=C2=A0=C2=A0=C2=A0 r0,0
>>> =C2=A0=C2=A0 670:=C2=A0=C2=A0=C2=A0 38 60 00 00=C2=A0=C2=A0=C2=A0=C2=A0=
 li=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r3,0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <=3D=3D
>>> =C2=A0=C2=A0 674:=C2=A0=C2=A0=C2=A0 4e 80 00 20=C2=A0=C2=A0=C2=A0=C2=A0=
 blr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <=3D=3D
>>> =C2=A0=C2=A0 678:=C2=A0=C2=A0=C2=A0 38 60 00 00=C2=A0=C2=A0=C2=A0=C2=A0=
 li=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r3,0
>>> =C2=A0=C2=A0 67c:=C2=A0=C2=A0=C2=A0 4e 80 00 20=C2=A0=C2=A0=C2=A0=C2=A0=
 blr
>>>
>> The builtin variant of unreachable (__builtin_unreachable()) works.
>>=20
>> How about using that instead of unreachable() ?
>>=20
>>=20
>=20
> In fact the problem comes from the macro annotate_unreachable() which is=
=20
> called by unreachable() before calling __build_unreachable().
>=20
> Seems like this macro adds (after the unconditional trap twui) a call to=
=20
> an empty function whose address is listed in section .discard.unreachable
>=20
>      1c78:       00 00 e0 0f     twui    r0,0
>      1c7c:       55 e7 ff 4b     bl      3d0=20
> <qdisc_root_sleeping_lock.part.0>
>=20
>=20
> RELOCATION RECORDS FOR [.discard.unreachable]:
> OFFSET           TYPE              VALUE
> 0000000000000000 R_PPC64_REL32     .text+0x00000000000003d0
>=20
> The problem is that that function has size 0:
>=20
> 00000000000003d0 l     F .text	0000000000000000=20
> qdisc_root_sleeping_lock.part.0
>=20
>=20
> And objtool is not prepared for a function with size 0.

annotate_unreachable() seems to have been introduced in commit=20
649ea4d5a624f0 ("objtool: Assume unannotated UD2 instructions are dead=20
ends").

Objtool considers 'ud2' instruction to be fatal, so BUG() has=20
__builtin_unreachable(), rather than unreachable(). See commit=20
bfb1a7c91fb775 ("x86/bug: Merge annotate_reachable() into _BUG_FLAGS()=20
asm"). For the same reason, __WARN_FLAGS() is annotated with=20
_ASM_REACHABLE so that objtool can differentiate warnings from a BUG().

On powerpc, we use trap variants for both and don't have a special=20
instruction for a BUG(). As such, for _WARN_FLAGS(), using=20
__builtin_unreachable() suffices to achieve optimal code generation from=20
the compiler. Objtool would consider subsequent instructions to be=20
reachable. For BUG(), we can continue to use unreachable() so that=20
objtool can differentiate these from traps used in warnings.

>=20
> The following changes to objtool seem to fix the problem, most warning=20
> are gone with that change.
>=20
> diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
> index 63218f5799c2..37c0a268b7ea 100644
> --- a/tools/objtool/elf.c
> +++ b/tools/objtool/elf.c
> @@ -77,6 +77,8 @@ static int symbol_by_offset(const void *key, const=20
> struct rb_node *node)
>=20
>   	if (*o < s->offset)
>   		return -1;
> +	if (*o =3D=3D s->offset && !s->len)
> +		return 0;
>   	if (*o >=3D s->offset + s->len)
>   		return 1;
>=20
> @@ -400,7 +402,7 @@ static void elf_add_symbol(struct elf *elf, struct=20
> symbol *sym)
>   	 * Don't store empty STT_NOTYPE symbols in the rbtree.  They
>   	 * can exist within a function, confusing the sorting.
>   	 */
> -	if (!sym->len)
> +	if (sym->type =3D=3D STT_NOTYPE && !sym->len)
>   		rb_erase(&sym->node, &sym->sec->symbol_tree);
>   }

Is there a reason to do this, rather than change __WARN_FLAGS() to use=20
__builtin_unreachable()? Or, are you seeing an issue with unreachable()=20
elsewhere in the kernel?


- Naveen

