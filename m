Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE472A2D0C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Nov 2020 15:34:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPwQq2pc2zDqTL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 01:34:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VTlEatNm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPwKq2CTpzDqBd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 01:29:50 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A2E21nB096586; Mon, 2 Nov 2020 09:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=A211HEQL0o7cFFR+RWcWVCddjHLxzWcqy3gPnBa+C8k=;
 b=VTlEatNmT6+qBybENdZpVeDhU5nPZsplJ8TMszK0Q0GjbcatAZ8F8LHfM1oooVKYqpqU
 uE7uRVde+VYVzqyVnMRYgnZBYY1xF4UfZeNzQ/585ul7rBhCpAMDtod7V+QoAIR9JS6J
 kY7K6GFhSxuPQ+3f2diB8+G5EnLVJlgG84jkq+TbVuQt9+9TLrlOOJjUgOYTI6l1x31m
 qxD5aD1LGnyasJ46kQXTOh9dF/gq9qZEkXr0qT2WIGc97kZkF8aUlJjZ4yG9Ce8p1v4w
 AjQouYhZeTwvSsk5MOFrmSL7k0yhzyycJCBzRYDjaunbc5LcfuJssyGtdB9FsjvDMWqB Rw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34jfjpgq0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 09:29:38 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A2ET8ap001320;
 Mon, 2 Nov 2020 14:29:36 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 34h0fct6xp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 14:29:36 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A2ETYBC852580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Nov 2020 14:29:34 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 473C911C04C;
 Mon,  2 Nov 2020 14:29:34 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FAE511C04A;
 Mon,  2 Nov 2020 14:29:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.4.98])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  2 Nov 2020 14:29:33 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] misc: ocxl: config: Rename function attribute
 description
To: Lee Jones <lee.jones@linaro.org>, gregkh@linuxfoundation.org, arnd@arndb.de
References: <20201102142001.560490-1-lee.jones@linaro.org>
 <20201102142001.560490-2-lee.jones@linaro.org>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <b06fdb27-c799-c339-f3be-c1d5bccf41c1@linux.ibm.com>
Date: Mon, 2 Nov 2020 15:29:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201102142001.560490-2-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-02_07:2020-11-02,
 2020-11-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011020107
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/11/2020 à 15:20, Lee Jones a écrit :
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/misc/ocxl/config.c:81: warning: Function parameter or member 'dev' not described in 'get_function_0'
>   drivers/misc/ocxl/config.c:81: warning: Excess function parameter 'device' description in 'get_function_0'
> 
> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---


Thanks!
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>


>   drivers/misc/ocxl/config.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
> index 4d490b92d951f..a68738f382521 100644
> --- a/drivers/misc/ocxl/config.c
> +++ b/drivers/misc/ocxl/config.c
> @@ -73,7 +73,7 @@ static int find_dvsec_afu_ctrl(struct pci_dev *dev, u8 afu_idx)
>   
>   /**
>    * get_function_0() - Find a related PCI device (function 0)
> - * @device: PCI device to match
> + * @dev: PCI device to match
>    *
>    * Returns a pointer to the related device, or null if not found
>    */
> 
