Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E2738C041
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 09:02:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmcxd31MJz3btY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 17:02:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f2whFDBO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f2whFDBO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmcx92b4qz2xxk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 17:02:20 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L6isOj082356; Fri, 21 May 2021 03:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=y5bENCOf6w9xrHmuvXUU+DOFUaRTdG/J0a6ngQTIPj4=;
 b=f2whFDBOG9Qvf75Mk4c9mactvd8ArhGYLN7+FXuZCzHgBkVb/jVoEFXAlLc9JJPG3jwc
 Elpm8uCvD2v98oi+MIQCMnk4YMgHPcuirmoFLBjx+sbQRuKijtRwKX1HtjOPiOV/s0H+
 ZU1aBwh/5lTsHZ/ObfSDzN4oIDpjINy2LtGHpwaIOcdpE7b8DWApPDLUqstfK9V/t0z9
 wSc+3NPAT9TBqzYPcFirnc4W1VhhLV+orU52R8LocNeItdy55TeomEVwf5q+FHszQB5h
 raPjiSMRcU5+iaIhDyR/UQrMiH27NxP40Gcbw7x24x/KS6zHKkVxTuY+VUu1cifFpnU8 7w== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p7v58db3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 03:02:04 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L6mBRQ031858;
 Fri, 21 May 2021 07:02:01 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 38mceh8w1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 07:02:01 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L71xkA33620366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 07:01:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 188FD52050;
 Fri, 21 May 2021 07:01:59 +0000 (GMT)
Received: from localhost (unknown [9.85.72.15])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 54FD052057;
 Fri, 21 May 2021 07:01:58 +0000 (GMT)
Date: Fri, 21 May 2021 12:31:54 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/kprobes: Pass ppc_inst as a pointer to
 emulate_step() on ppc32
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <20210520072909.2901326-1-naveen.n.rao@linux.vnet.ibm.com>
 <8a0cfd88-a98d-711c-b80b-916a99ada2c8@csgroup.eu>
 <1621507675.1o3860b85w.naveen@linux.ibm.com>
 <cb7d49dc-3980-2d2b-ee4e-480b89a04b0a@csgroup.eu>
In-Reply-To: <cb7d49dc-3980-2d2b-ee4e-480b89a04b0a@csgroup.eu>
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1621580436.oscey0zhvn.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DBcQ8cKOCK0ZfB_JF-iECCbfRb12if5x
X-Proofpoint-ORIG-GUID: DBcQ8cKOCK0ZfB_JF-iECCbfRb12if5x
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105210043
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 20/05/2021 =C3=A0 12:54, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Christophe Leroy wrote:
>>>
>>>
>>> Le 20/05/2021 =C3=A0 09:29, Naveen N. Rao a =C3=A9crit=C2=A0:
>>>> diff --git a/arch/powerpc/kernel/optprobes.c=20
>>>> b/arch/powerpc/kernel/optprobes.c
>>>> index cdf87086fa33a0..2bc53fa48a1b33 100644
>>>> --- a/arch/powerpc/kernel/optprobes.c
>>>> +++ b/arch/powerpc/kernel/optprobes.c
>>>> @@ -281,8 +281,12 @@ int arch_prepare_optimized_kprobe(struct optimize=
d_kprobe *op, struct kprobe=20
>>>> *p)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 3. load instruction to be emula=
ted into relevant register, and
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> -=C2=A0=C2=A0=C2=A0 temp =3D ppc_inst_read((struct ppc_inst *)p->ainsn=
.insn);
>>>> -=C2=A0=C2=A0=C2=A0 patch_imm_load_insns(ppc_inst_as_ulong(temp), 4, b=
uff + TMPL_INSN_IDX);
>>>> +=C2=A0=C2=A0=C2=A0 if (IS_ENABLED(CONFIG_PPC64)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 temp =3D ppc_inst_read((st=
ruct ppc_inst *)p->ainsn.insn);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch_imm_load_insns(ppc_i=
nst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
>>>> +=C2=A0=C2=A0=C2=A0 } else {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch_imm_load_insns((unsi=
gned long)p->ainsn.insn, 4, buff + TMPL_INSN_IDX);
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>
>>> It means commit https://github.com/linuxppc/linux/commit/693557ebf407a8=
5ea400a0b501bb97687d8f4856=20
>>> was not necessary and may be reverted.
>>=20
>> Indeed, I will send a revert for it.
>>=20
>=20
> I'm not completely sure it is worth reverting, on an other hand it is poi=
ntless anyway to have=20
> something to convert to a u64 something that cannot be more than 32 bits =
on a PPC32, so now that we=20
> have ppc_inst_as_ulong() it is as good I think.

Sure. If necessary, the revert can go in separately as part of your=20
other cleanup series.

- Naveen

