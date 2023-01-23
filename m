Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 775A96774D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 06:25:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0dpP2vlSz3bdV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 16:25:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HLFN73iN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0dnN5GHYz3Wtp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 16:24:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HLFN73iN;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P0dnK3lz3z4xN4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 16:24:05 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P0dnK3jBWz4y0Q; Mon, 23 Jan 2023 16:24:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HLFN73iN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4P0dnK1P6qz4xN4
	for <linuxppc-dev@ozlabs.org>; Mon, 23 Jan 2023 16:24:05 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30N3TTAc029676;
	Mon, 23 Jan 2023 05:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hVv6HMGZpGkOQB9xjSgTw3//k07HrNdPWREpH531SnY=;
 b=HLFN73iNqyjR/1WezZ2iAdI/+UO84SGKMLBUYuij8lKWf+ZE4BqiM5kIwv6cJAIi+Jcb
 SbgqJFXtsbkXfk8X+tDErKmOk/zkgZ/IeEaYARrczLjCndjBf1MEt5WXd2NYfmDfejMT
 kQgubA8AsRmWiVaaFk2nYhhPjzA+4n3tTuE6Hl1JsGsq3FV1761zndmdFbZrEESbiuLw
 I4ZVMlnKx1WQ5pKV2ShdCtODeypvMGhWs1c44gKY0R4iJfGqE7GulGUOlBxOFDnCBQMf
 MUGtFRIXCypjHALxKgv4Fc4JMizxNfPRHN4DGqaYyei18mUULTpayLK76lT+MbzMyg5Y fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n8sxk5wx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jan 2023 05:23:52 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30N5NqBU021377;
	Mon, 23 Jan 2023 05:23:52 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n8sxk5wwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jan 2023 05:23:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30N5FKj6014950;
	Mon, 23 Jan 2023 05:23:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n87af9u7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jan 2023 05:23:47 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30N5Nh9c44827002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 05:23:43 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6838820043;
	Mon, 23 Jan 2023 05:23:43 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C07E020040;
	Mon, 23 Jan 2023 05:23:41 +0000 (GMT)
Received: from [9.43.92.90] (unknown [9.43.92.90])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Jan 2023 05:23:41 +0000 (GMT)
Message-ID: <822ae84a-00f5-2a7e-75b1-9fca8819c864@linux.ibm.com>
Date: Mon, 23 Jan 2023 10:53:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 3/8] powerpc/crash: update kimage_arch struct
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230115150206.431528-1-sourabhjain@linux.ibm.com>
 <20230115150206.431528-4-sourabhjain@linux.ibm.com>
 <6d683365-d653-2c47-4a24-a311c62a5eec@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <6d683365-d653-2c47-4a24-a311c62a5eec@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9nISxjE_K9w6_4i8RQIR4nKbQzd3rZvN
X-Proofpoint-GUID: clppiJ2VIFVxiB-xUid3WhldJYI0H1FO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_02,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230047
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Laurent,

On 20/01/23 00:27, Laurent Dufour wrote:
> On 15/01/2023 16:02:01, Sourabh Jain wrote:
>> Add a new member "fdt_index" to kimage_arch struct to hold the index of
>> the FDT (Flattened Device Tree) segment in the kexec segment array.
>>
>> Having direct access to FDT segment will help arch crash hotplug handler
>> to avoid looping kexec segment array to identify the FDT segment index
>> for every FDT update on hotplug events.
>>
>> The fdt_index is initialized during the kexec load for both kexec_load and
>> kexec_file_load system call.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/kexec.h  |  7 +++++++
>>   arch/powerpc/kexec/core_64.c      | 27 +++++++++++++++++++++++++++
>>   arch/powerpc/kexec/elf_64.c       |  6 ++++++
>>   arch/powerpc/kexec/file_load_64.c |  5 +++++
>>   4 files changed, 45 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
>> index 8090ad7d97d9d..5a322c1737661 100644
>> --- a/arch/powerpc/include/asm/kexec.h
>> +++ b/arch/powerpc/include/asm/kexec.h
>> @@ -103,6 +103,10 @@ void kexec_copy_flush(struct kimage *image);
>>   struct crash_mem;
>>   int update_cpus_node(void *fdt);
>>   int get_crash_memory_ranges(struct crash_mem **mem_ranges);
>> +#if defined(CONFIG_CRASH_HOTPLUG)
>> +int machine_kexec_post_load(struct kimage *image);
>> +#define machine_kexec_post_load machine_kexec_post_load
>> +#endif
>>   #endif
>>   
>>   #if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
>> @@ -118,6 +122,9 @@ extern const struct kexec_file_ops kexec_elf64_ops;
>>   struct kimage_arch {
>>   	struct crash_mem *exclude_ranges;
>>   
>> +#if defined(CONFIG_CRASH_HOTPLUG)
>> +	int fdt_index;
>> +#endif
>>   	unsigned long backup_start;
>>   	void *backup_buf;
>>   	void *fdt;
>> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
>> index 0b292f93a74cc..3d4fe1aa6f761 100644
>> --- a/arch/powerpc/kexec/core_64.c
>> +++ b/arch/powerpc/kexec/core_64.c
>> @@ -77,6 +77,33 @@ int machine_kexec_prepare(struct kimage *image)
>>   	return 0;
>>   }
>>   
>> +#if defined(CONFIG_CRASH_HOTPLUG)
> I think you should add a small function header describing that this
> function is recording the index of the FDT segment for later use.

Yes good to have one,  I will add it in the next version.

>
>> +int machine_kexec_post_load(struct kimage *kimage)
>> +{
>> +	int i;
>> +	void *ptr;
>> +	unsigned long mem;
>> +
>> +	/* Mark fdt_index invalid */
>> +	kimage->arch.fdt_index = -1;
> Is that really needed?
> This is already done in arch_kexec_kernel_image_probe() called before this
> function, isn't it?

Oh I didn't realize machine_kexec_post load is called for both
kexec_load and kexec_file_load system call.

The intention was to initialize fdt_index for both system calls but since
machine_kexec_post_load is called for both system calls,
initializing fdt_index in arch_kernel_image_probe function is redundant.

Thanks for point it out. I will fix this in the next version by only 
initializing the
fdtindex in machine_kexec_post_load. With this fdt_index will be 
initialized
for both syscalls.

>> +
>> +	if (kimage->type != KEXEC_TYPE_CRASH)
>> +		return 0;
>> +
>> +	for (i = 0; i < kimage->nr_segments; i++) {
>> +		mem = kimage->segment[i].mem;
>> +		ptr = __va(mem);
>> +
>> +		if (ptr && fdt_magic(ptr) == FDT_MAGIC) {
>> +			kimage->arch.fdt_index = i;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +#endif
>> +
>>   /* Called during kexec sequence with MMU off */
>>   static notrace void copy_segments(unsigned long ind)
>>   {
>> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>> index eeb258002d1e0..2a17f171661f1 100644
>> --- a/arch/powerpc/kexec/elf_64.c
>> +++ b/arch/powerpc/kexec/elf_64.c
>> @@ -123,6 +123,12 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>   	kbuf.buf_align = PAGE_SIZE;
>>   	kbuf.top_down = true;
>>   	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>> +
>> +#if defined(CONFIG_CRASH_HOTPLUG)
>> +	image->arch.fdt_index = image->nr_segments;
> I'm sorry, I'm not familliar with that code, could you explain why
> fdt_index has to be assigned here, and to that value?

Again I didn't realize machine_kexec_post_load is also called for 
kexec_file_load
system call too, which makes this assignment redundant.

Now why this value?

The image->nr-segments holds the count of total number of kexec segments and
when a new segment/buffer is added ( by kexec_add_buffer()) it is 
incremented by 1. With
this the index of newly added segment in the kexec segment array will be 
image->nr_segments - 1.

So instead of adding fdt segment first and then initializing fdt_index 
as image->nr_segments - 1,
the fdt_index is initialized with nr_segments before adding the fdt 
kexec segment/buffer to the
segment array.

Hope I answered you query.

Thanks for the review.

- Sourabh


>
>> +#endif
>> +	kbuf.memsz = fdt_totalsize(fdt);
>> +
>>   	ret = kexec_add_buffer(&kbuf);
>>   	if (ret)
>>   		goto out_free_fdt;
>> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
>> index 9bc70b4d8eafc..725f74d1b928c 100644
>> --- a/arch/powerpc/kexec/file_load_64.c
>> +++ b/arch/powerpc/kexec/file_load_64.c
>> @@ -1153,6 +1153,11 @@ int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
>>   		return ret;
>>   	}
>>   
>> +#if defined(CONFIG_CRASH_HOTPLUG)
>> +	/* Mark fdt_index invalid */
>> +	image->arch.fdt_index = -1;
>> +#endif
>> +
>>   	return kexec_image_probe_default(image, buf, buf_len);
>>   }
>>   
