Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C938A72E938
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 19:18:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GOpbQ+w3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgZyk4yJ1z30jT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 03:18:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GOpbQ+w3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgZxS46YHz30XV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 03:17:32 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DH9KgO024010;
	Tue, 13 Jun 2023 17:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MuX/s0te/QSTHMjPRIUCcvq4Q6ofXoMYiJTfW+gFUaw=;
 b=GOpbQ+w3nuKmSXPPMhXr5U8p7aK4qUg3X0651b+xC8oU0xIHFKYtaPvzDqfT1ohQpI0c
 lDU+23KKBtC+c4zTWU7JcLVErFqrEanlnwpVtfcpcNQpDvIpURb/eFB0nhhnVUr9PDXG
 4ESztoA/X+O0VO1jlfZ5sCqMNJP8YqTMf3dp1xfdCVCFo/RMHUDdd/bZiXWhwE/qvw90
 eEkTpjduvo3KEs1ePYqP1WF+1roHcXQmst/BW4++3YJBYbgHXF02PdKfKnnB+wCDU1Pa
 7H5oatbkVevtUaPK1VQbnaJKyQZ9hNTmU9icAhApdX9It/hXnz7kci0d1Dzc0YtYSndW sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v94rmx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:17:00 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DHA9eb028079;
	Tue, 13 Jun 2023 17:16:59 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v94rmwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:16:59 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35D8o1hA017849;
	Tue, 13 Jun 2023 17:16:57 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3r4gedsr5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:16:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DHGtkY21037798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 17:16:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20EF120043;
	Tue, 13 Jun 2023 17:16:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B42F2004E;
	Tue, 13 Jun 2023 17:16:54 +0000 (GMT)
Received: from [9.171.1.146] (unknown [9.171.1.146])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 17:16:54 +0000 (GMT)
Message-ID: <d42e9452-8210-a06a-4c91-6c2f1d038a61@linux.ibm.com>
Date: Tue, 13 Jun 2023 19:16:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 3/9] cpu/SMT: Store the current/max number of threads
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>,
        Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <20230524155630.794584-1-mpe@ellerman.id.au>
 <20230524155630.794584-3-mpe@ellerman.id.au> <87fs6z80w5.ffs@tglx>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <87fs6z80w5.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UUQofGuwuSBBIoz8cSy_Gu6pnGgH1Vh-
X-Proofpoint-ORIG-GUID: T86cnNWOeg0f_uTNpCq-hakyXXApSFqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130151
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com, bp@alien8.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/06/2023 23:26:18, Thomas Gleixner wrote:
> On Thu, May 25 2023 at 01:56, Michael Ellerman wrote:
>>  #ifdef CONFIG_HOTPLUG_SMT
>>  enum cpuhp_smt_control cpu_smt_control __read_mostly = CPU_SMT_ENABLED;
>> +static unsigned int cpu_smt_max_threads __ro_after_init;
>> +unsigned int cpu_smt_num_threads;
> 
> Why needs this to be global? cpu_smt_control is pointlessly global already.

I agree that cpu_smt_*_threads should be static.

Howwever, regarding cpu_smt_control, it is used in 2 places in the x86 code:
 - arch/x86/power/hibernate.c in arch_resume_nosmt()
 - arch/x86/kernel/cpu/bugs.c in spectre_v2_user_select_mitigation()

An accessor function may be introduced to read that value in these 2
functions, but I'm wondering if that's really the best option.

Unless there is a real need to change this through this series, I think
cpu_smt_control can remain global.

Thomas, are you ok with that?

> 
>>  void __init cpu_smt_disable(bool force)
>>  {
>> @@ -433,10 +435,18 @@ void __init cpu_smt_disable(bool force)
>>   * The decision whether SMT is supported can only be done after the full
>>   * CPU identification. Called from architecture code.
>>   */
>> -void __init cpu_smt_check_topology(void)
>> +void __init cpu_smt_check_topology(unsigned int num_threads)
>>  {
>>  	if (!topology_smt_supported())
>>  		cpu_smt_control = CPU_SMT_NOT_SUPPORTED;
>> +
>> +	cpu_smt_max_threads = num_threads;
>> +
>> +	// May already be disabled by nosmt command line parameter
>> +	if (cpu_smt_control != CPU_SMT_ENABLED)
>> +		cpu_smt_num_threads = 1;
>> +	else
>> +		cpu_smt_num_threads = num_threads;
> 
> Taking Laurents findings into account this should be something like
> the incomplete below.
> 
> x86 would simply invoke cpu_smt_set_num_threads() with both arguments as
> smp_num_siblings while PPC can funnel its command line parameter through
> the num_threads argument.

I do prefer cpu_smt_set_num_threads() also.

Thanks,
Laurent

> 
> Thanks,
> 
>         tglx
> ---
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -414,6 +414,8 @@ void __weak arch_smt_update(void) { }
>  
>  #ifdef CONFIG_HOTPLUG_SMT
>  enum cpuhp_smt_control cpu_smt_control __read_mostly = CPU_SMT_ENABLED;
> +static unsigned int cpu_smt_max_threads __ro_after_init;
> +static unsigned int cpu_smt_num_threads = UINT_MAX;
>  
>  void __init cpu_smt_disable(bool force)
>  {
> @@ -427,24 +429,31 @@ void __init cpu_smt_disable(bool force)
>  		pr_info("SMT: disabled\n");
>  		cpu_smt_control = CPU_SMT_DISABLED;
>  	}
> +	cpu_smt_num_threads = 1;
>  }
>  
>  /*
>   * The decision whether SMT is supported can only be done after the full
>   * CPU identification. Called from architecture code.
>   */
> -void __init cpu_smt_check_topology(void)
> +void __init cpu_smt_set_num_threads(unsigned int max_threads, unsigned int num_threads)
>  {
> -	if (!topology_smt_supported())
> +	if (max_threads == 1)
>  		cpu_smt_control = CPU_SMT_NOT_SUPPORTED;
> -}
>  
> -static int __init smt_cmdline_disable(char *str)
> -{
> -	cpu_smt_disable(str && !strcmp(str, "force"));
> -	return 0;
> +	cpu_smt_max_threads = max_threads;
> +
> +	/*
> +	 * If SMT has been disabled via the kernel command line or SMT is
> +	 * not supported, set cpu_smt_num_threads to 1 for consistency.
> +	 * If enabled, take the architecture requested number of threads
> +	 * to bring up into account.
> +	 */
> +	if (cpu_smt_control != CPU_SMT_ENABLED)
> +		cpu_smt_num_threads = 1;
> +	else if (num_threads < cpu_smt_num_threads)
> +		cpu_smt_num_threads = num_threads;
>  }
> -early_param("nosmt", smt_cmdline_disable);
>  
>  static inline bool cpu_smt_allowed(unsigned int cpu)
>  {
> @@ -463,6 +472,13 @@ static inline bool cpu_smt_allowed(unsig
>  	return !cpumask_test_cpu(cpu, &cpus_booted_once_mask);
>  }
>  
> +static int __init smt_cmdline_disable(char *str)
> +{
> +	cpu_smt_disable(str && !strcmp(str, "force"));
> +	return 0;
> +}
> +early_param("nosmt", smt_cmdline_disable);
> +
>  /* Returns true if SMT is not supported of forcefully (irreversibly) disabled */
>  bool cpu_smt_possible(void)
>  {

