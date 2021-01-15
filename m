Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DF52F7298
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 06:51:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH9Kp6Gn3zDsb4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 16:51:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=P7gQYIzN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH9Hw2zrQzDsZ1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 16:50:03 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10F5h5rP042082; Fri, 15 Jan 2021 00:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=iGfcYIJFbznPuW5F8GLISBLwN+/bsKvYMl6QS6ML5sQ=;
 b=P7gQYIzNKTU/2AtFZVNYLlcu+ED1MCnXdILYNR+DLRE3ERBhbRwawL70NogDzvW2vm/z
 lAfryGRS6GnAERTVU89ATMmRSYePEJACnxx6SMhsde5OF1ifzs15CDWI9YtMssKTKd1X
 9jKgimB7c/w06//J6Kkqd1U0DM/ok/QJtky/mO9YCDRlOELba040sqSRZgyCEY43+RDd
 XvezZte9UAZhGQ61Eq7eFAJQUqOxxOXgeUdmF4s3st4eRc8+G8Sjj6jx76fuvY1aImK9
 Z3DzcuthAD3VJgQ9IJcu1Fjy64GyXpFLcOTZmy6xF4IQOYrkmjvYMJN/+5+WU6oXdiqj TQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3635508493-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 00:49:54 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10F5WWmw006262;
 Fri, 15 Jan 2021 05:49:53 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 35y448fac5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 05:49:52 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10F5njd330540194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 05:49:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A92FB4C044;
 Fri, 15 Jan 2021 05:49:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58CA04C040;
 Fri, 15 Jan 2021 05:49:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 05:49:50 +0000 (GMT)
Received: from [9.102.61.252] (unknown [9.102.61.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 839AD601F5;
 Fri, 15 Jan 2021 16:49:48 +1100 (AEDT)
Subject: Re: [PATCH 4/6] powerpc/rtas: move syscall filter setup into separate
 function
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-5-nathanl@linux.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <5347b6e7-0c7a-f65d-29d1-e3d58543df49@linux.ibm.com>
Date: Fri, 15 Jan 2021 16:49:44 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114220004.1138993-5-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_01:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150027
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
Cc: aik@ozlabs.ru, tyreld@linux.ibm.com, brking@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/1/21 9:00 am, Nathan Lynch wrote:
> Reduce conditionally compiled sections within rtas_initialize() by
> moving the filter table initialization into its own function already
> guarded by CONFIG_PPC_RTAS_FILTER. No behavior change intended.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

> +static void __init rtas_syscall_filter_init(void)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rtas_filters); i++) {
> +		rtas_filters[i].token = rtas_token(rtas_filters[i].name);
> +	}
> +
> +}

Unnecessary empty line, but vitally important braces :)


-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
