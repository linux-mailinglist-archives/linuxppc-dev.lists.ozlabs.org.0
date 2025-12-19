Return-Path: <linuxppc-dev+bounces-14897-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A74FECCF3E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 10:59:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXjg716LCz2yFb;
	Fri, 19 Dec 2025 20:59:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766138355;
	cv=none; b=A2rPsWsIdETGYZjG0wYiWTZiz/rMocQDw0EdQK5jXfx72Hj3p7hizUh1AvFpbkALhBuZhvF7/+6U+wsKAa1EOT1RU6l3SvzZ4z/yrjT3vLext5VGCg59lABQdBzBSEBzVWsszkML1cmTDxhI4cW64jUL1HmJzc8FQSrpk5G8GA1XlZXMt6XPBi3aiC+PG6xm0iOjy5j21I5Yb7n5R0QrtPrQLIxLum7Aijnw21cwypWGYKr7JWuveu8v0r9pFG19+3A8ktK70TzkWiRuzAUKNnt+bLS2+6CNZAe8UQCT4B8Lp5QIhhVQeg31bPlqu1nTE/PBhN405IFNZKUten3QMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766138355; c=relaxed/relaxed;
	bh=HjXwjEYyLAjERmT/P3jZFWsenxE3WpbszS0wG9QRvnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cz7f1Ab6eFOk90QOg+qlQQYGtMTWNaD9LHGGU8oCp06THwH4L4nFpxLb7m3ZE4yYu5kcs9xMdg+Kq5ANUn9geJYsOs2lqwOxyk6TLoFvjBEL2UrMqUzEPM3QuWLum0N7SXYLRXPrQK4iIUW31L05nYrn0D70aT0Sa/F2MQfw9hTeU284BKwIR7vZpXUvJNtyY/3VOvOWNIWaQmrGYAnf0vQ3GgCMm/UbdrBvlxWMs2lhbYZg9ZwHbW+cMJYYxwYHPtNy5uIZcqxsGs92cCvAdLstipySssL88RijHdLLomOPZcTFpitrIiB6VTulVPitGkFsSys4Y7pRd1rImc1fhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pz8NNeo6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pz8NNeo6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXjg60WnHz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 20:59:13 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJ95cJf031413;
	Fri, 19 Dec 2025 09:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HjXwjE
	YyLAjERmT/P3jZFWsenxE3WpbszS0wG9QRvnM=; b=pz8NNeo64Ogk6Ctyp94Oit
	TF20GcgiK6f/m5IjTgrVRtIQQsaD+njb1SubwvESdjzSwWn3Kfq6HB7rG0oUVTn+
	Ia8Wy/gBx6DJq+PPY44zKCczF0AikLzOrxhtEB5SpDb/AZ8mQPtuL52qw4ZBXhNZ
	sngd3DssxKGy31FtEknPmGSbtTVg880gxnk/pLO0Lc/ZTy6Ub6b1m7cVb+JvwJWQ
	b816QEX44B8yZ9j+sahUQdo9ox+AFYoZngH0oq6rlvw2h2csauiaQ5tlOKvr0/VQ
	ffr9wAouzwxCPWbf51II/pjlDenqmUSDrzjr8R8bTs3Irkw0OePFqSH89ItAOdqw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b4r3djsgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 09:58:59 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BJ9sIAq022147;
	Fri, 19 Dec 2025 09:58:58 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b4r3djsg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 09:58:58 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJ7iomG001277;
	Fri, 19 Dec 2025 09:58:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b4qvpk2fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 09:58:57 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BJ9wrAu28836522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Dec 2025 09:58:54 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3B3D2004F;
	Fri, 19 Dec 2025 09:58:53 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DFC020043;
	Fri, 19 Dec 2025 09:58:51 +0000 (GMT)
Received: from [9.124.209.192] (unknown [9.124.209.192])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 Dec 2025 09:58:51 +0000 (GMT)
Message-ID: <857996ed-f60a-419d-8292-93b3494db2ff@linux.ibm.com>
Date: Fri, 19 Dec 2025 15:28:49 +0530
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
Subject: Re: [PATCH v2] powerpc/kexec: Enable SMT before waking offline CPUs
To: "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Srikar Dronamraju <srikar@linux.ibm.com>,
        Sachin P Bappalige <sachinpb@linux.ibm.com>, stable@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Thomas Gleixner
 <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20251025080512.85690-1-nysal@linux.ibm.com>
 <20251028105516.26258-1-nysal@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20251028105516.26258-1-nysal@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 56bbVSljGG6tCNGybMMSg0HuxkEQpcUZ
X-Proofpoint-GUID: eFUgXrAxSkpzqPITDHZlqvcfCgYNpTJP
X-Authority-Analysis: v=2.4 cv=KrZAGGWN c=1 sm=1 tr=0 ts=694521e3 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=OpFFV_YLwuV3j5NzMVYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MCBTYWx0ZWRfX89RwAcVjNWnF
 swYDiMbtWJ6NNGPFb4gCQ9KwCzszVXcxQ6J2YT06SkK0vzbRW24mXMPBwUNt0Ib32tm1pWhUzTJ
 aHv3A74iyv5zs7pioX2zsvctEIqZtxIj3fG5PHuP0am6i6TnddegwvI/Fcf/5x2jJOJfoWHe09j
 tPlw5EbGvy32eI73ItO7Lp9fgPRlNjuPZrnUMds7zQv6ZSlhoQPl76ir/KQ3fDFUIWZADYoup/v
 1DO/7Gaigvg9Et7L59r9wdgKAN4pRWjYhIqNK9/gjLBZkVRPMWvwUkq3PijKEdJUlbbZTQ+3O7O
 wlOBYvBKAjAep6rXQpMldJPMgwzFiAZ848TZPQU3WfdJji+8/6H8begk1VEb65/k8LWxJJq+C3H
 K8hswym0Gs9uR9WyErLxqJiaSFYguElHWsj6UEFrdreIgOHyjvM9udeJi2hDqJjK0qzcY843Us2
 M+SPzRpVn1yDN64A+KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512190080
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 28/10/25 16:25, Nysal Jan K.A. wrote:
> If SMT is disabled or a partial SMT state is enabled, when a new kernel
> image is loaded for kexec, on reboot the following warning is observed:
>
> kexec: Waking offline cpu 228.
> WARNING: CPU: 0 PID: 9062 at arch/powerpc/kexec/core_64.c:223 kexec_prepare_cpus+0x1b0/0x1bc
> [snip]
>   NIP kexec_prepare_cpus+0x1b0/0x1bc
>   LR  kexec_prepare_cpus+0x1a0/0x1bc
>   Call Trace:
>    kexec_prepare_cpus+0x1a0/0x1bc (unreliable)
>    default_machine_kexec+0x160/0x19c
>    machine_kexec+0x80/0x88
>    kernel_kexec+0xd0/0x118
>    __do_sys_reboot+0x210/0x2c4
>    system_call_exception+0x124/0x320
>    system_call_vectored_common+0x15c/0x2ec
>
> This occurs as add_cpu() fails due to cpu_bootable() returning false for
> CPUs that fail the cpu_smt_thread_allowed() check or non primary
> threads if SMT is disabled.
>
> Fix the issue by enabling SMT and resetting the number of SMT threads to
> the number of threads per core, before attempting to wake up all present
> CPUs.
>
> Fixes: 38253464bc82 ("cpu/SMT: Create topology_smt_thread_allowed()")
> Reported-by: Sachin P Bappalige <sachinpb@linux.ibm.com>
> Cc: stable@vger.kernel.org # v6.6+
> Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
> Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
> ---
>   arch/powerpc/kexec/core_64.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 222aa326dace..825ab8a88f18 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -202,6 +202,23 @@ static void kexec_prepare_cpus_wait(int wait_state)
>   	mb();
>   }
>   
> +
> +/*
> + * The add_cpu() call in wake_offline_cpus() can fail as cpu_bootable()
> + * returns false for CPUs that fail the cpu_smt_thread_allowed() check
> + * or non primary threads if SMT is disabled. Re-enable SMT and set the
> + * number of SMT threads to threads per core.
> + */
> +static void kexec_smt_reenable(void)
> +{
> +#if defined(CONFIG_SMP) && defined(CONFIG_HOTPLUG_SMT)
> +	lock_device_hotplug();
> +	cpu_smt_num_threads = threads_per_core;
> +	cpu_smt_control = CPU_SMT_ENABLED;
> +	unlock_device_hotplug();
> +#endif
> +}
> +
>   /*
>    * We need to make sure each present CPU is online.  The next kernel will scan
>    * the device tree and assume primary threads are online and query secondary
> @@ -216,6 +233,8 @@ static void wake_offline_cpus(void)
>   {
>   	int cpu = 0;
>   
> +	kexec_smt_reenable();
> +
>   	for_each_present_cpu(cpu) {
>   		if (!cpu_online(cpu)) {
>   			printk(KERN_INFO "kexec: Waking offline cpu %d.\n",

The fix looks good to me. I also tested it with QEMU using different
SMT values with the kexec_load and kexec_file_load system calls, and no
warnings were observed during kexec.

Feel free to add:
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>

