Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A5368761F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 08:01:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6qTR6DS7z3f4C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 18:01:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AU8PJPhp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AU8PJPhp;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6qSS0pztz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 18:00:55 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3124g5tG004820;
	Thu, 2 Feb 2023 07:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=c41cUAYAIuungBjJWqHXw8J37UMkxAk/D8iCocBEyDY=;
 b=AU8PJPhp/lVlmv0YfUCmbQ7VygBF8o05/jjClAC9UVpSskSsXbCPKiCm3QH/IBYTucyF
 zRURzBjP7/r6K8+kix7BTYhwMtI3kj/VxnMlhV78QDMVB2UvjdhOwvlD/KGO7oNR7t4i
 WoEW3ujTfNFS4RwdNMrDYf5Jjj2056sgrDFm9tIHhzhqvMEX404WCsa37ruM2gMwld80
 lTIQEiDlf92BMU4WVU7vY+mF/RKkb+JlWNRAful77EsR2tgNavyOtLFCxRzE4W06U3qG
 jx+P3oFKAlv8iE0Q1ygUYpDVaeJrlI4YIh08EHNN8CJdU/ns7o06kUk3alxcy+aZRZ/g HA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ng5gybfe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 07:00:47 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311JCYuM012873;
	Thu, 2 Feb 2023 07:00:45 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtydt6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 07:00:45 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31270g1N51511794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Feb 2023 07:00:42 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 263E32004F;
	Thu,  2 Feb 2023 07:00:42 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51D832004B;
	Thu,  2 Feb 2023 07:00:41 +0000 (GMT)
Received: from [9.43.104.186] (unknown [9.43.104.186])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Feb 2023 07:00:41 +0000 (GMT)
Message-ID: <2f211d64-cf91-1d3b-fd79-eb827e949caa@linux.ibm.com>
Date: Thu, 2 Feb 2023 12:30:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] powerpc/kexec_file: Fix division by zero in extra size
 estimation
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20230130014707.541110-1-mpe@ellerman.id.au>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20230130014707.541110-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ECzjCZuz_WlYmJfyK5V7QYwMCY0xElRP
X-Proofpoint-ORIG-GUID: ECzjCZuz_WlYmJfyK5V7QYwMCY0xElRP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020061
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
Cc: sourabhjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for the fix, Michael.

On 30/01/23 7:17 am, Michael Ellerman wrote:
> In kexec_extra_fdt_size_ppc64() there's logic to estimate how much
> extra space will be needed in the device tree for some memory related
> properties.
> 
> That logic uses the size of RAM divided by drmem_lmb_size() to do the
> estimation. However drmem_lmb_size() can be zero if the machine has no
> hotpluggable memory configured, which is the case when booting with qemu
> and no maxmem=x parameter is passed (the default).
> 
> The division by zero is reported by UBSAN, and can also lead to an
> overflow and a warning from kvmalloc, and kdump kernel loading fails:
> 
>    WARNING: CPU: 0 PID: 133 at mm/util.c:596 kvmalloc_node+0x15c/0x160
>    Modules linked in:
>    CPU: 0 PID: 133 Comm: kexec Not tainted 6.2.0-rc5-03455-g07358bd97810 #223
>    Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1200 0xf000005 of:SLOF,git-dd0dca pSeries
>    NIP:  c00000000041ff4c LR: c00000000041fe58 CTR: 0000000000000000
>    REGS: c0000000096ef750 TRAP: 0700   Not tainted  (6.2.0-rc5-03455-g07358bd97810)
>    MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24248242  XER: 2004011e
>    CFAR: c00000000041fed0 IRQMASK: 0
>    ...
>    NIP kvmalloc_node+0x15c/0x160
>    LR  kvmalloc_node+0x68/0x160
>    Call Trace:
>      kvmalloc_node+0x68/0x160 (unreliable)
>      of_kexec_alloc_and_setup_fdt+0xb8/0x7d0
>      elf64_load+0x25c/0x4a0
>      kexec_image_load_default+0x58/0x80
>      sys_kexec_file_load+0x5c0/0x920
>      system_call_exception+0x128/0x330
>      system_call_vectored_common+0x15c/0x2ec
> 
> To fix it, skip the calculation if drmem_lmb_size() is zero.
> 
> Fixes: 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump kernel")
> Cc: stable@vger.kernel.org # v5.12+
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Hari Bathini <hbathini@in.ibm.com>

> ---
>   arch/powerpc/kexec/file_load_64.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index af8854f9eae3..3caee570e79b 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -989,10 +989,12 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
>   	 * linux,drconf-usable-memory properties. Get an approximate on the
>   	 * number of usable memory entries and use for FDT size estimation.
>   	 */
> -	usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
> -		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
> -
> -	extra_size = (unsigned int)(usm_entries * sizeof(u64));
> +	if (drmem_lmb_size()) {
> +		usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
> +			       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
> +		extra_size = (unsigned int)(usm_entries * sizeof(u64));
> +	} else
> +		extra_size = 0;
>   
>   	/*
>   	 * Get the number of CPU nodes in the current DT. This allows to
