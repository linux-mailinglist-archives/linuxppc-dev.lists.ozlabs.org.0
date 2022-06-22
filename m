Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8D554F1F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 17:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSnKY1HBLz3cH1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 01:26:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ehu706n+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSnJn6sG0z306Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 01:25:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ehu706n+;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSnJn6Trrz4xZl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 01:25:45 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4LSnJn5rzVz4xZq; Thu, 23 Jun 2022 01:25:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ehu706n+;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4LSnJn38SBz4xZl
	for <linuxppc-dev@ozlabs.org>; Thu, 23 Jun 2022 01:25:45 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25MEpBEa018355;
	Wed, 22 Jun 2022 15:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dtjJzRSRZbBew4AvdjsnZ+HFwA6KmK9RJLyNrXIy+6U=;
 b=Ehu706n+v667Plmmeqj+4sAS0I4VmlTdDwB7yXGgsUuQQicJZF+ILu/rGjHR9qEIYNSu
 lnKhcPR77+nK95YuKUv0CeqD/FH+6797RVue8hUGMHYVJA95WjcSxal91bvkOHK3GQI6
 M6hCD/hO0JBHj4I9FUAO7yja3Y+hKwFTZ43rgTOS34r1SlMHKUH5gaRaEjRVtnplCLE/
 oUKminO4lliMnIooPF8h1dic/M4uH96a4kX72uJRN8nPolec9R8SdTklGMh3r2PRd9/g
 LzgokyjQMo3tna4aAZMLx4otR0d0UWm5q/c2gEipkwqWPBl7XulB4+aFADzHdtd28qsf Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gv56x9072-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jun 2022 15:25:37 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25MErgbj028622;
	Wed, 22 Jun 2022 15:25:37 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gv56x906d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jun 2022 15:25:37 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25MFM6KW009056;
	Wed, 22 Jun 2022 15:25:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04fra.de.ibm.com with ESMTP id 3gs6b8vk1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jun 2022 15:25:34 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25MFPV7w15991116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jun 2022 15:25:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F4A15204F;
	Wed, 22 Jun 2022 15:25:31 +0000 (GMT)
Received: from [9.145.21.142] (unknown [9.145.21.142])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DED1252050;
	Wed, 22 Jun 2022 15:25:30 +0000 (GMT)
Message-ID: <4a217cf4-a634-04a7-4ff6-85d27736090a@linux.ibm.com>
Date: Wed, 22 Jun 2022 17:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v5 4/5] powerpc/crash hp: add crash hotplug support for
 kexec_load
Content-Language: fr
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20220620070106.93141-1-sourabhjain@linux.ibm.com>
 <20220620070106.93141-5-sourabhjain@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220620070106.93141-5-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CI1Ju9QZ2rRLCrQ83EjhJAm2XYFuTMz6
X-Proofpoint-GUID: aRPrreBBnSQrO2grFxtO-JgYkR6wUWAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-22_04,2022-06-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206220075
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

On 20/06/2022, 09:01:05, Sourabh Jain wrote:
> A common crash hotplug handler is used for both kexec_load and
> kexec_file_load, which is already implemented in earlier patches while
> adding support for kexec_file_load.
> 
> To enable the crash hotplug handler to work for kexec_load case the
> fdt_index attribute of kimage_arch needs to be populated with index of
> FDT segment in kexec segment array.
> 
> After loading kexec segments the FDT segment is identified by looping
> through all the kexec segments and fdt_index is updated accordingly.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/kexec/core_64.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 6d448b55dfad..373cb46bcc0e 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -74,6 +74,31 @@ int machine_kexec_prepare(struct kimage *image)
>  	return 0;
>  }
>  
> +#if defined(CONFIG_HOTPLUG_CPU)
> +int machine_kexec_post_load(struct kimage *kimage)
> +{
> +	int i;
> +	void *ptr;
> +	unsigned long mem;
> +
> +	if (kimage->type != KEXEC_TYPE_CRASH)
> +		return 0;
> +
> +	/* Mark fdt_index invalid */
> +	kimage->arch.fdt_index = -1;

If fdt_index should be set to -1, this should be done in
machine_kexec_prepare().  Anyway, there is no need to set it to -1 because
this image will not be registered in do_kexec_load() before the following
loop is complete.

> +
> +	for (i = 0; i < kimage->nr_segments; i++) {
> +		mem = kimage->segment[i].mem;
> +		ptr = __va(mem);
> +
> +		if (ptr && fdt_magic(ptr) == FDT_MAGIC)
> +			kimage->arch.fdt_index = i;
			break;

there is no need to check the other segments, isn't it?

Cheers,
Laurent.

> +	}
> +
> +	return 0;
> +}
> +#endif
> +
>  /* Called during kexec sequence with MMU off */
>  static notrace void copy_segments(unsigned long ind)
>  {

