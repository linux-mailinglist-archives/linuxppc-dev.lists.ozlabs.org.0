Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 378A87A0A7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 18:11:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=db84Z3l2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmj4J16gkz3cnp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 02:11:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=db84Z3l2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmj3N6kXMz3bxY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 02:10:40 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38EG8qJs010389;
	Thu, 14 Sep 2023 16:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wxM/CRoD3JKaVnkmsw2ndIN0bmN3lKAlmmoxIO/1ADQ=;
 b=db84Z3l2Ma3GLDVNLusEIncP22DwWYdzo1c3anhq3g0GCzkhTFQogQCG1lsVgVro71dO
 Lp8+phjrmaihwlCsZ8NkkXbpkIEF3eLc+sAlgNpcUwAghQKAPjCGfZcKrg2QoMIMP63P
 Oecb6eBo3QZQ1pJ23J1YM0nXKx4JNQ8lB0K7iSEPoIby+EevnAg+JBW2BryVf7PfK8Iy
 O7lpkhypPOdIpel520S30TLm0AKnu4BdmEr8Moo5m/35su29IfHOPnD3FtQ+99M3GEVJ
 cGPua7kgKXzzXxMU6H+s/DDIolg3QtNEJvpjFyNvIWAdk9x5YdthZyZZB7ibyVulE4xC rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4584rax5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 16:10:27 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38EG9ZlL017308;
	Thu, 14 Sep 2023 16:10:27 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4584rasy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 16:10:26 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38EECXUc024033;
	Thu, 14 Sep 2023 16:10:25 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t131tmjax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 16:10:25 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38EGAOH83342852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Sep 2023 16:10:24 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF31A58051;
	Thu, 14 Sep 2023 16:10:24 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CC2E5805C;
	Thu, 14 Sep 2023 16:10:24 +0000 (GMT)
Received: from [9.61.37.125] (unknown [9.61.37.125])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Sep 2023 16:10:24 +0000 (GMT)
Message-ID: <54bf92e8-f884-1567-2149-caf638ff8f68@linux.ibm.com>
Date: Thu, 14 Sep 2023 09:10:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] powerpc: fix a memory leak
Content-Language: en-US
To: Yuanjun Gong <ruc_gongyuanjun@163.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20230914094620.3379729-1-ruc_gongyuanjun@163.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20230914094620.3379729-1-ruc_gongyuanjun@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ehf7fiFyzaUOI7NGdKsAxMSqMMcW1_UN
X-Proofpoint-ORIG-GUID: ZG1ahKUKrOA4vxNeAv_OcJngxTe42jz-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140139
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/14/23 02:46, Yuanjun Gong wrote:
> When one of the methods xive_native_alloc_irq_on_chip, irq_create_mapping
> or irq_get_handler_data fails, the function will directly return without
> disposing vinst->name and vinst. Fix it.
> 
> Fixes: c20e1e299d93 ("powerpc/vas: Alloc and setup IRQ and trigger port address")
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  arch/powerpc/platforms/powernv/vas.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
> index b65256a63e87..780740b478f0 100644
> --- a/arch/powerpc/platforms/powernv/vas.c
> +++ b/arch/powerpc/platforms/powernv/vas.c
> @@ -54,7 +54,7 @@ static int init_vas_instance(struct platform_device *pdev)
>  	struct xive_irq_data *xd;
>  	uint32_t chipid, hwirq;
>  	struct resource *res;
> -	int rc, cpu, vasid;
> +	int rc, cpu, vasid, ret;

You can you reuse rc for the return value in the error path instead of
introducing a new ret variable.

-Tyrel

> 
>  	rc = of_property_read_u32(dn, "ibm,vas-id", &vasid);
>  	if (rc) {
> @@ -102,6 +102,7 @@ static int init_vas_instance(struct platform_device *pdev)
>  	res = &pdev->resource[3];
>  	if (res->end > 62) {
>  		pr_err("Bad 'paste_win_id_shift' in DT, %llx\n", res->end);
> +		ret = -ENODEV
>  		goto free_vinst;
>  	}
> 
> @@ -111,21 +112,24 @@ static int init_vas_instance(struct platform_device *pdev)
>  	if (!hwirq) {
>  		pr_err("Inst%d: Unable to allocate global irq for chip %d\n",
>  				vinst->vas_id, chipid);
> -		return -ENOENT;
> +		ret = -ENOENT;
> +		goto free_vinst;
>  	}
> 
>  	vinst->virq = irq_create_mapping(NULL, hwirq);
>  	if (!vinst->virq) {
>  		pr_err("Inst%d: Unable to map global irq %d\n",
>  				vinst->vas_id, hwirq);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto free_vinst;
>  	}
> 
>  	xd = irq_get_handler_data(vinst->virq);
>  	if (!xd) {
>  		pr_err("Inst%d: Invalid virq %d\n",
>  				vinst->vas_id, vinst->virq);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto free_vinst;
>  	}
> 
>  	vinst->irq_port = xd->trig_page;
> @@ -168,7 +172,7 @@ static int init_vas_instance(struct platform_device *pdev)
>  free_vinst:
>  	kfree(vinst->name);
>  	kfree(vinst);
> -	return -ENODEV;
> +	return ret;
> 
>  }
> 

