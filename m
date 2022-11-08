Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C2620D59
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 11:34:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N64Gg1gQlz3dvH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 21:34:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HBjsJFnK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HBjsJFnK;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N64Fh444Nz3c5D
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 21:33:43 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A89Uauf008683;
	Tue, 8 Nov 2022 10:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=l9ul+0S7lm+uzPFL9oD0Ysw0PxdqaZ/7uKOWB/AKQvQ=;
 b=HBjsJFnKAIkAN5PC7N1I/VCM+EcW5f/3YkNCruPkdxkHPnYd8OO2T2dIgA7beFgsDL0E
 ktbyheBwdArHK2lEPQPGil4KEe5pRZk7Qey1mpHF1ZhPufrOQiI8ciY0CFYCjoJXCxyx
 2gjULaiO8khU5grIo5Oq461jRQ4DpuPRm/kPmPBdIhRNEyK9lwNBDZ8W4GYrDKxCMiW0
 p0TeQ5kQE2Fx0wIekuCAzJRF0GjKAxAWxmrggYKCQbRa+mIM0FLLVQhwQTo9s34DImRm
 9sfaJx9FW9RfASa9/XXTYii6qMBMFOTBkgxYVYKve1faj80Oal08NpIZsYq7LpGxOe+0 jA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqkjf3n8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 10:33:29 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A89BaJ1025150;
	Tue, 8 Nov 2022 10:33:29 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqkjf3n7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 10:33:28 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A8ANdhw028302;
	Tue, 8 Nov 2022 10:33:26 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma05fra.de.ibm.com with ESMTP id 3kngpstuev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 10:33:26 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A8ARfui43581722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Nov 2022 10:27:41 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 24024AE051;
	Tue,  8 Nov 2022 10:33:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9848AAE045;
	Tue,  8 Nov 2022 10:33:23 +0000 (GMT)
Received: from localhost (unknown [9.43.47.171])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  8 Nov 2022 10:33:23 +0000 (GMT)
Date: Tue, 08 Nov 2022 16:03:22 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/5] powerpc/kprobes: Remove preempt disable around call
 to get_kprobe() in arch_prepare_kprobe()
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
	<npiggin@gmail.com>
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
	<1043d06a0affed83a4a46dd29466e72820ee215d.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
	<CO5ZGEJVLRZ7.238O5NMW5P1B2@bobo>
In-Reply-To: <CO5ZGEJVLRZ7.238O5NMW5P1B2@bobo>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1667903577.zgaqqqw8dc.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dfVVv-5CGnyzr1JfJHJJLom54ZPmem4B
X-Proofpoint-GUID: EsxGgPip2munH9I-jSGh5lKJugO-l0NZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=592 lowpriorityscore=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080057
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin wrote:
> On Fri Oct 21, 2022 at 3:28 AM AEST, Naveen N. Rao wrote:
>> arch_prepare_kprobe() is called from register_kprobe() via
>> prepare_kprobe(), or through register_aggr_kprobe(), both with the
>> kprobe_mutex held. Per the comment for get_kprobe():
>>   /*
>>    * This routine is called either:
>>    *	- under the 'kprobe_mutex' - during kprobe_[un]register().
>>    *				OR
>>    *	- with preemption disabled - from architecture specific code.
>>    */
>=20
> That comment should read [un]register_kprobe(), right?

Ugh, yes!

>=20
>>
>> As such, there is no need to disable preemption around the call to
>> get_kprobe(). Drop the same.
>=20
> And prepare_kprobe() and register_aggr_kprobe() are both called with
> kprobe_mutex held so you rely on the same protection. This seems to
> fix a lost-resched bug with preempt kernels too.
>=20
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Naveen

