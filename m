Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3578C6B7D77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 17:28:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb2Br08H6z3frf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 03:28:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FiBD+zhL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb28K3sPQz3fm2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:25:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FiBD+zhL;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Pb28K31s8z4x4r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:25:53 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Pb28K2zJmz4x5R; Tue, 14 Mar 2023 03:25:53 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FiBD+zhL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Pb28K0cKjz4x4r
	for <linuxppc-dev@ozlabs.org>; Tue, 14 Mar 2023 03:25:52 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32DFAgoS003552;
	Mon, 13 Mar 2023 16:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WisQbImFAuZ6JQDJ6XFsiqOEX0hrs010qoAhkkLAT58=;
 b=FiBD+zhLZf+2AMvJ3W6/eqt9GhflhsmVob0mVKZxx0XjqdLAHSr7RGHiPZW7ddKqxzDl
 P4qn//02GHBqp3Ln86lIFZ3Wlq7HIwETtMBj+yFI+huNFF+3WO9z7DKSLpIDD+jRtVlm
 pijFG+3rROMxOAJH1x9DtHveTEC24RJ/1IriFTowTDbKKsIzmEBdmnQX3Yu1JIOt7o6Z
 /HA1mFWJJkiGeqD427qMd6psGWrayMigH5XdK04kS0L0RmuGO2bgiO3dnU6ECCzsEDf7
 yBx4xA5i72EOVngTxKv4xPPqjQHSac2k/VU7DHtFKTSAc2BSHm4yB+AzyHhon4SAQCJR tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa3dm03cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 16:25:45 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32DDkW85013034;
	Mon, 13 Mar 2023 16:25:44 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa3dm03bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 16:25:44 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DEj77l001030;
	Mon, 13 Mar 2023 16:25:42 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p8h96km2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 16:25:42 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32DGPcMw32899764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Mar 2023 16:25:38 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5BB820043;
	Mon, 13 Mar 2023 16:25:38 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 728DA20040;
	Mon, 13 Mar 2023 16:25:38 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Mar 2023 16:25:38 +0000 (GMT)
Message-ID: <5093127d-0199-2ef5-8a10-f293d54f3d90@linux.ibm.com>
Date: Mon, 13 Mar 2023 17:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v9 3/6] powerpc/crash: add a new member to the kimage_arch
 struct
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
 <20230312181154.278900-4-sourabhjain@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20230312181154.278900-4-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: M25RaPiz6UY-iP41V1Ewf7jJ3Fbh9X2A
X-Proofpoint-GUID: 54zZ5X1ZLyCSoD0oHzzerb46Z4gNQxjE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_07,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130125
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

On 12/03/2023 19:11:51, Sourabh Jain wrote:
> A new member "fdt_index" is added to the kimage_arch struct to hold
> the index of the FDT (Flattened Device Tree) segment from the kexec
> the segment array.
> 
> fdt_index will provide direct access to the FDT segment in the kexec
> segment array after the kdump kernel is loaded.
> 
> The new attribute will be used in the arch crash hotplug handler
> (added in upcoming patches) on every CPU and memory hotplug event.
> 
> The fdt_index is populated for both kexec_load and kexec_file_load
> case.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kexec.h |  5 +++++
>  arch/powerpc/kexec/core_64.c     | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index 8090ad7d97d9d..348eb96e8ca67 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -103,6 +103,8 @@ void kexec_copy_flush(struct kimage *image);
>  struct crash_mem;
>  int update_cpus_node(void *fdt);
>  int get_crash_memory_ranges(struct crash_mem **mem_ranges);
> +int machine_kexec_post_load(struct kimage *image);
> +#define machine_kexec_post_load machine_kexec_post_load

Minor comment, when CONFIG_CRASH_HOTPLUG is not set the function is simply
returning 0, why not defining it has an inline in that case?

>  #endif
>  
>  #if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
> @@ -118,6 +120,9 @@ extern const struct kexec_file_ops kexec_elf64_ops;
>  struct kimage_arch {
>  	struct crash_mem *exclude_ranges;
>  
> +#if defined(CONFIG_CRASH_HOTPLUG)
> +	int fdt_index;
> +#endif
>  	unsigned long backup_start;
>  	void *backup_buf;
>  	void *fdt;
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 0b292f93a74cc..531486c973988 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -77,6 +77,37 @@ int machine_kexec_prepare(struct kimage *image)
>  	return 0;
>  }
>  
> +int machine_kexec_post_load(struct kimage *kimage)
> +{
> +#if defined(CONFIG_CRASH_HOTPLUG)
> +	int i;
> +	void *ptr;
> +	unsigned long mem;
> +
> +	/* Mark fdt_index invalid */
> +	kimage->arch.fdt_index = -1;

Why is that not done in the series introducing the generic
crash hotplug update, in do_kimage_alloc_init() ?
This way there is a guarantee that the field will not be used while set by
default to 0.

> +
> +	/* fdt_index remains invalid if it is not a crash kernel load */
> +	if (kimage->type != KEXEC_TYPE_CRASH)
> +		return 0;
> +	/*
> +	 * Find the FDT segment index in kexec segment array and
> +	 * assign it to kimage's member fdt_index to enable direct
> +	 * access to FDT segment later on.
> +	 */
> +	for (i = 0; i < kimage->nr_segments; i++) {
> +		mem = kimage->segment[i].mem;
> +		ptr = __va(mem);
> +
> +		if (ptr && fdt_magic(ptr) == FDT_MAGIC) {
> +			kimage->arch.fdt_index = i;
> +			break;
> +		}
> +	}
> +#endif
> +	return 0;
> +}
> +
>  /* Called during kexec sequence with MMU off */
>  static notrace void copy_segments(unsigned long ind)
>  {

