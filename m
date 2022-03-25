Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F994E79AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 18:11:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ7sL1HVlz30Cy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 04:11:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NaVHJBZ7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQ7rb20dDz2yLT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Mar 2022 04:10:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NaVHJBZ7; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KQ7rX3gCqz4xLb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Mar 2022 04:10:20 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KQ7rX2XLvz4xcj; Sat, 26 Mar 2022 04:10:20 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NaVHJBZ7; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KQ7rW1KlVz4xLb
 for <linuxppc-dev@ozlabs.org>; Sat, 26 Mar 2022 04:10:18 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PEqWwg022348; 
 Fri, 25 Mar 2022 17:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=RHjyocSevE9YIGh1cYfsvki70GVqxBb3Mx6+VoM8tBE=;
 b=NaVHJBZ7M3N1Byb6UE/voAgVxwNBrEhSGZqliJhQ2AJ4N2gjWuO7Y2Mduvr+OjFN2dGc
 nEu4H8unr3bvgswMSIv8+vuSaIGu+ZuckvuHVuAUs4qZwZ8Uu+p9RMC4IFqjWUtHHugA
 qPv7rXlOge1L6nPxBL5k4px9+hc9TKHOEY2CUITjE7cXO4sqdFGYOSWq+NFkhOLp9Sfy
 U0PU4gIQx0pcCEpyNQHhlrB45TTLMY4bYWsZMVjc43w2IC01OHR3F8RxM2Q/sDmF14Yf
 a9AqXkJaEAaf7fNYDl5v7Q6xYOmYb1yp/BfVAYtux5fZr1i8jpO/7E6gTuR7dGEzv+sV FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0rqbruwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 17:04:53 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22PGtsgs031274;
 Fri, 25 Mar 2022 17:04:53 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0rqbruvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 17:04:53 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22PH4ABp007360;
 Fri, 25 Mar 2022 17:04:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3ew6t8unc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 17:04:51 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PH4mLu34275590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 17:04:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A3CE5204F;
 Fri, 25 Mar 2022 17:04:48 +0000 (GMT)
Received: from [9.145.35.34] (unknown [9.145.35.34])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C23DA5204E;
 Fri, 25 Mar 2022 17:04:47 +0000 (GMT)
Message-ID: <4f67f1ca-26e4-fbd6-bff7-692cd87da1b5@linux.ibm.com>
Date: Fri, 25 Mar 2022 18:04:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC v3 PATCH 0/5] In kernel handling of CPU hotplug events for
 crash kernel
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iVvI7JjLruDwvBRr1WxNF8BSlaVJ-Qfw
X-Proofpoint-ORIG-GUID: CdFTkbYe8cG3whbS1kUBiRnzdg9rkmqr
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_05,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203250092
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
 kexec@lists.infradead.org, hbathini@linux.ibm.com, bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/03/2022, 09:04:17, Sourabh Jain wrote:
> This patch series implements the crash hotplug handler on PowerPC introduced
> by https://lkml.org/lkml/2022/3/3/674 patch series.

Hi Sourabh,

That's a great idea!

> 
> The Problem:
> ============
> Post hotplug/DLPAR events the capture kernel holds stale information about the
> system. Dump collection with stale capture kernel might end up in dump capture
> failure or an inaccurate dump collection.
> 
> 
> Existing solution:
> ==================
> The existing solution to keep the capture kernel up-to-date is observe the
> hotplug event via udev rule and trigger a full capture kernel reload post
> hotplug event. 
> 
> Shortcomings:
> ------------------------------------------------
> - Leaves a window where kernel crash might not lead to successful dump
>   collection.
> - Reloading all kexec components for each hotplug is inefficient. Since only
>   one or two kexec components need to be updated due to hotplug event reloading
>   all kexec component is redundant.
> - udev rules are prone to races if hotplug events are frequent.
> 
> More about issues with an existing solution is posted here:
>  - https://lkml.org/lkml/2020/12/14/532
>  - https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-February/240254.html
> 
> Proposed Solution:
> ==================
> Instead of reloading all kexec segments on hotplug event, this patch series
> focuses on updating only the relevant kexec segment. Once the kexec
> segments are loaded in the kernel reserved area then an arch-specific hotplug handler
> will update the relevant kexec segment based on hotplug event type.
> 
> As mentioned above this patch series implemented a PowerPC crash hotplug
> handler for the CPU. The crash hotplug handler memory is in our TODO list.

If I understand corrrectly, and based on the change in the patch 4/5,
memory hotplug operations are ignored. Does this means that once this
series is applied, the capture kenrel will not be able to work correctly on
this hot plug/unplugged memory areas?

Thanks,
Laurent.
> 
> A couple of minor changes are required to realize the benefit of the patch
> series:
> 
> - disalble the udev rule:
> 
>   comment out the below line in kdump udev rule file:
>   RHEL: /usr/lib/udev/rules.d/98-kexec.rules
>   # SUBSYSTEM=="cpu", ACTION=="online", GOTO="kdump_reload_cpu"
> 
> - kexec tool needs to be updated with patch for kexec_load system call
>   to work (not needed if -s option is used during kexec panic load):
> 
> ---
> diff --git a/kexec/arch/ppc64/kexec-elf-ppc64.c b/kexec/arch/ppc64/kexec-elf-ppc64.c
> index 695b8b0..1dc6490 100644
> --- a/kexec/arch/ppc64/kexec-elf-ppc64.c
> +++ b/kexec/arch/ppc64/kexec-elf-ppc64.c
> @@ -45,6 +45,29 @@ uint64_t initrd_base, initrd_size;
>  unsigned char reuse_initrd = 0;
>  const char *ramdisk;
>  
> +#define MAX_CORE 256
> +#define PER_CORE_NODE_SIZE 1500
> +
> +/**
> + * get_crash_fdt_mem_sz() - calcuate mem size for crash kernel FDT
> + * @fdt: pointer to crash kernel FDT
> + *
> + * Calculate the buffer space needed to add more CPU nodes in FDT after
> + * capture kenrel load due to hot add events.
> + *
> + * Some assumption are made to calculate the additional buffer size needed
> + * to accommodate future hot add CPUs to the crash FDT. The maximum core count
> + * in the system would not go beyond MAX_CORE and memory needed to store per core
> + * date in FDT is PER_CORE_NODE_SIZE.
> + *
> + * Certainly MAX_CORE count can be replaced with possible core count and
> + * PER_CORE_NODE_SIZE to some standard value instead of randomly observed
> + * core size value on Power9 LPAR.
> + */
> +static unsigned int get_crash_fdt_mem_sz(void *fdt) {
> +	return fdt_totalsize(fdt) + (PER_CORE_NODE_SIZE * MAX_CORE);
> +}
> +
>  int elf_ppc64_probe(const char *buf, off_t len)
>  {
>  	struct mem_ehdr ehdr;
> @@ -179,6 +202,7 @@ int elf_ppc64_load(int argc, char **argv, const char *buf, off_t len,
>  	uint64_t max_addr, hole_addr;
>  	char *seg_buf = NULL;
>  	off_t seg_size = 0;
> +	unsigned int mem_sz = 0;
>  	struct mem_phdr *phdr;
>  	size_t size;
>  #ifdef NEED_RESERVE_DTB
> @@ -329,7 +353,13 @@ int elf_ppc64_load(int argc, char **argv, const char *buf, off_t len,
>  	if (result < 0)
>  		return result;
>  
> -	my_dt_offset = add_buffer(info, seg_buf, seg_size, seg_size,
> +	if (info->kexec_flags & KEXEC_ON_CRASH) {
> +		mem_sz = get_crash_fdt_mem_sz((void *)seg_buf);
> +		fdt_set_totalsize(seg_buf, mem_sz);
> +		info->fdt_index = info->nr_segments;
> +	}
> +
> +	my_dt_offset = add_buffer(info, seg_buf, seg_size, mem_sz,
>  				0, 0, max_addr, -1);
>  
>  #ifdef NEED_RESERVE_DTB
> diff --git a/kexec/kexec.c b/kexec/kexec.c
> index f63b36b..846b1a8 100644
> --- a/kexec/kexec.c
> +++ b/kexec/kexec.c
> @@ -672,6 +672,9 @@ static void update_purgatory(struct kexec_info *info)
>  		if (info->segment[i].mem == (void *)info->rhdr.rel_addr) {
>  			continue;
>  		}
> +		if (info->fdt_index == i)
> +			continue;
> +
>  		sha256_update(&ctx, info->segment[i].buf,
>  			      info->segment[i].bufsz);
>  		nullsz = info->segment[i].memsz - info->segment[i].bufsz;
> diff --git a/kexec/kexec.h b/kexec/kexec.h
> index 595dd68..0906a1b 100644
> --- a/kexec/kexec.h
> +++ b/kexec/kexec.h
> @@ -169,6 +169,7 @@ struct kexec_info {
>  	int command_line_len;
>  
>  	int skip_checks;
> +       // Given that we might need to update mutliple kexec segments
> +       // then having array to keep indexes of all hotplug kexec segments
> +       // will be helpful.
> +	unsigned int fdt_index;
>  };
>  
>  struct arch_map_entry {
> ---
> 
> ---
> Changelog:
> 
> v1 -> v2:
>   - Use generic hotplug handler introduced by https://lkml.org/lkml/2022/2/9/1406, a
>     significant change from v1.
> 
> v2 -> v3
>   - Move fdt_index and fdt_index_vaild variables to kimage_arch struct.
>   - Rebase patche on top of https://lkml.org/lkml/2022/3/3/674 [v5]
>   - Fixed warning reported by checpatch script
> ---
> 
> Sourabh Jain (5):
>   powerpc/kexec: make update_cpus_node non-static
>   powerpc/crash hp: introduce a new config option CRASH_HOTPLUG
>   powrepc/crash hp: update kimage struct
>   powerpc/crash hp: add crash hotplug support for kexec_file_load
>   powerpc/crash hp: add crash hotplug support for kexec_load
> 
>  arch/powerpc/Kconfig              |  11 +++
>  arch/powerpc/include/asm/kexec.h  |   3 +
>  arch/powerpc/kexec/core_64.c      | 153 ++++++++++++++++++++++++++++++
>  arch/powerpc/kexec/elf_64.c       |  40 ++++++++
>  arch/powerpc/kexec/file_load_64.c |  87 -----------------
>  5 files changed, 207 insertions(+), 87 deletions(-)
> 

