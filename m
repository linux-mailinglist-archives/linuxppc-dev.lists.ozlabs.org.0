Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 818892CEFFE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 15:48:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnbDv3LwPzDrfR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 01:48:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=breMBUEg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnbBk0BHszDqdx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 01:46:53 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4EZgsR055242; Fri, 4 Dec 2020 09:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=WH83iHJoBT999tE6SlmLaoXknbCn6+cJiM52Z/unEo4=;
 b=breMBUEgqcqDTdCnvDnXUgLJFg1bMylpexhrGzfvN2s8ISsPUGc0ywzHaoHSGmQ+6wau
 +yBKfNPsCrEYxR4IMzHOaqyVlLiC6jjoUqE+6FWhMQ3uSGrx3udqvPbvJidwpMVQvupQ
 N/HZtdNeuXNmHB6WIsBr2ymbhV2fRe26uUKr/2KYuvN02M2eGubOA1XdNM4M5drvSYLg
 C5E5W5AFHRetGfqvihAIi/4A9borbF8V3RndI07y7re6Fb5hxTvV2Nbka4mL8ieKuKc1
 +CgfSHyqo6Z/1Wxu7FTH6bI49bBntb0aK7v52Ehk3Szvs/u6YYh2r3BnT84tjG1dJwYN Ug== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357m8gnpm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 09:46:48 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4EhaRb019110;
 Fri, 4 Dec 2020 14:46:48 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 356q6qvcru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 14:46:48 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4EklbL16515520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 14:46:47 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F561C605F;
 Fri,  4 Dec 2020 14:46:47 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC8CAC605A;
 Fri,  4 Dec 2020 14:46:46 +0000 (GMT)
Received: from localhost (unknown [9.65.194.14])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 14:46:46 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 12/29] powerpc/pseries/mobility: extract VASI session
 polling logic
In-Reply-To: <878sadvio4.fsf@mpe.ellerman.id.au>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
 <20201030011805.1224603-13-nathanl@linux.ibm.com>
 <878sadvio4.fsf@mpe.ellerman.id.au>
Date: Fri, 04 Dec 2020 08:46:46 -0600
Message-ID: <87zh2t1ve1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_04:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040080
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> The behavior of rtas_ibm_suspend_me_unsafe() is to return -EAGAIN to
>> the caller until the specified VASI suspend session state makes the
>> transition from H_VASI_ENABLED to H_VASI_SUSPENDING. In the interest
>> of separating concerns to prepare for a new implementation of the
>> join/suspend sequence, extract VASI session polling logic into a
>> couple of local functions. Waiting for the session state to reach
>> H_VASI_SUSPENDING before calling rtas_ibm_suspend_me_unsafe() ensures
>> that we will never get an EAGAIN result necessitating a retry. No
>> user-visible change in behavior is intended.
>>
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/mobility.c | 76 +++++++++++++++++++++--
>>  1 file changed, 71 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
>> index dc6abf164db7..1b8ae221b98a 100644
>> --- a/arch/powerpc/platforms/pseries/mobility.c
>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>> @@ -345,6 +345,73 @@ void post_mobility_fixup(void)
> ...
>
>> +
>> +static int wait_for_vasi_session_suspending(u64 handle)
>> +{
>> +	unsigned long state;
>> +	bool keep_polling;
>> +	int ret;
>> +
>> +	/*
>> +	 * Wait for transition from H_VASI_ENABLED to
>> +	 * H_VASI_SUSPENDING. Treat anything else as an error.
>> +	 */
>> +	do {
>> +		keep_polling = false;
>> +		ret = poll_vasi_state(handle, &state);
>> +		if (ret != 0)
>> +			break;
>> +
>> +		switch (state) {
>> +		case H_VASI_SUSPENDING:
>> +			break;
>> +		case H_VASI_ENABLED:
>> +			keep_polling = true;
>> +			ssleep(1);
>> +			break;
>> +		default:
>> +			pr_err("unexpected H_VASI_STATE result %lu\n", state);
>> +			ret = -EIO;
>> +			break;
>> +		}
>> +	} while (keep_polling);
>
> This seems like it could be simpler?
>
> eg:
>
> 	while (true) {
> 		ret = poll_vasi_state(handle, &state);
>
> 		if (ret != 0 || state == H_VASI_SUSPENDING)
> 			break;
> 		else if (state == H_VASI_ENABLED)
> 			ssleep(1);
> 		else {
> 			pr_err("unexpected H_VASI_STATE result %lu\n", state);
> 			ret = -EIO;
> 			break;
> 		}
> 	}
>
>
> Or did I miss something?

No I think you're right, thanks.
