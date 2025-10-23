Return-Path: <linuxppc-dev+bounces-13179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A26BFF0E5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 06:04:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csXV03hZjz30RJ;
	Thu, 23 Oct 2025 15:04:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761192264;
	cv=none; b=dLOFidyk+ZAa2hRdzg2kWFQida6LcTcmAFe5iDdHe38KF04cdGFyOjcHBtZGBB8jKVWjZhZgLA7RGrvax6Zar3IggVthO1dNgM9UlGjXbbFjPyFePyASTzRyZrWnQXaLUuRBghcR0UZgo8srdeUDtsUn1kG8KZmqJsKHie7q18wzdA4A2N6ZRBnD/j3CS39k2Sa0bg1nHAf/8zQ+meHaP9C0aB8vPVXtDzFNVkBtr4tCKMjUAylYmjtxS/tBnr1TKv+dkrHE1KgajTa9uanG7S1+rpq9ySu9SuXJMelw+/qSCTnoJkMVqUawN/VVV2v1MG8vFu7egZ/tIxvobmrQgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761192264; c=relaxed/relaxed;
	bh=kNqq/bIE1J52ZfD77A5OJ4HQCqtofGAaXPUWDYZC3HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KS7b10e65ij2eKQ/a90fpNh4SBvPxBChgXrYX2Lr9ug2vYD6hTATwbj/NHx00rJ34mgQubQU7e/OgINIU5RPw12xV7js1pmzK1qZNnl72iEx8xh3fRI0CF0r8qMvNKxyZS6C39YuiLXBRxNm0x/jS+17EgTZyrk+qMq9etkI7xKqawGh7SmPd6IAlt4cYj0zPvBNPCXVx5mcQMBkjqKOK9PZ8o3eojoVgSnMv9BqcpIcrEDX2qaxYJbZnEUWqorHlgLKSzao6uc77oECOHNfKO+fVNq3lDuFIxc1e/rS5fLbCdT1oYHi1dntBI6qcXuXx+avibRjs96iw+TmGTAufQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qqE2oKM3; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qqE2oKM3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csXTy5q20z304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 15:04:22 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MLMA9j031196;
	Thu, 23 Oct 2025 04:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kNqq/b
	IE1J52ZfD77A5OJ4HQCqtofGAaXPUWDYZC3HM=; b=qqE2oKM3aYqpoV+9NG+S6r
	KRpqEqw/PF95ZD4lYALCAOlE8OyOOEVdZhrX1OQ8/YnryBUwZ1UvVtRUSVdZt9nx
	Fl5Nx/IEoZYjyWJ3MIZDwqiqkTESTc4la+QiBWh6DIVXCjhFST3ErQG0Ke8q56B9
	4VxZFgMZ93oES9VDKfaj1SzTHEUNiCVboesynAaaeX7R3chtCDWuzPMwAZbt0IpD
	QzOZJ8ygrbRtUrxK1dkEyjKgjjwIu905ZHS94lm/8peNQryWG4UGMDpngchIbrSh
	DGWyf4KpBI+Wxe16LSyFUn/iNlYDLwZYlSgxg9LAzAgkGi1Lnt4oWcnxVvXTNahQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v327069s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 04:04:09 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59N41SVA015176;
	Thu, 23 Oct 2025 04:04:08 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v327069k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 04:04:08 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59N2aEqQ002281;
	Thu, 23 Oct 2025 04:04:07 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49vqejknn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 04:04:07 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59N443di51839398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Oct 2025 04:04:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B784820043;
	Thu, 23 Oct 2025 04:04:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26A0020040;
	Thu, 23 Oct 2025 04:04:00 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Oct 2025 04:03:59 +0000 (GMT)
Message-ID: <4d2f41ed-4cab-420a-a7ba-f11a45924c9a@linux.ibm.com>
Date: Thu, 23 Oct 2025 09:33:59 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 00/10] paravirt CPUs and push task for less vCPU
 preemption
To: Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org,
        vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, vineeth@bitbyteword.org,
        jgross@suse.com
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <aPZIGCFk-Rnlc1yT@google.com>
 <cfc43786-5a9d-4813-b8ac-a8a55f430f03@redhat.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <cfc43786-5a9d-4813-b8ac-a8a55f430f03@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=EJELElZC c=1 sm=1 tr=0 ts=68f9a939 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Zoj0bJXJtDvkO92F0TYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX31ySbOXlWtrv
 36HjYPNht7QqJ8cVglDFimrajnMGXUo0ccUOu+Em+zLwxF00WDYiiHKYGsdSsnwGg8EKSYZSAPB
 XKc4zv+43LYRM/q30xU2gt4mHm0JOAD44az/GH3EY/DfQ8bu4I5ehILFxMG7IiRBB4b7w0bljOH
 imIKsaCJ7ztVX5BsQiHmieFXkVaJkoEJKebGFEyyr8p6CPGc3nhYoADKAb92AyD3xSnjH1DIVW/
 dNZ6+1zRtXnrzdRaaq1mIAO0N1237aqLmbOPXgQvA7RQeJ0LvDYSBjPHL1QU9ldJTLstIm6ItRC
 paubwmdw/5J2HDegcVg6EV2a80JUEiDL/01jtj5oCAay7lnejvVeGYAsD4dBtyls02PQkU2pe2h
 T2EX2nW/powb4VbwOZT/Nd+vhQdsGQ==
X-Proofpoint-GUID: 7AYUV3o335U8A7KKkJkO2g6VjFIco6ML
X-Proofpoint-ORIG-GUID: LzGoaR3-um5SC2JWdi-dBlo3OVIsc2-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Hi Paolo. Thanks for looking into this series.

On 10/20/25 8:35 PM, Paolo Bonzini wrote:
> On 10/20/25 16:32, Sean Christopherson wrote:
>>   : Till the hint from underlying hypervisor arrives, another idea is to
>>   : approximate the hint from steal time.
> 
> I think this is the first thing to look at.
>

The current code i have does the below: All of this happens in the Guest.
No change in host. (Host is running PowerVM, a non linux hypervisor)

At every 1second (configurable):
1. Low and High steal time thresholds are defined.(configurable)
2. Gathers steam time from all CPUs.
3. If it higher than the High threshold reduce the core(SMT8) usage by 1
4. If it lower than low threshould increase core usage by 1.
5. Avoid ping-pong as much as possible.

Its an initial code to try out if it works with plumbing the push current task framework
given in the series.

  
> Perhaps single_task_running() can be exposed in the x86 steal time data 
> structure, and in fact even in the rseq data for non-VM usecases?  This 
> is not specific to VMs and I'd like the steal time implementation to 
> follow the footsteps of rseq rather than the opposite.
> 
> Paolo
> 

Sorry, I didn't follow. You mean KVM usecases?

I don't know much about rseq(on todo list). Any specific implementation i could
look at done via rseq that you are talking about?


