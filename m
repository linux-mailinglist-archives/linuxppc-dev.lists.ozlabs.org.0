Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4DA5BC0C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 02:06:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MW4jV2Jg8z3bP1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 10:06:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fL59jwUR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fL59jwUR;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MW4hh3xm3z2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 10:06:11 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28IKnp3q005379;
	Mon, 19 Sep 2022 00:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=kFcIlrdEX+zNRtD5J5TZQ161xOSIpnmIETOLyo49t1s=;
 b=fL59jwURaPcUCpDWb6fwmK8GYOJ1RNKI7s1VOTR3gn2XYTHIhPZG0DhKULdM0ElFT/d9
 cGsgBy1lYp57pdDBLDaew5KTCep6XGvhYTzMF4Bk5ucCjD2k28IRS5CyYnzEt41hT2eC
 LoM74ShtUFECAnNL0vDwF2Dntr4IASapQz5Z95YNQRTCEDhGHNXQ9zG/z/rDfCi/Mghd
 /Y7j531YPcb8fkB2el85mYJ1lecbcAca00Itzjbp0xBzEig8oAP2eccgfBEiawn/9qCh
 seLjJ7FLdQHC6n7nJH8vvcVM+EMjXvbrNaWK59iM0mIuZ4T7mibv9ta0ZmWpHSVgVqf1 rg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jpaqb2t9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 00:05:59 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28J05b6b011663;
	Mon, 19 Sep 2022 00:05:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06fra.de.ibm.com with ESMTP id 3jn5ghh85a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 00:05:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28J05tmV46661938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Sep 2022 00:05:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9021CAE04D;
	Mon, 19 Sep 2022 00:05:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3AAA8AE045;
	Mon, 19 Sep 2022 00:05:55 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 19 Sep 2022 00:05:55 +0000 (GMT)
Received: from [9.43.174.23] (unknown [9.43.174.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7F0CE602EA;
	Mon, 19 Sep 2022 10:05:47 +1000 (AEST)
Message-ID: <3622c8a3a55a5c4193a7bd4fe9e5d6bfa781aa5d.camel@linux.ibm.com>
Subject: Re: [PATCH] cxl: fix repeated words in comments
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Jilin Yuan <yuanjilin@cdjrlc.com>, fbarrat@linux.ibm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org
Date: Mon, 19 Sep 2022 10:05:42 +1000
In-Reply-To: <20220918100312.26836-1-yuanjilin@cdjrlc.com>
References: <20220918100312.26836-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TdFa_OcEWbQ676_SbJFcYUkPJj59yXv1
X-Proofpoint-GUID: TdFa_OcEWbQ676_SbJFcYUkPJj59yXv1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-18_10,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209180184
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

On Sun, 2022-09-18 at 18:03 +0800, Jilin Yuan wrote:
> Delete the redundant word 'dont'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com


Thanks for the catch. While you're there, perhaps fix the spelling to
"don't".

> ---
>  drivers/misc/cxl/native.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/cxl/native.c b/drivers/misc/cxl/native.c
> index 50b0c44bb8d7..6957946a6463 100644
> --- a/drivers/misc/cxl/native.c
> +++ b/drivers/misc/cxl/native.c
> @@ -920,7 +920,7 @@ int cxl_attach_dedicated_process_psl9(struct
> cxl_context *ctx, u64 wed, u64 amr)
>          * Ideally we should do a wmb() here to make sure the changes
> to the
>          * PE are visible to the card before we call afu_enable.
>          * On ppc64 though all mmios are preceded by a 'sync'
> instruction hence
> -        * we dont dont need one here.
> +        * we dont need one here.
>          */
>  
>         result = cxl_ops->afu_reset(afu);

-- 
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

