Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859447C11E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 15:02:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJJ6f6HQ5z3bWC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 01:02:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NzgLPNLH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NzgLPNLH; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJJ5s1ZrKz2ynV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 01:01:20 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BLDe0Cd007258; 
 Tue, 21 Dec 2021 14:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Y2f1JQNiS0TkECCmHkDm6yIUjMCDTlb5T57vxkzTkfw=;
 b=NzgLPNLHcmIx4YuA5k/SH/RKRK1Z7XuLM1O63eg/eZpzQGqQCw7ni63kJTvpUKWTxcDj
 CaZZOoqzz8IfKk9oknUJ8FrKL9/PC0pG16viZOobfPRMzDxs9yrEzybyZ59quOwQ0Azt
 ULy+VwhwTRdbCqnRO1fX3m9TED82UW0s8nM2uPEH5gJfuzfXfQA/kCIJPUCixmqzmokn
 nkBZZ2Gbm0Xks3Ln3bOTT3mpf4twdjvoZwr3GkvG4CQ9h0v2KB3UWuUpkGF4LnQw0j4o
 b/PfjsfkgjYzbfedX83Z/ontygBgH0zyPqPwSuRtKEeHsOAqhxq89QSNFz1vsaNWGb39 EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3g0u8emv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 14:01:14 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BLDehno008320;
 Tue, 21 Dec 2021 14:01:14 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d3g0u8emf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 14:01:14 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BLDwHRb012382;
 Tue, 21 Dec 2021 14:01:13 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3d179ahx1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Dec 2021 14:01:13 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BLE19dV11075864
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 14:01:09 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9ED297805C;
 Tue, 21 Dec 2021 14:01:09 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB41878098;
 Tue, 21 Dec 2021 14:01:07 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 21 Dec 2021 14:01:07 +0000 (GMT)
Message-ID: <8b0c9683-d29b-38a2-8dfe-8f47db6544f2@linux.ibm.com>
Date: Tue, 21 Dec 2021 09:01:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] tpm: Fix kexec crash due to access to ops NULL pointer
 (powerpc)
Content-Language: en-US
To: Jarkko Sakkinen <jarkko@kernel.org>
References: <20211212012804.1555661-1-stefanb@linux.ibm.com>
 <YcGUoJCtmqfCWER0@iki.fi>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <YcGUoJCtmqfCWER0@iki.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YHJNSFTPngVAQ5P_j1u33_1jnTL2ToE9
X-Proofpoint-ORIG-GUID: RMqKfdeYynsKsm3JE-UXzhEFk2o4fXi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_04,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112210065
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
Cc: Korrapati.Likhitha@ibm.com, pavrampu@in.ibm.com,
 linux-kernel@vger.kernel.org, jgg@ziepe.ca,
 linux-security-module@vger.kernel.org, gcwilson@us.ibm.com, peterhuewe@gmx.de,
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 12/21/21 03:47, Jarkko Sakkinen wrote:
> On Sat, Dec 11, 2021 at 08:28:04PM -0500, Stefan Berger wrote:
>> Fix the following crash on kexec by checking chip->ops for a NULL pointer
>> in tpm_chip_start() and returning an error code if this is the case.
>>
>> BUG: Kernel NULL pointer dereference on read at 0x00000060
>> Faulting instruction address: 0xc00000000099a06c
>> Oops: Kernel access of bad area, sig: 11 [#1]
>> ...
>> NIP [c00000000099a06c] tpm_chip_start+0x2c/0x140
>>   LR [c00000000099a808] tpm_chip_unregister+0x108/0x170
>> Call Trace:
>> [c0000000188bfa00] [c000000002b03930] fw_devlink_strict+0x0/0x8 (unreliable)
>> [c0000000188bfa30] [c00000000099a808] tpm_chip_unregister+0x108/0x170
>> [c0000000188bfa70] [c0000000009a3874] tpm_ibmvtpm_remove+0x34/0x130
>> [c0000000188bfae0] [c000000000110dbc] vio_bus_remove+0x5c/0xb0
>> [c0000000188bfb20] [c0000000009bc154] device_shutdown+0x1d4/0x3a8
>> [c0000000188bfbc0] [c000000000196e14] kernel_restart_prepare+0x54/0x70
>>
>> The referenced patch below introduced a function to shut down the VIO bus.
>> The bus shutdown now calls tpm_del_char_device (via tpm_chip_unregister)
>> after a call to tpm_class_shutdown, which already set chip->ops to NULL.
>> The crash occurrs when tpm_del_char_device calls tpm_chip_start with the
>> chip->ops NULL pointer.
>>
>> Fixes: 39d0099f9439 ("powerpc/pseries: Add shutdown() to vio_driver and vio_bus")
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   drivers/char/tpm/tpm-chip.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
>> index ddaeceb7e109..cca1bde296ee 100644
>> --- a/drivers/char/tpm/tpm-chip.c
>> +++ b/drivers/char/tpm/tpm-chip.c
>> @@ -101,6 +101,9 @@ int tpm_chip_start(struct tpm_chip *chip)
>>   {
>>   	int ret;
>>   
>> +	if (!chip->ops)
>> +		return -EINVAL;
> This triggers to all drivers, not just tpm_ibmvtpm, i.e. the fix has
> side-effects.

What are those side-effects?

   Stefan

>
> /Jarkko
>
