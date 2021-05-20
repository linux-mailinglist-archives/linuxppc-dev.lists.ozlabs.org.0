Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA79F38A8EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 12:55:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm68J4nskz30BJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 20:55:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SRi45m91;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SRi45m91; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm67p4hyCz2xtn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 20:54:46 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KAXsXF178240; Thu, 20 May 2021 06:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LHS4hQ15hYB2TUIjXY605AGyePi1R8y7kBO2TIg821Q=;
 b=SRi45m91q2rBylNnlHCXKlMqws8AtcEZobbwclE0jdNnjN6ArJMQ6bfRIk4LsyH+4oQe
 cXZ3T1GJ/EYsRWXpZN2xUHucnWYA5g/dAeGurSQiHmNBLRPCp70SIufxUVXK++3vyrmQ
 pqRvce++T13H7xz+z1u8KMiJ0FBzhNJ52ryX/2MMpm119gV9EEBE84DSTFowFP52caT3
 oZrt7XttIRZ9tdN0nQnP8KOp9t0a+PdGYqi30yy7IqY/KagIzRXCdi3/Fa03v7NV1sl9
 lCT5nSkMem05C6d5I93sHUhCkD4nwUUxpu+JTQSG4VPleqaEI5enPLJyPFnhSEMZK3zp eg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38nndahu9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 06:54:35 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14KAqbqZ010216;
 Thu, 20 May 2021 10:54:33 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 38j5x7tjxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 10:54:33 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14KAs2Nj33817028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 10:54:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB506A4060;
 Thu, 20 May 2021 10:54:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DB83A405C;
 Thu, 20 May 2021 10:54:30 +0000 (GMT)
Received: from localhost (unknown [9.85.120.117])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 May 2021 10:54:30 +0000 (GMT)
Date: Thu, 20 May 2021 16:24:28 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/kprobes: Pass ppc_inst as a pointer to
 emulate_step() on ppc32
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <20210520072909.2901326-1-naveen.n.rao@linux.vnet.ibm.com>
 <8a0cfd88-a98d-711c-b80b-916a99ada2c8@csgroup.eu>
In-Reply-To: <8a0cfd88-a98d-711c-b80b-916a99ada2c8@csgroup.eu>
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1621507675.1o3860b85w.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c-ouhgXBt5viXxIU5DAeelEelgLUNVlw
X-Proofpoint-GUID: c-ouhgXBt5viXxIU5DAeelEelgLUNVlw
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_01:2021-05-20,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200079
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
> Le 20/05/2021 =C3=A0 09:29, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Trying to use a kprobe on ppc32 results in the below splat:
>>      BUG: Unable to handle kernel data access on read at 0x7c0802a6
>>      Faulting instruction address: 0xc002e9f0
>>      Oops: Kernel access of bad area, sig: 11 [#1]
>>      BE PAGE_SIZE=3D4K PowerPC 44x Platform
>>      Modules linked in:
>>      CPU: 0 PID: 89 Comm: sh Not tainted 5.13.0-rc1-01824-g3a81c0495fdb =
#7
>>      NIP:  c002e9f0 LR: c0011858 CTR: 00008a47
>>      REGS: c292fd50 TRAP: 0300   Not tainted  (5.13.0-rc1-01824-g3a81c04=
95fdb)
>>      MSR:  00009000 <EE,ME>  CR: 24002002  XER: 20000000
>>      DEAR: 7c0802a6 ESR: 00000000
>>      <snip>
>>      NIP [c002e9f0] emulate_step+0x28/0x324
>>      LR [c0011858] optinsn_slot+0x128/0x10000
>>      Call Trace:
>>       opt_pre_handler+0x7c/0xb4 (unreliable)
>>       optinsn_slot+0x128/0x10000
>>       ret_from_syscall+0x0/0x28
>=20
> I remember running some kprobe tests before submitting the patch, how did=
 I miss that ?
> Is there anything special to do to activate the use of optprobes and/or t=
o hit this bug ?

Yeah, I was surprised when I hit this. One of the requirements we have=20
for optprobes on powerpc is that the instruction should be a compute=20
instruction (no load/store -- emulate_update_regs() should be enough)=20
with the exception of conditional branches. It's possible that you ended=20
up probing an instruction that couldn't be optimized.

An easy way to confirm if a probe has been optimized is to look at=20
kprobes/list in debugfs, and to watch out for [OPTIMIZED] flag there.

>> diff --git a/arch/powerpc/kernel/optprobes.c=20
>> b/arch/powerpc/kernel/optprobes.c
>> index cdf87086fa33a0..2bc53fa48a1b33 100644
>> --- a/arch/powerpc/kernel/optprobes.c
>> +++ b/arch/powerpc/kernel/optprobes.c
>> @@ -281,8 +281,12 @@ int arch_prepare_optimized_kprobe(struct optimized_=
kprobe *op, struct kprobe *p)
>>   	/*
>>   	 * 3. load instruction to be emulated into relevant register, and
>>   	 */
>> -	temp =3D ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
>> -	patch_imm_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX);
>> +	if (IS_ENABLED(CONFIG_PPC64)) {
>> +		temp =3D ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
>> +		patch_imm_load_insns(ppc_inst_as_ulong(temp), 4, buff + TMPL_INSN_IDX=
);
>> +	} else {
>> +		patch_imm_load_insns((unsigned long)p->ainsn.insn, 4, buff + TMPL_INS=
N_IDX);
>> +	}
>=20
> It means commit https://github.com/linuxppc/linux/commit/693557ebf407a85e=
a400a0b501bb97687d8f4856=20
> was not necessary and may be reverted.

Indeed, I will send a revert for it.


- Naveen

