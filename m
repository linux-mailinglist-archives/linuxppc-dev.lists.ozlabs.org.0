Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D1D73650B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:44:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n3WrWDET;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QldvB42pwz30Pp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 17:44:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n3WrWDET;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QldtJ4HBCz2yxt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:43:52 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35K7f4JD015190;
	Tue, 20 Jun 2023 07:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=fjrabIf4HS+xzHGwit1Rg45PNAxZkLQNHIOhQQVNugE=;
 b=n3WrWDETlTbShH8SjKvcY+TjosLZdL1eXtLge/wbGHiLDKdfr32XWzIGNlK/3p6FNl1m
 Gj/3MoGY6yi6Mogxwnxj45jek4EMgCSP6emlZ9wGVMEJ7sJC2IHrqguvCVM6jZvJR+S5
 CE4UB9wG/FWbvQsT7eMKWPR51AFE848YSBYPQWe+BU1FATgKTmCzNh1ZWQj14YVE0CMY
 H6RR9ZJ9vIofK9+V8HDqPOusJntbbmbUDmrgp0zs39VIPMuS31WsjhulbXfwxJ5tg/1w
 oD4Srn+xv5Wegbvf+LsYXj0DZE9TY2rkbq2zBNcCqHoPEAF2hR0GEG2qDM4nVylIFkBf bg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rb7kt8r7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2023 07:43:32 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35K3S3J1028011;
	Tue, 20 Jun 2023 07:43:29 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r943e1x3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jun 2023 07:43:29 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35K7hRq810420824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jun 2023 07:43:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C1B72004B;
	Tue, 20 Jun 2023 07:43:27 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BBB220040;
	Tue, 20 Jun 2023 07:43:27 +0000 (GMT)
Received: from [9.101.4.34] (unknown [9.101.4.34])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Jun 2023 07:43:26 +0000 (GMT)
Message-ID: <b75bb8b1-6d55-8062-00f2-dff4ff59efdd@linux.ibm.com>
Date: Tue, 20 Jun 2023 09:43:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH] cxl/ocxl: Possible repeated word
Content-Language: en-US
To: zhumao001@208suo.com, ajd@linux.ibm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org
References: <20230618150648.1123-1-dengshaomin@cdjrlc.com>
 <787f5a712a0459bc21d83bb388770b58@208suo.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <787f5a712a0459bc21d83bb388770b58@208suo.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fgj1IvywEEuKdP1K7-hS11tDgkbwWIGL
X-Proofpoint-ORIG-GUID: fgj1IvywEEuKdP1K7-hS11tDgkbwWIGL
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_04,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1011 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200067
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello,

While the correction in the comment is of course ok, the patch was sent 
as html. You may want to check/fix how it was submitted.

   Fred


On 18/06/2023 17:08, zhumao001@208suo.com wrote:
> Delete repeated word in comment. Signed-off-by: Zhu Mao <zhumao001@ 
>  208suo. com> --- drivers/misc/cxl/native. c | 2 +- 1 file changed, 1 
> insertion(+), 1 deletion(-) diff --git a/drivers/misc/cxl/native. c 
> b/drivers/misc/cxl/native. cindex
> ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/PjiDSg!2k-hI76VihO6WgXx-IHFLxDVOAL2DdWMKjPu4ApiehtDXYjNrTR1Cj6nYDmD8SP9M8AZ7TpWUloL0Ixn_2IX60uI2MsuBkM$>
> ZjQcmQRYFpfptBannerEnd
> Delete repeated word in comment.
> 
> Signed-off-by: Zhu Mao <zhumao001@208suo.com>
> ---
>   drivers/misc/cxl/native.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/cxl/native.c b/drivers/misc/cxl/native.c
> index 50b0c44bb8d7..6957946a6463 100644
> --- a/drivers/misc/cxl/native.c
> +++ b/drivers/misc/cxl/native.c
> @@ -920,7 +920,7 @@ int cxl_attach_dedicated_process_psl9(struct 
> cxl_context *ctx, u64 wed, u64 amr)
>        * Ideally we should do a wmb() here to make sure the changes to the
>        * PE are visible to the card before we call afu_enable.
>        * On ppc64 though all mmios are preceded by a 'sync' instruction 
> hence
> -     * we dont dont need one here.
> +     * we dont need one here.
>        */
> 
>       result = cxl_ops->afu_reset(afu);
