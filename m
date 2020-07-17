Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C53812244DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 22:02:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7hqq0VrBzDrVP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 06:02:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7hnC2mJRzDrRM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 06:00:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B7hnC1Rbbz9CMP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 06:00:31 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B7hnC0xVqz9sSn; Sat, 18 Jul 2020 06:00:31 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4B7hnB48JLz9sRk
 for <linuxppc-dev@ozlabs.org>; Sat, 18 Jul 2020 06:00:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HJWejB000636; Fri, 17 Jul 2020 16:00:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32aurbp35e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 16:00:23 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06HJWfw6000844;
 Fri, 17 Jul 2020 16:00:22 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32aurbp345-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 16:00:22 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06HJfp9V015856;
 Fri, 17 Jul 2020 20:00:20 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 327527y1vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 20:00:20 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06HK0HWS25625038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 20:00:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CB8811C069;
 Fri, 17 Jul 2020 20:00:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34F8711C04C;
 Fri, 17 Jul 2020 20:00:14 +0000 (GMT)
Received: from [9.102.22.153] (unknown [9.102.22.153])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jul 2020 20:00:13 +0000 (GMT)
Subject: Re: [PATCH v3 03/12] powerpc/kexec_file: add helper functions for
 getting memory ranges
From: Hari Bathini <hbathini@linux.ibm.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466087136.24747.16494497863685481495.stgit@hbathini.in.ibm.com>
 <874kq98xo4.fsf@morokweng.localdomain>
 <0684ed3d-0dde-8dce-f12c-72ef86bc91f9@linux.ibm.com>
Message-ID: <1b09c0e4-54c9-7dd6-4402-81c9d1ba3ee0@linux.ibm.com>
Date: Sat, 18 Jul 2020 01:30:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0684ed3d-0dde-8dce-f12c-72ef86bc91f9@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_09:2020-07-17,
 2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 mlxscore=100
 adultscore=0 mlxlogscore=-1000 suspectscore=0 clxscore=1015 bulkscore=0
 spamscore=100 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007170131
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



On 17/07/20 10:02 am, Hari Bathini wrote:
> 
> 
> On 15/07/20 5:19 am, Thiago Jung Bauermann wrote:
>>
>> Hello Hari,
>>
>> Hari Bathini <hbathini@linux.ibm.com> writes:
>>
>>> In kexec case, the kernel to be loaded uses the same memory layout as
>>> the running kernel. So, passing on the DT of the running kernel would
>>> be good enough.
>>>
>>> But in case of kdump, different memory ranges are needed to manage
>>> loading the kdump kernel, booting into it and exporting the elfcore
>>> of the crashing kernel. The ranges are exlude memory ranges, usable
>>
>> s/exlude/exclude/
>>
>>> memory ranges, reserved memory ranges and crash memory ranges.
>>>
>>> Exclude memory ranges specify the list of memory ranges to avoid while
>>> loading kdump segments. Usable memory ranges list the memory ranges
>>> that could be used for booting kdump kernel. Reserved memory ranges
>>> list the memory regions for the loading kernel's reserve map. Crash
>>> memory ranges list the memory ranges to be exported as the crashing
>>> kernel's elfcore.
>>>
>>> Add helper functions for setting up the above mentioned memory ranges.
>>> This helpers facilitate in understanding the subsequent changes better
>>> and make it easy to setup the different memory ranges listed above, as
>>> and when appropriate.
>>>
>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>> Tested-by: Pingfan Liu <piliu@redhat.com>
>>
> 
> <snip>
> 
>>> +/**
>>> + * add_reserved_ranges - Adds "/reserved-ranges" regions exported by f/w
>>> + *                       to the given memory ranges list.
>>> + * @mem_ranges:          Range list to add the memory ranges to.
>>> + *
>>> + * Returns 0 on success, negative errno on error.
>>> + */
>>> +int add_reserved_ranges(struct crash_mem **mem_ranges)
>>> +{
>>> +	int i, len, ret = 0;
>>> +	const __be32 *prop;
>>> +
>>> +	prop = of_get_property(of_root, "reserved-ranges", &len);
>>> +	if (!prop)
>>> +		return 0;
>>> +
>>> +	/*
>>> +	 * Each reserved range is an (address,size) pair, 2 cells each,
>>> +	 * totalling 4 cells per range.
>>
>> Can you assume that, or do you need to check the #address-cells and
>> #size-cells properties of the root node?
> 
> Taken from early_reserve_mem_dt() which did not seem to care.
> Should we be doing any different here?

On second thoughts, wouldn't hurt to be extra cautious. Will use
#address-cells & #size-cells to parse reserved-ranges.

Thanks
Hari
