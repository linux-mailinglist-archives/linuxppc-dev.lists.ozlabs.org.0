Return-Path: <linuxppc-dev+bounces-1141-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69D97000E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2024 07:01:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X11CR1Vj9z2yyx;
	Sat,  7 Sep 2024 15:01:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725685283;
	cv=none; b=ZhNWHJx8nY24sarpz8BB1D4H5QiGx20jWMLHPzwYnpiq1E19Y2hQNVwW5/+8Y8KJmfQopbsIK1IvhivFLTYUzWqJj/QUuM3+5S2Gt2bIQ3ZNa1eTzL3Q0LNRyd6j6DFhXapItValx+mVvG6e7zlHMOC5VtxStEucPpVRmPBFzxvtxFW5KoOYJN/at0FIOkAUQl3RuL3CTKh1vCkOT6Zskwsn0j8Gj1UECzxnZBHwnArydGltCNyWsGZV8CJqqo1j7fNvfjDd3TdprokRwmJJHrk4MJaHr/L9J6ir7vQM84D7kQ9HoLknnXJeO969O5d7jBze2Y0J2oz1GlkT27TFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725685283; c=relaxed/relaxed;
	bh=dCST9shKxCMSfnB6UtS+kX37QTHiypXMkNq1zmSVRWQ=;
	h=DKIM-Signature:Message-ID:Date:MIME-Version:Subject:From:To:Cc:
	 References:In-Reply-To:Content-Type; b=WRAQYy2puEupK7TPE4cxMyi9Sdtdo5WjLJiaMir/jjJi16y474ouZdaDn/yZLmi5xCnguS/FBWeG1pPY+yogg0s8krPh6UZVmwPTgCLJa5bvF1W55jGJxFu3rGCu6GAUwZfbrFkth3/cGtQFgXB+R4Bl5BWTybI6pcGNSB3GKNeArfRLEztnJldq8VEM4NY6uA5mMehWIhVShFrJk4HNe0yatjwFZ2753paV5QVprxdjYE9WqY4eIOCQW+h+AZfu3oXASF6Yg1Ev40O+iq26iMDyfF5AhQAkMHFIdTLaja3mygJdqhI18T0Kz1oBPvnZGNgKIr72ZFN4t/dhyMbqvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cq+b+P1l; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cq+b+P1l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X11CQ3DYNz2yxP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 15:01:22 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48731Kfr010345;
	Sat, 7 Sep 2024 05:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=d
	CST9shKxCMSfnB6UtS+kX37QTHiypXMkNq1zmSVRWQ=; b=Cq+b+P1lHw2YPPRhl
	sj//qFYTa9EqzoJBgpAO6E1eBl5qnyk1LcdwcTRy83yWE5vs8x6qDNtNHo9E2pqg
	4Ikj26KdJG6+T4UommdlZqcFsuvQdxRJ6rDETGZYrhDCZAPKToQ4xFoskouYsZJo
	Mz5iY7RdBBLZSj1N2FBYmsUmNV3QIgyvopHe4nV4lUpawURf5g2jur8p2JZEISz5
	3DlI+Bt0OwlpCSoHX5jhsf10OEO9/zu+mLGoj6/0cUzrlgPwHkw7mnW7v+E0wUvd
	0lV70wYuseL/jNxUsc+pXr3QRrCIGr20ZkiIx1ap+ef+Zv3eV+XgT4YeTuzB1u2o
	wXbiA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41geja0ap5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Sep 2024 05:01:12 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4874w6sW030044;
	Sat, 7 Sep 2024 05:01:11 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41geja0ap0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Sep 2024 05:01:11 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4874SgjZ019697;
	Sat, 7 Sep 2024 05:01:10 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41fj3ty398-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Sep 2024 05:01:10 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 487516u332047704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 7 Sep 2024 05:01:06 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B2AD20040;
	Sat,  7 Sep 2024 05:01:06 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B3B520043;
	Sat,  7 Sep 2024 05:01:02 +0000 (GMT)
Received: from [9.43.30.235] (unknown [9.43.30.235])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  7 Sep 2024 05:01:01 +0000 (GMT)
Message-ID: <641be54a-440f-475b-a62d-fac157ecbbcb@linux.ibm.com>
Date: Sat, 7 Sep 2024 10:30:59 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] crash: Lock-free crash hotplug support reporting
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: bhe@redhat.com
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>, kexec@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        x86@kernel.org
References: <20240823115226.835865-1-sourabhjain@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20240823115226.835865-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LC9jEnmn0hrrTL9fWBvQ1nZ50wcK9DJN
X-Proofpoint-GUID: OIYQ2VIwFF8L086nJNoFpwX5G6jqjbL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409070030

Hello Baoquan,

Do you think this patch would help reduce lock contention when
CPU/Memory resources are removed in bulk from a system?


Thanks,
Sourabh Jain


On 23/08/24 17:22, Sourabh Jain wrote:
> On a CPU/Memory hotplug event, the kexec lock is taken to update the
> kdump image. At the same time, this lock is also required to report
> the support for crash hotplug to user-space via the
> /sys/devices/system/[cpu|memory]/crash_hotplug sysfs interface, to
> avoid kdump reload.
>
> The kexec lock is needed to report crash hotplug support because the
> crash_hotplug variable, which tracks crash hotplug support, is part of
> the kdump image, and the kdump image needs to be updated during a
> hotplug event.
>
> Given that only one kdump image can be loaded at any given time, the
> crash_hotplug variable can be placed outside the kdump image and set or
> reset during kdump image load and unload. This allows crash hotplug
> support to be reported without taking the kexec lock.
>
> This would help in situation where CPU/Memory resource are hotplug from
> system in bulk.
>
> Commit e2a8f20dd8e9 ("Crash: add lock to serialize crash hotplug
> handling") introduced to serialize the kexec lock during bulk CPU/Memory
> hotplug events. However, with these changes, the kexec lock for crash
> hotplug support reporting can be avoided altogether.
>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: kexec@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-kernel@vger.kernel.org
> Cc: x86@kernel.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   include/linux/kexec.h | 11 ++++-------
>   kernel/crash_core.c   | 27 +++++++++------------------
>   kernel/kexec.c        |  5 ++++-
>   kernel/kexec_file.c   |  7 ++++++-
>   4 files changed, 23 insertions(+), 27 deletions(-)
>
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index f0e9f8eda7a3..bd755ba6bac4 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -318,13 +318,6 @@ struct kimage {
>   	unsigned int preserve_context : 1;
>   	/* If set, we are using file mode kexec syscall */
>   	unsigned int file_mode:1;
> -#ifdef CONFIG_CRASH_HOTPLUG
> -	/* If set, it is safe to update kexec segments that are
> -	 * excluded from SHA calculation.
> -	 */
> -	unsigned int hotplug_support:1;
> -#endif
> -
>   #ifdef ARCH_HAS_KIMAGE_ARCH
>   	struct kimage_arch arch;
>   #endif
> @@ -370,6 +363,10 @@ struct kimage {
>   	unsigned long elf_load_addr;
>   };
>   
> +#ifdef CONFIG_CRASH_HOTPLUG
> +extern unsigned int crash_hotplug_support;
> +#endif
> +
>   /* kexec interface functions */
>   extern void machine_kexec(struct kimage *image);
>   extern int machine_kexec_prepare(struct kimage *image);
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 63cf89393c6e..3428deba0070 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -30,6 +30,13 @@
>   #include "kallsyms_internal.h"
>   #include "kexec_internal.h"
>   
> +#ifdef CONFIG_CRASH_HOTPLUG
> +/* if set, it is safe to update kexec segments that are
> + * excluded from sha calculation.
> + */
> +unsigned int crash_hotplug_support;
> +#endif
> +
>   /* Per cpu memory for storing cpu states in case of system crash. */
>   note_buf_t __percpu *crash_notes;
>   
> @@ -500,23 +507,7 @@ static DEFINE_MUTEX(__crash_hotplug_lock);
>    */
>   int crash_check_hotplug_support(void)
>   {
> -	int rc = 0;
> -
> -	crash_hotplug_lock();
> -	/* Obtain lock while reading crash information */
> -	if (!kexec_trylock()) {
> -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> -		crash_hotplug_unlock();
> -		return 0;
> -	}
> -	if (kexec_crash_image) {
> -		rc = kexec_crash_image->hotplug_support;
> -	}
> -	/* Release lock now that update complete */
> -	kexec_unlock();
> -	crash_hotplug_unlock();
> -
> -	return rc;
> +	return crash_hotplug_support;
>   }
>   
>   /*
> @@ -552,7 +543,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
>   	image = kexec_crash_image;
>   
>   	/* Check that kexec segments update is permitted */
> -	if (!image->hotplug_support)
> +	if (!crash_hotplug_support)
>   		goto out;
>   
>   	if (hp_action == KEXEC_CRASH_HP_ADD_CPU ||
> diff --git a/kernel/kexec.c b/kernel/kexec.c
> index a6b3f96bb50c..d5c6b51eaa8b 100644
> --- a/kernel/kexec.c
> +++ b/kernel/kexec.c
> @@ -116,6 +116,9 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
>   		/* Uninstall image */
>   		kimage_free(xchg(dest_image, NULL));
>   		ret = 0;
> +#ifdef CONFIG_CRASH_HOTPLUG
> +		crash_hotplug_support = 0;
> +#endif
>   		goto out_unlock;
>   	}
>   	if (flags & KEXEC_ON_CRASH) {
> @@ -136,7 +139,7 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
>   
>   #ifdef CONFIG_CRASH_HOTPLUG
>   	if ((flags & KEXEC_ON_CRASH) && arch_crash_hotplug_support(image, flags))
> -		image->hotplug_support = 1;
> +		crash_hotplug_support = 1;
>   #endif
>   
>   	ret = machine_kexec_prepare(image);
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 3d64290d24c9..b326edb90fd7 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -378,7 +378,7 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
>   
>   #ifdef CONFIG_CRASH_HOTPLUG
>   	if ((flags & KEXEC_FILE_ON_CRASH) && arch_crash_hotplug_support(image, flags))
> -		image->hotplug_support = 1;
> +		crash_hotplug_support = 1;
>   #endif
>   
>   	ret = machine_kexec_prepare(image);
> @@ -432,6 +432,11 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
>   		arch_kexec_protect_crashkres();
>   #endif
>   
> +#ifdef CONFIG_CRASH_HOTPLUG
> +	if (flags & KEXEC_FILE_UNLOAD)
> +		crash_hotplug_support = 0;
> +#endif
> +
>   	kexec_unlock();
>   	kimage_free(image);
>   	return ret;


