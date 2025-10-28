Return-Path: <linuxppc-dev+bounces-13446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF77C152CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 15:31:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwt9k6r8rz3ckP;
	Wed, 29 Oct 2025 01:31:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761661914;
	cv=none; b=N5GQHjxSAhXpRBLitUqhK273jTcKVOdPhPN8oY03MVFprVGC0/ABxIYS7R4AGKWLDcfo9W8qs+zG29em0OlS3R+rVrPqDN0MBM8ojIICR6Kq5w/viXHv9HkjMmA1bOXKkn/MOxxY0t5njzlvymCSLcU3T3lCWepHgpL5/nkWV3ajoK56FwQ3sbRIy5U1PGzTaFO+Ue98GqJ72J8IUWxvmyqfhNAz39Cd1lPgWjDXaE3o1r92eooEIXLm2WXbcvuphSQrAR5USF1Po71RRoCeiFkeHMSr+Y+hu+Ircay+9DJXgnjur36jbaCXipZeaLtLZybwUAb6jSFwxIc5HZFiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761661914; c=relaxed/relaxed;
	bh=ucGcR9rOjBIb4XdclIDsHmqAcRNNRWnSM5xXKu7RGrU=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=A0MSnMamK7+U++Ecx5qXqdAVgPNXagktLrkegLg8eqky4zHD89aRl4WrSrBZz6X4xeL1SRSaeJIhUfZwvpwljszN+sf89JRVktZFELk+aLORHspyTUP+1l0bAKC625Rzp0n0qXcTKjqpC+YUQOjwHkPoIEpug3E+2MswS7leCpo7QsrzFEb4Ub3wg0lT3Vqxt8xpyBRhNfUqp4pIwEszDiXj6Qgp8qCkzBj7rSA4QIrsda1YCGLQpR5NqKtzfTw54Nt3LcF47v8lzZkEIbNZJHOqcxo4Z/OZv3JgcpocEUsR+2KSJHkJ9Ca6qYKcit2i1tQfY3n1WRV1FdAQe9c1lQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZSo5uNxu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZSo5uNxu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=samir@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwt9j5fqtz3chZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 01:31:53 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59SCrubO011720;
	Tue, 28 Oct 2025 14:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ucGcR9rOjBIb4XdclIDsHmqAcRNNRW
	nSM5xXKu7RGrU=; b=ZSo5uNxutBlmAd89wYx5UR6B2c1eN1EDjhSFR47keLEko6
	oogIydfD1hBaQtou9JUTSta8M+K7eukVLQPpo7aDZWWPHVLuo5tkAQG1qj0fzuNN
	4PHyvoFE4SxNYpJFzEXvXLgPup62q3CyGqkTUck7pbFA2JD1I/aJCvQ1NZR+v43G
	SeMhNcMlpDaUjBW4vaOPIfcIMAeCc2bfFm62l0/iBNMb2AjUucHehbqZJ6W/dH30
	Go2Un1Ze7lI3smfbA+oFxK80iunPeTQL/ldXqudCnG3A8FcyWrRiqL6xSBRD4P1A
	ZLU/6DiEPk7OirbNLJd+QoFS/18X+RwkspIXzvsw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0mys4j0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 14:31:39 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59SERC2d013530;
	Tue, 28 Oct 2025 14:31:38 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0mys4j0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 14:31:38 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59SBhXkr021635;
	Tue, 28 Oct 2025 14:31:37 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a18vs3d9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 14:31:37 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59SEVZvR17302234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Oct 2025 14:31:36 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97E9D5805E;
	Tue, 28 Oct 2025 14:31:35 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2C6B58059;
	Tue, 28 Oct 2025 14:31:29 +0000 (GMT)
Received: from [9.61.253.27] (unknown [9.61.253.27])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Oct 2025 14:31:29 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------dLuUnlVI0bzbjPQkADLsyzVv"
Message-ID: <c86ce949-fd09-4810-8612-a6163f26fb9d@linux.ibm.com>
Date: Tue, 28 Oct 2025 20:01:27 +0530
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
        Sourabh Jain <sourabhjain@linux.ibm.com>,
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
From: Samir Alamshaha Mulani <samir@linux.ibm.com>
In-Reply-To: <20251028105516.26258-1-nysal@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BMHXwsmjUYqRr2o5l6okFN2ZkzHcC_HX
X-Authority-Analysis: v=2.4 cv=ct2WUl4i c=1 sm=1 tr=0 ts=6900d3cb cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=bjFi6RqZeUFi83XDj6wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nGyChcL-Hsos-sZBGsMA:9 a=X9ioPVpAzRIOd3j1:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAxMCBTYWx0ZWRfX8tBTgmiGN1JF
 0Ic5JW7HzNDSGY309+XFg7PnhEKXrHMXvdNPCOX1Wt7bhUzBBgtR+UHBD6lraktEFwltKmTMfsO
 bADApz+eGtIWmXuGPdLofBzKGQWP3PkpFanZr9akIVTpxmr2rcsrrvb20LDUPRo5ySWawJ9Iev1
 atzgy97b5ZwVjjZtGRQIsQ0WTH6aR2HhR8KNFlZXvzzsv1WCafnt35/pYUgadgczwxA7G6bnud/
 PN3gE8gvzM/AYzCpEQHCJVJIZ9lar4iYaH3HjHduZwC5FI/SiwrS2ec6YoxHPjWjNx0xNST1JjX
 ewEtlls+0Mj+UaYFGz1mDOO5uAc+J0vl7JPqHGYcXZawhGbFmiEPA9ugq/TX7ljfZpi4U/TAf1Z
 wMR0Irft7ix5gd5TYdlWdUa0YVnhTg==
X-Proofpoint-GUID: 8cYIRFExH6VCRaaLGCQeEKLZDYjM0j4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510250010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------dLuUnlVI0bzbjPQkADLsyzVv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 28/10/25 4:25 pm, Nysal Jan K.A. wrote:
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
> Reported-by: Sachin P Bappalige<sachinpb@linux.ibm.com>
> Cc:stable@vger.kernel.org # v6.6+
> Reviewed-by: Srikar Dronamraju<srikar@linux.ibm.com>
> Signed-off-by: Nysal Jan K.A.<nysal@linux.ibm.com>
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

Hi Nysal,


I have verified this patch with both *kexec* and the *smt_enabled=on/off 
or 4 mode* bootline parameters, and no warnings or issues were observed 
during testing.

Test Passed.


Thank you for fix !!

Tested-by: Samir M <samir@linux.ibm.com>


--------------dLuUnlVI0bzbjPQkADLsyzVv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 28/10/25 4:25 pm, Nysal Jan K.A.
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251028105516.26258-1-nysal@linux.ibm.com">
      <pre wrap="" class="moz-quote-pre">If SMT is disabled or a partial SMT state is enabled, when a new kernel
image is loaded for kexec, on reboot the following warning is observed:

kexec: Waking offline cpu 228.
WARNING: CPU: 0 PID: 9062 at arch/powerpc/kexec/core_64.c:223 kexec_prepare_cpus+0x1b0/0x1bc
[snip]
 NIP kexec_prepare_cpus+0x1b0/0x1bc
 LR  kexec_prepare_cpus+0x1a0/0x1bc
 Call Trace:
  kexec_prepare_cpus+0x1a0/0x1bc (unreliable)
  default_machine_kexec+0x160/0x19c
  machine_kexec+0x80/0x88
  kernel_kexec+0xd0/0x118
  __do_sys_reboot+0x210/0x2c4
  system_call_exception+0x124/0x320
  system_call_vectored_common+0x15c/0x2ec

This occurs as add_cpu() fails due to cpu_bootable() returning false for
CPUs that fail the cpu_smt_thread_allowed() check or non primary
threads if SMT is disabled.

Fix the issue by enabling SMT and resetting the number of SMT threads to
the number of threads per core, before attempting to wake up all present
CPUs.

Fixes: 38253464bc82 ("cpu/SMT: Create topology_smt_thread_allowed()")
Reported-by: Sachin P Bappalige <a class="moz-txt-link-rfc2396E" href="mailto:sachinpb@linux.ibm.com">&lt;sachinpb@linux.ibm.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:stable@vger.kernel.org">stable@vger.kernel.org</a> # v6.6+
Reviewed-by: Srikar Dronamraju <a class="moz-txt-link-rfc2396E" href="mailto:srikar@linux.ibm.com">&lt;srikar@linux.ibm.com&gt;</a>
Signed-off-by: Nysal Jan K.A. <a class="moz-txt-link-rfc2396E" href="mailto:nysal@linux.ibm.com">&lt;nysal@linux.ibm.com&gt;</a>
---
 arch/powerpc/kexec/core_64.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 222aa326dace..825ab8a88f18 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -202,6 +202,23 @@ static void kexec_prepare_cpus_wait(int wait_state)
 	mb();
 }
 
+
+/*
+ * The add_cpu() call in wake_offline_cpus() can fail as cpu_bootable()
+ * returns false for CPUs that fail the cpu_smt_thread_allowed() check
+ * or non primary threads if SMT is disabled. Re-enable SMT and set the
+ * number of SMT threads to threads per core.
+ */
+static void kexec_smt_reenable(void)
+{
+#if defined(CONFIG_SMP) &amp;&amp; defined(CONFIG_HOTPLUG_SMT)
+	lock_device_hotplug();
+	cpu_smt_num_threads = threads_per_core;
+	cpu_smt_control = CPU_SMT_ENABLED;
+	unlock_device_hotplug();
+#endif
+}
+
 /*
  * We need to make sure each present CPU is online.  The next kernel will scan
  * the device tree and assume primary threads are online and query secondary
@@ -216,6 +233,8 @@ static void wake_offline_cpus(void)
 {
 	int cpu = 0;
 
+	kexec_smt_reenable();
+
 	for_each_present_cpu(cpu) {
 		if (!cpu_online(cpu)) {
 			printk(KERN_INFO "kexec: Waking offline cpu %d.\n",
</pre>
    </blockquote>
    <p>Hi Nysal,</p>
    <p><br>
    </p>
    <p>I have verified this patch with both <strong data-start="37"
        data-end="46">kexec</strong> and the <strong data-start="55"
        data-end="70">smt_enabled=on/off or 4 mode</strong> bootline
      parameters, and no warnings or issues were observed during
      testing.</p>
    <p>Test Passed.</p>
    <p><br>
    </p>
    <p>Thank you for fix !!</p>
    <p>Tested-by: Samir M <a class="moz-txt-link-rfc2396E" href="mailto:samir@linux.ibm.com">&lt;samir@linux.ibm.com&gt;</a></p>
    <p><br>
    </p>
  </body>
</html>

--------------dLuUnlVI0bzbjPQkADLsyzVv--


