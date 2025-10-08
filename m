Return-Path: <linuxppc-dev+bounces-12710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B4CBC446C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 12:17:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chTTT5fZtz3cZR;
	Wed,  8 Oct 2025 21:17:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759918653;
	cv=none; b=TMzHdc3tz6zEzRDDFrEsvapupg5CBpgmMq2TV24ld9t+MIGXPxbLTIpJHDHuHOoA2BgwBDhOuzdNjLHoyUG0Y50BGy2RtCYKfI7KOi9l26/rn3A6phYF1XlvWnkhYerWks+F7BetfQ4pYYbSSnoZxVAKN+ZSsjWsV/kqm66cBZLMW/niYPhSl36lby7jVuUAuABYkTZZki8tNno5eiszvo/oDB9RNvgCHRkUUTgagwwG2UJMpGiNvX/pN5G/Vcffd+k/hQnWUjtmR9xHWbtA9S7v1T7fM2WblrQ3qgvEk9Grg495d/hLQRV/OHdcIhYUMTGldjgzqfQLB/qVjeNpSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759918653; c=relaxed/relaxed;
	bh=9M11XR2j1oLdHVKEIuGyfsDcvUxWmkKGtmwLgxcGaro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FL4i/8C6PXwySgaRQifBY4oAZic7+tkcuE8yA+BE9NcoeY/1M3QsjmwBqhmlNRNRy22bQFOBtS+Fv5IqY/fXel1tojJmuM7u7BEaKTDsOuSpvsylP0XOUn+p76sh7r4Y60rU0F3+KZndtk5+n89k/4dfg9kzeHn2CGKFSdofKG4/yq5IiNk3jDWsgURZnUiFwhbto8dny6zaZL2mWreYC/flWkerJUSS0jrzsoUwa4rjmlapQtxeNySYtKYV3eGBLRj9F9oUm+fvwfeaDQhNTx8YV21Llb5WBIQP2wOvADFPppddqbL90sCvbw1veVSrTLll044rluNorI4xdlxxLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N8Lu5ijX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N8Lu5ijX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chTTS6Nc2z2xK5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 21:17:32 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5989BCUq031517;
	Wed, 8 Oct 2025 10:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9M11XR
	2j1oLdHVKEIuGyfsDcvUxWmkKGtmwLgxcGaro=; b=N8Lu5ijXXOa/N1juqeNIQT
	ZaEBUXfc6YvHVTZSqVdXlQL06x257WoDlhmg/bpI6ST7mVCc3yK8Ej+/CAlzl0Jl
	I7mu6NsL/tNap5Bq3RHdToYEQ/1xTQlUA3sRMEkQCd2tF76/JOgfECUSDGJhwB70
	1e++Qbj9ixgwIwz73VIwwJBvbw8OR5XPPLn7OZGuk5K9iuH+KWxtufYbUwhPRFB6
	erMXsBFdICbM/WchCN4URsEJ21pyVyHBjSsd+bWKHuxKLf5J4eFPVyNTQTbH9/E6
	Qs/f5UEflGJA/zPWGIxAYckkmRDVhB30nM/bLjcUgN6PdVpq3pqjAhlqrLeY187g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49ju8aumwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 10:17:24 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5989jNKm031698;
	Wed, 8 Oct 2025 10:17:24 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49ju8aumwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 10:17:24 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5988ZwlQ019616;
	Wed, 8 Oct 2025 10:17:23 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 49kdwsg480-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 10:17:23 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 598AHJfM48955668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Oct 2025 10:17:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 180AA20071;
	Wed,  8 Oct 2025 10:17:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53DD520072;
	Wed,  8 Oct 2025 10:17:17 +0000 (GMT)
Received: from [9.124.216.74] (unknown [9.124.216.74])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Oct 2025 10:17:17 +0000 (GMT)
Message-ID: <5a248390-ddaa-4127-a58a-794d0d70461a@linux.ibm.com>
Date: Wed, 8 Oct 2025 15:47:16 +0530
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
Subject: Re: [bisected][mainline]Kernel warnings at
 kernel/sched/cpudeadline.c:219
To: Peter Zijlstra <peterz@infradead.org>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, jstultz@google.com,
        stultz@google.com
References: <8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com>
 <20251008095039.GG3245006@noisy.programming.kicks-ass.net>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20251008095039.GG3245006@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JKy9HI3OIwfwCqwGCsc9hy9eDGS1yCz2
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=68e63a34 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=C-qSTpEYKFkgWNEV-BgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMiBTYWx0ZWRfX93Ilcyr4j9S6
 HRKLYlHhMxO8bQvbiwyXMZRi3Z+l1ZBJhYkFbGyLzd3NJDaOTty1cTSAyhQ1dcU19mSv3QMrAb3
 bnfnOvvyoxtWAaIwDo2Wb8nKwpaPOVCijQSlPkxpGZrn8UBbhcunuP2lfRH+/Belnmz0DZ4bGzm
 ks4ypMF6A4pbUITwzRzN0i1DCtvl2okyfcPeValkx6yzaKZ4uzbuTsUrP9hLfiZ7kB2ep34HAZp
 RMGElI50DHsTBLmjC+atRvvnPRRqUzOZY8fJ1u2ym459cicZAUpHijp3DCDi6pMOLHN0z8JKZO4
 8Txns1agTNljjynwtO3w8/XarKUtKW+0FWOzK2Taj41KLZJdhLgJKPZd2hdnvqWz4vOJ1x1gplL
 1J7Dc4xe53JBsjUYiQeqwd5VpcShqA==
X-Proofpoint-ORIG-GUID: IugG6FWmo057Mko0fdAZ9dogxA0KNllW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/8/25 3:20 PM, Peter Zijlstra wrote:
> On Wed, Oct 08, 2025 at 07:41:10AM +0530, Venkat Rao Bagalkote wrote:
>> Greetings!!!
>>
>>
>> IBM CI has reported a kernel warnings while running CPU hot plug operation
>> on IBM Power9 system.
>>
>>
>> Command to reproduce the issue:
>>
>> drmgr -c cpu -r -q 1
>>
>>
>> Git Bisect is pointing to below commit as the first bad commit.
> 
> Does something like this help?
> 
> (also, for future reference, please don't line wrap logs, it makes them
> very hard to read)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 198d2dd45f59..65f37bfcd661 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8328,6 +8328,7 @@ static inline void sched_set_rq_offline(struct rq *rq, int cpu)
>   		BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
>   		set_rq_offline(rq);
>   	}
> +	dl_server_stop(&rq->fair_server);
>   	rq_unlock_irqrestore(rq, &rf);
>   }
>  


Hi Peter. Thanks for looking into it.

I was able to repro this issue on my system. This above diff didn't help. I still see the warning.

I have to understand this dl server stuff still.
So not sure if my understanding is completely correct.

Looks like the hrtimer is firing after the cpu was removed. The warn on hit only with
drmgr. Regular hotplug with chcpu doesn;t hit. That's because drmgr changes the cpu_present mask.
and warning is hit with it.

maybe during drmgr, the dl server gets started again? Maybe that's why above patch it didn't work.
Will see and understand this bit more.

Also, i tried this below diff which fixes it. Just ignore the hrtimer if the cpu is offline.
Does this makes sense?
---

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 615411a0a881..a342cf5e4624 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1160,6 +1160,9 @@ static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_
  	scoped_guard (rq_lock, rq) {
  		struct rq_flags *rf = &scope.rf;
  
+		if (!cpu_online(rq->cpu))
+			return HRTIMER_NORESTART;
+
  		if (!dl_se->dl_throttled || !dl_se->dl_runtime)
  			return HRTIMER_NORESTART;




