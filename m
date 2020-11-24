Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E312C29AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 15:33:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgRMJ0QXMzDqXC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 01:33:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xb+B0nz+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgRGl2x12zDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 01:28:59 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AOE2I7T090896; Tue, 24 Nov 2020 09:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+Rzo+UcZrxQVSygpiFP4yvX8SyHUZGUYjgrdUKtnEoQ=;
 b=Xb+B0nz+nK2qI9P+th/CHifVb13Jgkut/Fm5nIoBEngod98bS2jmEOBVcZW8G0NZ/AUm
 0PpN7MvroyKseMV53/d1o6CE+PI5InRFSHhkil2dI5ZTnaRREq0FL9m9rDd6yaoBhoRU
 unRl0Nalb8pVfev6TImEnXjP1zWwWX56IF8dvNfWc6tVLLykYcmQeMtHYSvAFTQvSUKI
 TI70ccxBLoeGbNhNXtc7N9ZD6MSz+U8QLzhhfF1AuSdFMaS/ja3CuLmqy2ZHnxzohjjI
 uAkGn7QKDwfoD//zwRY6hbVJeVsJA4xlrukK1pAleRNgn++Hsna1Q2skZuRkl2+Q8ysU gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350meqmpht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 09:28:32 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AOE2O0M091371;
 Tue, 24 Nov 2020 09:28:31 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350meqmpha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 09:28:31 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AOER5Ju020080;
 Tue, 24 Nov 2020 14:28:30 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 34xth9wvm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 14:28:30 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AOEST2K36110604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 14:28:29 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B5802805E;
 Tue, 24 Nov 2020 14:28:29 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 651BC28059;
 Tue, 24 Nov 2020 14:28:29 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 24 Nov 2020 14:28:29 +0000 (GMT)
Subject: Re: [PATCH] tpm: ibmvtpm: fix error return code in tpm_ibmvtpm_probe()
To: Wang Hai <wanghai38@huawei.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, peterhuewe@gmx.de,
 jarkko@kernel.org, jgg@ziepe.ca, nayna@linux.ibm.com
References: <20201124135244.31932-1-wanghai38@huawei.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <7faf1b71-2bcb-8133-5fc8-2be96085dfc1@linux.ibm.com>
Date: Tue, 24 Nov 2020 09:28:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201124135244.31932-1-wanghai38@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_04:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011240084
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
Cc: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/24/20 8:52 AM, Wang Hai wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: d8d74ea3c002 ("tpm: ibmvtpm: Wait for buffer to be set before proceeding")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>
> ---
>   drivers/char/tpm/tpm_ibmvtpm.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
> index 994385bf37c0..813eb2cac0ce 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -687,6 +687,7 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
>   				ibmvtpm->rtce_buf != NULL,
>   				HZ)) {
>   		dev_err(dev, "CRQ response timed out\n");
> +		rc = -ETIMEDOUT;
>   		goto init_irq_cleanup;
>   	}
>   

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

