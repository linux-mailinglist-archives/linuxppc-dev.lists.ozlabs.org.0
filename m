Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D54FC23E78A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 09:07:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNGd52GL3zDqvP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 17:07:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jEBvrmHk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNGbD68BhzDq9j
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 17:05:28 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07773A3p073797; Fri, 7 Aug 2020 03:05:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=ILYpS8OUNEVYcrf5G2iIfHUMUQpveWXgvjknEXLgCak=;
 b=jEBvrmHkyH7yNK7DnFJrT/tAEv+MQWNcKlVyZCAnC6fEP5zPi0AMEWQLmml/eM9GhYV7
 MQRqn+8prIip7g3+bXjN1lyyhC5OKqXuONp7iyAV/JFs10w69WllP/G0iYxsAuEYg8Ez
 x/UrE61vg0gBM9+NZb4ZmAEsP0q83nxWraSwDIpFQOuMGDWCFyrt+C0nZ4WJn4Z6XmAv
 ++8gsg3/huqEWyd1co4XybFmXgrNelS3I4XodGLhjUyzLpQHpAorpXXwwH1sLkp/2i1M
 FzLudOIfe5IGL7Vnjfuquf1pUA4u5hqyC1e0d1UoUdKO8veDgmyUEGjxCZYEu+CDHMMG oA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32rgnfww01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 03:05:13 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 077701TC016519;
 Fri, 7 Aug 2020 07:05:12 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 32n01a425e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Aug 2020 07:05:12 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 077758Ig51773790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Aug 2020 07:05:08 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB5CC6E059;
 Fri,  7 Aug 2020 07:05:10 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FD316E058;
 Fri,  7 Aug 2020 07:05:10 +0000 (GMT)
Received: from localhost (unknown [9.65.243.213])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Aug 2020 07:05:09 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: increase wait time for vCPU
 death
In-Reply-To: <87zh79yen7.fsf@mpe.ellerman.id.au>
References: <20200804032937.7235-1-mdroth@linux.vnet.ibm.com>
 <873652zg8h.fsf@mpe.ellerman.id.au> <20200804161609.6cb2cb71@bahia.lan>
 <87zh79yen7.fsf@mpe.ellerman.id.au>
Date: Fri, 07 Aug 2020 02:05:09 -0500
Message-ID: <87mu37ylzu.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-07_02:2020-08-06,
 2020-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 suspectscore=1 clxscore=1011 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008070051
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
Cc: Greg Kurz <groug@kaod.org>, linuxppc-dev@lists.ozlabs.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi everyone,

Michael Ellerman <mpe@ellerman.id.au> writes:
> Greg Kurz <groug@kaod.org> writes:
>> On Tue, 04 Aug 2020 23:35:10 +1000
>> Michael Ellerman <mpe@ellerman.id.au> wrote:
>>> Spinning forever seems like a bad idea, but as has been demonstrated at
>>> least twice now, continuing when we don't know the state of the other
>>> CPU can lead to straight up crashes.
>>> 
>>> So I think I'm persuaded that it's preferable to have the kernel stuck
>>> spinning rather than oopsing.
>>> 
>>
>> +1
>>
>>> I'm 50/50 on whether we should have a cond_resched() in the loop. My
>>> first instinct is no, if we're stuck here for 20s a stack trace would be
>>> good. But then we will probably hit that on some big and/or heavily
>>> loaded machine.
>>> 
>>> So possibly we should call cond_resched() but have some custom logic in
>>> the loop to print a warning if we are stuck for more than some
>>> sufficiently long amount of time.
>>
>> How long should that be ?
>
> Yeah good question.
>
> I guess step one would be seeing how long it can take on the 384 vcpu
> machine. And we can probably test on some other big machines.
>
> Hopefully Nathan can give us some idea of how long he's seen it take on
> large systems? I know he was concerned about the 20s timeout of the
> softlockup detector.

Maybe I'm not quite clear what this is referring to, but I don't think
stop-self/query-stopped-state latency increases with processor count, at
least not on PowerVM. And IIRC I was concerned with the earlier patch's
potential for causing the softlockup watchdog to rightly complain by
polling the stopped state without ever scheduling away.

The fact that smp_query_cpu_stopped() kind of collapses the two distinct
results from the query-cpu-stopped-state RTAS call into one return value
may make it harder than necessary to reason about the questions around
cond_resched() and whether to warn.

Sorry to pull this stunt but I have had some code sitting in a neglected
branch that I think gets the logic around this right.

What we should have is a simple C wrapper for the RTAS call that reflects the
architected inputs and outputs:

================================================================
(-- rtas.c --)

/**
 * rtas_query_cpu_stopped_state() - Call RTAS query-cpu-stopped-state.
 * @hwcpu: Identifies the processor thread to be queried.
 * @status: Pointer to status, valid only on success.
 *
 * Determine whether the given processor thread is in the stopped
 * state.  If successful and @status is non-NULL, the thread's status
 * is stored to @status.
 *
 * Return:
 * * 0   - Success
 * * -1  - Hardware error
 * * -2  - Busy, try again later
 */
int rtas_query_cpu_stopped_state(unsigned int hwcpu, unsigned int *status)
{
       unsigned int cpu_status;
       int token;
       int fwrc;

       token = rtas_token("query-cpu-stopped-state");

       fwrc = rtas_call(token, 1, 2, &cpu_status, hwcpu);
       if (fwrc != 0)
               goto out;

       if (status != NULL)
               *status = cpu_status;
out:
       return fwrc;
}
================================================================


And then a utility function that waits for the remote thread to enter
stopped state, with higher-level logic for rescheduling and warning. The
fact that smp_query_cpu_stopped() currently does not handle a -2/busy
status is a bug, fixed below by using rtas_busy_delay(). Note the
justification for the explicit cond_resched() in the outer loop:

================================================================
(-- rtas.h --)

/* query-cpu-stopped-state CPU_status */
#define RTAS_QCSS_STATUS_STOPPED     0
#define RTAS_QCSS_STATUS_IN_PROGRESS 1
#define RTAS_QCSS_STATUS_NOT_STOPPED 2

(-- pseries/hotplug-cpu.c --)

/**
 * wait_for_cpu_stopped() - Wait for a cpu to enter RTAS stopped state.
 */
static void wait_for_cpu_stopped(unsigned int cpu)
{
       unsigned int status;
       unsigned int hwcpu;

       hwcpu = get_hard_smp_processor_id(cpu);

       do {
               int fwrc;

               /*
                * rtas_busy_delay() will yield only if RTAS returns a
                * busy status. Since query-cpu-stopped-state can
                * yield RTAS_QCSS_STATUS_IN_PROGRESS or
                * RTAS_QCSS_STATUS_NOT_STOPPED for an unbounded
                * period before the target thread stops, we must take
                * care to explicitly reschedule while polling.
                */
               cond_resched();

               do {
                       fwrc = rtas_query_cpu_stopped_state(hwcpu, &status);
               } while (rtas_busy_delay(fwrc));

               if (fwrc == 0)
                       continue;

               pr_err_ratelimited("query-cpu-stopped-state for "
                                  "thread 0x%x returned %d\n",
                                  hwcpu, fwrc);
               goto out;

       } while (status == RTAS_QCSS_STATUS_NOT_STOPPED ||
                status == RTAS_QCSS_STATUS_IN_PROGRESS);

       if (status != RTAS_QCSS_STATUS_STOPPED) {
               pr_err_ratelimited("query-cpu-stopped-state yielded unknown "
                                  "status %d for thread 0x%x\n",
                                  status, hwcpu);
       }
out:
       return;
}

[...]

static void pseries_cpu_die(unsigned int cpu)
{
       wait_for_cpu_stopped(cpu);
       paca_ptrs[cpu]->cpu_start = 0;
}
================================================================

wait_for_cpu_stopped() should be able to accommodate a time-based
warning if necessary, but speaking as a likely recipient of any bug
reports that would arise here, I'm not convinced of the need and I
don't know what a good value would be. It's relatively easy to sample
the stack of a task that's apparently failing to make progress, plus I
probably would use 'perf probe' or similar to report the inputs and
outputs for the RTAS call.

I'm happy to make this a proper submission after I can clean it up and
retest it, or Michael R. is welcome to appropriate it, assuming it's
acceptable.

