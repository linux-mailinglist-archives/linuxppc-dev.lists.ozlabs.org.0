Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE4F5337AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 09:47:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7NT15H3sz3blk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 17:47:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZvVEcwe1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZvVEcwe1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7NSJ21nyz301F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 17:46:55 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24P6LIbc004833;
 Wed, 25 May 2022 07:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=AxKlKc5CFOm0zoKAftCrN6Z6eRFj3Yw1byWVrpghrWY=;
 b=ZvVEcwe1PlWUIUWrdVyP3XhQIVr2Q1JUjTqzarGcuRhC2zNnJDf7dm45IFEyz2tpLgee
 TzYoOrZqWv5ljmRv1oyJzhMnu+LrmKsdF2n9yTvm/x0ZezV7vRA0KlHgoskPJwijIDj5
 SM0dHInvmSsKgYIPwTgIWg831XjaPf2VjPCofBNVxw2veS3hd2yDDprnTrqa7uz2M5cG
 Y3QN2GrMky4ID8FSFDb4GW4oKRCEZXgYZpqa0+qjoVn587je8emQlE7F3pwXm765ULCk
 jClEnVeoQ0r7Mw5xWY7JP/bCgrRlUQTFYMWJO7jdZE8X5CExRInPjlO4xR8dUiM2b8fH aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9f45hj9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 07:46:44 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24P7SOYd024306;
 Wed, 25 May 2022 07:46:43 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9f45hj90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 07:46:43 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24P7NsmE022928;
 Wed, 25 May 2022 07:46:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3g93ur8k9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 07:46:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24P7kcHf25559388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 07:46:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D97D4C052;
 Wed, 25 May 2022 07:46:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60FA04C044;
 Wed, 25 May 2022 07:46:33 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.93.43])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 25 May 2022 07:46:33 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Wed, 25 May 2022 13:16:31 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Ritesh Harjani <ritesh.list@gmail.com>
Subject: Re: [PATCH v2] of: check previous kernel's ima-kexec-buffer against
 memory bounds
In-Reply-To: <20220525055149.f4nqx2ocnh3pqnpr@riteshh-domain>
References: <20220524055042.1527968-1-vaibhav@linux.ibm.com>
 <20220525055149.f4nqx2ocnh3pqnpr@riteshh-domain>
Date: Wed, 25 May 2022 13:16:31 +0530
Message-ID: <87leuqf414.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: manfk7lGh9YjRaxXAgcQiYfILbiqQ7Yv
X-Proofpoint-ORIG-GUID: ZFyYZaxBpM0_5EbZqJTLcrZOlPRz3P1-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_02,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205250035
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ritesh,
thanks for looking into this patch,

Ritesh Harjani <ritesh.list@gmail.com> writes:

> Just a minor nit which I noticed.
>
> On 22/05/24 11:20AM, Vaibhav Jain wrote:
>> Presently ima_get_kexec_buffer() doesn't check if the previous kernel's
>> ima-kexec-buffer lies outside the addressable memory range. This can result
>> in a kernel panic if the new kernel is booted with 'mem=X' arg and the
>> ima-kexec-buffer was allocated beyond that range by the previous kernel.
>> The panic is usually of the form below:
>>
>> $ sudo kexec --initrd initrd vmlinux --append='mem=16G'
>>
>> <snip>
>>  BUG: Unable to handle kernel data access on read at 0xc000c01fff7f0000
>>  Faulting instruction address: 0xc000000000837974
>>  Oops: Kernel access of bad area, sig: 11 [#1]
>> <snip>
>>  NIP [c000000000837974] ima_restore_measurement_list+0x94/0x6c0
>>  LR [c00000000083b55c] ima_load_kexec_buffer+0xac/0x160
>>  Call Trace:
>>  [c00000000371fa80] [c00000000083b55c] ima_load_kexec_buffer+0xac/0x160
>>  [c00000000371fb00] [c0000000020512c4] ima_init+0x80/0x108
>>  [c00000000371fb70] [c0000000020514dc] init_ima+0x4c/0x120
>>  [c00000000371fbf0] [c000000000012240] do_one_initcall+0x60/0x2c0
>>  [c00000000371fcc0] [c000000002004ad0] kernel_init_freeable+0x344/0x3ec
>>  [c00000000371fda0] [c0000000000128a4] kernel_init+0x34/0x1b0
>>  [c00000000371fe10] [c00000000000ce64] ret_from_kernel_thread+0x5c/0x64
>>  Instruction dump:
>>  f92100b8 f92100c0 90e10090 910100a0 4182050c 282a0017 3bc00000 40810330
>>  7c0802a6 fb610198 7c9b2378 f80101d0 <a1240000> 2c090001 40820614 e9240010
>>  ---[ end trace 0000000000000000 ]---
>>
>> Fix this issue by checking returned PFN range of previous kernel's
>> ima-kexec-buffer with pfn_valid to ensure correct memory bounds.
>>
>> Fixes: 467d27824920 ("powerpc: ima: get the kexec buffer passed by the previous kernel")
>> Cc: Frank Rowand <frowand.list@gmail.com>
>> Cc: Prakhar Srivastava <prsriva@linux.microsoft.com>
>> Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
>> Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> Cc: Rob Herring <robh@kernel.org>
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>>
>> ---
>> Changelog
>> ==========
>>
>> v2:
>> * Instead of using memblock to determine the valid bounds use pfn_valid() to do
>> so since memblock may not be available late after the kernel init. [ Mpe ]
>> * Changed the patch prefix from 'powerpc' to 'of' [ Mpe ]
>> * Updated the 'Fixes' tag to point to correct commit that introduced this
>> function. [ Rob ]
>> * Fixed some whitespace/tab issues in the patch description [ Rob ]
>> * Added another check for checking ig 'tmp_size' for ima-kexec-buffer is > 0
>> ---
>>  drivers/of/kexec.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
>> index 8d374cc552be..879e984fe901 100644
>> --- a/drivers/of/kexec.c
>> +++ b/drivers/of/kexec.c
>> @@ -126,6 +126,7 @@ int ima_get_kexec_buffer(void **addr, size_t *size)
>>  {
>>  	int ret, len;
>>  	unsigned long tmp_addr;
>> +	unsigned int start_pfn, end_pfn;
>
> ^^^ Shouldn't this be unsigned long?
Thanks for catching this. Yes that should be 'unsigned long'. Will
resend the patch with this fixed.

>
> -ritesh
>
>>  	size_t tmp_size;
>>  	const void *prop;
>>
>> @@ -140,6 +141,22 @@ int ima_get_kexec_buffer(void **addr, size_t *size)
>>  	if (ret)
>>  		return ret;
>>
>> +	/* Do some sanity on the returned size for the ima-kexec buffer */
>> +	if (!tmp_size)
>> +		return -ENOENT;
>> +
>> +	/*
>> +	 * Calculate the PFNs for the buffer and ensure
>> +	 * they are with in addressable memory.
>> +	 */
>> +	start_pfn = PHYS_PFN(tmp_addr);
>> +	end_pfn = PHYS_PFN(tmp_addr + tmp_size - 1);
>> +	if (!pfn_valid(start_pfn) || !pfn_valid(end_pfn)) {
>> +		pr_warn("IMA buffer at 0x%lx, size = 0x%zx beyond memory\n",
>> +			tmp_addr, tmp_size);
>> +		return -EINVAL;
>> +	}
>> +
>>  	*addr = __va(tmp_addr);
>>  	*size = tmp_size;
>>
>> --
>> 2.35.1
>>

-- 
Cheers
~ Vaibhav
