Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433985ACB86
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 08:58:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLfVS0WRFz3c6M
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 16:58:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VjM6P3tD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VjM6P3tD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLfTN6DZ8z305d
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 16:57:12 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2855ILvH025773;
	Mon, 5 Sep 2022 06:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ttmy3J8ey3lYUSrfNnutszvkGUWefnqFAcAqXwKgejs=;
 b=VjM6P3tDJzRXDwUczITSH1S3ibuc0vPxzjOiDfqoIQWySvdq3nas8+H4/SSQWlv9QlJO
 g1CM69l9KPLzoyK6o7IHob+tGM42VvA1Ckq1I/yjZVjpyEokHYRV3PULOnyCVWQ6S2a4
 rPTJBdTneNRZ1IztONvQxtpeYF1SgsmswmL44/Gx29xECCG3RKOu3PwDJEQU3daTMwSu
 LVa9SDbWAFMDozEBbdl4twnINY+/ezLtZQJms3FPL0OgCR3WIBB2wwHPy8KedMuxtTMy
 me5QZ6we03VDXt/Df8z7VGFccaN+dmqOnsRgbmMhiM/ZaVRpMkIdpQKzQcDXtPP7SVp2 NQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdaunj8qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 06:57:06 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2856oGqv011715;
	Mon, 5 Sep 2022 06:57:04 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3jbxj8t20t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 06:57:04 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2856ralA42140062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Sep 2022 06:53:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4D7811C052;
	Mon,  5 Sep 2022 06:57:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B21911C04A;
	Mon,  5 Sep 2022 06:57:00 +0000 (GMT)
Received: from [9.43.20.7] (unknown [9.43.20.7])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Mon,  5 Sep 2022 06:56:59 +0000 (GMT)
Message-ID: <fd2d1a4f-2304-017e-3040-175b547a8838@linux.ibm.com>
Date: Mon, 5 Sep 2022 12:26:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] tools/perf: Fix out of bound access to cpu mask array
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org
References: <20220905045441.1643-1-atrajeev@linux.vnet.ibm.com>
 <20220905045441.1643-2-atrajeev@linux.vnet.ibm.com>
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20220905045441.1643-2-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lW90AT9GsSwnam4DTYWvLgEnLh97l0DR
X-Proofpoint-ORIG-GUID: lW90AT9GsSwnam4DTYWvLgEnLh97l0DR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-05_04,2022-09-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050031
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
Cc: linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/09/22 10:24 am, Athira Rajeev wrote:
> The cpu mask init code in "record__mmap_cpu_mask_init"
> function access "bits" array part of "struct mmap_cpu_mask".
> The size of this array is the value from cpu__max_cpu().cpu.
> This array is used to contain the cpumask value for each
> cpu. While setting bit for each cpu, it calls "set_bit" function
> which access index in "bits" array. If we provide a command
> line option to -C which is greater than the number of CPU's
> present in the system, the set_bit could access an array
> member which is out-of the array size. This is because
> currently, there is no boundary check for the CPU. This will
> result in seg fault:
> 
> <<>>
> ./perf record -C 12341234 ls
> Perf can support 2048 CPUs. Consider raising MAX_NR_CPUS
> Segmentation fault (core dumped)
> <<>>
> 
> Debugging with gdb, points to function flow as below:
> 
> <<>>
> set_bit
> record__mmap_cpu_mask_init
> record__init_thread_default_masks
> record__init_thread_masks
> cmd_record
> <<>>
> 
> Fix this by adding boundary check for the array.
> 
> After the patch:
> <<>>
> ./perf record -C 12341234 ls
> Perf can support 2048 CPUs. Consider raising MAX_NR_CPUS
> Failed to initialize parallel data streaming masks
> <<>>
> 
> With this fix, if -C is given a non-exsiting CPU, perf
> record will fail with:
> 
> <<>>
>   ./perf record -C 50 ls
> Failed to initialize parallel data streaming masks
> <<>>
> 
> Reported-by: Nageswara Sastry <rnsastry@linux.ibm.com>

Tested-by: Nageswara Sastry <rnsastry@linux.ibm.com>

> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>   tools/perf/builtin-record.c | 26 ++++++++++++++++++++------
>   1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
> index 4713f0f3a6cf..09b68d76bbdc 100644
> --- a/tools/perf/builtin-record.c
> +++ b/tools/perf/builtin-record.c
> @@ -3358,16 +3358,22 @@ static struct option __record_options[] = {
>   
>   struct option *record_options = __record_options;
>   
> -static void record__mmap_cpu_mask_init(struct mmap_cpu_mask *mask, struct perf_cpu_map *cpus)
> +static int record__mmap_cpu_mask_init(struct mmap_cpu_mask *mask, struct perf_cpu_map *cpus)
>   {
>   	struct perf_cpu cpu;
>   	int idx;
>   
>   	if (cpu_map__is_dummy(cpus))
> -		return;
> +		return 0;
>   
> -	perf_cpu_map__for_each_cpu(cpu, idx, cpus)
> +	perf_cpu_map__for_each_cpu(cpu, idx, cpus) {
> +		/* Return ENODEV is input cpu is greater than max cpu */
> +		if ((unsigned long)cpu.cpu > mask->nbits)
> +			return -ENODEV;
>   		set_bit(cpu.cpu, mask->bits);
> +	}
> +
> +	return 0;
>   }
>   
>   static int record__mmap_cpu_mask_init_spec(struct mmap_cpu_mask *mask, const char *mask_spec)
> @@ -3379,7 +3385,9 @@ static int record__mmap_cpu_mask_init_spec(struct mmap_cpu_mask *mask, const cha
>   		return -ENOMEM;
>   
>   	bitmap_zero(mask->bits, mask->nbits);
> -	record__mmap_cpu_mask_init(mask, cpus);
> +	if (record__mmap_cpu_mask_init(mask, cpus))
> +		return -ENODEV;
> +
>   	perf_cpu_map__put(cpus);
>   
>   	return 0;
> @@ -3461,7 +3469,12 @@ static int record__init_thread_masks_spec(struct record *rec, struct perf_cpu_ma
>   		pr_err("Failed to allocate CPUs mask\n");
>   		return ret;
>   	}
> -	record__mmap_cpu_mask_init(&cpus_mask, cpus);
> +
> +	ret = record__mmap_cpu_mask_init(&cpus_mask, cpus);
> +	if (ret) {
> +		pr_err("Failed to init cpu mask\n");
> +		goto out_free_cpu_mask;
> +	}
>   
>   	ret = record__thread_mask_alloc(&full_mask, cpu__max_cpu().cpu);
>   	if (ret) {
> @@ -3702,7 +3715,8 @@ static int record__init_thread_default_masks(struct record *rec, struct perf_cpu
>   	if (ret)
>   		return ret;
>   
> -	record__mmap_cpu_mask_init(&rec->thread_masks->maps, cpus);
> +	if (record__mmap_cpu_mask_init(&rec->thread_masks->maps, cpus))
> +		return -ENODEV;
>   
>   	rec->nr_threads = 1;
>   

-- 
Thanks and Regards
R.Nageswara Sastry
