Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24635222E47
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:59:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B77ST4jSMzDr6w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 07:59:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B77Qf2BR5zDr68
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 07:57:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B77Qd2sc9z8tX6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 07:57:29 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B77Qd2DzQz9sRW; Fri, 17 Jul 2020 07:57:29 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4B77Qc4zGFz9sRN
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Jul 2020 07:57:27 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06GL3GIM074078; Thu, 16 Jul 2020 17:57:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32aut4dns4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 17:57:23 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06GLTWFM139142;
 Thu, 16 Jul 2020 17:57:23 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32aut4dnrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 17:57:23 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06GLk9b6016594;
 Thu, 16 Jul 2020 21:57:22 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 327529xy0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 21:57:22 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06GLvLTo58786132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 21:57:21 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 032F9BE051;
 Thu, 16 Jul 2020 21:57:21 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF126BE04F;
 Thu, 16 Jul 2020 21:57:17 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.8.110])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 16 Jul 2020 21:57:17 +0000 (GMT)
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466098739.24747.5860501703617893464.stgit@hbathini.in.ibm.com>
 <87tuy88ai7.fsf@morokweng.localdomain>
 <929db6fe-b221-a514-8ea1-93227f8d47b0@linux.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 10/12] ppc64/kexec_file: prepare elfcore header for
 crashing kernel
In-reply-to: <929db6fe-b221-a514-8ea1-93227f8d47b0@linux.ibm.com>
Date: Thu, 16 Jul 2020 18:57:15 -0300
Message-ID: <87a6zzcedg.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_11:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 spamscore=100
 suspectscore=0 impostorscore=0 mlxlogscore=-1000 lowpriorityscore=0
 mlxscore=100 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007160140
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
Cc: Pingfan Liu <piliu@redhat.com>, Petr Tesarik <ptesarik@suse.cz>,
 Nayna Jain <nayna@linux.ibm.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hari Bathini <hbathini@linux.ibm.com> writes:

> On 16/07/20 7:52 am, Thiago Jung Bauermann wrote:
>> 
>> Hari Bathini <hbathini@linux.ibm.com> writes:
>> 
>>>  /**
>>> + * get_crash_memory_ranges - Get crash memory ranges. This list includes
>>> + *                           first/crashing kernel's memory regions that
>>> + *                           would be exported via an elfcore.
>>> + * @mem_ranges:              Range list to add the memory ranges to.
>>> + *
>>> + * Returns 0 on success, negative errno on error.
>>> + */
>>> +static int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>>> +{
>>> +	struct memblock_region *reg;
>>> +	struct crash_mem *tmem;
>>> +	int ret;
>>> +
>>> +	for_each_memblock(memory, reg) {
>>> +		u64 base, size;
>>> +
>>> +		base = (u64)reg->base;
>>> +		size = (u64)reg->size;
>>> +
>>> +		/* Skip backup memory region, which needs a separate entry */
>>> +		if (base == BACKUP_SRC_START) {
>>> +			if (size > BACKUP_SRC_SIZE) {
>>> +				base = BACKUP_SRC_END + 1;
>>> +				size -= BACKUP_SRC_SIZE;
>>> +			} else
>>> +				continue;
>>> +		}
>>> +
>>> +		ret = add_mem_range(mem_ranges, base, size);
>>> +		if (ret)
>>> +			goto out;
>>> +
>>> +		/* Try merging adjacent ranges before reallocation attempt */
>>> +		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
>>> +			sort_memory_ranges(*mem_ranges, true);
>>> +	}
>>> +
>>> +	/* Reallocate memory ranges if there is no space to split ranges */
>>> +	tmem = *mem_ranges;
>>> +	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
>>> +		tmem = realloc_mem_ranges(mem_ranges);
>>> +		if (!tmem)
>>> +			goto out;
>>> +	}
>>> +
>>> +	/* Exclude crashkernel region */
>>> +	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
>>> +	if (ret)
>>> +		goto out;
>>> +
>>> +	ret = add_rtas_mem_range(mem_ranges);
>>> +	if (ret)
>>> +		goto out;
>>> +
>>> +	ret = add_opal_mem_range(mem_ranges);
>>> +	if (ret)
>>> +		goto out;
>> 
>> Maybe I'm confused, but don't you add the RTAS and OPAL regions as
>> usable memory for the crashkernel? In that case they shouldn't show up
>> in the core file.
>
> kexec-tools does the same thing. I am not endorsing it but I was trying to stay
> in parity to avoid breaking any userspace tools/commands. But as you rightly
> pointed, this is NOT right. The right thing to do, to get the rtas/opal data at
> the time of crash, is to have a backup region for them just like we have for
> the first 64K memory. I was hoping to do that later.
>
> Will check how userspace tools respond to dropping these regions. If that makes
> the tools unhappy, will retain the regions with a FIXME. Sorry about the confusion.

No problem, thanks for the clarification.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
