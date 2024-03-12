Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CF18795C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 15:13:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VLEM8cLn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvFxQ0Jkgz3vWy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 01:13:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VLEM8cLn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvFwc5dv9z2yk5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 01:13:04 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42CDxwCu013802;
	Tue, 12 Mar 2024 14:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=C/7Wo3Do9rVfY4C0hJPRuEoQ8N6r53SaOQYqtVwZzig=;
 b=VLEM8cLnKe7hSl2BHsW5/6ET7DMGZHe1WlNQnCSs/9y/UMGi7F6LibLPkyTQFZGdi0h/
 ebMEVYj8o1i2M48eR6qdKIeYsOjTCw7YdKvYL4BQpr+iAmEJaKLDODZPlIWuzHx4p6qr
 4Rkg0nRl373kvJiSMigLb5pHaNSMDcy6x8nTvPBg6/whjtSs1IA9RDCn0WfI+pnq1St4
 JbxJ5XtzKCYmCw6DWHdqqYC5pvCinbmYXOF+JcnNYqqXBdjGsrBnbL0MaR4SIFN79RH+
 3Xrmd22/2m5tiHK8OOUBhUT4PZW/HQdudV2glipjNNORSRuY58pO6EzazNuEG2pSNWUB nA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wtre507sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 14:12:47 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42CE06Lw014522;
	Tue, 12 Mar 2024 14:12:47 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wtre507s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 14:12:47 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42CBNxhS018128;
	Tue, 12 Mar 2024 14:12:46 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ws23t7q89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 14:12:46 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42CEChpw44433916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Mar 2024 14:12:45 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 014A65806B;
	Tue, 12 Mar 2024 14:12:43 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECE5F58059;
	Tue, 12 Mar 2024 14:12:41 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Mar 2024 14:12:41 +0000 (GMT)
Message-ID: <cbe526b1-b044-48ac-896e-6037a85171ea@linux.ibm.com>
Date: Tue, 12 Mar 2024 10:12:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/3] dt-bindings: tpm: Add linux,sml-log to
 ibm,vtpm.yaml
Content-Language: en-US
To: Lukas Wunner <lukas@wunner.de>
References: <20240311132030.1103122-1-stefanb@linux.ibm.com>
 <20240311132030.1103122-3-stefanb@linux.ibm.com> <ZfA4TZspY7oOQ4vz@wunner.de>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <ZfA4TZspY7oOQ4vz@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Jlo8b5KaqDw2EQmqvwb7imfqs1qNC_2U
X-Proofpoint-GUID: SlFIL06VJjfnVsAKMoTBGlqmFhgtVArT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_08,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403120108
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
Cc: devicetree@vger.kernel.org, rnsastry@linux.ibm.com, Nayna Jain <nayna@linux.ibm.com>, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, linux-integrity@vger.kernel.org, viparash@in.ibm.com, linuxppc-dev@lists.ozlabs.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/12/24 07:11, Lukas Wunner wrote:
> On Mon, Mar 11, 2024 at 09:20:29AM -0400, Stefan Berger wrote:
>> Add linux,sml-log, which carries the firmware TPM log in a uint8-array, to
>> the properties. Either this property is required or both linux,sml-base and
>> linux,sml-size are required. Add a test case for verification.
>>
>> Fixes: 82003e0487fb ("Documentation: tpm: add the IBM Virtual TPM device tree binding documentation")
> 
> The Fixes tag is confusing.  The patch won't even apply cleanly to the
> v4.10 commit referenced here as the conversion to yaml happened only
> recently with v6.8.

Then that's as far back (6.8) as the series may be applied. I put the 
Fixes tag on the first appearance of sml-base/sml-size since for kexec 
this was never correct.

> 
> Why is the Fixes tag necessary in the first place?  Same question for
> the other patches in the series.  This looks like feature work rather
> than a fix.  Not sure whether it satisfies the "obviously correct"
> rule per Documentation/process/stable-kernel-rules.rst.


It is a fix for the interaction of the TPM firmware log with kexec. The 
sml-base buffer pointer was never protected across a kexec.

> 
> 
>> --- a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
>> +++ b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
>> @@ -74,8 +74,6 @@ required:
>>     - ibm,my-dma-window
>>     - ibm,my-drc-index
>>     - ibm,loc-code
>> -  - linux,sml-base
>> -  - linux,sml-size
> 
> I assume that either these two or the new "linux,sml-log" property
> are (still) required?  If so, a quick grep through the bindings
> (e.g. auxdisplay/img,ascii-lcd.yaml) shows that the following
> might work:
> 
> required:
>    - ...
> 
> oneOf:
>    - required:
>        - linux,sml-base
>    - required:
>        - linux,sml-log
> 
You're right, they need to be here since examples could now omit 
sml-base or sml-log. I added them. Thanks.

> 
>> --- a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
>> +++ b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
>> @@ -30,6 +30,11 @@ properties:
>>         size of reserved memory allocated for firmware event log
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>   
>> +  linux,sml-log:
>> +    description:
>> +      Content of firmware event log
> 
> Please add one or two sentences of context so that readers don't
> need to use git blame + git log to find out what this is for.
> (Mention at least that the property may be used to pass the log
> to a kexec kernel.)

Ok, will do:

Content of firmware event log embedded in device tree to be safely 
carried across a kexec soft reboot.



> 
> 
>> -# must only have either memory-region or linux,sml-base
>> +# must only have either memory-region or linux,sml-base/size or linux,sml-log
>>   # as well as either resets or reset-gpios
>>   dependentSchemas:
>>     memory-region:
>>       properties:
>>         linux,sml-base: false
>> +      linux,sml-log: false
>>     linux,sml-base:
>>       properties:
>>         memory-region: false
>> +      linux,sml-log: false
>> +  linux,sml-log:
>> +    properties:
>> +      memory-region: false
>> +      linux,sml-base: false
>> +      linux,sml-size: false
> 
> Could you add "linux,sml-size: false" to "memory-region" as well
> while at it for consistency?

Done. Thanks.

    Stefan
> 
> Thanks,
> 
> Lukas
