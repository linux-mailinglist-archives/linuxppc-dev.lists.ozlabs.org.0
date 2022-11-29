Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC0163C935
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 21:26:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMDPP1Gkwz3bX0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 07:26:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DugerKvZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DugerKvZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMDNP2wcfz30RH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 07:25:08 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATJBr4Q003828;
	Tue, 29 Nov 2022 20:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=ELKfZcQKST1hX1cZ2BkkTiTSslhlKaDdsRGP+5ItdYQ=;
 b=DugerKvZcQbiYTvllowK2UolOuTV1kGI/N1fh0E9GJv2GA6yUEcMxiP80AVDR3XICuWE
 h6bvmhNgb/uH35xIEWcjnnQa4JaDVPC3LZRg/ljYY2IzRobWmYWjOU4z87lEDyQSBNd4
 qob9G36KvVu8rPpgp446Z77o+IWZMHiBAB6lZCGEu2pv5GEPVCkaF/mHwBCD8J7HNTch
 lhL/PwiRO8IbMmUo31oYqnEQfZpjK4Ti50qTclVVauXzKP8VfmUH/AcYRBQ7MhK26Xa2
 +z9MQgd4yM3CtjTVHjdBZZeFevRT75xszlcxK/4QtHcj9XoiE0viYZttZDSbwV+EZsM7 rA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5r179nfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 20:25:00 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ATKNXRT021920;
	Tue, 29 Nov 2022 20:24:59 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5r179nfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 20:24:59 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATKLRLS025683;
	Tue, 29 Nov 2022 20:24:58 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma03wdc.us.ibm.com with ESMTP id 3m3ae9fakb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 20:24:58 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ATKOvAY46924420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 20:24:57 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32B7A5805D;
	Tue, 29 Nov 2022 20:24:57 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15CFF58052;
	Tue, 29 Nov 2022 20:24:57 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2022 20:24:57 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 13/13] powerpc/rtas: place tracepoints in do_enter_rtas()
In-Reply-To: <87mt8abn4f.fsf@mpe.ellerman.id.au>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-14-nathanl@linux.ibm.com>
 <CONLJ0VXR77H.JM4D75GQAF62@bobo> <87tu2i8x0e.fsf@linux.ibm.com>
 <87mt8abn4f.fsf@mpe.ellerman.id.au>
Date: Tue, 29 Nov 2022 14:24:56 -0600
Message-ID: <87ilix8q5j.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TTuXNK85HzMVv5hcp-yNQ-eHBOmW_rev
X-Proofpoint-GUID: kjop11HO8O1eqXHFB4lqWvbz7anZGjlx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_11,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxlogscore=847 bulkscore=0 impostorscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290116
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> "Nicholas Piggin" <npiggin@gmail.com> writes:
>>> On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
>>>> Call the just-added rtas tracepoints in do_enter_rtas(), taking care
>>>> to avoid function name lookups in the CPU offline path.
>>>>
>>>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>>>> ---
>>>>  arch/powerpc/kernel/rtas.c | 23 +++++++++++++++++++++++
>>>>  1 file changed, 23 insertions(+)
>>>>
>>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>>> index 198366d641d0..3487b42cfbf7 100644
>>>> --- a/arch/powerpc/kernel/rtas.c
>>>> +++ b/arch/powerpc/kernel/rtas.c
>>>> @@ -38,6 +38,7 @@
>>>>  #include <asm/page.h>
>>>>  #include <asm/rtas.h>
>>>>  #include <asm/time.h>
>>>> +#include <asm/trace.h>
>>>>  #include <asm/udbg.h>
>>>>  
>>>>  enum rtas_function_flags {
>>>> @@ -525,6 +526,7 @@ void enter_rtas(unsigned long);
>>>>  static void do_enter_rtas(struct rtas_args *args)
>>>>  {
>>>>  	unsigned long msr;
>>>> +	const char *name = NULL;
>>>>  
>>>>  	/*
>>>>  	 * Make sure MSR[RI] is currently enabled as it will be forced later
>>>> @@ -537,9 +539,30 @@ static void do_enter_rtas(struct rtas_args *args)
>>>>  
>>>>  	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
>>>>  
>>>> +	if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
>>>> +		/*
>>>> +		 * rtas_token_to_function() uses xarray which uses RCU,
>>>> +		 * but this code can run in the CPU offline path
>>>> +		 * (e.g. stop-self), after it's become invalid to call
>>>> +		 * RCU APIs.
>>>> +		 */
>>>
>>> We can call this in real-mode via pseries_machine_check_realmode
>>> -> fwnmi_release_errinfo, so tracing should be disabled for that
>>> case too... Does this_cpu_set_ftrace_enabled(0) in the early
>>> machine check handler cover that sufficiently?
>>
>> I suspect so, but I'd like to verify. Do you know how I could exercise
>> this path in qemu or LPAR?
>
> On a P9 or P10 LPAR you should be able to use tools/testing/selftests/powerpc/mce/inject-ra-err

Nice. Looks like I was too optimistic. From a P10 LPAR:

# trace-cmd record -T -e powerpc:rtas_input -- \
  sh -c 'sleep 10; ./inject-ra-err' && trace-cmd report
     kworker/7:1-73    [007]    72.882159: rtas_input:           event-scan arguments: 4294967295 0 80419368 2048
     kworker/7:1-73    [007]    72.882165: kernel_stack:         <stack trace >
=> do_enter_rtas (c000000000045180)
=> rtas_call (c000000000045da8)
=> rtas_event_scan (c000000000049458)
=> process_one_work (c0000000001c7618)
=> worker_thread (c0000000001c7bd8)
=> kthread (c0000000001d6858)
=> ret_from_kernel_thread (c00000000000cf5c)
   inject-ra-err-1080  [001]    78.386947: rtas_input:           ibm,nmi-interlock arguments: 
   inject-ra-err-1080  [001]    78.386950: kernel_stack:         <stack trace >
=> do_enter_rtas (c000000000045180)
=> rtas_call_unlocked (c000000000046ff4)
=> pseries_machine_check_realmode (c0000000000e8db8)
=> machine_check_early (c0000000000400c4)
=> machine_check_early_common (c00000000000836c)

So... that's bad. (right?)

I guess this patch needs something like this?

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 998aab967400..3086b5f6c6fc 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -541,6 +541,7 @@ static void do_enter_rtas(struct rtas_args *args)
 {
        unsigned long msr;
        const char *name = NULL;
+       bool can_trace;
 
        /*
         * Make sure MSR[RI] is currently enabled as it will be forced later
@@ -553,7 +554,9 @@ static void do_enter_rtas(struct rtas_args *args)
 
        hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
 
-       if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
+       can_trace = (msr & MSR_IR) && (msr & MSR_DR);
+
+       if (can_trace && (trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
                /*
                 * rtas_token_to_function() uses xarray which uses RCU,
                 * but this code can run in the CPU offline path
@@ -568,15 +571,19 @@ static void do_enter_rtas(struct rtas_args *args)
                }
        }
 
-       trace_rtas_input(args, name);
-       trace_rtas_ll_entry(args);
+       if (can_trace) {
+               trace_rtas_input(args, name);
+               trace_rtas_ll_entry(args);
+       }
 
        enter_rtas(__pa(args));
 
        srr_regs_clobbered(); /* rtas uses SRRs, invalidate */
 
-       trace_rtas_ll_exit(args);
-       trace_rtas_output(args, name);
+       if (can_trace) {
+               trace_rtas_ll_exit(args);
+               trace_rtas_output(args, name);
+       }
 }
 
 struct rtas_t rtas = {
