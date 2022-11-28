Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF8D63B61A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 00:45:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLht41J0kz3cKr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 10:45:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H5jSgmF7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H5jSgmF7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLhs44v5cz3cBD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 10:44:39 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASMt5tF024234
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 23:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=HxKH3BfmiNh3OGhef6bPYnkhY6/ZTYwNJGGEuK6MP9I=;
 b=H5jSgmF70IWKOROfjgxPvdmOFUHTAkUP8VFbi46zQvv9UN35KE8Cl2wHQDgJgUtRGcbD
 7LucOBBiOS+5w/ZoDizCRECgs5P64SAeLG9+0a58JzZnz5VPKS3HUl09iUzmVgyGC/5g
 fUGngjQeU1KgQ/hXaOU3zIF80OEp1WyN3ky/oifigP9JRa3EDNZ11NWeE9OiSYo4gzNg
 i+xalgBHtTojAd4sjtU0vreo2pmQXfGaB02cjzSLrri68ROZiHnL3Mcmt9xYiSvZyKl0
 De+1chPOa9s2R7yCUF0/AA93aht8o0jSiKRPACWb1uxwwP/y3Wn1l5NxeuPz/XQTjK8P ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5671gx76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 23:44:37 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ASNUQaL012829
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 23:44:36 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5671gx70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 23:44:36 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ASNZnKc027588;
	Mon, 28 Nov 2022 23:44:36 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma03dal.us.ibm.com with ESMTP id 3m3ae9ctjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 23:44:36 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ASNiYZK1114872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 23:44:34 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2459D58045;
	Mon, 28 Nov 2022 23:44:34 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDDDB58050;
	Mon, 28 Nov 2022 23:44:33 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 23:44:33 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 13/13] powerpc/rtas: place tracepoints in do_enter_rtas()
In-Reply-To: <CONLJ0VXR77H.JM4D75GQAF62@bobo>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-14-nathanl@linux.ibm.com>
 <CONLJ0VXR77H.JM4D75GQAF62@bobo>
Date: Mon, 28 Nov 2022 17:44:33 -0600
Message-ID: <87tu2i8x0e.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f25eNuxxwIJD_hRr_EsLCeLaDI98za9f
X-Proofpoint-ORIG-GUID: wgjbaes2FL6KG03OUty7-9BHKTdhvlpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_17,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 mlxlogscore=558 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211280169
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

"Nicholas Piggin" <npiggin@gmail.com> writes:

> On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
>> Call the just-added rtas tracepoints in do_enter_rtas(), taking care
>> to avoid function name lookups in the CPU offline path.
>>
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> ---
>>  arch/powerpc/kernel/rtas.c | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index 198366d641d0..3487b42cfbf7 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -38,6 +38,7 @@
>>  #include <asm/page.h>
>>  #include <asm/rtas.h>
>>  #include <asm/time.h>
>> +#include <asm/trace.h>
>>  #include <asm/udbg.h>
>>  
>>  enum rtas_function_flags {
>> @@ -525,6 +526,7 @@ void enter_rtas(unsigned long);
>>  static void do_enter_rtas(struct rtas_args *args)
>>  {
>>  	unsigned long msr;
>> +	const char *name = NULL;
>>  
>>  	/*
>>  	 * Make sure MSR[RI] is currently enabled as it will be forced later
>> @@ -537,9 +539,30 @@ static void do_enter_rtas(struct rtas_args *args)
>>  
>>  	hard_irq_disable(); /* Ensure MSR[EE] is disabled on PPC64 */
>>  
>> +	if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
>> +		/*
>> +		 * rtas_token_to_function() uses xarray which uses RCU,
>> +		 * but this code can run in the CPU offline path
>> +		 * (e.g. stop-self), after it's become invalid to call
>> +		 * RCU APIs.
>> +		 */
>
> We can call this in real-mode via pseries_machine_check_realmode
> -> fwnmi_release_errinfo, so tracing should be disabled for that
> case too... Does this_cpu_set_ftrace_enabled(0) in the early
> machine check handler cover that sufficiently?

I suspect so, but I'd like to verify. Do you know how I could exercise
this path in qemu or LPAR?
