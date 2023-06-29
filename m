Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A29EB74254C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 14:05:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UNx7oT3D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsHFy4Bngz3bcD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 22:05:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UNx7oT3D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsHF27107z306B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 22:04:38 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35TBlb6h014110;
	Thu, 29 Jun 2023 12:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FFcWFhPXK4s5EhufV5iP50/C3C+p/BQChJ9YUO6Wogs=;
 b=UNx7oT3DvlVOz5pk0UY8ZUpqPKoFDq2aQ2IEiLqdDzzbU88NCWYMTrXnxeR8wZT4+7aY
 oCCoMwdpI6hdRAlbBAjVyZt2nUfK4D4qoscePARhmUZWDb/Klm7VezQhLdj0lJ448bk3
 XIl8dvniU9fHssKeXijLtp+KcPUNkWI/E1pC6LpGz4Wgt3YDq47xbGLvpriAT3u7HvqA
 G3lgfvriY6mWun8GxVKvlv/XHflxW1nXadnFB9mPY28zJs6RiyS2bMe6ZEeKJI7WkmxY
 IvrjGI/T/xy109Hf8o9kzgZHACMWYQz49vfC8GE7p9w1RjzLjlsAvdk4Fcz0uB5nl/AC xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rh9d28bk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 12:04:13 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35TC0k2k030829;
	Thu, 29 Jun 2023 12:04:12 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rh9d28bhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 12:04:12 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35TBYLAi011422;
	Thu, 29 Jun 2023 12:04:09 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3rdr452ge1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 12:04:09 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35TC47JX19268186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jun 2023 12:04:07 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3781C20043;
	Thu, 29 Jun 2023 12:04:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C468320040;
	Thu, 29 Jun 2023 12:04:06 +0000 (GMT)
Received: from [9.144.158.239] (unknown [9.144.158.239])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Jun 2023 12:04:06 +0000 (GMT)
Message-ID: <91dc3a14-4f1b-ebff-69d7-ff15469b5dcb@linux.ibm.com>
Date: Thu, 29 Jun 2023 14:04:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/9] Introduce SMT level and add PowerPC support
Content-Language: fr
To: Michael Ellerman <mpe@ellerman.id.au>, Sachin Sant <sachinp@linux.ibm.com>
References: <20230628100558.43482-1-ldufour@linux.ibm.com>
 <88E208A6-F4E0-4DE9-8752-C9652B978BC6@linux.ibm.com>
 <87edluh6ce.fsf@mail.lhotse>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <87edluh6ce.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0UOBMfegDE_I71F22zNx5oVM0tK1OamE
X-Proofpoint-GUID: UpmLjj2GgeXEOoGf8Ebdt0bsAN_eXqAi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306290108
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, open list <linux-kernel@vger.kernel.org>, npiggin@gmail.com, Ingo Molnar <mingo@redhat.com>, bp@alien8.de, tglx@linutronix.de, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/06/2023 à 13:10, Michael Ellerman a écrit :
> Sachin Sant <sachinp@linux.ibm.com> writes:
>>> On 28-Jun-2023, at 3:35 PM, Laurent Dufour <ldufour@linux.ibm.com> wrote:
>>>
>>> I'm taking over the series Michael sent previously [1] which is smartly
>>> reviewing the initial series I sent [2].  This series is addressing the
>>> comments sent by Thomas and me on the Michael's one.
>>>
>>> Here is a short introduction to the issue this series is addressing:
>>>
>>> When a new CPU is added, the kernel is activating all its threads. This
>>> leads to weird, but functional, result when adding CPU on a SMT 4 system
>>> for instance.
>>>
>>> Here the newly added CPU 1 has 8 threads while the other one has 4 threads
>>> active (system has been booted with the 'smt-enabled=4' kernel option):
>>>
>>> ltcden3-lp12:~ # ppc64_cpu --info
>>> Core   0:    0*    1*    2*    3*    4     5     6     7
>>> Core   1:    8*    9*   10*   11*   12*   13*   14*   15*
>>>
>>> This mixed SMT level may confused end users and/or some applications.
>>>
>>
>> Thanks for the patches Laurent.
>>
>> Is the SMT level retained even when dynamically changing SMT values?
>> I am observing difference in behaviour with and without smt-enabled
>> kernel command line option.
>>
>> When smt-enabled= option is specified SMT level is retained across
>> cpu core remove and add.
>>
>> Without this option but changing SMT level during runtime using
>> ppc64_cpu —smt=<level>, the SMT level is not retained after
>> cpu core add.
> 
> That's because ppc64_cpu is not using the sysfs SMT control file, it's
> just onlining/offlining threads manually.
> 
> If you run:
>   $ ppc64_cpu --smt=4
> 
> And then also do:
> 
>   $ echo 4 > /sys/devices/system/cpu/smt/control
> 
> It should work as expected?
> 
> ppc64_cpu will need to be updated to do that automatically.

Hi Sachin and Michael,

Yes, ppc64_cpu will need an update, and I have a patch ready to be sent 
once this series will be accepted.

By the way, I've a fix for the build issue reported against the patch 
6/9. I'll send a v3 soon.

Cheers,

Laurent.
