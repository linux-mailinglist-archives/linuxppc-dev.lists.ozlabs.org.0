Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25086222E68
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:08:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B77gM3Zr6zDrB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 08:08:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B77d86w47zDqjJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 08:06:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B77d85nfbz8tFl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 08:06:36 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B77d852B9z9sRf; Fri, 17 Jul 2020 08:06:36 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4B77d80ljLz9sRW
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Jul 2020 08:06:35 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06GM3tGU136868; Thu, 16 Jul 2020 18:06:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32ax789gnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 18:06:31 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06GM4Yb7140217;
 Thu, 16 Jul 2020 18:06:31 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32ax789gnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 18:06:30 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06GM59LO018012;
 Thu, 16 Jul 2020 22:06:30 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 327529c2fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 22:06:30 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06GM6Tnu53215548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 22:06:29 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C841CAE073;
 Thu, 16 Jul 2020 22:06:29 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05BBDAE079;
 Thu, 16 Jul 2020 22:06:24 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.8.110])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 16 Jul 2020 22:06:24 +0000 (GMT)
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466096898.24747.16701009925943468066.stgit@hbathini.in.ibm.com>
 <87y2nk8cjq.fsf@morokweng.localdomain>
 <bea19627-c6b7-5d59-e194-03038bb4d9f6@linux.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 09/12] ppc64/kexec_file: setup backup region for kdump
 kernel
In-reply-to: <bea19627-c6b7-5d59-e194-03038bb4d9f6@linux.ibm.com>
Date: Thu, 16 Jul 2020 19:06:20 -0300
Message-ID: <874kq7cdyb.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
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
 definitions=main-2007160142
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
Cc: kernel test robot <lkp@intel.com>, Pingfan Liu <piliu@redhat.com>,
 Petr Tesarik <ptesarik@suse.cz>, Nayna Jain <nayna@linux.ibm.com>,
 Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hari Bathini <hbathini@linux.ibm.com> writes:

> On 16/07/20 7:08 am, Thiago Jung Bauermann wrote:
>>
>> Hari Bathini <hbathini@linux.ibm.com> writes:
>>
>>> @@ -968,7 +1040,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>>>
>>>  	/*
>>>  	 * Restrict memory usage for kdump kernel by setting up
>>> -	 * usable memory ranges.
>>> +	 * usable memory ranges and memory reserve map.
>>>  	 */
>>>  	if (image->type == KEXEC_TYPE_CRASH) {
>>>  		ret = get_usable_memory_ranges(&umem);
>>> @@ -980,6 +1052,24 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>>>  			pr_err("Error setting up usable-memory property for kdump kernel\n");
>>>  			goto out;
>>>  		}
>>> +
>>> +		ret = fdt_add_mem_rsv(fdt, BACKUP_SRC_START + BACKUP_SRC_SIZE,
>>> +				      crashk_res.start - BACKUP_SRC_SIZE);
>>
>> I believe this answers my question from the other email about how the
>> crashkernel is prevented from stomping in the crashed kernel's memory,
>> right? I needed to think for a bit to understand what the above
>> reservation was protecting. I think it's worth adding a comment.
>
> Right. The reason to add it in the first place is, prom presses the panic button if
> it can't find low memory. Marking it reserved seems to keep it quiet though. so..
>
> Will add comment mentioning that..

Ah, makes sense. Thanks for the explanation.

>>> +void purgatory(void)
>>> +{
>>> +	void *dest, *src;
>>> +
>>> +	src = (void *)BACKUP_SRC_START;
>>> +	if (backup_start) {
>>> +		dest = (void *)backup_start;
>>> +		__memcpy(dest, src, BACKUP_SRC_SIZE);
>>> +	}
>>> +}
>>
>> In general I'm in favor of using C code over assembly, but having to
>> bring in that relocation support just for the above makes me wonder if
>> it's worth it in this case.
>
> I am planning to build on purgatory later with "I'm in purgatory" print support
> for pseries at least and also, sha256 digest check.

Ok. In that case, my preference would be to convert both the powerpc and
x86 purgatories to PIE since this greatly reduces the types of
relocations that are emitted, but better ask Dave Young what he thinks
before going down that route.

--
Thiago Jung Bauermann
IBM Linux Technology Center
