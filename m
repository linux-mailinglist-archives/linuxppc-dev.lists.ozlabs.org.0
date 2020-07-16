Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD29222D84
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:14:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B76T96FTtzDrC8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 07:14:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B76MG3SRLzDr8H
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 07:09:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B76MG28zsz8tPV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 07:09:30 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B76MG1lB6z9sRW; Fri, 17 Jul 2020 07:09:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B76MF5Cz5z9sRR
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Jul 2020 07:09:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06GL3Xv8109986; Thu, 16 Jul 2020 17:09:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32aurams6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 17:09:24 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06GL3cfW110485;
 Thu, 16 Jul 2020 17:09:24 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32aurams6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 17:09:24 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06GKpmvU028550;
 Thu, 16 Jul 2020 21:09:21 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 327527x097-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 21:09:21 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06GL9Isq47645114
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 21:09:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9B8EAE045;
 Thu, 16 Jul 2020 21:09:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D321AE04D;
 Thu, 16 Jul 2020 21:09:15 +0000 (GMT)
Received: from [9.102.2.181] (unknown [9.102.2.181])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jul 2020 21:09:15 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 04/12] ppc64/kexec_file: avoid stomping memory used by
 special regions
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466088775.24747.1248185448154277951.stgit@hbathini.in.ibm.com>
 <87365t8pse.fsf@morokweng.localdomain>
Message-ID: <0582476e-415e-3f60-2bb2-6199d0340156@linux.ibm.com>
Date: Fri, 17 Jul 2020 02:39:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87365t8pse.fsf@morokweng.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_11:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 mlxscore=100
 adultscore=0 mlxlogscore=-1000 suspectscore=0 clxscore=1015 bulkscore=0
 spamscore=100 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007160139
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



On 15/07/20 8:09 am, Thiago Jung Bauermann wrote:
> 
> Hari Bathini <hbathini@linux.ibm.com> writes:
> 

<snip>
 
>> +/**
>> + * __locate_mem_hole_top_down - Looks top down for a large enough memory hole
>> + *                              in the memory regions between buf_min & buf_max
>> + *                              for the buffer. If found, sets kbuf->mem.
>> + * @kbuf:                       Buffer contents and memory parameters.
>> + * @buf_min:                    Minimum address for the buffer.
>> + * @buf_max:                    Maximum address for the buffer.
>> + *
>> + * Returns 0 on success, negative errno on error.
>> + */
>> +static int __locate_mem_hole_top_down(struct kexec_buf *kbuf,
>> +				      u64 buf_min, u64 buf_max)
>> +{
>> +	int ret = -EADDRNOTAVAIL;
>> +	phys_addr_t start, end;
>> +	u64 i;
>> +
>> +	for_each_mem_range_rev(i, &memblock.memory, NULL, NUMA_NO_NODE,
>> +			       MEMBLOCK_NONE, &start, &end, NULL) {
>> +		if (start > buf_max)
>> +			continue;
>> +
>> +		/* Memory hole not found */
>> +		if (end < buf_min)
>> +			break;
>> +
>> +		/* Adjust memory region based on the given range */
>> +		if (start < buf_min)
>> +			start = buf_min;
>> +		if (end > buf_max)
>> +			end = buf_max;
>> +
>> +		start = ALIGN(start, kbuf->buf_align);
>> +		if (start < end && (end - start + 1) >= kbuf->memsz) {
> 
> This is why I dislike using start and end to express address ranges:
> 
> While struct resource seems to use the [address, end] convention, my

struct crash_mem also uses [address, end] convention.
This off-by-one error did not cause any issues as the hole start and size we try to find
are at least page aligned.

Nonetheless, I think fixing 'end' early in the loop with "end -= 1" would ensure
correctness while continuing to use the same convention for structs crash_mem & resource.

Thanks
Hari
