Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C1F220273
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 04:42:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B61qx1PpjzDqSN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 12:42:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B61ng36GyzDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 12:40:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B61ng1jzmz9BwZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 12:40:07 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B61ng1LYjz9sRK; Wed, 15 Jul 2020 12:40:07 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B61nf4dSCz9sQt
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Jul 2020 12:40:06 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06F2Ws38173010; Tue, 14 Jul 2020 22:39:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 327tnaudmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 22:39:56 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06F2ZH36178263;
 Tue, 14 Jul 2020 22:39:55 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 327tnaudme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 22:39:55 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06F2Z7NS002784;
 Wed, 15 Jul 2020 02:39:55 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 327528w4qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 02:39:55 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06F2dstr48300518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 02:39:54 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C401AAE05C;
 Wed, 15 Jul 2020 02:39:54 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 445DAAE05F;
 Wed, 15 Jul 2020 02:39:50 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.66.159])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Jul 2020 02:39:49 +0000 (GMT)
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466088775.24747.1248185448154277951.stgit@hbathini.in.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 04/12] ppc64/kexec_file: avoid stomping memory used by
 special regions
In-reply-to: <159466088775.24747.1248185448154277951.stgit@hbathini.in.ibm.com>
Date: Tue, 14 Jul 2020 23:39:45 -0300
Message-ID: <87365t8pse.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-14_10:2020-07-14,
 2020-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150016
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
Cc: Pingfan Liu <piliu@redhat.com>, Nayna Jain <nayna@linux.ibm.com>,
 Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hari Bathini <hbathini@linux.ibm.com> writes:

> diff --git a/arch/powerpc/include/asm/crashdump-ppc64.h b/arch/powerpc/include/asm/crashdump-ppc64.h
> new file mode 100644
> index 0000000..90deb46
> --- /dev/null
> +++ b/arch/powerpc/include/asm/crashdump-ppc64.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _ASM_POWERPC_CRASHDUMP_PPC64_H
> +#define _ASM_POWERPC_CRASHDUMP_PPC64_H
> +
> +/* min & max addresses for kdump load segments */
> +#define KDUMP_BUF_MIN		(crashk_res.start)
> +#define KDUMP_BUF_MAX		((crashk_res.end < ppc64_rma_size) ? \
> +				 crashk_res.end : (ppc64_rma_size - 1))
> +
> +#endif /* __ASM_POWERPC_CRASHDUMP_PPC64_H */
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index 7008ea1..bf47a01 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -100,14 +100,16 @@ void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_co
>  #ifdef CONFIG_KEXEC_FILE
>  extern const struct kexec_file_ops kexec_elf64_ops;
>
> -#ifdef CONFIG_IMA_KEXEC
>  #define ARCH_HAS_KIMAGE_ARCH
>
>  struct kimage_arch {
> +	struct crash_mem *exclude_ranges;
> +
> +#ifdef CONFIG_IMA_KEXEC
>  	phys_addr_t ima_buffer_addr;
>  	size_t ima_buffer_size;
> -};
>  #endif
> +};
>
>  int setup_purgatory(struct kimage *image, const void *slave_code,
>  		    const void *fdt, unsigned long kernel_load_addr,
> @@ -125,6 +127,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>  			unsigned long initrd_load_addr,
>  			unsigned long initrd_len, const char *cmdline);
>  #endif /* CONFIG_PPC64 */
> +
>  #endif /* CONFIG_KEXEC_FILE */
>
>  #else /* !CONFIG_KEXEC_CORE */
> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index 23ad04c..c695f94 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -22,6 +22,7 @@
>  #include <linux/of_fdt.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <asm/crashdump-ppc64.h>
>
>  static void *elf64_load(struct kimage *image, char *kernel_buf,
>  			unsigned long kernel_len, char *initrd,
> @@ -46,6 +47,12 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>  	if (ret)
>  		goto out;
>
> +	if (image->type == KEXEC_TYPE_CRASH) {
> +		/* min & max buffer values for kdump case */
> +		kbuf.buf_min = pbuf.buf_min = KDUMP_BUF_MIN;
> +		kbuf.buf_max = pbuf.buf_max = KDUMP_BUF_MAX;

This is only my personal opinion and an actual maintainer may disagree,
but just looking at the lines above, I would assume that KDUMP_BUF_MIN
and KDUMP_BUF_MAX were constants, when in fact they aren't.

I suggest using static inline macros in <asm/crashdump-ppc64.h>, for
example:

static inline resource_size_t get_kdump_buf_min(void)
{
	return crashk_res.start;
}

static inline resource_size_t get_kdump_buf_max(void)
{
	return (crashk_res.end < ppc64_rma_size) ? \
		 crashk_res.end : (ppc64_rma_size - 1)
}


> +	}
> +
>  	ret = kexec_elf_load(image, &ehdr, &elf_info, &kbuf, &kernel_load_addr);
>  	if (ret)
>  		goto out;

<snip>

> +/**
> + * __locate_mem_hole_top_down - Looks top down for a large enough memory hole
> + *                              in the memory regions between buf_min & buf_max
> + *                              for the buffer. If found, sets kbuf->mem.
> + * @kbuf:                       Buffer contents and memory parameters.
> + * @buf_min:                    Minimum address for the buffer.
> + * @buf_max:                    Maximum address for the buffer.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int __locate_mem_hole_top_down(struct kexec_buf *kbuf,
> +				      u64 buf_min, u64 buf_max)
> +{
> +	int ret = -EADDRNOTAVAIL;
> +	phys_addr_t start, end;
> +	u64 i;
> +
> +	for_each_mem_range_rev(i, &memblock.memory, NULL, NUMA_NO_NODE,
> +			       MEMBLOCK_NONE, &start, &end, NULL) {
> +		if (start > buf_max)
> +			continue;
> +
> +		/* Memory hole not found */
> +		if (end < buf_min)
> +			break;
> +
> +		/* Adjust memory region based on the given range */
> +		if (start < buf_min)
> +			start = buf_min;
> +		if (end > buf_max)
> +			end = buf_max;
> +
> +		start = ALIGN(start, kbuf->buf_align);
> +		if (start < end && (end - start + 1) >= kbuf->memsz) {

This is why I dislike using start and end to express address ranges:

While struct resource seems to use the [address, end] convention, my
reading of memblock code is that it uses [addres, end). This is
guaranteed to lead to bugs. So the above has an off-by-one error. To
calculate the size of the current range, you need to use `end - start`.

> +			/* Suitable memory range found. Set kbuf->mem */
> +			kbuf->mem = ALIGN_DOWN(end - kbuf->memsz + 1,

Similarly, I believe the `+ 1` here is wrong.

> +					       kbuf->buf_align);
> +			ret = 0;
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * locate_mem_hole_top_down_ppc64 - Skip special memory regions to find a
> + *                                  suitable buffer with top down approach.
> + * @kbuf:                           Buffer contents and memory parameters.
> + * @buf_min:                        Minimum address for the buffer.
> + * @buf_max:                        Maximum address for the buffer.
> + * @emem:                           Exclude memory ranges.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int locate_mem_hole_top_down_ppc64(struct kexec_buf *kbuf,
> +					  u64 buf_min, u64 buf_max,
> +					  const struct crash_mem *emem)
> +{
> +	int i, ret = 0, err = -EADDRNOTAVAIL;
> +	u64 start, end, tmin, tmax;
> +
> +	tmax = buf_max;
> +	for (i = (emem->nr_ranges - 1); i >= 0; i--) {
> +		start = emem->ranges[i].start;
> +		end = emem->ranges[i].end;
> +
> +		if (start > tmax)
> +			continue;
> +
> +		if (end < tmax) {
> +			tmin = (end < buf_min ? buf_min : end + 1);
> +			ret = __locate_mem_hole_top_down(kbuf, tmin, tmax);
> +			if (!ret)
> +				return 0;
> +		}
> +
> +		tmax = start - 1;
> +
> +		if (tmax < buf_min) {
> +			ret = err;
> +			break;
> +		}
> +		ret = 0;
> +	}
> +
> +	if (!ret) {
> +		tmin = buf_min;
> +		ret = __locate_mem_hole_top_down(kbuf, tmin, tmax);
> +	}
> +	return ret;
> +}
> +
> +/**
> + * __locate_mem_hole_bottom_up - Looks bottom up for a large enough memory hole
> + *                               in the memory regions between buf_min & buf_max
> + *                               for the buffer. If found, sets kbuf->mem.
> + * @kbuf:                        Buffer contents and memory parameters.
> + * @buf_min:                     Minimum address for the buffer.
> + * @buf_max:                     Maximum address for the buffer.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int __locate_mem_hole_bottom_up(struct kexec_buf *kbuf,
> +				       u64 buf_min, u64 buf_max)
> +{
> +	int ret = -EADDRNOTAVAIL;
> +	phys_addr_t start, end;
> +	u64 i;
> +
> +	for_each_mem_range(i, &memblock.memory, NULL, NUMA_NO_NODE,
> +			   MEMBLOCK_NONE, &start, &end, NULL) {
> +		if (end < buf_min)
> +			continue;
> +
> +		/* Memory hole not found */
> +		if (start > buf_max)
> +			break;
> +
> +		/* Adjust memory region based on the given range */
> +		if (start < buf_min)
> +			start = buf_min;
> +		if (end > buf_max)
> +			end = buf_max;

buf_max is an inclusive end address, right? Then this should read
`end = buf_max + 1`. Same thing in the top-down version above.

> +
> +		start = ALIGN(start, kbuf->buf_align);
> +		if (start < end && (end - start + 1) >= kbuf->memsz) {

Same off-by-one problem. There shouldn't be a `+ 1` here.

> +			/* Suitable memory range found. Set kbuf->mem */
> +			kbuf->mem = start;
> +			ret = 0;
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}


--
Thiago Jung Bauermann
IBM Linux Technology Center
