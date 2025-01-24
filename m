Return-Path: <linuxppc-dev+bounces-5545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E851CA1B37B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 11:28:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfYtd3pQSz30Nl;
	Fri, 24 Jan 2025 21:28:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737714505;
	cv=none; b=V9KHQbgm2oRFkEcsvO19Lo4YiFBU+g6HNmSnSaSSxNrUwBW/xaiqjNwLuX46/212YqUviKhh/W60e08//i8W6tfDvzYlJbLAS26wdhh2WFqD+ZsJlk+cNOV3ASt272R+XnvmWkJ91NDDA/WNm5XQxyTCjT8/BLfg1aivX8UFwnDuP+nnoajVPBpamxOaDAKqNP+1iaVWX3+aoSUD5df50u4YIoZruWn0wQ7o8AuBrqVJHPcmIRmtt8P+yA3ZKvs69lyBF7iaiChzs1EHGHU2pj0ELTDgsCmHi7wh2Qr0pkWxfbsa5s1i/NxPFlh0zNNBgRFiWQUnhDKg+iYsRx6Jtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737714505; c=relaxed/relaxed;
	bh=hpKskXVjgOzyZaxztnFU2cAlivF8Cd3w2FfX1ovqe0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dJ2QVU6XYCFq0nH7j8c5l5TTULeRuhTcRKsIvV+OqCax6crY/tQ/X4/NsB/WRmXggj6vJILYkszKB7HnmAM+87DRpar7593YqjsXmjCQREBnDuWfTqESdS/JkRktClmDuzhYIMCYCGQ1FxqnoOHPW45q/rZM4sYL8f9QMNoDzBKXOn+pYvxcAI+0m2v9ENy2MG9+Ukoa5bz9oY+HCudONtIWYoj0y7luZSceX+HwfePssSRi2PfnryNmem9+8vfVzfzE7eKdTyFTg8TYCOcq+0dMN7AvYVg/dueV9m7sGwO6ESgmq4kV4s+pi+GUBpcO4XMyYC9jSWWjPJ0OiH7+kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q2fjwg9I; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q2fjwg9I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfYtc2H9Zz2yxN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 21:28:23 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O7XqUH024041;
	Fri, 24 Jan 2025 10:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hpKskX
	VjgOzyZaxztnFU2cAlivF8Cd3w2FfX1ovqe0Y=; b=Q2fjwg9IubUoeNTMpplPRB
	ZA6XNaPov4t6WELAgV+IDcUulaInuK5Yoz7CpCS2wSt7No/i0Ek+H6fJaVAiX7c1
	8lsNRVfn8p17y/YYAv9Bxdfx9IRp2r+o6oxb3nP+ftqW/WVWv7/E3K4n7QCMGLud
	xtElb9JSkaB6HIFr+1zRfMwEEo3rbRpFXvqkJ+mQGuUe/zF7HHMQMIrW5iEYEpo2
	m97cM2POyD/ONNzlvPUE2T9ucuQ137d7jUUklFQBjrxjfIxlyDjN4z904inSSanO
	H4G7feb29m0DRk2Bpl5TvCa/NgwxE7u4eKKYc7pYok4FQ/+y0giY9wT/RiDyzJjg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44c6jngqwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:28:12 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50O8YHC5022384;
	Fri, 24 Jan 2025 10:28:11 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448r4kju1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:28:11 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50OAS7nR21103158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2025 10:28:07 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F2422020E;
	Fri, 24 Jan 2025 10:28:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 820CB2020B;
	Fri, 24 Jan 2025 10:28:05 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Jan 2025 10:28:05 +0000 (GMT)
Message-ID: <6af97bc3-1ff1-4843-a15a-6067c1a40b9d@linux.ibm.com>
Date: Fri, 24 Jan 2025 15:58:04 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] crash: option to let arch decide mem range is
 usable
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
 <20250121115442.1278458-7-sourabhjain@linux.ibm.com>
 <755825bb-4153-44ce-8c1d-7c011fac4b7d@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <755825bb-4153-44ce-8c1d-7c011fac4b7d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -Unl90OubHgdJMTixrrxnbojyUIdUzgg
X-Proofpoint-ORIG-GUID: -Unl90OubHgdJMTixrrxnbojyUIdUzgg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_03,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240068
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Hari,


On 24/01/25 15:22, Hari Bathini wrote:
> Hi Sourabh,
>
> On 21/01/25 5:24 pm, Sourabh Jain wrote:
>> On PowerPC, the memory reserved for the crashkernel can contain
>> components like RTAS, TCE, OPAL, etc., which should be avoided when
>> loading kexec segments into crashkernel memory. Due to these special
>> components, PowerPC has its own set of functions to locate holes in the
>> crashkernel memory for loading kexec segments for kdump. However, for
>> loading kexec segments in the kexec case, PowerPC uses generic functions
>> to locate holes.
>>
>> So, let's use generic functions to locate memory holes for kdump on
>> PowerPC by adding an arch hook to handle such special regions while
>> loading kexec segments, and remove the PowerPC functions to locate
>> holes.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: kexec@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/kexec.h  |   6 +-
>>   arch/powerpc/kexec/file_load_64.c | 259 ++----------------------------
>>   include/linux/kexec.h             |   9 ++
>>   kernel/kexec_file.c               |  12 ++
>>   4 files changed, 34 insertions(+), 252 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/kexec.h 
>> b/arch/powerpc/include/asm/kexec.h
>> index 64741558071f..5e4680f9ff35 100644
>> --- a/arch/powerpc/include/asm/kexec.h
>> +++ b/arch/powerpc/include/asm/kexec.h
>> @@ -95,8 +95,10 @@ int arch_kexec_kernel_image_probe(struct kimage 
>> *image, void *buf, unsigned long
>>   int arch_kimage_file_post_load_cleanup(struct kimage *image);
>>   #define arch_kimage_file_post_load_cleanup 
>> arch_kimage_file_post_load_cleanup
>>   -int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf);
>> -#define arch_kexec_locate_mem_hole arch_kexec_locate_mem_hole
>> +int arch_check_excluded_range(struct kimage *image, unsigned long 
>> start,
>> +                  unsigned long end);
>> +#define arch_check_excluded_range  arch_check_excluded_range
>> +
>>     int load_crashdump_segments_ppc64(struct kimage *image,
>>                     struct kexec_buf *kbuf);
>> diff --git a/arch/powerpc/kexec/file_load_64.c 
>> b/arch/powerpc/kexec/file_load_64.c
>> index dc65c1391157..e7ef8b2a2554 100644
>> --- a/arch/powerpc/kexec/file_load_64.c
>> +++ b/arch/powerpc/kexec/file_load_64.c
>> @@ -49,201 +49,18 @@ const struct kexec_file_ops * const 
>> kexec_file_loaders[] = {
>>       NULL
>>   };
>>   -/**
>> - * __locate_mem_hole_top_down - Looks top down for a large enough 
>> memory hole
>> - *                              in the memory regions between 
>> buf_min & buf_max
>> - *                              for the buffer. If found, sets 
>> kbuf->mem.
>> - * @kbuf:                       Buffer contents and memory parameters.
>> - * @buf_min:                    Minimum address for the buffer.
>> - * @buf_max:                    Maximum address for the buffer.
>> - *
>> - * Returns 0 on success, negative errno on error.
>> - */
>> -static int __locate_mem_hole_top_down(struct kexec_buf *kbuf,
>> -                      u64 buf_min, u64 buf_max)
>> -{
>> -    int ret = -EADDRNOTAVAIL;
>> -    phys_addr_t start, end;
>> -    u64 i;
>> -
>> -    for_each_mem_range_rev(i, &start, &end) {
>> -        /*
>> -         * memblock uses [start, end) convention while it is
>> -         * [start, end] here. Fix the off-by-one to have the
>> -         * same convention.
>> -         */
>> -        end -= 1;
>> -
>> -        if (start > buf_max)
>> -            continue;
>> -
>> -        /* Memory hole not found */
>> -        if (end < buf_min)
>> -            break;
>> -
>> -        /* Adjust memory region based on the given range */
>> -        if (start < buf_min)
>> -            start = buf_min;
>> -        if (end > buf_max)
>> -            end = buf_max;
>> -
>> -        start = ALIGN(start, kbuf->buf_align);
>> -        if (start < end && (end - start + 1) >= kbuf->memsz) {
>> -            /* Suitable memory range found. Set kbuf->mem */
>> -            kbuf->mem = ALIGN_DOWN(end - kbuf->memsz + 1,
>> -                           kbuf->buf_align);
>> -            ret = 0;
>> -            break;
>> -        }
>> -    }
>> -
>> -    return ret;
>> -}
>> -
>> -/**
>> - * locate_mem_hole_top_down_ppc64 - Skip special memory regions to 
>> find a
>> - *                                  suitable buffer with top down 
>> approach.
>> - * @kbuf:                           Buffer contents and memory 
>> parameters.
>> - * @buf_min:                        Minimum address for the buffer.
>> - * @buf_max:                        Maximum address for the buffer.
>> - * @emem:                           Exclude memory ranges.
>> - *
>> - * Returns 0 on success, negative errno on error.
>> - */
>> -static int locate_mem_hole_top_down_ppc64(struct kexec_buf *kbuf,
>> -                      u64 buf_min, u64 buf_max,
>> -                      const struct crash_mem *emem)
>> +int arch_check_excluded_range(struct kimage *image, unsigned long 
>> start,
>> +                  unsigned long end)
>>   {
>> -    int i, ret = 0, err = -EADDRNOTAVAIL;
>> -    u64 start, end, tmin, tmax;
>> -
>> -    tmax = buf_max;
>> -    for (i = (emem->nr_ranges - 1); i >= 0; i--) {
>> -        start = emem->ranges[i].start;
>> -        end = emem->ranges[i].end;
>> -
>> -        if (start > tmax)
>> -            continue;
>> -
>> -        if (end < tmax) {
>> -            tmin = (end < buf_min ? buf_min : end + 1);
>> -            ret = __locate_mem_hole_top_down(kbuf, tmin, tmax);
>> -            if (!ret)
>> -                return 0;
>> -        }
>> -
>> -        tmax = start - 1;
>> -
>> -        if (tmax < buf_min) {
>> -            ret = err;
>> -            break;
>> -        }
>> -        ret = 0;
>> -    }
>> -
>> -    if (!ret) {
>> -        tmin = buf_min;
>> -        ret = __locate_mem_hole_top_down(kbuf, tmin, tmax);
>> -    }
>> -    return ret;
>> -}
>> -
>> -/**
>> - * __locate_mem_hole_bottom_up - Looks bottom up for a large enough 
>> memory hole
>> - *                               in the memory regions between 
>> buf_min & buf_max
>> - *                               for the buffer. If found, sets 
>> kbuf->mem.
>> - * @kbuf:                        Buffer contents and memory parameters.
>> - * @buf_min:                     Minimum address for the buffer.
>> - * @buf_max:                     Maximum address for the buffer.
>> - *
>> - * Returns 0 on success, negative errno on error.
>> - */
>> -static int __locate_mem_hole_bottom_up(struct kexec_buf *kbuf,
>> -                       u64 buf_min, u64 buf_max)
>> -{
>> -    int ret = -EADDRNOTAVAIL;
>> -    phys_addr_t start, end;
>> -    u64 i;
>> -
>> -    for_each_mem_range(i, &start, &end) {
>> -        /*
>> -         * memblock uses [start, end) convention while it is
>> -         * [start, end] here. Fix the off-by-one to have the
>> -         * same convention.
>> -         */
>> -        end -= 1;
>> -
>> -        if (end < buf_min)
>> -            continue;
>> -
>> -        /* Memory hole not found */
>> -        if (start > buf_max)
>> -            break;
>> -
>> -        /* Adjust memory region based on the given range */
>> -        if (start < buf_min)
>> -            start = buf_min;
>> -        if (end > buf_max)
>> -            end = buf_max;
>> -
>> -        start = ALIGN(start, kbuf->buf_align);
>> -        if (start < end && (end - start + 1) >= kbuf->memsz) {
>> -            /* Suitable memory range found. Set kbuf->mem */
>> -            kbuf->mem = start;
>> -            ret = 0;
>> -            break;
>> -        }
>> -    }
>> -
>> -    return ret;
>> -}
>> -
>> -/**
>> - * locate_mem_hole_bottom_up_ppc64 - Skip special memory regions to 
>> find a
>> - *                                   suitable buffer with bottom up 
>> approach.
>> - * @kbuf:                            Buffer contents and memory 
>> parameters.
>> - * @buf_min:                         Minimum address for the buffer.
>> - * @buf_max:                         Maximum address for the buffer.
>> - * @emem:                            Exclude memory ranges.
>> - *
>> - * Returns 0 on success, negative errno on error.
>> - */
>> -static int locate_mem_hole_bottom_up_ppc64(struct kexec_buf *kbuf,
>> -                       u64 buf_min, u64 buf_max,
>> -                       const struct crash_mem *emem)
>> -{
>> -    int i, ret = 0, err = -EADDRNOTAVAIL;
>> -    u64 start, end, tmin, tmax;
>> -
>> -    tmin = buf_min;
>> -    for (i = 0; i < emem->nr_ranges; i++) {
>> -        start = emem->ranges[i].start;
>> -        end = emem->ranges[i].end;
>> -
>> -        if (end < tmin)
>> -            continue;
>> -
>> -        if (start > tmin) {
>> -            tmax = (start > buf_max ? buf_max : start - 1);
>> -            ret = __locate_mem_hole_bottom_up(kbuf, tmin, tmax);
>> -            if (!ret)
>> -                return 0;
>> -        }
>> -
>> -        tmin = end + 1;
>> +    struct crash_mem *emem;
>> +    int i;
>>   -        if (tmin > buf_max) {
>> -            ret = err;
>> -            break;
>> -        }
>> -        ret = 0;
>> -    }
>> +    emem = image->arch.exclude_ranges;
>> +    for (i = 0; i < emem->nr_ranges; i++)
>> +        if (start < emem->ranges[i].end && end > emem->ranges[i].start)
>> +            return 1;
>>   -    if (!ret) {
>> -        tmax = buf_max;
>> -        ret = __locate_mem_hole_bottom_up(kbuf, tmin, tmax);
>> -    }
>> -    return ret;
>> +    return 0;
>>   }
>>     #ifdef CONFIG_CRASH_DUMP
>> @@ -1004,64 +821,6 @@ int setup_new_fdt_ppc64(const struct kimage 
>> *image, void *fdt, struct crash_mem
>>       return ret;
>>   }
>>   -/**
>> - * arch_kexec_locate_mem_hole - Skip special memory regions like 
>> rtas, opal,
>> - *                              tce-table, reserved-ranges & such 
>> (exclude
>> - *                              memory ranges) as they can't be used 
>> for kexec
>> - *                              segment buffer. Sets kbuf->mem when 
>> a suitable
>> - *                              memory hole is found.
>> - * @kbuf:                       Buffer contents and memory parameters.
>> - *
>> - * Assumes minimum of PAGE_SIZE alignment for kbuf->memsz & 
>> kbuf->buf_align.
>> - *
>> - * Returns 0 on success, negative errno on error.
>> - */
>> -int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
>> -{
>> -    struct crash_mem **emem;
>> -    u64 buf_min, buf_max;
>> -    int ret;
>> -
>> -    /* Look up the exclude ranges list while locating the memory 
>> hole */
>> -    emem = &(kbuf->image->arch.exclude_ranges);
>> -    if (!(*emem) || ((*emem)->nr_ranges == 0)) {
>> -        pr_warn("No exclude range list. Using the default locate mem 
>> hole method\n");
>> -        return kexec_locate_mem_hole(kbuf);
>> -    }
>> -
>> -    buf_min = kbuf->buf_min;
>> -    buf_max = kbuf->buf_max;
>> -    /* Segments for kdump kernel should be within crashkernel region */
>> -    if (IS_ENABLED(CONFIG_CRASH_DUMP) && kbuf->image->type == 
>> KEXEC_TYPE_CRASH) {
>> -        buf_min = (buf_min < crashk_res.start ?
>> -               crashk_res.start : buf_min);
>> -        buf_max = (buf_max > crashk_res.end ?
>> -               crashk_res.end : buf_max);
>> -    }
>> -
>> -    if (buf_min > buf_max) {
>> -        pr_err("Invalid buffer min and/or max values\n");
>> -        return -EINVAL;
>> -    }
>> -
>> -    if (kbuf->top_down)
>> -        ret = locate_mem_hole_top_down_ppc64(kbuf, buf_min, buf_max,
>> -                             *emem);
>> -    else
>> -        ret = locate_mem_hole_bottom_up_ppc64(kbuf, buf_min, buf_max,
>> -                              *emem);
>> -
>> -    /* Add the buffer allocated to the exclude list for the next 
>> lookup */
>> -    if (!ret) {
>> -        add_mem_range(emem, kbuf->mem, kbuf->memsz);
>> -        sort_memory_ranges(*emem, true);
>> -    } else {
>> -        pr_err("Failed to locate memory buffer of size %lu\n",
>> -               kbuf->memsz);
>> -    }
>> -    return ret;
>> -}
>> -
>>   /**
>>    * arch_kexec_kernel_image_probe - Does additional handling needed 
>> to setup
>>    *                                 kexec segments.
>
>
>> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
>> index f0e9f8eda7a3..407f8b0346aa 100644
>> --- a/include/linux/kexec.h
>> +++ b/include/linux/kexec.h
>> @@ -205,6 +205,15 @@ static inline int 
>> arch_kimage_file_post_load_cleanup(struct kimage *image)
>>   }
>>   #endif
>>   +#ifndef arch_check_excluded_range
>> +static inline int arch_check_excluded_range(struct kimage *image,
>> +                        unsigned long start,
>> +                        unsigned long end)
>> +{
>> +    return 0;
>> +}
>> +#endif
>> +
>>   #ifdef CONFIG_KEXEC_SIG
>>   #ifdef CONFIG_SIGNED_PE_FILE_VERIFICATION
>>   int kexec_kernel_verify_pe_sig(const char *kernel, unsigned long 
>> kernel_len);
>> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
>> index 3eedb8c226ad..fba686487e3b 100644
>> --- a/kernel/kexec_file.c
>> +++ b/kernel/kexec_file.c
>> @@ -464,6 +464,12 @@ static int locate_mem_hole_top_down(unsigned 
>> long start, unsigned long end,
>>               continue;
>>           }
>>   +        /* Make sure this does not conflict with exclude range */
>> +        if (arch_check_excluded_range(image, temp_start, temp_end)) {
>> +            temp_start = temp_start - PAGE_SIZE;
>> +            continue;
>> +        }
>> +
>>           /* We found a suitable memory range */
>>           break;
>>       } while (1);
>> @@ -498,6 +504,12 @@ static int locate_mem_hole_bottom_up(unsigned 
>> long start, unsigned long end,
>>               continue;
>>           }
>>   +        /* Make sure this does not conflict with exclude range */
>> +        if (arch_check_excluded_range(image, temp_start, temp_end)) {
>> +            temp_start = temp_start + PAGE_SIZE;
>> +            continue;
>> +        }
>> +
>>           /* We found a suitable memory range */
>>           break;
>>       } while (1);
>
> Please split this arch-independent patch and have it as a preceding
> patch. Arch-specific changes can go in a separate patch.

Yes, I will split this patch in the next version.

Thanks,
Sourabh Jain


