Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 830576377DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 12:45:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHx5G3B0rz3dvF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 22:45:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jk/LxuNs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jk/LxuNs;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHx4L5QBPz3cG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 22:44:50 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AO9waNH022414;
	Thu, 24 Nov 2022 11:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Wn9dYJ2YxCpfsEok5XeVZL8IP0UIqxkVlhf17lHLy+8=;
 b=Jk/LxuNsVqesWx1yjZcJm6zt3PPb477RGjC349qbAF4v4CNlNsDEFxcfDuOLSsZ6fR/A
 Q4hWcDfuIGd044Y+pV74M3ZMt7FqQNg61NUUIFWbmRsvNfGYI3kysVvO9UsnW+ThIi0C
 IIahbJJ55vjCv2hwTRXwK7e3e1Nwojf8V8aKfpPA+/flsvb2/5gIYexBzDUf9Zecuwsb
 6khxdxZ39AQ+EVRgsvzhPzkNDC7hD0I+kfVhCTuFnfrHALPvMUX38aiDsKg7GdnglY87
 9nBnbcoujWL1SbOxME4lWiuZOVbX8oycY7Qt11avXdRdMLMdjBQZ39fYl6HK6PRNWb4x Mw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m26f1jg3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 11:44:33 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AOBZMYd009958;
	Thu, 24 Nov 2022 11:44:32 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma05fra.de.ibm.com with ESMTP id 3kxps8nub7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 11:44:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AOBcDMj66912614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Nov 2022 11:38:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF05911C052;
	Thu, 24 Nov 2022 11:44:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2183811C04A;
	Thu, 24 Nov 2022 11:44:29 +0000 (GMT)
Received: from localhost (unknown [9.43.36.53])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 24 Nov 2022 11:44:29 +0000 (GMT)
Date: Thu, 24 Nov 2022 17:14:27 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: Questions about kprobe handler
To: Jinyang He <hejinyang@loongson.cn>,
        "Masami Hiramatsu (Google)"
	<mhiramat@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
References: <9b6eb4db-83fe-e6d9-a580-1a11aace84b0@loongson.cn>
	<20221117220915.8b233ec82dc10a84753150b4@kernel.org>
	<7e4143dc-c444-e497-43bb-ac0ba18b6691@loongson.cn>
In-Reply-To: <7e4143dc-c444-e497-43bb-ac0ba18b6691@loongson.cn>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1669288280.gcxbuppl5k.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oLVdXfblmB5sbqw6XzISmqaiawpdMLa3
X-Proofpoint-ORIG-GUID: oLVdXfblmB5sbqw6XzISmqaiawpdMLa3
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_09,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1011 mlxlogscore=689
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211240087
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jinyang He wrote:
> =E5=9C=A8 2022/11/17 21:09, Masami Hiramatsu (Google) =E5=86=99=E9=81=93:
>=20
>> On Thu, 17 Nov 2022 09:07:37 +0800
>> Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>>> Hi KPROBES maintainers,
>>>
>>> There are some differences of kprobe handler implementations on various
>>> archs, the implementations are almost same on arm64, riscv, csky, the
>>> code logic is clear and understandable. But on mips and loongarch (not
>>> upstreamed yet), if get_kprobe() returns NULL, what is the purpose of
>>> the check "if (addr->word !=3D breakpoint_insn.word)", is it necessary?
>>> Can we just return directly? Please take a look, thank you.

Are you seeing any problem with that?

>> Good question!
>>
>> This means that when the software breakpoint was hit on that CPU, but
>> before calling kprobe handler function, the other CPU can remove that
>> kprobe from hash table, becahse the hash table is not locked.
>> In that case, the get_kprobe(addr) will return NULL, and the software
>> breakpoint instruction is already removed (replaced with the original
>> instruction). Thus it is safe to go back. But this is originally
>> implemented for x86, which doesn't need stop_machine() to modify the
>> code. On the other hand, if an architecture which needs stop_machine()
>> to modify code, the above scenario never happen. In that case, you
>> don't need this "if" case.

This has been a problematic area on powerpc. See, for instance, commits:
- 9ed5df69b79a22 ("powerpc/kprobes: Use probe_address() to read instruction=
s")
- 21f8b2fa3ca5b0 ("powerpc/kprobes: Ignore traps that happened in real mode=
")

I think we should close this race, perhaps by instroducing another=20
synchronize_rcu() in unregister_kprobe(), allowing architectures using=20
stop_machine() to override that. That would be cleaner.


>>
>> Thank you,
>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/mips/kernel/kprobes.c#n323
>>> 		p =3D get_kprobe(addr);
>>> 		if (p) {
>>> 			...
>>> 		} else if (addr->word !=3D breakpoint_insn.word) {
>=20
> Hi,
>=20
>=20
> Sorry for the late reply, but I think there should be some public
> comments so that I can get the authoritative response, as offline
> communication with Tiezhu is always one-sided.
>=20
> I think the branch you answered here is " if (p)... " rather than
> "else if (addr->word !=3D breakpoint_insn.word)". It is right if we
> not use stop_machine here we need this branch. In fact, Tiezhu
> and Huacai, the maintainer of LoongArch are more concerned
> about the latter why we need compare with the breakpoint_insn.

Masami answered why we need the else part comparing the instruction at=20
addr with the breakpoint instruction. It is to check if the breakpoint=20
instruction has been removed since we hit it, but before the processor=20
reached the kprobe handler.

>=20
> The reason I gave as follows, and I show mips code here,
>=20
>  =C2=A0=C2=A0 =C2=A0p =3D get_kprobe(addr);
>  =C2=A0=C2=A0 =C2=A0if (!p) {
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 if (addr->word !=3D breakpoint_ins=
n.word) {
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /*
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0* The bre=
akpoint instruction was removed right
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0* after w=
e hit it.=C2=A0 Another cpu has removed
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0* either =
a probepoint or a debugger breakpoint
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0* at this=
 address.=C2=A0 In either case, no further
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0* handlin=
g of this interrupt is appropriate.
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0*/
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ret =3D 1;
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 }
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 /* Not one of ours: let kernel han=
dle it */
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 goto no_kprobe;
>  =C2=A0=C2=A0 =C2=A0}
>=20
> ...
> int kprobe_exceptions_notify(struct notifier_block *self,
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long val, void *data)
> {
>  =C2=A0=C2=A0 =C2=A0struct die_args *args =3D (struct die_args *)data;
>  =C2=A0=C2=A0 =C2=A0int ret =3D NOTIFY_DONE;
>=20
>  =C2=A0=C2=A0 =C2=A0switch (val) {
>  =C2=A0=C2=A0 =C2=A0case DIE_BREAK:
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 if (kprobe_handler(args->regs))
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ret =3D NOTIFY_=
STOP;
>  =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 break;
> ...
>=20
> The !p means this insn has been moved, and then in most cases the COND

!p means the kprobe has been removed - there may or may not be another=20
breakpoint instruction at that address.

> "addr->word !=3D breakpoint_insn.word" is true, we return 1 so that the r=
eturn
> value in kprobe_exceptions_notify will be changed to NOTIFY_STOP.

We do this since we now know that there is no breakpoint at this=20
address, so we should not continue.

> The mips use soft breakpoint like "break hint". How if the original insn
> is same as breakpoint_insn? That is a few case when COND is false. In that
> case, it means we should handle it by other handlers and doesn't change=20
> ret to
> keep NOTIFY_DONE as kprobe_exceptions_notify return value.

If there is a breakpoint instruction at that address, we should let the=20
kernel continue processing the breakpoint.

>=20
> Is this idea reasonable? Thanks!

As another data point, you may want to look at kprobe_handler() in=20
arch/powerpc/kernel/kprobes.c . We also handle cases where there is a=20
different type of breakpoint instruction.


- Naveen

