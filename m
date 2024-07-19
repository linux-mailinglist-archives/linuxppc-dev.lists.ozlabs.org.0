Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F5593717D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 02:26:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FiT9Uhzc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQ9TP0hjcz3fR8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2024 10:26:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FiT9Uhzc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQ9Sg22rrz3c8Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2024 10:25:53 +1000 (AEST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46ICLeXP026945;
	Fri, 19 Jul 2024 00:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vVe8gBu1FHvCbBfTE5T+pB0LJssvC9dbvIOsjYOJ9ag=; b=FiT9UhzcIy4pewo/
	1I6yJaStfAUunFNzL1VZVovEsfo1n0tIcgaAJQkTznJYr3CwCKyq0PhYYibAs/n2
	a4N/T4/ob7GvBM8jRtEeJGAd0++bTwzAO2tn+IJpkKrBqZ4sQZ2CqIhvz/TGJ3vh
	RpqFrIlT40eL8ofAkTA1eNsVs7MbBIjQL/f4QYDEpzLAN398fZsKH/88IU+6jHc/
	fiD8dEf1bAgPvYLVRnHSwoi+DMGx8uljvMwjrcv4q317Ct2TKMO72aJTdF4D/ihZ
	19JiAlklb8C3stRfAKzy2fFhfCt3ejPZ0L1CtR0N4/NrR/XKCJkcKNPw5tMUt7fE
	Yaio0g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfs7392-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 00:25:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46J0P9SB020987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 00:25:09 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Jul
 2024 17:25:09 -0700
Message-ID: <e27ccb59-0a3b-4845-bec4-f64830b2492e@quicinc.com>
Date: Thu, 18 Jul 2024 17:25:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] crypto: X25519 core functions for ppc64le
To: Danny Tsen <dtsen@linux.ibm.com>, <linux-crypto@vger.kernel.org>
References: <20240516151957.2215-1-dtsen@linux.ibm.com>
 <20240516151957.2215-3-dtsen@linux.ibm.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240516151957.2215-3-dtsen@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4SaSaKnBK17EHCcP3C8wigKZvVER_YJQ
X-Proofpoint-GUID: 4SaSaKnBK17EHCcP3C8wigKZvVER_YJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_17,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407190002
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, appro@cryptogams.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/16/24 08:19, Danny Tsen wrote:
> X25519 core functions to handle scalar multiplication for ppc64le.
> 
> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> ---
>   arch/powerpc/crypto/curve25519-ppc64le-core.c | 299 ++++++++++++++++++
>   1 file changed, 299 insertions(+)
>   create mode 100644 arch/powerpc/crypto/curve25519-ppc64le-core.c
...

> +MODULE_ALIAS_CRYPTO("curve25519");
> +MODULE_ALIAS_CRYPTO("curve25519-ppc64le");
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Danny Tsen <dtsen@us.ibm.com>");

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning with make W=1. I'm in the process of building 
ppc64le with CRYPTO_CURVE25519_PPC64=m to validate my suspicion, but I 
expect this to generate a warning.

Can you submit a follow-up patch that adds a MODULE_DESCRIPTION()?
And since I'm trying to fix all of the existing issues in 6.11, Herbert 
can you push this to Linus when it lands?

Thanks,
/jeff
