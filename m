Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B68694B6D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 16:41:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFpVX08j6z3c8V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 02:41:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b3aJTCGN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b3aJTCGN;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFpTY1bDLz3bjf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 02:41:03 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31DEWPLa022719;
	Mon, 13 Feb 2023 15:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=MRlHja68zXK8rM1WDFTOEy0ggXxp6OKRe0cMX4F0XPY=;
 b=b3aJTCGNik1vWmduwtZv9sFneedp4zCQ753Hx8tEa19t6qVvoe2evyoevXWAgtVG2eCz
 DB6a3ySbBXIj7rA4G6LNbfh+6607Y03u5G6mqfbDEf4KjB6GGVWNURPzPOR4gVvuGdJ6
 tFh12lMglkk+2i3YD8FRs1QwuyFDA4/oVayVtqxgkx67U59k64a+4F3XYTcoS+9tfQJH
 t5PrhXb8JOjeDSJ64zetUNfusmgzzRG9jXIo96pFCFSckpyoLIxIq+s/HtogVlmKiZe3
 FvTi4Bs2hlon0qCf9YK1jLR5vz7v0YpvyHWeBOLbbLbbCYx3oNHhwc6Zb1JSnfJG13bP Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqq2dhw0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 15:40:54 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DFaFnq001932;
	Mon, 13 Feb 2023 15:40:54 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nqq2dhw0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 15:40:54 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DD13sp010507;
	Mon, 13 Feb 2023 15:40:53 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3np2n7dyf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Feb 2023 15:40:53 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31DFepMW56557902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Feb 2023 15:40:51 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44FAF5805D;
	Mon, 13 Feb 2023 15:40:51 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C51558066;
	Mon, 13 Feb 2023 15:40:51 +0000 (GMT)
Received: from localhost (unknown [9.211.96.43])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Feb 2023 15:40:51 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] powerpc/pseries/cpuhp: respect current SMT when adding
 new CPU
In-Reply-To: <20230213150429.GZ19419@kitsune.suse.cz>
References: <20230213124510.12651-1-ldufour@linux.ibm.com>
 <87ilg5aahx.fsf@linux.ibm.com> <20230213150429.GZ19419@kitsune.suse.cz>
Date: Mon, 13 Feb 2023 09:40:50 -0600
Message-ID: <87fsb9a7zx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LenrdvV9f1Rm-F3fXge8-iKoWOmKsYTi
X-Proofpoint-ORIG-GUID: lGdNXSAelP0hRZ8Ie6pez55jppAVxESs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_10,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130136
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
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.ibm.com>, npiggin@gmail.com, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Mon, Feb 13, 2023 at 08:46:50AM -0600, Nathan Lynch wrote:
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> > When a new CPU is added, the kernel is activating all its threads. This
>> > leads to weird, but functional, result when adding CPU on a SMT 4 syst=
em
>> > for instance.
>> >
>> > Here the newly added CPU 1 has 8 threads while the other one has 4 thr=
eads
>> > active (system has been booted with the 'smt-enabled=3D4' kernel optio=
n):
>> >
>> > ltcden3-lp12:~ # ppc64_cpu --info
>> > Core   0:    0*    1*    2*    3*    4     5     6     7
>> > Core   1:    8*    9*   10*   11*   12*   13*   14*   15*
>> >
>> > There is no SMT value in the kernel. It is possible to run unbalanced =
LPAR
>> > with 2 threads for a CPU, 4 for another one, and 5 on the latest.
>> >
>> > To work around this possibility, and assuming that the LPAR run with t=
he
>> > same number of threads for each CPU, which is the common case,
>>=20
>> I am skeptical at best of baking that assumption into this code. Mixed
>> SMT modes within a partition doesn't strike me as an unreasonable
>> possibility for some use cases. And if that's wrong, then we should just
>> add a global smt value instead of using heuristics.
>>=20
>> > the number
>> > of active threads of the CPU doing the hot-plug operation is computed.=
 Only
>> > that number of threads will be activated for the newly added CPU.
>> >
>> > This way on a LPAR running in SMT=3D4, newly added CPU will be running=
 4
>> > threads, which is what a end user would expect.
>>=20
>> I could see why most users would prefer this new behavior. But surely
>> some users have come to expect the existing behavior, which has been in
>> place for years, and developed workarounds that might be broken by this
>> change?
>>=20
>> I would suggest that to handle this well, we need to give user space
>> more ability to tell the kernel what actions to take on added cores, on
>> an opt-in basis.
>>=20
>> This could take the form of extending the DLPAR sysfs command set:
>>=20
>> Option 1 - Add a flag that tells the kernel not to online any threads at
>> all; user space will online the desired threads later.
>>=20
>> Option 2 - Add an option that tells the kernel which SMT mode to apply.
>
> powerpc-utils grew some drmgr hooks recently so maybe the policy can be
> moved to userspace?

I'm not sure whether the hook mechanism would come into play, but yes, I
am suggesting that user space be given the option of overriding the
kernel's current behavior.
