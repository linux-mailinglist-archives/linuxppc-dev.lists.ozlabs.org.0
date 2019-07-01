Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 050035B73A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 10:53:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ch3P2qxXzDqT4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 18:53:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ch1b0wHMzDqGB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 18:51:30 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x618ln6Y010968
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 1 Jul 2019 04:51:27 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tfe97tme7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 04:51:27 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Mon, 1 Jul 2019 09:51:25 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Jul 2019 09:51:20 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x618pJ1I50266294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 08:51:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD34042042;
 Mon,  1 Jul 2019 08:51:19 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E56F42041;
 Mon,  1 Jul 2019 08:51:19 +0000 (GMT)
Received: from localhost (unknown [9.124.35.147])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jul 2019 08:51:19 +0000 (GMT)
Date: Mon, 01 Jul 2019 14:21:17 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 4/7] powerpc/ftrace: Additionally nop out the preceding
 mflr with -mprofile-kernel
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
 <841386feda429a1f0d4b7442c3ede1ed91466f92.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
 <20190627110819.4892780f@gandalf.local.home>
 <1561648598.uvetvkj39x.naveen@linux.ibm.com>
 <20190627121344.25b5449a@gandalf.local.home>
In-Reply-To: <20190627121344.25b5449a@gandalf.local.home>
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19070108-0020-0000-0000-0000034F14D6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070108-0021-0000-0000-000021A29D96
Message-Id: <1561970917.6b4f6qppo3.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=932 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010110
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
> On Thu, 27 Jun 2019 20:58:20 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
>>=20
>> > But interesting, I don't see a synchronize_rcu_tasks() call
>> > there. =20
>>=20
>> We felt we don't need it in this case. We patch the branch to ftrace=20
>> with a nop first. Other cpus should see that first. But, now that I=20
>> think about it, should we add a memory barrier to ensure the writes get=20
>> ordered properly?
>=20
> Do you send an ipi to the other CPUs. I would just to be safe.
>=20

<snip>

>>=20
>> We are handling this through ftrace_replace_code() and=20
>> __ftrace_make_call_prep() below. For FTRACE_UPDATE_MAKE_CALL, we patch=20
>> in the mflr, followed by smp_call_function(isync) and=20
>> synchronize_rcu_tasks() before we proceed to patch the branch to ftrace.
>>=20
>> I don't see any other scenario where we end up in=20
>> __ftrace_make_nop_kernel() without going through ftrace_replace_code(). =
=20
>> For kernel modules, this can happen during module load/init and so, I=20
>> patch out both instructions in __ftrace_make_call() above without any=20
>> synchronization.
>>=20
>> Am I missing anything?
>>=20
>=20
> No, I think I got confused ;-), it's the patch out that I was worried
> about, but when I was going through the scenario, I somehow turned it
> into the patching in (which I already audited :-p). I was going to
> reply with just the top part of this email, but then the confusion
> started :-/
>=20
> OK, yes, patching out should be fine, and you already covered the
> patching in. Sorry for the noise.
>=20
> Just to confirm and totally remove the confusion, the patch does:
>=20
> 	<func>:
> 	mflr	r0 <-- preempt here
> 	bl	_mcount
>=20
> 	<func>:
> 	mflr	r0
> 	nop
>=20
> And this is fine regardless.
>=20
> OK, Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Thanks for confirming! We do need an IPI to be sure, as you pointed out=20
above. I will have the patching out take the same path to simplify=20
things.


- Naveen

=

