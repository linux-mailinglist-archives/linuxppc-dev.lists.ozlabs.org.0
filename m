Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD62D5018EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 18:40:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfQDf6Cndz3bgh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 02:40:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KEtNbqH1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfQCx04Xmz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 02:39:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KEtNbqH1; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KfQCw5LqDz4xLR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 02:39:40 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KfQCw5HGcz4xQq; Fri, 15 Apr 2022 02:39:40 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KEtNbqH1; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KfQCw2L5Rz4xLR
 for <linuxppc-dev@ozlabs.org>; Fri, 15 Apr 2022 02:39:40 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23EEGXro001714; 
 Thu, 14 Apr 2022 16:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=korJHgVO3RXZN00rOlgExsEQjFSylZmpgUTuGHFjwkE=;
 b=KEtNbqH1MvZcXinu2BGdH0W/p62Qqn3EyOHBTp3ZbMhIr3MtGDk083XH2bEA26PgF+vU
 YseQ3eFV01oevVDM7waagKM3ZWoun9UY8mh41rIpQFvCsdswNANrexid9fpDtvyzv0bC
 7UrbdxKxKpMdDleR50tuAC9f4xx9K8quxKAQj9GRCaE6Sb57hif0Grz9GOR33Xf4usNm
 GTzdaU6d0fyLPJOouzH8bav4ZiEnU/Mr1Loo62AbEgWA/lmXaLTXMj6VFPLCVz3Nbb/N
 ijCAqjpEu0L6WUvSS43IHzWtCxxEke69h8Q6dlSGO29swJ7Xp3GfzC9x/8K7rZ7ZN5KO EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fegdp1gnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 16:39:31 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23EGDBjI028136;
 Thu, 14 Apr 2022 16:39:31 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fegdp1gn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 16:39:30 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23EGbmFi003100;
 Thu, 14 Apr 2022 16:39:29 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3fb1s8y6xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Apr 2022 16:39:29 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23EGdQOA45613328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Apr 2022 16:39:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AAB211C04C;
 Thu, 14 Apr 2022 16:39:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFCD411C04A;
 Thu, 14 Apr 2022 16:39:25 +0000 (GMT)
Received: from [9.145.94.207] (unknown [9.145.94.207])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Apr 2022 16:39:25 +0000 (GMT)
Message-ID: <fc93749d-d7b9-2c56-f156-9f5ffd4808f7@linux.ibm.com>
Date: Thu, 14 Apr 2022 18:39:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC v4 PATCH 5/5] powerpc/crash hp: add crash hotplug support
 for kexec_load
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
 <20220411084357.157308-6-sourabhjain@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220411084357.157308-6-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DmHL6pbMIiB1s_gmqr6JxwVx6p6ata12
X-Proofpoint-GUID: NjO8xk4ACvQRpz_85J-hMBhZSXd0rIOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-14_04,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=950 spamscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204140088
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com,
 kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/04/2022, 10:43:57, Sourabh Jain wrote:
> The kernel changes needed for crash hotplug support for kexec_load system
> calls are similar to kexec_file_load (which has already been implemented
> in earlier patches) except for finding the index of the FDT segment in the
> kexec segment array. Since the kexec segment array is prepared by the
> kexec tool in the userspace, the kernel is not aware of at which index FDT
> segment is present.
> 
> Now to enable crash hotplug support for the kexec_load case, the crash
> hotplug handler is updated to identify the index at which the FDT segment
> is present in the kexec segment array by comparing the first 32 bits of
> every kexec segment with the FDT magic number.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/kexec/core_64.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 62f77cc86407..e3f224f8eb3a 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -480,7 +480,9 @@ int update_cpus_node(void *fdt)
>  void arch_crash_hotplug_handler(struct kimage *image, unsigned int hp_action,
>  				unsigned long a, unsigned long b)
>  {
> -	void *fdt;
> +	void *fdt, *ptr;
> +	unsigned int n;
> +	unsigned long mem, memsz;
>  
>  	/* No action needed for CPU hot-unplug */
>  	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
> @@ -492,6 +494,24 @@ void arch_crash_hotplug_handler(struct kimage *image, unsigned int hp_action,
>  		return;
>  	}
>  
> +	/* Sine kexec segments for kexec_load system call is prepred by
           Since

FWIW,
Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> +	 * kexec tool in userspace we need loop through all the segments
> +	 * to find out segment index corresponds FDT segment. In case of
> +	 * kexec_file_load it is discovered during the load itself.
> +	 */
> +	if (!image->arch.fdt_index_valid) {
> +		for (n = 0; n < image->nr_segments; n++) {
> +			mem = image->segment[n].mem;
> +			memsz = image->segment[n].memsz;
> +			ptr = __va(mem);
> +			if (ptr && fdt_magic(ptr) == FDT_MAGIC) {
> +				image->arch.fdt_index = n;
> +				image->arch.fdt_index_valid = true;
> +				break;
> +			}
> +		}
> +	}
> +
>  	/* Must have valid FDT index */
>  	if (!image->arch.fdt_index_valid) {
>  		pr_err("crash hp: unable to locate FDT segment");

