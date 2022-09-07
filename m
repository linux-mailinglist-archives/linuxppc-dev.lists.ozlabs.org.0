Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB175AFDA2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 09:35:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMvF74wQRz3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 17:35:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X9sMmUXb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X9sMmUXb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMvDP35pKz2y8J
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 17:35:16 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2876NbP8026200;
	Wed, 7 Sep 2022 07:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=WPWMtIvGpQnxPLV6mOT1LP/qsbfR3oGYV9JqlZPkNx4=;
 b=X9sMmUXbqNAOAk31d7JkgeVPafmELhngilZrcrH6ZI5EQN1gEsggXdoe+SJVeAisg3Ii
 h4rPuDcR+d9Lk51oujUHPp0l63W+DqJ3SM5FC+k0j/gmZo1JSv+cYqYlVK/Nbt5VeiHM
 /DWYmMdZPwPjfuXJ7kxigsax7C2hnMvzUT3adzbyLrl5TJjl4WlV9P/SmhuHd3udHDe9
 5c0dLkP5JqyaQMgz2xQPNBvtgZEAfBXMViDxwBfbLDezeG6EN+73I211spaqu07vpvu/
 B6cUMX7xB3oejYux7WsWvV79CRj0rMnO0V04yWmq2Zw9yTmY+Cbwqazqs8Lm6OaMMEux LA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jep08a0wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Sep 2022 07:35:07 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2877RRLt031889;
	Wed, 7 Sep 2022 07:35:07 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jep08a0tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Sep 2022 07:35:06 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2877KO7q002396;
	Wed, 7 Sep 2022 07:35:04 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04fra.de.ibm.com with ESMTP id 3jbxj8khj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Sep 2022 07:35:04 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2877Z2EN35520938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Sep 2022 07:35:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 002BFAE045;
	Wed,  7 Sep 2022 07:35:02 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E4ACAE055;
	Wed,  7 Sep 2022 07:35:01 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  7 Sep 2022 07:35:01 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EB5CD600A6;
	Wed,  7 Sep 2022 17:34:50 +1000 (AEST)
Message-ID: <744e04b545ed8f9a87c9728041169bb9b55edfad.camel@linux.ibm.com>
Subject: Re: [PATCH linux-next] ocxl: Remove the unneeded result variable
From: Andrew Donnellan <ajd@linux.ibm.com>
To: cgel.zte@gmail.com, fbarrat@linux.ibm.com
Date: Wed, 07 Sep 2022 17:34:43 +1000
In-Reply-To: <20220906072006.337099-1-ye.xingchen@zte.com.cn>
References: <20220906072006.337099-1-ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mieZ9fv_Ehh8vtpj8Z4aaVLoScdr0XZm
X-Proofpoint-ORIG-GUID: 5Yms27kvnICqZOSTtzg2GeVTPJ4Tb07s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_04,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=815 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070031
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
Cc: ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2022-09-06 at 07:20 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Return the value opal_npu_spa_clear_cache() directly instead of
> storing
> it in another redundant variable.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>  arch/powerpc/platforms/powernv/ocxl.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/ocxl.c
> b/arch/powerpc/platforms/powernv/ocxl.c
> index 27c936075031..629067781cec 100644
> --- a/arch/powerpc/platforms/powernv/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/ocxl.c
> @@ -478,10 +478,8 @@ EXPORT_SYMBOL_GPL(pnv_ocxl_spa_release);
>  int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int
> pe_handle)
>  {
>         struct spa_data *data = (struct spa_data *) platform_data;
> -       int rc;
>  
> -       rc = opal_npu_spa_clear_cache(data->phb_opal_id, data->bdfn,
> pe_handle);
> -       return rc;
> +       return opal_npu_spa_clear_cache(data->phb_opal_id, data-
> >bdfn, pe_handle);
>  }
>  EXPORT_SYMBOL_GPL(pnv_ocxl_spa_remove_pe_from_cache);
>  

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

