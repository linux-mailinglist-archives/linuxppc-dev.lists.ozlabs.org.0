Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D97EB3618F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 06:39:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM3QS5XYxz3c0f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 14:39:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YYuMSPze;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YYuMSPze; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM3Q10DmWz30DF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 14:39:04 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13G4Y3j9022685; Fri, 16 Apr 2021 00:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Qg3sUk81HK+aS8G8kz99tD1f+4C08Ppu6ef3glezsJA=;
 b=YYuMSPzeN9W+kwvAEKA7kOn9LX7MjuNZ9+epu7drmVlfmlaI/0Yjv6Zd71Aa51NX0iIw
 625eZBEN0L2FGzTHHRP3jaksobM2W6DZplZkkitk6KtjpGle1yRORYKpPqQWn91tUxYR
 A8O6lkutyqCuCn1x40MQ3Otv2mGoYblAMfGmYA6TyWzDjoNwbuotcbZ2UTVaaf9vVlA3
 zvlcaYKALH68h4D25XilhwY9ABGxxkgo4BDbnn5km+c9x5D+vB47TC7P9LDv06zdp+sM
 hEIjhqF7KxmgHNfefADKKjMG1k4boqyB19doUNj09XsAyPKHWsEN2JIEgvwkt5ibJuDw nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xbpu3m36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 00:38:53 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13G4YjJl023816;
 Fri, 16 Apr 2021 00:38:53 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xbpu3m1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 00:38:52 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13G4bc0l019194;
 Fri, 16 Apr 2021 04:38:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 37u3n8c7u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 04:38:50 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13G4cQXW36962698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 04:38:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B17F9A4051;
 Fri, 16 Apr 2021 04:38:48 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D40CFA4040;
 Fri, 16 Apr 2021 04:38:46 +0000 (GMT)
Received: from [9.85.71.75] (unknown [9.85.71.75])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 04:38:46 +0000 (GMT)
Subject: Re: [PATCH v1 1/1] powerpc/papr_scm: Properly handle UUID types and
 API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20210415134637.17770-1-andriy.shevchenko@linux.intel.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <266684c6-e2c8-e19b-214d-809f16e79e7b@linux.ibm.com>
Date: Fri, 16 Apr 2021 10:08:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415134637.17770-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0PxvgveLwHLjJYd3ClaSZb_jAgO70mft
X-Proofpoint-GUID: EvIvTXs2ncKiE5pD93RJbCRHHo_9nM4i
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_11:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 clxscore=1011 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104160033
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

On 4/15/21 7:16 PM, Andy Shevchenko wrote:
> Parse to and export from UUID own type, before dereferencing.
> This also fixes wrong comment (Little Endian UUID is something else)
> and should fix Sparse warnings about assigning strict types to POD.
> 

I am wondering whether this will break older namespace created. IIRC 
that cpu_to_le64 was done to be backward compatible with namespaces 
created before 259a948c4ba1.

What we need to test is create a namespace in little endian kernel and 
read it back in via big endian and vice versa. Also we need to make sure 
we can read the already created namespace before this patch.


> Fixes: 43001c52b603 ("powerpc/papr_scm: Use ibm,unit-guid as the iset cookie")
> Fixes: 259a948c4ba1 ("powerpc/pseries/scm: Use a specific endian format for storing uuid from the device tree")
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> Not tested
>   arch/powerpc/platforms/pseries/papr_scm.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index ae6f5d80d5ce..4366e1902890 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -1085,8 +1085,9 @@ static int papr_scm_probe(struct platform_device *pdev)
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
> @@ -1129,16 +1130,18 @@ static int papr_scm_probe(struct platform_device *pdev)
>   	p->hcall_flush_required = of_property_read_bool(dn, "ibm,hcall-flush-required");
>   
>   	/* We just need to ensure that set cookies are unique across */
> -	uuid_parse(uuid_str, (uuid_t *) uuid);
> +	uuid_parse(uuid_str, &uuid);
> +
>   	/*
>   	 * cookie1 and cookie2 are not really little endian
> -	 * we store a little endian representation of the
> +	 * we store a raw buffer representation of the
>   	 * uuid str so that we can compare this with the label
>   	 * area cookie irrespective of the endian config with which
>   	 * the kernel is built.
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

