Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D0C48967E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 11:37:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXVdV4syBz30LS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 21:37:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fCsfg/7t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fCsfg/7t; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXVcl3Rjhz2xs2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 21:36:55 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20A9JU4d015927; 
 Mon, 10 Jan 2022 10:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZoUnCLx6kjEmuveUKaImqiaxecsAA+7RnbJQhwjzrM0=;
 b=fCsfg/7tPy82KdxBzcIB+ho93RTnShbpTTCYK9WAoxO3XvvvsMDrv+NA/9f+4aUmLpxR
 8OXHMrnIW2ZW8YLCSxAvz9pZ7opBfH9hNKwEFxrVMn3DWMcwvajJOI7uwySBFiRQYEqo
 mEvM9qH80Tr9zyzhgKGQlWLn0pu4sQYaw/Sa9Ui6T76NGs70ferZd0Trkys4VCa0pF1g
 OxVJ0DaLNYvdDTI5F622xUOYDClZ9APwh8ZbgzHAC58zG3kEjkiMBylNKMhelOj9cCid
 L/Cy7OsQ7TIi+v2LF7/7eh7odJX9MsnNNAHrLL0H5R99+uWKxxWRcT37HKKBUX3iolIA eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfm5rq9cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 10:36:27 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AASwsf004498;
 Mon, 10 Jan 2022 10:36:26 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dfm5rq9c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 10:36:26 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20AARnrX024077;
 Mon, 10 Jan 2022 10:36:24 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3df1vj2twk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 10:36:23 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20AAaLbe34996484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 10:36:21 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD6E9A4057;
 Mon, 10 Jan 2022 10:36:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D2F5A409A;
 Mon, 10 Jan 2022 10:36:21 +0000 (GMT)
Received: from localhost (unknown [9.43.113.57])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jan 2022 10:36:21 +0000 (GMT)
Date: Mon, 10 Jan 2022 16:06:20 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 01/13] bpf: Guard against accessing NULL pt_regs in
 bpf_get_task_stack()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Daniel Borkmann <daniel@iogearbox.net>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <d5ef83c361cc255494afd15ff1b4fb02a36e1dcf.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <b10434ec-f2bc-44b0-0b0a-414bff75edd8@csgroup.eu>
In-Reply-To: <b10434ec-f2bc-44b0-0b0a-414bff75edd8@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1641810817.8yruuwqpg4.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5-tz77TpCPWohDNjT2tdzPEpEJKmg42_
X-Proofpoint-ORIG-GUID: LjJohthc_mYADmvRBH0R1OvWuc-366g0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_04,2022-01-10_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100074
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
Cc: "ykaliuta@redhat.com" <ykaliuta@redhat.com>,
 "johan.almbladh@anyfinetworks.com" <johan.almbladh@anyfinetworks.com>,
 Jiri Olsa <jolsa@redhat.com>, "song@kernel.org" <song@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 06/01/2022 =C3=A0 12:45, Naveen N. Rao a =C3=A9crit=C2=A0:
>> task_pt_regs() can return NULL on powerpc for kernel threads. This is
>> then used in __bpf_get_stack() to check for user mode, resulting in a
>> kernel oops. Guard against this by checking return value of
>> task_pt_regs() before trying to obtain the call chain.
>=20
> I started looking at that some time ago, and I'm wondering whether it is=20
> worth keeping that powerpc particularity.
>=20
> We used to have a potentially different pt_regs depending on how we=20
> entered kernel, especially on PPC32, but since the following commits it=20
> is not the case anymore.
>=20
> 06d67d54741a ("powerpc: make process.c suitable for both 32-bit and 64-bi=
t")
> db297c3b07af ("powerpc/32: Don't save thread.regs on interrupt entry")
> b5cfc9cd7b04 ("powerpc/32: Fix critical and debug interrupts on BOOKE")
>=20
> We could therefore just do like other architectures, define
>=20
> #define task_pt_regs(p) ((struct pt_regs *)(THREAD_SIZE +=20
> task_stack_page(p)) - 1)
>=20
> And then remove the regs field we have in thread_struct.

Sure, I don't have an opinion on that, but I think this patch will still=20
be needed for -stable.

>=20
>=20
>>=20
>> Fixes: fa28dcb82a38f8 ("bpf: Introduce helper bpf_get_task_stack()")
>> Cc: stable@vger.kernel.org # v5.9+
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> ---
>>   kernel/bpf/stackmap.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/kernel/bpf/stackmap.c b/kernel/bpf/stackmap.c
>> index 6e75bbee39f0b5..0dcaed4d3f4cec 100644
>> --- a/kernel/bpf/stackmap.c
>> +++ b/kernel/bpf/stackmap.c
>> @@ -525,13 +525,14 @@ BPF_CALL_4(bpf_get_task_stack, struct task_struct =
*, task, void *, buf,
>>   	   u32, size, u64, flags)
>>   {
>>   	struct pt_regs *regs;
>> -	long res;
>> +	long res =3D -EINVAL;
>>  =20
>>   	if (!try_get_task_stack(task))
>>   		return -EFAULT;
>>  =20
>>   	regs =3D task_pt_regs(task);
>> -	res =3D __bpf_get_stack(regs, task, NULL, buf, size, flags);
>> +	if (regs)
>> +		res =3D __bpf_get_stack(regs, task, NULL, buf, size, flags);
>=20
> Should there be a comment explaining that on powerpc, 'regs' can be NULL=20
> for a kernel thread ?

I guess this won't be required if we end up with the change you are=20
proposing above?


- Naveen

