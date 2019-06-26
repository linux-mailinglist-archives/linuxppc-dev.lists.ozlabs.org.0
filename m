Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EDB565CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 11:41:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YdMk1FSWzDqZV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 19:41:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YdKz2YDczDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 19:40:07 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5Q9cf0U103942
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 05:40:05 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tc45hdb1b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 05:40:04 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 26 Jun 2019 10:40:02 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Jun 2019 10:39:58 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5Q9dm2T15729130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 09:39:48 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC53F4C046;
 Wed, 26 Jun 2019 09:39:57 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AD584C044;
 Wed, 26 Jun 2019 09:39:57 +0000 (GMT)
Received: from localhost (unknown [9.124.35.28])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Jun 2019 09:39:57 +0000 (GMT)
Date: Wed, 26 Jun 2019 15:09:56 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 7/7] powerpc/kprobes: Allow probing on any ftrace address
To: Masami Hiramatsu <mhiramat@kernel.org>, Joe Perches <joe@perches.com>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <d26f5467577ff0aeecea55e7035ea64e303bdf17.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <20190621235034.acc00fc3e2b2c7e89caa1fd5@kernel.org>
In-Reply-To: <20190621235034.acc00fc3e2b2c7e89caa1fd5@kernel.org>
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19062609-0020-0000-0000-0000034D817E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062609-0021-0000-0000-000021A0F5C4
Message-Id: <1561541820.15ifr1qex2.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-26_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=690 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906260116
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
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masami Hiramatsu wrote:
> On Tue, 18 Jun 2019 20:17:06 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
>> With KPROBES_ON_FTRACE, kprobe is allowed to be inserted on instructions
>> that branch to _mcount (referred to as ftrace location). With
>> -mprofile-kernel, we now include the preceding 'mflr r0' as being part
>> of the ftrace location.
>>=20
>> However, by default, probing on an instruction that is not actually the
>> branch to _mcount() is prohibited, as that is considered to not be at an
>> instruction boundary. This is not the case on powerpc, so allow the same
>> by overriding arch_check_ftrace_location()
>>=20
>> In addition, we update kprobe_ftrace_handler() to detect this scenarios
>> and to pass the proper nip to the pre and post probe handlers.
>>=20
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> ---
>>  arch/powerpc/kernel/kprobes-ftrace.c | 30 ++++++++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>=20
>> diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/=
kprobes-ftrace.c
>> index 972cb28174b2..6a0bd3c16cb6 100644
>> --- a/arch/powerpc/kernel/kprobes-ftrace.c
>> +++ b/arch/powerpc/kernel/kprobes-ftrace.c
>> @@ -12,14 +12,34 @@
>>  #include <linux/preempt.h>
>>  #include <linux/ftrace.h>
>> =20
>> +/*
>> + * With -mprofile-kernel, we patch two instructions -- the branch to _m=
count
>> + * as well as the preceding 'mflr r0'. Both these instructions are clai=
med
>> + * by ftrace and we should allow probing on either instruction.
>> + */
>> +int arch_check_ftrace_location(struct kprobe *p)
>> +{
>> +	if (ftrace_location((unsigned long)p->addr))
>> +		p->flags |=3D KPROBE_FLAG_FTRACE;
>> +	return 0;
>> +}
>> +
>>  /* Ftrace callback handler for kprobes */
>>  void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
>>  			   struct ftrace_ops *ops, struct pt_regs *regs)
>>  {
>>  	struct kprobe *p;
>> +	int mflr_kprobe =3D 0;
>>  	struct kprobe_ctlblk *kcb;
>> =20
>>  	p =3D get_kprobe((kprobe_opcode_t *)nip);
>> +	if (unlikely(!p)) {
>=20
> Hmm, is this really unlikely? If we put a kprobe on the second instructio=
n address,
> we will see p =3D=3D NULL always.
>=20
>> +		p =3D get_kprobe((kprobe_opcode_t *)(nip - MCOUNT_INSN_SIZE));
>> +		if (!p)
>=20
> Here will be unlikely, because we can not find kprobe at both of nip and
> nip - MCOUNT_INSN_SIZE.
>=20
>> +			return;
>> +		mflr_kprobe =3D 1;
>> +	}
>> +
>>  	if (unlikely(!p) || kprobe_disabled(p))
>=20
> "unlikely(!p)" is not needed here.

...

Joe Perches wrote:
> On Fri, 2019-06-21 at 23:50 +0900, Masami Hiramatsu wrote:
>> On Tue, 18 Jun 2019 20:17:06 +0530
>> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
> trivia:
>=20
>> > diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kerne=
l/kprobes-ftrace.c
> []
>> > @@ -57,6 +82,11 @@ NOKPROBE_SYMBOL(kprobe_ftrace_handler);
>> > =20
>> >  int arch_prepare_kprobe_ftrace(struct kprobe *p)
>> >  {
>> > +	if ((unsigned long)p->addr & 0x03) {
>> > +		printk("Attempt to register kprobe at an unaligned address\n");
>=20
> Please use the appropriate KERN_<LEVEL> or pr_<level>
>=20

All good points. Thanks for the review.


- Naveen

=

