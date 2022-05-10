Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B93B52246C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 20:55:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyS0z1Vrfz3cM7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 04:55:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GdqPf84p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GdqPf84p; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyS075YKNz3bjq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 04:55:03 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24AIFd7x013308;
 Tue, 10 May 2022 18:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zj+ciaKGYskhPPR9+F46t3cZTHZTJSZYUcobdcGfY+c=;
 b=GdqPf84pDuoWF/mb8XaEXHAXHpL2lymIqptlQCzRzbMJnB/vXkT5KmefvjMGYolibVjn
 QFgN4pRa/Pd2lfn/KQh/YUEjmjfhQwG8sdh9I18vLnimL0twg9cE2I9APyIhnte0xFDa
 LH/BOUVP87rrbwyXG8lC/+JUaiudbWe4c/SrmSsaMfSXRHahJICZT9XdFyjsY6kqn6Ao
 R+es308b7tnxjWV1N7qYx30dPsKhh48q5NdJt2eyV6V5u8EWIJbI/W0CsPNRSyrRAVZi
 woQIm84gCryidwFlGsX1RkEPdGBRoaWwieiTIwc0CcG7negrctCJimcU0NjqDGdmRani Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyw628rgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 18:54:54 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24AIiuI6022838;
 Tue, 10 May 2022 18:54:54 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyw628rg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 18:54:54 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24AId58f016614;
 Tue, 10 May 2022 18:54:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3fwgd9f1p3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 18:54:52 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24AIsqP733030520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 May 2022 18:54:52 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2449D13605E;
 Tue, 10 May 2022 18:54:52 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38ED9136059;
 Tue, 10 May 2022 18:54:50 +0000 (GMT)
Received: from [9.160.170.88] (unknown [9.160.170.88])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 10 May 2022 18:54:50 +0000 (GMT)
Message-ID: <08d9470c-20db-52b8-7015-84f0ed29ad0c@linux.ibm.com>
Date: Tue, 10 May 2022 11:54:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] powerpc/eeh: Drop redundant spinlock initialization
Content-Language: en-US
To: Haowen Bai <baihaowen@meizu.com>, Russell Currey <ruscur@russell.cc>,
 "Oliver O'Halloran" <oohall@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <1652176394-4331-1-git-send-email-baihaowen@meizu.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <1652176394-4331-1-git-send-email-baihaowen@meizu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZDWTDKdbQcJ5VCuhPJargC0sHL62Pyj_
X-Proofpoint-GUID: oOxcxjEcoqwPVorQ5dp9o_-uGRqKN_hi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_05,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=875 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1011 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205100079
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/10/22 02:53, Haowen Bai wrote:
> slot_errbuf_lock has declared and initialized by DEFINE_SPINLOCK,
> so we don't need to spin_lock_init again, drop it.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index f9af879c0222..77b476093e06 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -848,7 +848,6 @@ static int __init eeh_pseries_init(void)
>  	}
> 
>  	/* Initialize error log lock and size */

Update the comment, or just drop it entirely?

-Tyrel

> -	spin_lock_init(&slot_errbuf_lock);
>  	eeh_error_buf_size = rtas_token("rtas-error-log-max");
>  	if (eeh_error_buf_size == RTAS_UNKNOWN_SERVICE) {
>  		pr_info("%s: unknown EEH error log size\n",

