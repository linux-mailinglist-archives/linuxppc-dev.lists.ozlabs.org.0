Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 894747FBCAC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 15:24:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VjZKV0+9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sfl890CdDz3dVv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 01:24:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VjZKV0+9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sfl690m9Yz3wJJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 01:22:40 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASEDE64016946;
	Tue, 28 Nov 2023 14:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=076vjzN4zuUA9vKNf2kv2FRrqJHCunpl4NpJ7xpbzfQ=;
 b=VjZKV0+9WLqFqYtU9C9rLvIMlS3kfYqD+T7ay0t0rcHUxY+Rm3paNxE9nKugBnvAEEum
 WimcHccMmMIKPN76C7Omht4rFgUeXx8mI/FYgG7+b57hSZHilBfq1fYulN0zv1HzEige
 mDsumcQIkHe29xvLGdklJxJ1vmItTiTNB/br+Fjrf9lQMvSYHgdLu7pPRZma15dgZ592
 2eoP16tv74CYyn+3KfFXrBCKVuT2ylNhtQD2C/xRWLmBLmBN78Ut7EaUzcyyTlzoU3yr
 cOsQZv8MZO+ldwODuePwOW++jQO2GcIJWs23jIVBjA82fRhYDrHTWS1Dq6gEewbetbZI MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unhs88aky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 14:21:49 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ASEDbqb018739;
	Tue, 28 Nov 2023 14:21:45 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unhs88a4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 14:21:45 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASDU1be018257;
	Tue, 28 Nov 2023 14:21:06 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwy1qmcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 14:21:06 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ASEL4Ur45941132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Nov 2023 14:21:05 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CA0B5805A;
	Tue, 28 Nov 2023 14:21:04 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73ED15806F;
	Tue, 28 Nov 2023 14:21:04 +0000 (GMT)
Received: from localhost (unknown [9.61.20.55])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Nov 2023 14:21:04 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nick Child <nnac123@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/pseries/memhp: Remove unbalanced
 dlpar_release_drc() call
In-Reply-To: <18be4145-732a-4e28-b7f1-94d367a54bd7@linux.ibm.com>
References: <20231114-pseries-memhp-fixes-v1-0-fb8f2bb7c557@linux.ibm.com>
 <20231114-pseries-memhp-fixes-v1-2-fb8f2bb7c557@linux.ibm.com>
 <18be4145-732a-4e28-b7f1-94d367a54bd7@linux.ibm.com>
Date: Tue, 28 Nov 2023 08:21:04 -0600
Message-ID: <8734wq2c33.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9iID0NJPbdWDkiBttaRzFkI6Jub_wrcP
X-Proofpoint-GUID: vEWX9QiF-WmnA8s7I8M6avLhc_x_wABy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_15,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1011 adultscore=0 mlxlogscore=824 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280114
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nick Child <nnac123@linux.ibm.com> writes:
> Hi Nathan,
> Patches 1 and 3 LGTM

thanks.

> Regarding this patch, dlpar_memory_remove_by_count() calls 
> dlpar_add_lmb() and does not free drc on add error.
> dlpar_add_lmb() is called here in error recovery so probably
> not a big deal.
>
> This is all new code to me but it looks like if the requested
> number of lmbs cannot be removed then it attempts to add back
> the ones that were successfully removed. So if you cannot add
> an lmb that WAS successfully removed, it seems sane to also
> release the drc.

Maybe I'll drop this one for now and turn my attention to removing all
the high-level rollback logic in this code. There's no reliable way to
accomplish what it's trying to do (i.e. restore the original quantity of
LMBs) and it just complicates things.


> On 11/14/23 11:01, Nathan Lynch via B4 Relay wrote:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>> 
>> Callers of dlpar_add_lmb() are responsible for first acquiring the DRC
>> and releasing it if dlpar_add_lmb() fails.
>> 
>> However, dlpar_add_lmb() performs a dlpar_release_drc() in one error
>> branch.  There is no corresponding dlpar_acquire_drc() in the
>> function, nor is there any stated justification. None of the other
>> error paths in dlpar_add_lmb() release the DRC.
>> 
>> This is a potential source of redundant attempts to release DRCs,
>> which is likely benign, but is confusing and inconsistent. Remove it.
>> 
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/hotplug-memory.c | 1 -
>>   1 file changed, 1 deletion(-)
>> 
>> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> index 6f2eebae7bee..ba883c1b9f6d 100644
>> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
>> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
>> @@ -575,7 +575,6 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>>   
>>   	rc = update_lmb_associativity_index(lmb);
>>   	if (rc) {
>> -		dlpar_release_drc(lmb->drc_index);
>>   		return rc;
>>   	}
>>   
>> 
