Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EED3728D7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 12:26:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZGGP4q4rz301v
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 20:26:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hIAZhO4y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hIAZhO4y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZGFr1CLkz2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 20:25:51 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144A3x3Q034607
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 May 2021 06:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : references : in-reply-to : mime-version : message-id : content-type :
 content-transfer-encoding; s=pp1;
 bh=XNE0tz8/TZenWmq04e07dYMedbhPAN+LeA65OZqMe/A=;
 b=hIAZhO4ykBv1NyPHfgeH99VdhS7xT0IaNSq///Jpbn1sLDlmugcBbzX6fR68fyYYPw3q
 U0ktco3B6BNJ9Szvw/M8aaoiqG+AOVUCj0owQ5PZsfCQYFd6mJdPjbjmc/lGyyxkedow
 xsgQlw0b/B7XQr63unfCFabvKRX/OF8c/TOA+Tg/U+u4Yp+6wLdNZBsyO7wGy2C4II3E
 avDkVnhzxGQkUNSs+lDJVQilH4qMQfPg3zsnzJ/jwdf870mo70uMcmkXQKUvvFXlZ3j0
 ocDIOwVI/r5UdNz6nqLBFh144HOijVMxy6VO7V1EeLs08ZXur3/0cARg/X3/RnesuPma Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38b2n6kcg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 06:25:48 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 144A485h035182
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 May 2021 06:25:48 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38b2n6kcfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 06:25:48 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 144APSGR018736;
 Tue, 4 May 2021 10:25:46 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 388xm88mhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 10:25:46 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 144APIds35651884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 10:25:18 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13CB5A4060;
 Tue,  4 May 2021 10:25:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B1C8A405B;
 Tue,  4 May 2021 10:25:43 +0000 (GMT)
Received: from localhost (unknown [9.85.73.70])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 10:25:43 +0000 (GMT)
Date: Tue, 04 May 2021 15:55:42 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/4] powerpc/pseries: warn if recursing into the hcall
 tracing code
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
References: <20210423031108.1046067-1-npiggin@gmail.com>
 <20210423031108.1046067-5-npiggin@gmail.com>
 <1619531703.lv0qigovgz.naveen@linux.ibm.com>
 <1619832142.gw4mrldjdp.astroid@bobo.none>
In-Reply-To: <1619832142.gw4mrldjdp.astroid@bobo.none>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1620123377.d2jb7v70z0.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qREVrshdDGDN9Rn-pqNx8ZjweoygEW8T
X-Proofpoint-ORIG-GUID: VOCow_FbtENCQLY7sA2fPs3GNVchxLp8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_05:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105040072
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin wrote:
> Excerpts from Naveen N. Rao's message of April 27, 2021 11:59 pm:
>> Nicholas Piggin wrote:
>>> + *
>>> + * H_CONFER from spin locks must be treated separately though and use =
_notrace
>>> + * plpar_hcall variants, see yield_to_preempted().
>>>   */
>>>  static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
>>>=20
>>> @@ -1843,7 +1846,7 @@ notrace void __trace_hcall_entry(unsigned long op=
code, unsigned long *args)
>>>=20
>>>  	depth =3D this_cpu_ptr(&hcall_trace_depth);
>>>=20
>>> -	if (*depth)
>>> +	if (WARN_ON_ONCE(*depth))
>>>  		goto out;
>>=20
>> I don't think this will be helpful. The hcall trace depth tracking is=20
>> for the tracepoint and I suspect that this warning will be triggered=20
>> quite easily. Since we have recursion protection, I don't think we=20
>> should warn here.
>=20
> What would trigger recursion?

The trace code that this protects: trace_hcall_entry(). The tracing code=20
itself can end up doing a hcall as we see in the first patch in this=20
series:
  plpar_hcall_norets_trace+0x34/0x8c (unreliable)
  __pv_queued_spin_lock_slowpath+0x684/0x710
  trace_clock_global+0x148/0x150
  ring_buffer_lock_reserve+0x12c/0x630
  trace_event_buffer_lock_reserve+0x80/0x220
  trace_event_buffer_reserve+0x7c/0xd0
  trace_event_raw_event_hcall_entry+0x68/0x150
  __trace_hcall_entry+0x160/0x180


There is also a comment aroung hcall_trace_depth that mentions this:

  /*
   * Since the tracing code might execute hcalls we need to guard against
   * recursion. One example of this are spinlocks calling H_YIELD on
   * shared processor partitions.
   */


Thanks,
Naveen

