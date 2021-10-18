Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8833D4328D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 23:10:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HY8fc0cxYz301F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 08:10:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VqhTedsC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VqhTedsC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HY8dm5DpSz2yS3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 08:09:47 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19IKxVRX008295; 
 Mon, 18 Oct 2021 17:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BDkVMWffyqmpIoyluN1eDCN/iczFwSrFK4pwZZk7jqg=;
 b=VqhTedsCZjzWA/iWnL08UKamzZ6ZZ34hwawUqTwQXm2o5s7pSyEtmFRZh7u2NHOm/x/7
 FKmo1UbeayvZyri84k2JG904Bjg0aVU0XI/HZ3/s5cI91tTOs9C77BbfVGKqMgQERjNJ
 Lsq7zgllMJ5QV7P1K47hcQDXrGIlPv/vOkFAsj17oQMsLqppU9/nsW74PxwD5ibHXz0J
 mPnw5b/lgMj+yRuJyTPbdV2knjcuhIVPN6XzJBe4kahmkn4uNFdgzappw73UHN+3vy+k
 zfVzbrCyzn/lIHV4sTSiiMhzwqVGNAo1Zy/ybYkDbS0pzAsCCEjPYlqqMBkebgTNiaKb TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bs8bpmkfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 17:09:36 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19IKxYjn008509;
 Mon, 18 Oct 2021 17:09:36 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bs8bpmkfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 17:09:36 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19IL81fq021056;
 Mon, 18 Oct 2021 21:09:35 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3bqpcaywht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 21:09:35 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19IL9YNM33751650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 21:09:34 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E430C6066;
 Mon, 18 Oct 2021 21:09:34 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D4CFC6059;
 Mon, 18 Oct 2021 21:09:32 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.235.71])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 21:09:32 +0000 (GMT)
Subject: Re: [PATCH][next] powerpc/vas: Fix potential NULL pointer dereference
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Haren Myneni <haren@linux.ibm.com>
References: <20211015050345.GA1161918@embeddedor>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <97c42e43-15b9-5db6-d460-dbb16f31954d@linux.ibm.com>
Date: Mon, 18 Oct 2021 14:09:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015050345.GA1161918@embeddedor>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jjEfsc0uU9hTp1jgkr7mgAjx7RJc61ww
X-Proofpoint-ORIG-GUID: T-oUCkfhnD21FXZhl8bo8dZAkS_FM3Vs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1011 suspectscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110180114
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/14/21 10:03 PM, Gustavo A. R. Silva wrote:
> (!ptr && !ptr->foo) strikes again. :)
> 
> The expression (!ptr && !ptr->foo) is bogus and in case ptr is NULL,
> it leads to a NULL pointer dereference: ptr->foo.
> 
> Fix this by converting && to ||
> 
> This issue was detected with the help of Coccinelle, and audited and
> fixed manually.
> 
> Fixes: 1a0d0d5ed5e3 ("powerpc/vas: Add platform specific user window operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Looking at the usage pattern it is obvious that if we determine !ptr attempting
to also confirm !ptr->ops is going to blow up.

LGTM.

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

> ---
>  arch/powerpc/platforms/book3s/vas-api.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
> index 30172e52e16b..4d82c92ddd52 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -303,7 +303,7 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
>  		return -EINVAL;
>  	}
> 
> -	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops->open_win) {
> +	if (!cp_inst->coproc->vops || !cp_inst->coproc->vops->open_win) {
>  		pr_err("VAS API is not registered\n");
>  		return -EACCES;
>  	}
> @@ -373,7 +373,7 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
>  		return -EINVAL;
>  	}
> 
> -	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops->paste_addr) {
> +	if (!cp_inst->coproc->vops || !cp_inst->coproc->vops->paste_addr) {
>  		pr_err("%s(): VAS API is not registered\n", __func__);
>  		return -EACCES;
>  	}
> 

