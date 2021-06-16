Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C93A9C88
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 15:48:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4mk52ZD1z3btr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 23:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UgPvjIrr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UgPvjIrr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4mjf52lkz2yhF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 23:48:22 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15GDXgok060344; Wed, 16 Jun 2021 09:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=d4dLu30gffdRAHt5KvZ4yq7qZBSJDOTJYTV89XMmAPY=;
 b=UgPvjIrrpfZcLeQsv7HFS9vf7yEW/SLkoEMOGfYE0DXug5IJnXcRAUbvuYSMIHuqnbmK
 2vdG6QTmMf1SkSSYFmyjU77SHgWMIQkNIKzaBWzeqPifslCjlRcT266iRHqM2DNiP0k9
 hvt5oNuu/cSOp0Uv2cBS1pmwOHwrCaPzZnuuXv0Jbo5bBmvRYW3h3ciLJeowpvnaksu8
 Rzz8UbfLExSwtTtgcv7/d80qydR7uIIVJXHmNWOvYPsYExetDXmpR/BX4U8UISNS8FKi
 08a25bHuueNvqLyOYI1+wVS9sQTbHiti/IuE/aEsdkBdZVWabut5wCJ/DKBmVl+lq355 Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397ftcdhsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 09:47:12 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15GDXfNU060100;
 Wed, 16 Jun 2021 09:47:11 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 397ftcdhr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 09:47:11 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15GDh4mL012286;
 Wed, 16 Jun 2021 13:47:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3966jpgnhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 13:47:08 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15GDk2ag34734490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 13:46:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 682374203F;
 Wed, 16 Jun 2021 13:47:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FC7842041;
 Wed, 16 Jun 2021 13:47:05 +0000 (GMT)
Received: from [9.77.206.69] (unknown [9.77.206.69])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Jun 2021 13:47:04 +0000 (GMT)
Subject: Re: [PATCH v2 1/1] powerpc/papr_scm: Properly handle UUID types and
 API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20210616134303.58185-1-andriy.shevchenko@linux.intel.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <6f895afd-3469-c330-a4da-72db89dba6b3@linux.ibm.com>
Date: Wed, 16 Jun 2021 19:17:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616134303.58185-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TgsF3gSvpuY0MPnyu4zsk3aG3B2hAnRi
X-Proofpoint-GUID: h9pX2R1A2vKYfmidWgVDrFLbGXlAaKDr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-16_07:2021-06-15,
 2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106160078
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
Cc: Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/16/21 7:13 PM, Andy Shevchenko wrote:
> Parse to and export from UUID own type, before dereferencing.
> This also fixes wrong comment (Little Endian UUID is something else)
> and should eliminate the direct strict types assignments.
> 
> Fixes: 43001c52b603 ("powerpc/papr_scm: Use ibm,unit-guid as the iset cookie")
> Fixes: 259a948c4ba1 ("powerpc/pseries/scm: Use a specific endian format for storing uuid from the device tree")


Do we need the Fixes: there? It didn't change any functionality right? 
The format with which we stored cookie1 remains the same with older and 
newer code. The newer one is better?

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: added missed header (Vaibhav), updated comment (Aneesh),
>      rewrite part of the commit message to avoid mentioning the Sparse
>   arch/powerpc/platforms/pseries/papr_scm.c | 27 +++++++++++++++--------
>   1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index e2b69cc3beaf..b43be41e8ff7 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -18,6 +18,7 @@
>   #include <asm/plpar_wrappers.h>
>   #include <asm/papr_pdsm.h>
>   #include <asm/mce.h>
> +#include <asm/unaligned.h>
>   
>   #define BIND_ANY_ADDR (~0ul)
>   
> @@ -1101,8 +1102,9 @@ static int papr_scm_probe(struct platform_device *pdev)
>   	u32 drc_index, metadata_size;
>   	u64 blocks, block_size;
>   	struct papr_scm_priv *p;
> +	u8 uuid_raw[UUID_SIZE];
>   	const char *uuid_str;
> -	u64 uuid[2];
> +	uuid_t uuid;
>   	int rc;
>   
>   	/* check we have all the required DT properties */
> @@ -1145,16 +1147,23 @@ static int papr_scm_probe(struct platform_device *pdev)
>   	p->hcall_flush_required = of_property_read_bool(dn, "ibm,hcall-flush-required");
>   
>   	/* We just need to ensure that set cookies are unique across */
> -	uuid_parse(uuid_str, (uuid_t *) uuid);
> +	uuid_parse(uuid_str, &uuid);
> +
>   	/*
> -	 * cookie1 and cookie2 are not really little endian
> -	 * we store a little endian representation of the
> -	 * uuid str so that we can compare this with the label
> -	 * area cookie irrespective of the endian config with which
> -	 * the kernel is built.
> +	 * The cookie1 and cookie2 are not really little endian.
> +	 * We store a raw buffer representation of the
> +	 * uuid string so that we can compare this with the label
> +	 * area cookie irrespective of the endian configuration
> +	 * with which the kernel is built.
> +	 *
> +	 * Historically we stored the cookie in the below format.
> +	 * for a uuid string 72511b67-0b3b-42fd-8d1d-5be3cae8bcaa
> +	 *	cookie1 was 0xfd423b0b671b5172
> +	 *	cookie2 was 0xaabce8cae35b1d8d
>   	 */
> -	p->nd_set.cookie1 = cpu_to_le64(uuid[0]);
> -	p->nd_set.cookie2 = cpu_to_le64(uuid[1]);
> +	export_uuid(uuid_raw, &uuid);
> +	p->nd_set.cookie1 = get_unaligned_le64(&uuid_raw[0]);
> +	p->nd_set.cookie2 = get_unaligned_le64(&uuid_raw[8]);
>   
>   	/* might be zero */
>   	p->metadata_size = metadata_size;
> 

