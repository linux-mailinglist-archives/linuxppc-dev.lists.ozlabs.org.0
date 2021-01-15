Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 562522F729A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 06:55:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH9Q03qpNzDscW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 16:55:20 +1100 (AEDT)
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
 header.s=pp1 header.b=IqVj08km; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH9LW0DK1zDsbV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 16:52:18 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10F5W3nD166517; Fri, 15 Jan 2021 00:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ARy5R97V6IkBtnW0BEqx3+zb2kwgDWda1pINg3Vzcoo=;
 b=IqVj08kmprVfhycV3CdRtc7/dh9h+dHt5jl2XmeYymHilFQKYnvgcEGhEjQX7YufPldr
 466C7CMRnyW0GrV2vEdQlISuhe/u6YuMIk3MOC6pN7jNbFr5S+1R+QLa66dzHgssCA92
 SiMegoKgDq64AjzlX9RGQpuNwCMEBtEniOO3WP3a83fijXVpx8JSxGGEqZS1ZwA7KA3W
 J+m2a8myFaq7Sjb3gFscEbiVSsW04EA1VTMe04OVZFkHbCF9MXv1DyFrpHqXszuUYD60
 S2k5DjyjfezOit30TzAhEfeexeQ1URQGWBcquuXJSzITcts6jkBuiiTd9HMrh7g3rw1/ tw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3634ps8rgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 00:52:13 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10F5qBuB031692;
 Fri, 15 Jan 2021 05:52:11 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 35ydrdevsq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 05:52:11 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10F5q8dc46006726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 05:52:08 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBE6D42042;
 Fri, 15 Jan 2021 05:52:08 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AEDC4203F;
 Fri, 15 Jan 2021 05:52:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 05:52:08 +0000 (GMT)
Received: from [9.102.61.252] (unknown [9.102.61.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 28C2E601F6;
 Fri, 15 Jan 2021 16:52:07 +1100 (AEDT)
Subject: Re: [PATCH 2/6] powerpc/rtas-proc: remove unused RMO_READ_BUF_MAX
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-3-nathanl@linux.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <7486c7bb-b9b7-e120-bf0a-ea1776d232dd@linux.ibm.com>
Date: Fri, 15 Jan 2021 16:52:06 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114220004.1138993-3-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_01:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101150027
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
> This constant is unused.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

A quick grep agrees.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>   arch/powerpc/kernel/rtas-proc.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas-proc.c b/arch/powerpc/kernel/rtas-proc.c
> index e0f8329966d6..d2b0d99824a4 100644
> --- a/arch/powerpc/kernel/rtas-proc.c
> +++ b/arch/powerpc/kernel/rtas-proc.c
> @@ -755,8 +755,6 @@ static int ppc_rtas_tone_volume_show(struct seq_file *m, void *v)
>   	return 0;
>   }
>   
> -#define RMO_READ_BUF_MAX 30
> -
>   /**
>    * ppc_rtas_rmo_buf_show() - Describe RTAS-addressable region for user space.
>    *
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
