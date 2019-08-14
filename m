Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2F68CC4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 09:08:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467gf90z6dzDqjx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 17:08:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467gcD5D5CzDqjH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:06:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 467gcD3jS4z8x3p
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:06:36 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 467gcD2fPHz9sN1; Wed, 14 Aug 2019 17:06:36 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 467gcC4Hy4z9sBF
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 17:06:35 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7E71eAu080289
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 03:06:32 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uca60y7sr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 03:06:32 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 14 Aug 2019 08:06:30 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 14 Aug 2019 08:06:27 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7E76Qrc49217612
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 07:06:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3011B11C04A;
 Wed, 14 Aug 2019 07:06:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C97311C05C;
 Wed, 14 Aug 2019 07:06:24 +0000 (GMT)
Received: from [9.199.56.240] (unknown [9.199.56.240])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Aug 2019 07:06:23 +0000 (GMT)
Subject: Re: [PATCH v4 11/25] powernv/fadump: register kernel metadata address
 with opal
To: mahesh@linux.vnet.ibm.com
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327679568.27462.14864917663459855788.stgit@hbathini.in.ibm.com>
 <20190813104137.xsyommcjdrnpa6u6@in.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Wed, 14 Aug 2019 12:36:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813104137.xsyommcjdrnpa6u6@in.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19081407-0008-0000-0000-00000308FB3B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081407-0009-0000-0000-00004A271092
Message-Id: <6d34b5d7-5183-6222-1bdb-5b1b7291fc0a@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140067
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Stewart Smith <stewart@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/08/19 4:11 PM, Mahesh J Salgaonkar wrote:
> On 2019-07-16 17:03:15 Tue, Hari Bathini wrote:
>> OPAL allows registering address with it in the first kernel and
>> retrieving it after MPIPL. Setup kernel metadata and register its
>> address with OPAL to use it for processing the crash dump.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>  arch/powerpc/kernel/fadump-common.h          |    4 +
>>  arch/powerpc/kernel/fadump.c                 |   65 ++++++++++++++---------
>>  arch/powerpc/platforms/powernv/opal-fadump.c |   73 ++++++++++++++++++++++++++
>>  arch/powerpc/platforms/powernv/opal-fadump.h |   37 +++++++++++++
>>  arch/powerpc/platforms/pseries/rtas-fadump.c |   32 +++++++++--
>>  5 files changed, 177 insertions(+), 34 deletions(-)
>>  create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.h
>>
> [...]
>> @@ -346,30 +349,42 @@ int __init fadump_reserve_mem(void)
>>  		 * use memblock_find_in_range() here since it doesn't allocate
>>  		 * from bottom to top.
>>  		 */
>> -		for (base = fw_dump.boot_memory_size;
>> -		     base <= (memory_boundary - size);
>> -		     base += size) {
>> +		while (base <= (memory_boundary - size)) {
>>  			if (memblock_is_region_memory(base, size) &&
>>  			    !memblock_is_region_reserved(base, size))
>>  				break;
>> +
>> +			base += size;
>>  		}
>> -		if ((base > (memory_boundary - size)) ||
>> -		    memblock_reserve(base, size)) {
>> +
>> +		if (base > (memory_boundary - size)) {
>> +			pr_err("Failed to find memory chunk for reservation\n");
>> +			goto error_out;
>> +		}
>> +		fw_dump.reserve_dump_area_start = base;
>> +
>> +		/*
>> +		 * Calculate the kernel metadata address and register it with
>> +		 * f/w if the platform supports.
>> +		 */
>> +		if (fw_dump.ops->setup_kernel_metadata(&fw_dump) < 0)
>> +			goto error_out;
> 
> I see setup_kernel_metadata() registers the metadata address with opal without
> having any minimum data initialized in it. Secondaly, why can't this wait until> registration ? I think we should defer this until fadump registration.

If setting up metadata address fails (it should ideally not fail, but..), everything else
is useless. So, we might as well try that early and fall back to KDump in case of an error..

> What if kernel crashes before metadata area is initialized ?

registered_regions would be '0'. So, it is treated as fadump is not registered case. Let me
initialize metadata explicitly before registering the address with f/w to avoid any assumption...

> 
>> +
>> +		if (memblock_reserve(base, size)) {
>>  			pr_err("Failed to reserve memory\n");
>> -			return 0;
>> +			goto error_out;
>>  		}
> [...]
>> -
>>  static struct fadump_ops rtas_fadump_ops = {
>> -	.init_fadump_mem_struct	= rtas_fadump_init_mem_struct,
>> -	.register_fadump	= rtas_fadump_register_fadump,
>> -	.unregister_fadump	= rtas_fadump_unregister_fadump,
>> -	.invalidate_fadump	= rtas_fadump_invalidate_fadump,
>> -	.process_fadump		= rtas_fadump_process_fadump,
>> -	.fadump_region_show	= rtas_fadump_region_show,
>> -	.fadump_trigger		= rtas_fadump_trigger,
>> +	.init_fadump_mem_struct		= rtas_fadump_init_mem_struct,
>> +	.get_kernel_metadata_size	= rtas_fadump_get_kernel_metadata_size,
>> +	.setup_kernel_metadata		= rtas_fadump_setup_kernel_metadata,
>> +	.register_fadump		= rtas_fadump_register_fadump,
>> +	.unregister_fadump		= rtas_fadump_unregister_fadump,
>> +	.invalidate_fadump		= rtas_fadump_invalidate_fadump,
>> +	.process_fadump			= rtas_fadump_process_fadump,
>> +	.fadump_region_show		= rtas_fadump_region_show,
>> +	.fadump_trigger			= rtas_fadump_trigger,
> 
> Can you make the tab space changes in your previous patch where these
> were initially introduced ? So that this patch can only show new members
> that are added.

done.

Thanks
Hari

