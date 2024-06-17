Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 886CC90BBE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 22:18:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ItABGs4l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W31Rx2mP2z3gGD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 06:18:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ItABGs4l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W31RD5SF3z3gDK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 06:18:16 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HJ01c7024582;
	Mon, 17 Jun 2024 20:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=4
	BfO0A59aeS+EuUXkTmQ/GMv6VbFKK1FWKlArNStJBg=; b=ItABGs4lJF8StiMZq
	J03TJRm5nzALh24wV6g2ruRK/VxkH6lvOM8sRL19pOIQGPX5MWwbeTkjh+Xlm+eX
	cYwx7NFUk9JVqNea3PkjYlTYU+OptSjVWN7SCx8ODufVWsyoW9+RH819SWXmRUQ8
	iN2mLtBMCo5naNq9ZZnHpMMRl8PoZXXX28jv+K/cj3nX/GeL4y/I3QsCzt7pcjJl
	qH42MfpnqldrLxJ2IROrv6+PnZZbHcc55bfCxH0BdMtdJtzBQ+OYQ86/sN0wOdSt
	g3mNsnEb2juOPJpWAB+eImChxqhlJ4Th//OYsSLwVzLNv1xsQJcOf/3Y3C0q98GS
	zFCdA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yttwc85hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 20:18:03 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45HHvRLG023889;
	Mon, 17 Jun 2024 20:18:03 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ysp9pw577-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 20:18:03 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45HKI0YU63832458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2024 20:18:02 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63FBB5805E;
	Mon, 17 Jun 2024 20:18:00 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC4FE58055;
	Mon, 17 Jun 2024 20:17:59 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jun 2024 20:17:59 +0000 (GMT)
Message-ID: <5427fe09-199b-4b4b-a451-044e8e352595@linux.ibm.com>
Date: Mon, 17 Jun 2024 16:17:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        jarkko@kernel.org
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
 <dfc4feaef0d63d616bab8cdec5d409369f9dacf1.camel@HansenPartnership.com>
 <5bd68636-ece6-4ba5-a4c0-c0535afc33c8@linux.ibm.com>
 <1302b413a2d7bf3b275133e7fdb04b44bfe2d5e3.camel@HansenPartnership.com>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <1302b413a2d7bf3b275133e7fdb04b44bfe2d5e3.camel@HansenPartnership.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RQxNUYf2DBrWStycNDpehfHgqmo8xgeN
X-Proofpoint-GUID: RQxNUYf2DBrWStycNDpehfHgqmo8xgeN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
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



On 6/17/24 16:05, James Bottomley wrote:
> On Mon, 2024-06-17 at 15:56 -0400, Stefan Berger wrote:
>>
>>
>> On 6/17/24 15:42, James Bottomley wrote:
>>> On Mon, 2024-06-17 at 15:34 -0400, Stefan Berger wrote:
>>>> Fix the following type of error message caused by a missing call
>>>> to
>>>> tpm2_sessions_init() in the IBM vTPM driver:
>>>>
>>>> [    2.987131] tpm tpm0: tpm2_load_context: failed with a TPM
>>>> error
>>>> 0x01C4
>>>> [    2.987140] ima: Error Communicating to TPM chip, result: -14
>>>>
>>>> Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
>>>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>>>> ---
>>>>    drivers/char/tpm/tpm_ibmvtpm.c | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c
>>>> b/drivers/char/tpm/tpm_ibmvtpm.c
>>>> index d3989b257f42..1e5b107d1f3b 100644
>>>> --- a/drivers/char/tpm/tpm_ibmvtpm.c
>>>> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
>>>> @@ -698,6 +698,10 @@ static int tpm_ibmvtpm_probe(struct vio_dev
>>>> *vio_dev,
>>>>                   rc = tpm2_get_cc_attrs_tbl(chip);
>>>>                   if (rc)
>>>>                           goto init_irq_cleanup;
>>>> +
>>>> +               rc = tpm2_sessions_init(chip);
>>>> +               if (rc)
>>>> +                       goto init_irq_cleanup;
>>>
>>> This looks wrong: the whole thing is designed to occur in the
>>> bootstrap
>>> phase from tpm_chip_register() (which tpm_ibmvtpm.c definitely
>>> calls),
>>> so why isn't it happening?
>>
>> Because flags = TPM_OPS_AUTO_STARTUP has not been set for this
>> driver.
>>
> 
> In that case, wouldn't the fix be to move tpm_sessions_init() to
> somewhere in tpm_chip_register() that would then be called by this
> driver?  Having to special case it for every driver that doesn't set
> this flag is going to be a huge pain.

I think the 2nd fix is to set TPM_OPS_AUTO_STARTUP also for the ibmvtpm 
driver like the following patch on top of this one, but after more testing:

 From c6bcd3890f1bdc43d9549fbb39fe388adf756358 Mon Sep 17 00:00:00 2001
From: Stefan Berger <stefanb@linux.ibm.com>
Date: Mon, 17 Jun 2024 16:05:54 -0400
Subject: [PATCH] tpm: ibmvtpm: Set TPM_OPS_AUTO_STARTUP flag for
  initialization

Set the TPM_OPS_AUTO_STARTUP flag for using common initialization code.
The difference between the old initialization and the new one is that
for TPM 1.2 tpm1_do_selftest and for TPM 2 tpm2_do_selftest will be called.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
  drivers/char/tpm/tpm_ibmvtpm.c | 15 +--------------
  1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 1e5b107d1f3b..76d048f63d55 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -450,6 +450,7 @@ static bool tpm_ibmvtpm_req_canceled(struct tpm_chip 
*chip, u8 status)
  }

  static const struct tpm_class_ops tpm_ibmvtpm = {
+       .flags = TPM_OPS_AUTO_STARTUP,
         .recv = tpm_ibmvtpm_recv,
         .send = tpm_ibmvtpm_send,
         .cancel = tpm_ibmvtpm_cancel,
@@ -690,20 +691,6 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
         if (!strcmp(id->compat, "IBM,vtpm20"))
                 chip->flags |= TPM_CHIP_FLAG_TPM2;

-       rc = tpm_get_timeouts(chip);
-       if (rc)
-               goto init_irq_cleanup;
-
-       if (chip->flags & TPM_CHIP_FLAG_TPM2) {
-               rc = tpm2_get_cc_attrs_tbl(chip);
-               if (rc)
-                       goto init_irq_cleanup;
-
-               rc = tpm2_sessions_init(chip);
-               if (rc)
-                       goto init_irq_cleanup;
-       }
-
         return tpm_chip_register(chip);
  init_irq_cleanup:
         do {
--
2.45.2

Regards,
    Stefan

> 
> I think the only reason it's down that far is that it should only be
> called for TPM2 code so it was avoiding doing the check twice, so
> something like this >
> James
> 
> ---
> 
> diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
> index 5da134f12c9a..4280cbb0f0b1 100644
> --- a/drivers/char/tpm/tpm-interface.c
> +++ b/drivers/char/tpm/tpm-interface.c
> @@ -347,6 +347,12 @@ int tpm_auto_startup(struct tpm_chip *chip)
>   {
>   	int rc;
>   
> +	if (chip->flags & TPM_CHIP_FLAG_TPM2) {
> +		rc = tpm2_sessions_init(chip);
> +		if (rc)
> +			return rc;
> +	}
> +
>   	if (!(chip->ops->flags & TPM_OPS_AUTO_STARTUP))
>   		return 0;
>   
> diff --git a/drivers/char/tpm/tpm2-cmd.c b/drivers/char/tpm/tpm2-cmd.c
> index 1e856259219e..b4f85c8cdbb6 100644
> --- a/drivers/char/tpm/tpm2-cmd.c
> +++ b/drivers/char/tpm/tpm2-cmd.c
> @@ -773,11 +773,6 @@ int tpm2_auto_startup(struct tpm_chip *chip)
>   		rc = 0;
>   	}
>   
> -	if (rc)
> -		goto out;
> -
> -	rc = tpm2_sessions_init(chip);
> -
>   out:
>   	/*
>   	 * Infineon TPM in field upgrade mode will return no data for the number
> 
