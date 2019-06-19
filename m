Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 425284B37D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 09:58:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45THQF45ckzDqlj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 17:58:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45THN15ZN3zDqLb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 17:56:48 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5J7qROj122401
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 03:56:46 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t7gbhaj17-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 03:56:46 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 19 Jun 2019 08:56:44 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 08:56:41 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5J7uesw59441326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 07:56:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA2EB11C050;
 Wed, 19 Jun 2019 07:56:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9769F11C058;
 Wed, 19 Jun 2019 07:56:39 +0000 (GMT)
Received: from localhost (unknown [9.124.35.165])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 07:56:39 +0000 (GMT)
Date: Wed, 19 Jun 2019 13:26:37 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 5/7] powerpc/ftrace: Update ftrace_location() for powerpc
 -mprofile-kernel
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <186656540d3e6225abd98374e791a13d10d86fab.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <20190618114509.5b1acbe5@gandalf.local.home>
 <1560881411.p0i6a1dkwk.naveen@linux.ibm.com>
 <1560881840.vz9llflvnf.naveen@linux.ibm.com>
 <20190618143234.78539805@gandalf.local.home>
In-Reply-To: <20190618143234.78539805@gandalf.local.home>
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19061907-0020-0000-0000-0000034B6576
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061907-0021-0000-0000-0000219EB760
Message-Id: <1560930937.j2vguryjp3.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190066
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Steven Rostedt wrote:
> On Tue, 18 Jun 2019 23:53:11 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
>> Naveen N. Rao wrote:
>> > Steven Rostedt wrote: =20
>> >> On Tue, 18 Jun 2019 20:17:04 +0530
>> >> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>> >>  =20
>> >>> @@ -1551,7 +1551,7 @@ unsigned long ftrace_location_range(unsigned l=
ong start, unsigned long end)
>> >>>  	key.flags =3D end;	/* overload flags, as it is unsigned long */
>> >>> =20
>> >>>  	for (pg =3D ftrace_pages_start; pg; pg =3D pg->next) {
>> >>> -		if (end < pg->records[0].ip ||
>> >>> +		if (end <=3D pg->records[0].ip || =20
>> >>=20
>> >> This breaks the algorithm. "end" is inclusive. That is, if you look f=
or
>> >> a single byte, where "start" and "end" are the same, and it happens t=
o
>> >> be the first ip on the pg page, it will be skipped, and not found. =20
>> >=20
>> > Thanks. It looks like I should be over-riding ftrace_location() instea=
d. =20
>> > I will update this patch. =20
>>=20
>> I think I will have ftrace own the two instruction range, regardless of=20
>> whether the preceding instruction is a 'mflr r0' or not. This simplifies=
=20
>> things and I don't see an issue with it as of now. I will do more=20
>> testing to confirm.
>>=20
>> - Naveen
>>=20
>>=20
>> --- a/arch/powerpc/kernel/trace/ftrace.c
>> +++ b/arch/powerpc/kernel/trace/ftrace.c
>> @@ -951,6 +951,16 @@ void arch_ftrace_update_code(int command)
>>  }
>> =20
>>  #ifdef CONFIG_MPROFILE_KERNEL
>> +/*
>> + * We consider two instructions -- 'mflr r0', 'bl _mcount' -- to be par=
t
>> + * of ftrace. When checking for the first instruction, we want to inclu=
de
>> + * the next instruction in the range check.
>> + */
>> +unsigned long ftrace_location(unsigned long ip)
>> +{
>> +	return ftrace_location_range(ip, ip + MCOUNT_INSN_SIZE);
>> +}
>> +
>>  /* Returns 1 if we patched in the mflr */
>>  static int __ftrace_make_call_prep(struct dyn_ftrace *rec)
>>  {
>> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
>> index 21d8e201ee80..122e2bb4a739 100644
>> --- a/kernel/trace/ftrace.c
>> +++ b/kernel/trace/ftrace.c
>> @@ -1573,7 +1573,7 @@ unsigned long ftrace_location_range(unsigned long =
start, unsigned long end)
>>   * the function tracer. It checks the ftrace internal tables to
>>   * determine if the address belongs or not.
>>   */
>> -unsigned long ftrace_location(unsigned long ip)
>> +unsigned long __weak ftrace_location(unsigned long ip)
>>  {
>>  	return ftrace_location_range(ip, ip);
>>  }
>=20
> Actually, instead of making this a weak function, let's do this:
>=20
>=20
> In include/ftrace.h:
>=20
> #ifndef FTRACE_IP_EXTENSION
> # define FTRACE_IP_EXTENSION	0
> #endif
>=20
>=20
> In arch/powerpc/include/asm/ftrace.h
>=20
> #define FTRACE_IP_EXTENSION	MCOUNT_INSN_SIZE
>=20
>=20
> Then we can just have:
>=20
> unsigned long ftrace_location(unsigned long ip)
> {
> 	return ftrace_location_range(ip, ip + FTRACE_IP_EXTENSION);
> }

Thanks, that's indeed nice. I hope you don't mind me adding your SOB for=20
that.

- Naveen

=

