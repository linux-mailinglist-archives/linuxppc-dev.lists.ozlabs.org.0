Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DA47D470B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 07:49:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oOqslc2F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF1Mg6MLmz3cGY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 16:49:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oOqslc2F;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF1Ln0XXBz30Ng
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 16:48:17 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SF1Lg5C7Sz4x5j
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 16:48:11 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SF1Lg5945z4x5h; Tue, 24 Oct 2023 16:48:11 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oOqslc2F;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SF1Lg2sJFz4wx7;
	Tue, 24 Oct 2023 16:48:11 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39O5lPCm029972;
	Tue, 24 Oct 2023 05:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=D9SCMG5vllUxiCXzrWB3kRwP/lSbEBFjlYYQAU/5BNY=;
 b=oOqslc2FM34KsFV8efEoOKDFyoZLQC1thCdob02eCbnfoDpTVodd+usxeq6s4RNAuiDo
 k+h3BGYfAvRoZ1yL9FOCgmqPxrItrzqE892Wl0sl0D4kVyfNLr2CocoCyj3t8BJ0GQ96
 R+wMb0dh35FGGt44q2KsUYC23PULceugnEudLRHpevXtboZ5CnxGF42GjX8xu8I7tJ6B
 lgbXOfoy6YeSH5z1iVosp9idQ5tpBslPbzczhSw5SYTdTVRBvoGMtw58tgmwZ4IsZRMw
 k/TU/57Da0Co/HKtaswZznGpAz8Bff46m9gm6YNuY10eatx8k+0IcUuoAVt7RfrC/CUH 2A== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tx836g0v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 05:48:09 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39O2jMWk024381;
	Tue, 24 Oct 2023 05:48:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tvu6jw0xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 05:48:08 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39O5m5lE19858036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Oct 2023 05:48:05 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9288A20049;
	Tue, 24 Oct 2023 05:48:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CE4120040;
	Tue, 24 Oct 2023 05:48:04 +0000 (GMT)
Received: from [9.43.97.178] (unknown [9.43.97.178])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Oct 2023 05:48:04 +0000 (GMT)
Message-ID: <4b567b79-21df-4190-acdc-6f5e2d63a5b0@linux.ibm.com>
Date: Tue, 24 Oct 2023 11:18:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] powerpc: make fadump resilient with memory
 add/remove events
To: Aditya Gupta <adityag@linux.ibm.com>
References: <20231009041953.36139-1-sourabhjain@linux.ibm.com>
 <20231009041953.36139-2-sourabhjain@linux.ibm.com>
 <se7qehosb7xx4ueguq7v3rlrhcqpwblz3thzzr2hkyz2ambp4u@veaocw6z57m6>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <se7qehosb7xx4ueguq7v3rlrhcqpwblz3thzzr2hkyz2ambp4u@veaocw6z57m6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OVIrJDZS4viJ7irQCRA_GkevQVhD2dn-
X-Proofpoint-ORIG-GUID: OVIrJDZS4viJ7irQCRA_GkevQVhD2dn-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_04,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=793
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310240048
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
Cc: mahesh@linux.vnet.ibm.com, linuxppc-dev@ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aditya,

On 24/10/23 11:05, Aditya Gupta wrote:
> Hi sourabh, found a typo in comment.
>
> On Mon, Oct 09, 2023 at 09:49:51AM +0530, Sourabh Jain wrote:
>> +/*
>> + * Process an active dump in four steps. First, verify the crash info header
>> + * signature/magic number for integrity and accuracy. Second, if the fadump
>> + * version is greater than 0, prepare the elfcorehdr; for fadump version 0,
>> + * it's already created in the first kernel as part of the fadump reserved
>> + * area. Third, let the platform update CPU notes in elfcorehdr. Finally,
>> + * set elfcorehdr_addr so that the vmcore module can export the elfcore
>> + * header through '/proc/vmcore'.
>> + */
>> +static void process_fadump(void)
>> +{
>>
>> ...
>>
>> +     /*
>> +      * fadump version zero indicates that fadump crash info header
>> +      * is corrupted.
>> +      */
>> +     if (fadump_version < 0) {
>> +             pr_err("Crash info header is not valid.\n");
>> +             goto err_out;
>> +     }
>> +
> Here, comment says 0 indicates header is corrupted. But as per my understanding,
> version 0 means the earlier case (when MAGIC number was FADUMPINF).
> Maybe it should be:
>
> /*
>   * fadump version less than zero indicates that fadump crash info header
>   * is corrupted.
>   */
>
> Or:
>
> /*
>   * Negative fadump version indicates that fadump crash info header
>   * is corrupted.
>   */

My mistake, I'll address that comment in the next release.

I appreciate you taking a look.

By the way, version 4 is now available, and it includes a similar comment.

- Sourabh



