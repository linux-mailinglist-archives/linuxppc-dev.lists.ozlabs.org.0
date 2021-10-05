Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0437D42206D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 10:15:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNr4S6vmkz2yLq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 19:15:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R8oXJLNf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNr3g0CGGz2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 19:14:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=R8oXJLNf; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4HNr3f6N7pz4xbX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 19:14:54 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4HNr3f6KmTz4xbC; Tue,  5 Oct 2021 19:14:54 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=R8oXJLNf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4HNr3f2cnJz4xb9;
 Tue,  5 Oct 2021 19:14:53 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1958C2OW011278; 
 Tue, 5 Oct 2021 04:14:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=A/Kl7e2gSTzCXrt+H1zCaP5VbCTaG1lDxyQaGTKuQ6E=;
 b=R8oXJLNfP8kNH3r0EkmBE9C7YGSW1zFybQeSKpV5xvk2FfpxR4Hi7OfHbKKobQTbPpJG
 dWqpiorySW4rdK3r9eZ7tbnFAVwiWv8qsNIa9RAgekRFboUTiH4646+Ni461j4dYGH2/
 /IDnDATe/uHUVwTAZJ6cTvKyVB+TGs5DjNeceOrPc32AdC7sc61xYjW7IkaCPR0RX9tr
 tKSlHRxcZhTnmix7YyNWlyvXGA37tWeGtj2bCKztV2GXT85jbpKNT24eo56rtosN5SKs
 3aVd+bvTjj1q4J5T+jRyBzS7L/6YyeWnlIAM/jwd+e2sJtvWg9n1mvs+RPFJjveInfGe jw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bgjyyr1md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 04:14:50 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19586VnG021270;
 Tue, 5 Oct 2021 08:14:49 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3beepjfw67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 08:14:48 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19589NVs44826984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 08:09:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDDBF4C058;
 Tue,  5 Oct 2021 08:14:42 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE52D4C046;
 Tue,  5 Oct 2021 08:14:38 +0000 (GMT)
Received: from [9.43.70.175] (unknown [9.43.70.175])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  5 Oct 2021 08:14:38 +0000 (GMT)
Message-ID: <b2844a83-d2b2-6e88-780c-3a41be882086@linux.ibm.com>
Date: Tue, 5 Oct 2021 13:44:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/3] powerpc: Set crashkernel offset to mid of RMA region
Content-Language: en-US
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au
References: <20211004151142.256251-1-sourabhjain@linux.ibm.com>
 <20211004151142.256251-4-sourabhjain@linux.ibm.com>
 <f13e218e-4e38-4076-672f-d555d7abfc02@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <f13e218e-4e38-4076-672f-d555d7abfc02@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AjfoHP62Lh3HZ-7hkkLuGzsRw7sC1HmF
X-Proofpoint-ORIG-GUID: AjfoHP62Lh3HZ-7hkkLuGzsRw7sC1HmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050046
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
Cc: linuxppc-dev@ozlabs.org, Abdul haleem <abdhalee@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, hbathini@linux.ibm.com,
 mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 04/10/21 21:36, Aneesh Kumar K.V wrote:
> On 10/4/21 20:41, Sourabh Jain wrote:
>> On large config LPARs (having 192 and more cores), Linux fails to boot
>> due to insufficient memory in the first memory block. It is due to the
>> reserve crashkernel area starts at 128MB offset by default and which
>> doesn't leave enough space in the first memory block to accommodate
>> memory for other essential system resources.
>>
>> Given that the RMA region size can be 512MB or more, setting the
>> crashkernel offset to mid of RMA size will leave enough space to
>> kernel to allocate memory for other system resources in the first
>> memory block.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Reported-and-tested-by: Abdul haleem <abdhalee@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/kernel/rtas.c |  3 +++
>>   arch/powerpc/kexec/core.c  | 13 +++++++++----
>>   2 files changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index ff80bbad22a5..ce5e62bb4d8e 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -1235,6 +1235,9 @@ int __init early_init_dt_scan_rtas(unsigned 
>> long node,
>>       entryp = of_get_flat_dt_prop(node, "linux,rtas-entry", NULL);
>>       sizep  = of_get_flat_dt_prop(node, "rtas-size", NULL);
>>   +    if (of_get_flat_dt_prop(node, "ibm,hypertas-functions", NULL))
>> +        powerpc_firmware_features |= FW_FEATURE_LPAR;
>> +
>
> The equivalent check that we currently do more than checking 
> ibm,hypertas-functions.
>
>     if (!strcmp(uname, "rtas") || !strcmp(uname, "rtas@0")) {
>         prop = of_get_flat_dt_prop(node, "ibm,hypertas-functions",
>                        &len);
>         if (prop) {
>             powerpc_firmware_features |= FW_FEATURE_LPAR;
>             fw_hypertas_feature_init(prop, len);
>         }
>
>
> also do we expect other firmware features to be set along with 
> FW_FEATURE_LPAR?

This patch needs to move crash kernel reservation to mid point of rma 
size for LPAR in reserve_crashkernel() function. Since 
reserve_crashkernel() is called too early even before 
powerpc_firmware_features is set with FW_FEATURE_LPAR, the check for if 
(firmware_has_feature(FW_FEATURE_LPAR)) fails and hence we only need to 
make sure that we set this flag early during early_init_dt_scan_rtas().

The rest of the LPAR specific initialization isn't required at this 
point and will be still done during pseries_probe_fw_features() as usual.

Thanks,
Sourabh Jain

