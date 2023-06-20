Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 565AB736BE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 14:26:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NXtDqFh/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlm8D19L0z30fF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 22:26:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NXtDqFh/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlm7H2CBKz3025
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 22:25:30 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35KCNRa6017177;
	Tue, 20 Jun 2023 12:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SfiD1M5z4OPY525vqVnkiTC4EukX3LFvu2r5WipmhxU=;
 b=NXtDqFh/dfC3GW2ogOM51OJDEPEVMIkl0ZqtFqLi9XdLIHiGIo2mJdsdgZ50765JFbvf
 g+z18r9mHbhStocqyjFwHWDVQBwLUk5BhsFzS8fb3/czBXQzd8SMJLOgprPHxVH/N/pf
 EIfZeh4CmNFtm97ZJ4byunzboYLlifW7Vem5gVK2/XlucLhw6WdRXmPrZ0PEUEEk8ArR
 uCImvGYiwzdiB50pplpMNFojax7HdUal5v24/nPFasYvxRv/M1wvbeRxoXCLDC+98htF
 owUXllHN8C7CRGoLh4S+geSLKdaD9IIamjAvd/Npyxn94KbQd5G2VrGAPx7Cnx6hUD00 zA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbc2x80p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2023 12:25:23 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35K5wnJc026655;
	Tue, 20 Jun 2023 12:25:21 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3r94f59j7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2023 12:25:21 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35KCPI9Q43057638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 12:25:18 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E43D92004B;
	Tue, 20 Jun 2023 12:25:17 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA63F20043;
	Tue, 20 Jun 2023 12:25:15 +0000 (GMT)
Received: from [9.43.82.247] (unknown [9.43.82.247])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 20 Jun 2023 12:25:15 +0000 (GMT)
Message-ID: <3a9bdc60-c9c7-d5ea-0674-0235cd6b9fc6@linux.ibm.com>
Date: Tue, 20 Jun 2023 17:55:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2] security/integrity: fix pointer to ESL data and its
 size on pseries
To: Nayna Jain <nayna@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-integrity <linux-integrity@vger.kernel.org>
References: <20230608120444.382527-1-nayna@linux.ibm.com>
Content-Language: en-US
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20230608120444.382527-1-nayna@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iPn6euKyjQbjaDzsfSmmFP-Fy5osSPOh
X-Proofpoint-ORIG-GUID: iPn6euKyjQbjaDzsfSmmFP-Fy5osSPOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1011 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200108
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
Cc: stable@vger.kenrnel.org, Andrew Donnellan <ajd@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>, Russell Currey <ruscur@russell.cc>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/06/23 5:34 pm, Nayna Jain wrote:
> On PowerVM guest, variable data is prefixed with 8 bytes of timestamp.
> Extract ESL by stripping off the timestamp before passing to ESL parser.
> 
> Fixes: 4b3e71e9a34c ("integrity/powerpc: Support loading keys from PLPKS")
> Cc: stable@vger.kenrnel.org # v6.3
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---

Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>

Seeing the keyring difference with and with out patch:
With out patch:
[root@ltcrain80-lp2 ~]# grep keyring /proc/keys | grep -v _ses
0131ebb4 I--Q---     1 perm 0c030000     0 65534 keyring   .user_reg: 2
039dfd93 I------     1 perm 1f0f0000     0     0 keyring   .ima: 1
03a160b5 I------     1 perm 1f0b0000     0     0 keyring 
.builtin_trusted_keys: 2
05377b73 I------     1 perm 1f0b0000     0     0 keyring   .platform: empty
0d7ea730 I------     1 perm 0f0b0000     0     0 keyring   .blacklist: empty
16235f2d I--Q---     6 perm 1f3f0000     0 65534 keyring   _uid.0: empty
1721f130 I------     1 perm 1f0f0000     0     0 keyring   .evm: empty

With patch:
[root@ltcrain80-lp2 ~]# grep keyring /proc/keys | grep -v _ses
04820159 I------     1 perm 0f0b0000     0     0 keyring   .blacklist: 1
16d05827 I--Q---     1 perm 0c030000     0 65534 keyring   .user_reg: 2
17648d6a I------     1 perm 1f0b0000     0     0 keyring 
.builtin_trusted_keys: 2
2158b34f I--Q---     6 perm 1f3f0000     0 65534 keyring   _uid.0: empty
2237eff6 I------     1 perm 1f0f0000     0     0 keyring   .evm: empty
26d0330c I------     1 perm 1f0b0000     0     0 keyring   .platform: 1
2daa48ab I------     1 perm 1f0f0000     0     0 keyring   .ima: 1

Thank you.
> Changelog:
> v2: Fixed feedback from Jarkko
>        * added CC to stable
>        * moved *data declaration to same line as *db,*dbx
>      Renamed extract_data() macro to extract_esl() for clarity
>   .../integrity/platform_certs/load_powerpc.c   | 40 ++++++++++++-------
>   1 file changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
> index b9de70b90826..170789dc63d2 100644
> --- a/security/integrity/platform_certs/load_powerpc.c
> +++ b/security/integrity/platform_certs/load_powerpc.c
> @@ -15,6 +15,9 @@
>   #include "keyring_handler.h"
>   #include "../integrity.h"
>   
> +#define extract_esl(db, data, size, offset)	\
> +	do { db = data + offset; size = size - offset; } while (0)
> +
>   /*
>    * Get a certificate list blob from the named secure variable.
>    *
> @@ -55,8 +58,9 @@ static __init void *get_cert_list(u8 *key, unsigned long keylen, u64 *size)
>    */
>   static int __init load_powerpc_certs(void)
>   {
> -	void *db = NULL, *dbx = NULL;
> -	u64 dbsize = 0, dbxsize = 0;
> +	void *db = NULL, *dbx = NULL, *data = NULL;
> +	u64 dsize = 0;
> +	u64 offset = 0;
>   	int rc = 0;
>   	ssize_t len;
>   	char buf[32];
> @@ -74,38 +78,46 @@ static int __init load_powerpc_certs(void)
>   		return -ENODEV;
>   	}
>   
> +	if (strcmp("ibm,plpks-sb-v1", buf) == 0)
> +		/* PLPKS authenticated variables ESL data is prefixed with 8 bytes of timestamp */
> +		offset = 8;
> +
>   	/*
>   	 * Get db, and dbx. They might not exist, so it isn't an error if we
>   	 * can't get them.
>   	 */
> -	db = get_cert_list("db", 3, &dbsize);
> -	if (!db) {
> +	data = get_cert_list("db", 3, &dsize);
> +	if (!data) {
>   		pr_info("Couldn't get db list from firmware\n");
> -	} else if (IS_ERR(db)) {
> -		rc = PTR_ERR(db);
> +	} else if (IS_ERR(data)) {
> +		rc = PTR_ERR(data);
>   		pr_err("Error reading db from firmware: %d\n", rc);
>   		return rc;
>   	} else {
> -		rc = parse_efi_signature_list("powerpc:db", db, dbsize,
> +		extract_esl(db, data, dsize, offset);
> +
> +		rc = parse_efi_signature_list("powerpc:db", db, dsize,
>   					      get_handler_for_db);
>   		if (rc)
>   			pr_err("Couldn't parse db signatures: %d\n", rc);
> -		kfree(db);
> +		kfree(data);
>   	}
>   
> -	dbx = get_cert_list("dbx", 4,  &dbxsize);
> -	if (!dbx) {
> +	data = get_cert_list("dbx", 4,  &dsize);
> +	if (!data) {
>   		pr_info("Couldn't get dbx list from firmware\n");
> -	} else if (IS_ERR(dbx)) {
> -		rc = PTR_ERR(dbx);
> +	} else if (IS_ERR(data)) {
> +		rc = PTR_ERR(data);
>   		pr_err("Error reading dbx from firmware: %d\n", rc);
>   		return rc;
>   	} else {
> -		rc = parse_efi_signature_list("powerpc:dbx", dbx, dbxsize,
> +		extract_esl(dbx, data, dsize, offset);
> +
> +		rc = parse_efi_signature_list("powerpc:dbx", dbx, dsize,
>   					      get_handler_for_dbx);
>   		if (rc)
>   			pr_err("Couldn't parse dbx signatures: %d\n", rc);
> -		kfree(dbx);
> +		kfree(data);
>   	}
>   
>   	return rc;

-- 
Thanks and Regards
R.Nageswara Sastry
