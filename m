Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAB0152488
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 02:42:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48C47k0MHTzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 12:42:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48C4662DKPzDqHp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2020 12:41:17 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0151coMi027432
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 Feb 2020 20:41:14 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xyhn3m2wv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Feb 2020 20:41:13 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <maddy@linux.ibm.com>;
 Wed, 5 Feb 2020 01:41:11 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 5 Feb 2020 01:41:07 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0151f6gI35651772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Feb 2020 01:41:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89FA542049;
 Wed,  5 Feb 2020 01:41:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81F9A42045;
 Wed,  5 Feb 2020 01:41:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.81.13])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  5 Feb 2020 01:41:00 +0000 (GMT)
Subject: Re: [RFC] per-CPU usage in perf core-book3s
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20200127150620.taio2txyqreg4kn6@linutronix.de>
From: maddy <maddy@linux.ibm.com>
Date: Wed, 5 Feb 2020 07:10:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127150620.taio2txyqreg4kn6@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20020501-0016-0000-0000-000002E3BB4C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20020501-0017-0000-0000-000033469948
Message-Id: <c26f6c2c-980f-c1b2-ff7c-7a5e2a5771cd@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-04_09:2020-02-04,
 2020-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxlogscore=811 impostorscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002050010
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Olsa <jolsa@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/27/20 8:36 PM, Sebastian Andrzej Siewior wrote:
> I've been looking at usage of per-CPU variable cpu_hw_events in
> arch/powerpc/perf/core-book3s.c.
>
> power_pmu_enable() and power_pmu_disable() (pmu::pmu_enable() and
> pmu::pmu_disable()) are accessing the variable and the callbacks are
> invoked always with disabled interrupts.
>
> power_pmu_event_init() (pmu::event_init()) is invoked from preemptible
> context and uses get_cpu_var() to obtain a stable pointer (by disabling
> preemption).
>
> pmu::pmu_enable() and pmu::pmu_disable() can be invoked via a hrtimer
> (perf_mux_hrtimer_handler()) and it invokes pmu::pmu_enable() and
> pmu::pmu_disable() as part of the callback.
>
> Is there anything that prevents the timer callback to interrupt
> pmu::event_init() while it is accessing per-CPU data?

Sorry for the delayed response.

Yes, currently we dont have anything that prevents the timer
callback to interrupt pmu::event_init. Nice catch. Thanks for
pointing this out.

Looking at the code, per-cpu variable access are made to
check for constraints and for Branch Stack (BHRB). So could
wrap this block of  pmu::event_init with local_irq_save/restore.
Will send a patch to fix it.


Maddy

>
> Sebastian

