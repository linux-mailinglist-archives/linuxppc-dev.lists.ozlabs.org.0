Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D698F945F76
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 16:33:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TWXbk7re;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wb7bv5lqcz3dXW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 00:33:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TWXbk7re;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb7b76jJLz3dTD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2024 00:32:34 +1000 (AEST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471LaPm5030335;
	Fri, 2 Aug 2024 14:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9jGJgJ9V12KPKJ2H/b+srBOfxdv/A3plkP+vj24OtQc=; b=TWXbk7rexId82YxK
	SxJaXiSGHaf43SsiaRamGdGUpaMeyaDUNkDBAaJO6Fak+0W6qgmx5iqgLNMjPKiw
	DL5zpMMY5v9ze7Mq9vlMPZj9aIgYnnfhfsODBbzll3WZ8/4qs2dsRWkZy0j+3gl0
	XemcUmRqMRA5TVclTPchZEdKZEZD3DU/0uFKcUmXd7yneZxyPrsdll51m2AgQdSD
	FGPTOT+R4F45wtRX2KWQYiUwh7pCyEA2/pTHE5Aczyy4Cv8OfgPZ+tovu9D/VDmQ
	k5AacKOUt0StqP5j0Hmgga4R1dUgr7DxuVHjBF9Qm+zXeDLctb+DeeWGt94ZhSDM
	bGBliQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje39vwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 14:27:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 472ERBgL015419
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 Aug 2024 14:27:11 GMT
Received: from [10.111.177.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 Aug 2024
 07:27:10 -0700
Message-ID: <75a526e3-3101-4319-b42f-4482ba188abc@quicinc.com>
Date: Fri, 2 Aug 2024 07:27:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: ppc/curve25519 - add missing MODULE_DESCRIPTION()
 macro
Content-Language: en-US
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20240718-md-powerpc-arch-powerpc-crypto-v1-1-b23a1989248e@quicinc.com>
 <ZqzcApbJomFTnc30@gondor.apana.org.au>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <ZqzcApbJomFTnc30@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dJM_C4AoOg1Arky9t5lMDOo5b6Ezokk_
X-Proofpoint-GUID: dJM_C4AoOg1Arky9t5lMDOo5b6Ezokk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_10,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 phishscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408020099
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
Cc: Arnd Bergmann <arnd@kernel.org>, kernel-janitors@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Greg KH <gregkh@linuxfoundation.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/2/2024 6:15 AM, Herbert Xu wrote:
> On Thu, Jul 18, 2024 at 06:14:18PM -0700, Jeff Johnson wrote:
>> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
>> description is missing"), a module without a MODULE_DESCRIPTION() will
>> result in a warning with make W=1. The following warning is being
>> observed when building ppc64le with CRYPTO_CURVE25519_PPC64=m:
>>
>> WARNING: modpost: missing MODULE_DESCRIPTION() in arch/powerpc/crypto/curve25519-ppc64le.o
>>
>> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>>  arch/powerpc/crypto/curve25519-ppc64le-core.c | 1 +
>>  1 file changed, 1 insertion(+)
> 
> Patch applied.  Thanks.

Great, that was the last of my MODULE_DESCRIPTION patches!!!

There are a few more instances of the warning that Arnd has patches for,
covering issues that appear in randconfigs that I didn't test.

/jeff
