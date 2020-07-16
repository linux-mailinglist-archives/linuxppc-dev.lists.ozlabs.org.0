Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB987222D77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:10:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B76Nk2SMNzDr7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 07:10:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B76Km2BNvzDr76
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 07:08:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B76Km13yXz8tPV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 07:08:12 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B76Km0XX9z9sRW; Fri, 17 Jul 2020 07:08:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B76Kl3bhYz9sRR
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Jul 2020 07:08:10 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06GL3Hew187534; Thu, 16 Jul 2020 17:08:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32ax788gna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 17:08:06 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06GL3LO6188037;
 Thu, 16 Jul 2020 17:08:05 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32ax788gmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 17:08:05 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06GL6lTn011429;
 Thu, 16 Jul 2020 21:08:03 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 328rbqst6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 21:08:03 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06GL80vd54198472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 21:08:00 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80CECAE053;
 Thu, 16 Jul 2020 21:08:00 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 541C9AE051;
 Thu, 16 Jul 2020 21:07:57 +0000 (GMT)
Received: from [9.102.2.181] (unknown [9.102.2.181])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jul 2020 21:07:57 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 10/12] ppc64/kexec_file: prepare elfcore header for
 crashing kernel
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466098739.24747.5860501703617893464.stgit@hbathini.in.ibm.com>
 <87tuy88ai7.fsf@morokweng.localdomain>
Message-ID: <929db6fe-b221-a514-8ea1-93227f8d47b0@linux.ibm.com>
Date: Fri, 17 Jul 2020 02:37:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87tuy88ai7.fsf@morokweng.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_11:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 bulkscore=0
 adultscore=0 spamscore=100 priorityscore=1501 mlxscore=100
 mlxlogscore=-1000 phishscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007160140
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



On 16/07/20 7:52 am, Thiago Jung Bauermann wrote:
> 
> Hari Bathini <hbathini@linux.ibm.com> writes:
> 
>>  /**
>> + * get_crash_memory_ranges - Get crash memory ranges. This list includes
>> + *                           first/crashing kernel's memory regions that
>> + *                           would be exported via an elfcore.
>> + * @mem_ranges:              Range list to add the memory ranges to.
>> + *
>> + * Returns 0 on success, negative errno on error.
>> + */
>> +static int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>> +{
>> +	struct memblock_region *reg;
>> +	struct crash_mem *tmem;
>> +	int ret;
>> +
>> +	for_each_memblock(memory, reg) {
>> +		u64 base, size;
>> +
>> +		base = (u64)reg->base;
>> +		size = (u64)reg->size;
>> +
>> +		/* Skip backup memory region, which needs a separate entry */
>> +		if (base == BACKUP_SRC_START) {
>> +			if (size > BACKUP_SRC_SIZE) {
>> +				base = BACKUP_SRC_END + 1;
>> +				size -= BACKUP_SRC_SIZE;
>> +			} else
>> +				continue;
>> +		}
>> +
>> +		ret = add_mem_range(mem_ranges, base, size);
>> +		if (ret)
>> +			goto out;
>> +
>> +		/* Try merging adjacent ranges before reallocation attempt */
>> +		if ((*mem_ranges)->nr_ranges == (*mem_ranges)->max_nr_ranges)
>> +			sort_memory_ranges(*mem_ranges, true);
>> +	}
>> +
>> +	/* Reallocate memory ranges if there is no space to split ranges */
>> +	tmem = *mem_ranges;
>> +	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
>> +		tmem = realloc_mem_ranges(mem_ranges);
>> +		if (!tmem)
>> +			goto out;
>> +	}
>> +
>> +	/* Exclude crashkernel region */
>> +	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = add_rtas_mem_range(mem_ranges);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = add_opal_mem_range(mem_ranges);
>> +	if (ret)
>> +		goto out;
> 
> Maybe I'm confused, but don't you add the RTAS and OPAL regions as
> usable memory for the crashkernel? In that case they shouldn't show up
> in the core file.

kexec-tools does the same thing. I am not endorsing it but I was trying to stay
in parity to avoid breaking any userspace tools/commands. But as you rightly
pointed, this is NOT right. The right thing to do, to get the rtas/opal data at
the time of crash, is to have a backup region for them just like we have for
the first 64K memory. I was hoping to do that later.

Will check how userspace tools respond to dropping these regions. If that makes
the tools unhappy, will retain the regions with a FIXME. Sorry about the confusion.

Thanks
Hari
