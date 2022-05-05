Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B5051BD19
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 12:24:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv8ty3ZzTz3c7P
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 20:24:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FfGMVaAj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv8tF2y5nz3bmV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 20:23:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FfGMVaAj; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Kv8tF2hTFz4ySm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 20:23:33 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4Kv8tF2Z5Hz4ySp; Thu,  5 May 2022 20:23:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FfGMVaAj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Kv8tD6jdZz4ySm
 for <linuxppc-dev@ozlabs.org>; Thu,  5 May 2022 20:23:32 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2458xNgQ010774
 for <linuxppc-dev@ozlabs.org>; Thu, 5 May 2022 10:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FuYfVsGbRRdwryGjXXh4UB+I1DgYGbs2i7w9ibgJHnw=;
 b=FfGMVaAjq84y1hcJq+TBgxvy61n2cPN4j5k4HNTgBB0fRNslEMEraeNb+8e7smP2YzIa
 hfZQHc/unQXVgGy6N/kUArgUblcwPIe5o7paq+bAZIrkl3TuzQpq/0r5J/3fnnLSa9hk
 u0DDpThmi2NF+7LvbmKcChZuWIucQMSctP683Cg2jBdiL0qibf6AP1QYxhIV/d8ZEUny
 MfIIJ7bTQ+T35kelCJ1AWUONAW7J3M8sSd3E5G8bSKrca3vyALV0W7IiV6ARXMoPig7k
 0rk/v7PV1bnsk2lydl/eEg84s7UU282/Ef5AgsLpOC8EaTnoNkDsGzaxwDnnvOHccOIQ xg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvbj31f2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 05 May 2022 10:23:30 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 245ANK9N019469
 for <linuxppc-dev@ozlabs.org>; Thu, 5 May 2022 10:23:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3fuxwkrscy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 05 May 2022 10:23:28 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 245ANQkI49742290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@ozlabs.org>; Thu, 5 May 2022 10:23:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75116AE04D
 for <linuxppc-dev@ozlabs.org>; Thu,  5 May 2022 10:23:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E03A9AE045
 for <linuxppc-dev@ozlabs.org>; Thu,  5 May 2022 10:23:25 +0000 (GMT)
Received: from [9.43.97.174] (unknown [9.43.97.174])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@ozlabs.org>; Thu,  5 May 2022 10:23:25 +0000 (GMT)
Message-ID: <0881a917-526a-0c9f-b001-eed9b6cb0dca@linux.ibm.com>
Date: Thu, 5 May 2022 15:53:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ppc64: update the NR_CPUS to 8192
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
References: <20220505101842.49149-1-sourabhjain@linux.ibm.com>
In-Reply-To: <20220505101842.49149-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 01MCc2jndrkKMSR4CaOqfgXQZEMvCxwH
X-Proofpoint-GUID: 01MCc2jndrkKMSR4CaOqfgXQZEMvCxwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=952
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1011 bulkscore=0
 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050071
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 05/05/22 15:48, Sourabh Jain wrote:
> The NR_CPUS on Linux kernel ranges from 1-8192. So let's match
> NR_CPUS with max NR_CPUS count on Linux kernel.
>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   defs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/defs.h b/defs.h
> index 1e8360d..a6735d0 100644
> --- a/defs.h
> +++ b/defs.h
> @@ -136,7 +136,7 @@
>   #define NR_CPUS  (4096)
>   #endif
>   #ifdef PPC64
> -#define NR_CPUS  (2048)
> +#define NR_CPUS  (8192)
>   #endif
>   #ifdef S390
>   #define NR_CPUS  (512)

Please ignore the patch was just meant for crash tool.

Thanks,
Sourabh Jain
