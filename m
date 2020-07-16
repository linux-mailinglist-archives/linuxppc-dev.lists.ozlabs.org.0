Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 463F32219D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 04:24:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6dNd51jfzDqNj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 12:24:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6dLt5G1DzDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 12:22:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B6dLt1DhKz8tSq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 12:22:30 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B6dLs5pMWz9sRK; Thu, 16 Jul 2020 12:22:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B6dLs2QJTz9sQt
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jul 2020 12:22:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06G27oP4089244; Wed, 15 Jul 2020 22:22:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329cum30m3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 22:22:18 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06G2CVpF102652;
 Wed, 15 Jul 2020 22:22:18 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329cum30kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 22:22:18 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06G2KZje025773;
 Thu, 16 Jul 2020 02:22:17 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 328ux7gkp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 02:22:17 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06G2MFI04850270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 02:22:15 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A318CBE053;
 Thu, 16 Jul 2020 02:22:15 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39B2EBE04F;
 Thu, 16 Jul 2020 02:22:12 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.73.114])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 16 Jul 2020 02:22:11 +0000 (GMT)
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466098739.24747.5860501703617893464.stgit@hbathini.in.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 10/12] ppc64/kexec_file: prepare elfcore header for
 crashing kernel
In-reply-to: <159466098739.24747.5860501703617893464.stgit@hbathini.in.ibm.com>
Date: Wed, 15 Jul 2020 23:22:08 -0300
Message-ID: <87tuy88ai7.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007160009
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

>  /**
> + * get_crash_memory_ranges - Get crash memory ranges. This list includes
> + *                           first/crashing kernel's memory regions that
> + *                           would be exported via an elfcore.
> + * @mem_ranges:              Range list to add the memory ranges to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int get_crash_memory_ranges(struct crash_mem **mem_ranges)
> +{
> +	struct memblock_region *reg;
> +	struct crash_mem *tmem;
> +	int ret;
> +
> +	for_each_memblock(memory, reg) {
> +		u64 base, size;
> +
> +		base = (u64)reg->base;
> +		size = (u64)reg->size;
> +
> +		/* Skip backup memory region, which needs a separate entry */
> +		if (base == BACKUP_SRC_START) {
> +			if (size > BACKUP_SRC_SIZE) {
> +				base = BACKUP_SRC_END + 1;
> +				size -= BACKUP_SRC_SIZE;
> +			} else
> +				continue;
> +		}
> +
> +		ret = add_mem_range(mem_ranges, base, size);
> +		if (ret)
> +			goto out;
> +
> +		/* Try merging adjacent ranges before reallocation attempt */
> +		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
> +			sort_memory_ranges(*mem_ranges, true);
> +	}
> +
> +	/* Reallocate memory ranges if there is no space to split ranges */
> +	tmem = *mem_ranges;
> +	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
> +		tmem = realloc_mem_ranges(mem_ranges);
> +		if (!tmem)
> +			goto out;
> +	}
> +
> +	/* Exclude crashkernel region */
> +	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_rtas_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_opal_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;

Maybe I'm confused, but don't you add the RTAS and OPAL regions as
usable memory for the crashkernel? In that case they shouldn't show up
in the core file.

> +
> +	/* create a separate program header for the backup region */
> +	ret = add_mem_range(mem_ranges, BACKUP_SRC_START, BACKUP_SRC_SIZE);
> +	if (ret)
> +		goto out;
> +
> +	sort_memory_ranges(*mem_ranges, false);
> +out:
> +	if (ret)
> +		pr_err("Failed to setup crash memory ranges\n");
> +	return ret;
> +}

<snip>

> +/**
> + * prepare_elf_headers - Prepare headers for the elfcore to be exported as
> + *                       /proc/vmcore by the kdump kernel.
> + * @image:               Kexec image.
> + * @cmem:                Crash memory ranges to be exported via elfcore.
> + * @addr:                Vmalloc'd memory allocated by crash_prepare_elf64_headers
> + *                       to prepare the elf headers.
> + * @sz:                  Size of the vmalloc'd memory allocated.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int prepare_elf_headers(struct kimage *image, struct crash_mem *cmem,
> +			       void **addr, unsigned long *sz)
> +{
> +	int ret;
> +
> +	ret = crash_prepare_elf64_headers(cmem, false, addr, sz);
> +
> +	/* Fix the offset for backup region in the ELF header */
> +	if (!ret)
> +		update_backup_region_phdr(image, *addr);
> +
> +	return ret;
> +}

The code above can be inlined into its caller, I don't see a need to
have a separate function.

> +
> +/**
> + * load_elfcorehdr_segment - Setup crash memory ranges and initialize elfcorehdr
> + *                           segment needed to load kdump kernel.
> + * @image:                   Kexec image.
> + * @kbuf:                    Buffer contents and memory parameters.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
> +{
> +	struct crash_mem *cmem = NULL;
> +	unsigned long headers_sz;
> +	void *headers = NULL;
> +	int ret;
> +
> +	ret = get_crash_memory_ranges(&cmem);
> +	if (ret)
> +		goto out;
> +
> +	/* Setup elfcorehdr segment */
> +	ret = prepare_elf_headers(image, cmem, &headers, &headers_sz);
> +	if (ret) {
> +		pr_err("Failed to prepare elf headers for the core\n");
> +		goto out;
> +	}
> +
> +	kbuf->buffer = headers;
> +	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
> +	kbuf->bufsz = kbuf->memsz = headers_sz;
> +	kbuf->top_down = false;
> +
> +	ret = kexec_add_buffer(kbuf);
> +	if (ret) {
> +		vfree(headers);
> +		goto out;
> +	}
> +
> +	image->arch.elfcorehdr_addr = kbuf->mem;
> +	image->arch.elf_headers_sz = headers_sz;
> +	image->arch.elf_headers = headers;
> +out:
> +	kfree(cmem);
> +	return ret;
> +}

--
Thiago Jung Bauermann
IBM Linux Technology Center
