Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB5725F6E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 14:30:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbmrM4TRsz3dwD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 22:29:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LF0XJt2C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LF0XJt2C;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbmqR4JzMz309V
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 22:29:07 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 357CNeN1011729;
	Wed, 7 Jun 2023 12:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=iM2zvC81BOYuajSNL75smtNHTJdGJ/hHWLH3SOPaChE=;
 b=LF0XJt2Cw6Z/WXeLBX3Bu8JpnW9bijYbWAvzypPf4Bz9me8UjlVSnaHCO4bV1aghoE51
 CuMU+GDWGb2R48P3SLQ5EQxbBPCvN0uGNyAwtGHxrx6J2gRMx6cC8Obvmc/+dIK2IhOH
 lpLJCQGqpbKGWYjp/p81MOR1Ck5IemhUgnK2a+m4JB2qpxnQgROkBMrsfeDmjvFzMyu/
 nk+b7koEEr1nOmkl04wLqpphnI4aEGT1IpHDrRKbyTitUvwbSu1Ipij12SutEadxMr5p
 5m5aZCtsEjBNbCBA97+3AuNpoICmLcXLH6bnL6ci5ea2dnpnKInTnCTvFitRJeekAcYn 7g== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2sv2g4n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 12:28:49 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 357BjvdT032105;
	Wed, 7 Jun 2023 12:28:48 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3r2a76ngg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 12:28:48 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 357CSlC35898952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jun 2023 12:28:47 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C73D5805B;
	Wed,  7 Jun 2023 12:28:47 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 346465805C;
	Wed,  7 Jun 2023 12:28:46 +0000 (GMT)
Received: from [9.61.101.222] (unknown [9.61.101.222])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jun 2023 12:28:45 +0000 (GMT)
Message-ID: <6a4cac35-efa9-40f6-ae0f-ad3509ef7fbb@linux.vnet.ibm.com>
Date: Wed, 7 Jun 2023 08:28:45 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] security/integrity: fix pointer to ESL data and its size
 on pseries
Content-Language: en-US
To: Jarkko Sakkinen <jarkko@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-integrity <linux-integrity@vger.kernel.org>
References: <20230606172652.198227-1-nayna@linux.ibm.com>
 <CT5V56O3NZS8.1V2L3JJWRKIOE@suppilovahvero>
From: Nayna <nayna@linux.vnet.ibm.com>
In-Reply-To: <CT5V56O3NZS8.1V2L3JJWRKIOE@suppilovahvero>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nZI7dfix533f-JwkKEja0YZ4zr3KmJ45
X-Proofpoint-GUID: nZI7dfix533f-JwkKEja0YZ4zr3KmJ45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_06,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 spamscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070100
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, Russell Currey <ruscur@russell.cc>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/6/23 16:51, Jarkko Sakkinen wrote:
> On Tue Jun 6, 2023 at 8:26 PM EEST, Nayna Jain wrote:
>> On PowerVM guest, variable data is prefixed with 8 bytes of timestamp.
>> Extract ESL by stripping off the timestamp before passing to ESL parser.
>>
> Cc: stable@vger.kenrnel.org # v6.3
>
> ?

Aah yes. Missed that.. Thanks..


>
>> Fixes: 4b3e71e9a34c ("integrity/powerpc: Support loading keys from PLPKS")
>> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
>> ---
>>   .../integrity/platform_certs/load_powerpc.c   | 39 ++++++++++++-------
>>   1 file changed, 26 insertions(+), 13 deletions(-)
>>
>> diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
>> index b9de70b90826..57768cbf1fd3 100644
>> --- a/security/integrity/platform_certs/load_powerpc.c
>> +++ b/security/integrity/platform_certs/load_powerpc.c
>> @@ -15,6 +15,9 @@
>>   #include "keyring_handler.h"
>>   #include "../integrity.h"
>>   
>> +#define extract_data(db, data, size, offset)	\
>> +	do { db = data + offset; size = size - offset; } while (0)
>> +
>>   /*
>>    * Get a certificate list blob from the named secure variable.
>>    *
>> @@ -55,8 +58,10 @@ static __init void *get_cert_list(u8 *key, unsigned long keylen, u64 *size)
>>    */
>>   static int __init load_powerpc_certs(void)
>>   {
>> +	void *data = NULL;
>> +	u64 dsize = 0;
>> +	u64 offset = 0;
>>   	void *db = NULL, *dbx = NULL;
> So... what do you need db still for?
>
> If you meant to rename 'db' to 'data', then you should not do it, since this is
> a bug fix. It is zero gain, and a factor harder backport.

In case of PowerVM guest, data points to timestamp + ESL.  And then with 
offset of 8 bytes, db points to ESL.

While db is used for parsing ESL, data is then later used to free 
(timestamp + ESL) memory.

Hope it answers the question.

Thanks & Regards,

     - Nayna


>
>> -	u64 dbsize = 0, dbxsize = 0;
>>   	int rc = 0;
>>   	ssize_t len;
>>   	char buf[32];
>> @@ -74,38 +79,46 @@ static int __init load_powerpc_certs(void)
>>   		return -ENODEV;
>>   	}
>>   
>> +	if (strcmp("ibm,plpks-sb-v1", buf) == 0)
>> +		/* PLPKS authenticated variables ESL data is prefixed with 8 bytes of timestamp */
>> +		offset = 8;
>> +
>>   	/*
>>   	 * Get db, and dbx. They might not exist, so it isn't an error if we
>>   	 * can't get them.
>>   	 */
>> -	db = get_cert_list("db", 3, &dbsize);
>> -	if (!db) {
>> +	data = get_cert_list("db", 3, &dsize);
>> +	if (!data) {
>>   		pr_info("Couldn't get db list from firmware\n");
>> -	} else if (IS_ERR(db)) {
>> -		rc = PTR_ERR(db);
>> +	} else if (IS_ERR(data)) {
>> +		rc = PTR_ERR(data);
>>   		pr_err("Error reading db from firmware: %d\n", rc);
>>   		return rc;
>>   	} else {
>> -		rc = parse_efi_signature_list("powerpc:db", db, dbsize,
>> +		extract_data(db, data, dsize, offset);
>> +
>> +		rc = parse_efi_signature_list("powerpc:db", db, dsize,
>>   					      get_handler_for_db);
>>   		if (rc)
>>   			pr_err("Couldn't parse db signatures: %d\n", rc);
>> -		kfree(db);
>> +		kfree(data);
>>   	}
>>   
>> -	dbx = get_cert_list("dbx", 4,  &dbxsize);
>> -	if (!dbx) {
>> +	data = get_cert_list("dbx", 4,  &dsize);
>> +	if (!data) {
>>   		pr_info("Couldn't get dbx list from firmware\n");
>> -	} else if (IS_ERR(dbx)) {
>> -		rc = PTR_ERR(dbx);
>> +	} else if (IS_ERR(data)) {
>> +		rc = PTR_ERR(data);
>>   		pr_err("Error reading dbx from firmware: %d\n", rc);
>>   		return rc;
>>   	} else {
>> -		rc = parse_efi_signature_list("powerpc:dbx", dbx, dbxsize,
>> +		extract_data(dbx, data, dsize, offset);
>> +
>> +		rc = parse_efi_signature_list("powerpc:dbx", dbx, dsize,
>>   					      get_handler_for_dbx);
>>   		if (rc)
>>   			pr_err("Couldn't parse dbx signatures: %d\n", rc);
>> -		kfree(dbx);
>> +		kfree(data);
>>   	}
>>   
>>   	return rc;
>> -- 
>> 2.31.1
> BR, Jarkko
