Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 253F164411D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 11:15:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRGWz099Lz3bhM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 21:15:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CxCV2iAw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CxCV2iAw;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRGVz2MHVz2yN9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 21:14:50 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B681iNn011870;
	Tue, 6 Dec 2022 10:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=xP+fE3zfeq7Cma8fKqUf/J6GY4b4v0vDQ9LWsl5xUaE=;
 b=CxCV2iAwdqdN9mf9vgFsB05jtM1ewnD7HjVYa5NrZSCY02d8w/paB+ehcpKx21z4oFQE
 WEBPO9BT0fxbd86ps7hzSw/TD8pDLKbTK7NKXuGKd5uMhrpy56EZ9U5KhsFDK47SWerB
 FlVZsbVGgLBm2wfv0lL0DkxVZcXkbzIlrC1exr595Zpx7w+0NGJ8IxHuqsTjv7MvRILX
 ZMZoEZ2VGQJfljhGh2d04VmXxvgut52TOBPpfFSQ6RSXRLxGFHCCxBVtTUEhYoI22LGv
 8HNrlS3L6B4FF8cvMJ18jr2fIJ9WEYnvwQoD9rQ7SwPJLmB5z5u48GZ0LQSoGfywgtpI 0g== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m8gm46xvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Dec 2022 10:14:28 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B696TPX008300;
	Tue, 6 Dec 2022 10:14:26 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3m9m5y1602-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Dec 2022 10:14:26 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com ([9.149.105.160])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B6AEOgf43843942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Dec 2022 10:14:24 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18ADFA4067;
	Tue,  6 Dec 2022 10:14:24 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A948A4062;
	Tue,  6 Dec 2022 10:14:23 +0000 (GMT)
Received: from localhost (unknown [9.124.31.136])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  6 Dec 2022 10:14:23 +0000 (GMT)
Date: Tue, 06 Dec 2022 15:44:22 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: linux-next: build warnings after merge of the powerpc-objtool
 tree
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        PowerPC
	<linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "peterz@infradead.org" <peterz@infradead.org>,
        Stephen Rothwell
	<sfr@canb.auug.org.au>,
        Sathvika Vasireddy <sv@linux.ibm.com>
References: <20221125143012.6426c2b9@canb.auug.org.au>
	<6cdad32e-782d-5bb5-f7e9-a44fb0b6444d@linux.ibm.com>
	<c0ed0d60-6014-4c5f-e610-b4d3bd9e9e33@csgroup.eu>
	<74552090-c654-5356-773d-47ead2d63ab2@linux.ibm.com>
In-Reply-To: <74552090-c654-5356-773d-47ead2d63ab2@linux.ibm.com>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1670317359.hj45ajyl9d.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: olsnCQvttZOY4sF1sHKJ-y4bBqYE_GNk
X-Proofpoint-GUID: olsnCQvttZOY4sF1sHKJ-y4bBqYE_GNk
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_05,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1011 mlxscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212060078
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sathvika Vasireddy wrote:
>=20
> On 29/11/22 20:58, Christophe Leroy wrote:
>>
>> Le 29/11/2022 =C3=A0 16:13, Sathvika Vasireddy a =C3=A9crit=C2=A0:
>>> Hi all,
>>>
>>> On 25/11/22 09:00, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> After merging the powerpc-objtool tree, today's linux-next build (powe=
rpc
>>>> pseries_le_defconfig) produced these warnings:
>>>>
>>>> arch/powerpc/kernel/head_64.o: warning: objtool: end_first_256B():
>>>> can't find starting instruction
>>>> arch/powerpc/kernel/optprobes_head.o: warning: objtool:
>>>> optprobe_template_end(): can't find starting instruction
>>>>
>>>> I have no idea what started this (they may have been there yesterday).
>>> I was able to recreate the above mentioned warnings with
>>> pseries_le_defconfig and powernv_defconfig. The regression report also
>>> mentions a warning
>>> (https://lore.kernel.org/oe-kbuild-all/202211282102.QUr7HHrW-lkp@intel.=
com/) seen with arch/powerpc/kernel/kvm_emul.S assembly file.
>>>
>>>   =C2=A0[1] arch/powerpc/kernel/optprobes_head.o: warning: objtool:
>>> optprobe_template_end(): can't find starting instruction
>>>   =C2=A0[2] arch/powerpc/kernel/kvm_emul.o: warning: objtool:
>>> kvm_template_end(): can't find starting instruction
>>>   =C2=A0[3] arch/powerpc/kernel/head_64.o: warning: objtool: end_first_=
256B():
>>> can't find starting instruction
>>>
>>> The warnings [1] and [2] go away after adding 'nop' instruction. Below
>>> diff fixes it for me:
>> You have to add NOPs just because those labels are at the end of the
>> files. That's a bit odd.
>> I think either we are missing some kind of flagging for the symbols, or
>> objtool has a bug. In both cases, I'm not sure adding an artificial
>> 'nop' is the solution. At least there should be a big hammer warning
>> explaining why.

The problem looks to be that commit dbcdbdfdf137b4 ("objtool: Rework=20
instruction -> symbol mapping"), which was referenced by Sathvika below,=20
changes how STT_NOTYPE symbols are handled. In the files throwing that=20
warning, there are labels either at the very end of the file, or at the=20
end of a section with no subsequent instruction. Before that commit, we=20
didn't used to expect an instruction for STT_NOTYPE symbols.

>=20
> I don't see these warnings with powerpc/topic/objtool branch. However,=20
> they are seen with linux-next master branch.
> Commit dbcdbdfdf137b49144204571f1a5e5dc01b8aaad objtool: Rework=20
> instruction -> symbol mapping in linux-next is resulting in objtool=20
> can't find starting instruction warnings on powerpc.
>=20
> Reverting this particular hunk (pasted below), resolves it and we don't=20
> see the problem anymore.
>=20
> @@ -427,7 +427,10 @@ static int decode_instructions(struct objtool_file=20
> *file)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 list_for_each_entry(func, &sec->symbol_list, list) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (func->type=
 !=3D STT_FUNC || func->alias !=3D func)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (func->type=
 !=3D STT_NOTYPE && func->type !=3D=20
> STT_FUNC)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (func->retu=
rn_thunk || func->alias !=3D func)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!fin=
d_insn(file, sec, func->offset)) {

We are currently bailing out if find_insn() there fails. Should we=20
instead just continue by not setting insn->sym?

@@ -430,11 +430,8 @@ static int decode_instructions(struct objtool_file *fi=
le)
                        if (func->return_thunk || func->alias !=3D func)
                                continue;
=20
-                       if (!find_insn(file, sec, func->offset)) {
-                               WARN("%s(): can't find starting instruction=
",
-                                    func->name);
-                               return -1;
-                       }
+                       if (!find_insn(file, sec, func->offset))
+                               continue;
=20
                        sym_for_each_insn(file, func, insn) {
                                insn->sym =3D func;



- Naveen

