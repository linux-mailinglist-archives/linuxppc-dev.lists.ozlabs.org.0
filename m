Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E90CD90BB81
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 21:57:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ibXnG1Ve;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W30yz4xnjz3gDR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 05:57:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ibXnG1Ve;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W30yH0xt2z3g8g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 05:56:38 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HJ01b2024582;
	Mon, 17 Jun 2024 19:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=5
	gTrKfTGK7nkUx0z1WmZsTK++4OVmR4Dpoli52j9yRw=; b=ibXnG1VeyRbwgtzb9
	AJPdHgM6gn9rgUXKRMT1AcTKcVbyjtkRQOFOWk46J7gG7pwykeY/5ExqNv/uqiZ3
	lgVA81hBm2F6JDU0IY2jAEHGy0odTUTT4QqwEil0jPtVpZoftwSqQhaYRFCM6inV
	AUv7T175gsvVfCu77w3Elsx3us3w/SFwFMrP8f7/QMy3U3GVcZoqCnUasRKU/eMU
	iPcxfWhWowiK2mz+/z/AGfe3ngkaE3SHJhNtJ5+jN8dwKdXdHqIe0pCMEz0cmeY3
	mqFlgbKa4FHM2GlcKNwk6tLWLOZiVNlKzOo8hqgxqW8Z+mYOOHr3xGwSUQBPhyK9
	tOd4Q==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yttwc840t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 19:56:29 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45HIK70b011442;
	Mon, 17 Jun 2024 19:56:29 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yspsmvtp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 19:56:29 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45HJuQWT38469990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2024 19:56:28 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87BDA58069;
	Mon, 17 Jun 2024 19:56:26 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08CAB5805D;
	Mon, 17 Jun 2024 19:56:26 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jun 2024 19:56:25 +0000 (GMT)
Message-ID: <5bd68636-ece6-4ba5-a4c0-c0535afc33c8@linux.ibm.com>
Date: Mon, 17 Jun 2024 15:56:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        jarkko@kernel.org
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
 <dfc4feaef0d63d616bab8cdec5d409369f9dacf1.camel@HansenPartnership.com>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <dfc4feaef0d63d616bab8cdec5d409369f9dacf1.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R6DyKD6fRPgMFtsS9Tn2awO1IbQ2YzPy
X-Proofpoint-GUID: R6DyKD6fRPgMFtsS9Tn2awO1IbQ2YzPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1011 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406170153
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
Cc: naveen.n.rao@linux.ibm.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/17/24 15:42, James Bottomley wrote:
> On Mon, 2024-06-17 at 15:34 -0400, Stefan Berger wrote:
>> Fix the following type of error message caused by a missing call to
>> tpm2_sessions_init() in the IBM vTPM driver:
>>
>> [    2.987131] tpm tpm0: tpm2_load_context: failed with a TPM error
>> 0x01C4
>> [    2.987140] ima: Error Communicating to TPM chip, result: -14
>>
>> Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   drivers/char/tpm/tpm_ibmvtpm.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c
>> b/drivers/char/tpm/tpm_ibmvtpm.c
>> index d3989b257f42..1e5b107d1f3b 100644
>> --- a/drivers/char/tpm/tpm_ibmvtpm.c
>> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
>> @@ -698,6 +698,10 @@ static int tpm_ibmvtpm_probe(struct vio_dev
>> *vio_dev,
>>                  rc = tpm2_get_cc_attrs_tbl(chip);
>>                  if (rc)
>>                          goto init_irq_cleanup;
>> +
>> +               rc = tpm2_sessions_init(chip);
>> +               if (rc)
>> +                       goto init_irq_cleanup;
> 
> This looks wrong: the whole thing is designed to occur in the bootstrap
> phase from tpm_chip_register() (which tpm_ibmvtpm.c definitely calls),
> so why isn't it happening?

Because flags = TPM_OPS_AUTO_STARTUP has not been set for this driver.
> 
> James
> 
