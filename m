Return-Path: <linuxppc-dev+bounces-14382-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75601C7637F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Nov 2025 21:39:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dC9FQ20G8z2yvR;
	Fri, 21 Nov 2025 07:39:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763639763;
	cv=none; b=d7qtJLgkqvYZTNOdqMmi+GPhdKfmW7mR/5sGvaWossHQJW6RQUlBbBt18Z99BaUzF+Cf3XNpSKCXcNsAXz7TA9lR6O5BfUI3lYoj1OWnv+UGXaX4g0uQiEMic0GPt6ktJoNpHLq89L+RTl2FuUEhG85BqsfsVRrvKTE9l+rzSG1B2x2nqN3yanQQgikF2oEUw35zZMVNTT0QBcg9gt1NRl6/6VTFZP+s08KtNbJfbNM75qFnp0f2Eh2D2+5cmhsEMDSBQJakXLRathlTABwjTNNaLoXkrV1ubQsB614tXZ2RjU8d5Jq4WsVKi231S2WjEGscPJHuXTLY8DT9HsIRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763639763; c=relaxed/relaxed;
	bh=dr5gW+Bnmja65/oHP10quRQfyi6Cq/M7AS+1v6VIg6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dXMlijFo+LArHDWuRoDSKh7exOEtORGcrnHuoKGJerdeOyk6xaOZpkbipKRqE/6vnF/hG/ecGYqNjLZCCDqBvd+TtjdCktKlE9k97lh5ehWtOZlg9dHEo1D4BOif1EFN5hIa+S8Ae+Xwh1Dpzpusy24uWYXm7xxq+0wBBtzSe/26GfLPWRKVnmBUMJj0xS2rUb+CY/gc1aEgbkMcJc9UBCiAujJHD73qXRrhHTn8v7evfdNcqD8+yVPK1JK75eIxrRzQIBdrazWIl6EVGbHTJS0RefeAUcBtR0TG1mYbH2eEjIwopN5uQYhc8pz1r0GQom8KeV4/ktE55FHPwGq6/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ptij1X5w; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ptij1X5w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBxdG37qsz2xqh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Nov 2025 22:56:02 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJLksYZ002704;
	Thu, 20 Nov 2025 11:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dr5gW+
	Bnmja65/oHP10quRQfyi6Cq/M7AS+1v6VIg6M=; b=ptij1X5wWrrphAxTefDIfb
	ZNAI9xC79Ltg6J4BqLdOlp51/OYpqS/1waUeUhpNla/4irXVIR2NQNwGaU7eVOW2
	psa/sB/45eP9D2Va0mnghovqP0atyDhfdfoAkc2BYHGsTCyGkzauFlFkZ8RdCGUQ
	WCNSbKFgbJaO5ZGh1XEE6IgPik43h5IEumzlA4G/U0Hj+D7QOSvACjr2FVmGIjH+
	ntjs2V9yLEa/a3TZIxA3B7JVWHWTft7Q0nzWanp02TsjQ6VIZynICGXN3nys4X3R
	uHWYQpSgN7yIucn993dnOjSdVVAzBqaJ6XxCvXQXO70CjRV3AmJa1M0gs5Mqd3NA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejju4rcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 11:55:57 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKAIfRF006964;
	Thu, 20 Nov 2025 11:55:57 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af62jnyew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 11:55:57 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AKBtrwm40567100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Nov 2025 11:55:53 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6065C20043;
	Thu, 20 Nov 2025 11:55:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B5FA20040;
	Thu, 20 Nov 2025 11:55:53 +0000 (GMT)
Received: from [9.83.151.220] (unknown [9.83.151.220])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Nov 2025 11:55:53 +0000 (GMT)
Message-ID: <9cf7460c-bc5d-41bd-a851-9c1ee20e6c46@linux.ibm.com>
Date: Thu, 20 Nov 2025 12:55:52 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Downgrade ocxl to Odd Fixes
To: Andrew Donnellan <ajd@linux.ibm.com>,
        Christophe Lombard <clombard@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20251120-ocxl-odd-fixes-v1-1-8b766f114621@linux.ibm.com>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20251120-ocxl-odd-fixes-v1-1-8b766f114621@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Rpr204lgXhyw1NdgCOvKGg8XKV_EBbeQ
X-Proofpoint-ORIG-GUID: Rpr204lgXhyw1NdgCOvKGg8XKV_EBbeQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX0eqPOBGWZXBJ
 xCqi7kIO8b9SgnojTphxVPkstWyYQL3qX1B6DgtQ02zCX+OGhZ+ytQOcaHbFR3wBAL1wRCa8t2H
 v1HZKLAQYspCaP5RBFXj9vw4ZCT/gPTLupJ+C/O90fLD8oUk1bdNqryGTe+XtJBKKD58eHnqBx3
 JLKh+fpWh/yYFne9/SUDh5XpD99MxIghlXzWKdKgrvB8Rm5qE7IrIOVfhGXh21dkGbwi1jLU6pJ
 qUE7BzFpGisT7mBIU6n+/bGYZXW+S1sZtTAUm6zgS6JVaiA/8UnXM7nymk8QJ3AIaAAWiqQadkq
 s7Fg7mlayPnqJ5vvk7o6mjKTLmHVkMLwgk57bIB6EhWRCzpIO539rSwHS0dqrCne+P8Fdmy9VUh
 hQRNDcoL63NvdeG7rOJTwUfrXr6/lg==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691f01ce cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=d5wiqgb7aCjHM72NYWoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 20/11/2025 à 04:16, Andrew Donnellan a écrit :
> There hasn't been any substantive work on the ocxl driver since 2020, and
> all patches since then have been minor fixes or part of treewide or
> arch-wide changes. Frederic and I are no longer spending much time on this
> driver.
> 
> Downgrade the status of the ocxl driver to Odd Fixes, to reflect the
> current reality.
> 
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea8194ac8970d0e34421670b663347b4678a34de..3d558554f074916364b013855dc0a82cfb6e73f2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18755,7 +18755,7 @@ OCXL (Open Coherent Accelerator Processor Interface OpenCAPI) DRIVER
>   M:	Frederic Barrat <fbarrat@linux.ibm.com>
>   M:	Andrew Donnellan <ajd@linux.ibm.com>
>   L:	linuxppc-dev@lists.ozlabs.org
> -S:	Supported
> +S:	Odd Fixes
>   F:	Documentation/userspace-api/accelerators/ocxl.rst
>   F:	arch/powerpc/include/asm/pnv-ocxl.h
>   F:	arch/powerpc/platforms/powernv/ocxl.c
> 
> ---
> base-commit: 23cb64fb76257309e396ea4cec8396d4a1dbae68
> change-id: 20251120-ocxl-odd-fixes-6a87a68dd270
> 
> 
> --
> Andrew Donnellan    OzLabs, ADL Canberra
> ajd@linux.ibm.com   IBM Australia Limited
> 


