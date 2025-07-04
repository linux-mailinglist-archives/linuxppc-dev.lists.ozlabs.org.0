Return-Path: <linuxppc-dev+bounces-10087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 386AFAF8C49
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 10:43:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYRxM0kvkz30Vl;
	Fri,  4 Jul 2025 18:43:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751618615;
	cv=none; b=RwdJ05+CQaq86TLZzKqBiayquusr+qTzt2NX2s2UePPlFRxNvYLe9WpxgqON7k6oOK7Wc5y1SOQGPH+/yp9REKDB1hKaYNRFsd3+k0mf0mma7zQmwxxcOypusrSqMel0Mf3JpeBVaDMa2k5uEZsED3C0cBj/zvJJ3Seuj1tBPn2nXWLWaiB8Fj+zCiQbOobIB+SwPtG9YId4VpovrEEJaN70rcyZqrWFINqIdxAyLq3vPvBn0188CiwGanVuoKtMzn9J74S51ejBB/PaK0W9Fko4g0Pm7F4YtMiY+vSv3Q67G+VWf0fXi3yWVnKUQUe+MEpx8+EcZeA5SNlg+2+jYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751618615; c=relaxed/relaxed;
	bh=MuMYGj4U9gATUdSjJQP490GKgcaR/4clHo3zdD3uLr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KO9JATXYvrU2PUHBnnvSJkmuY0W7NgYWhki8dWKdZ6SGjLpMnOmsNM1tH8Cw0xUTuc2ecQlEqCsLYxZaKA2zznZ5xkDlsAScFbhkiTwGRvvLSOlbFa9sXEMQiu2L+i3+zQNpL6J3pYPirhS+Put3fVLNJNv3e17DOzhiPaZuvdy/aTK8SbQdOg0A7Bmk5ShZ/bh8niH+wxOR5hII7eNSbqBJybnbCucFMjIOA9QAt8BHtKjbrLlyJ4Ubu2sfMI7cDTyGIMp5I0Z86a4c5jJCZywwlomH5KEbanefSfhQTpjpMGXu3hkKBiQcBtUkEk2KKBcYYjmZ9MmllKo3cJeQgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eDDY/TPx; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eDDY/TPx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYRxL2wCFz30VR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 18:43:34 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5642UeVR005891;
	Fri, 4 Jul 2025 08:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MuMYGj
	4U9gATUdSjJQP490GKgcaR/4clHo3zdD3uLr8=; b=eDDY/TPxvEx/E6O/YIZlyg
	9Crwmm7QJmyHkkMmiYiDdH4lEnGi8BCQAYH0EvYuSLk5XEig1YmxoQ1/fup9OLlI
	YMjv3ZcuLpWGG8wSsLyRnF2Im2snDGa+Vn7FVtb9ptzRLZqh8G6noYptRHjA3MBL
	MCG5QP1njdtxGRTNcLqWfEz4rWaAmg9Uv2JYdKhHQuyPGFDS/99mlsDE1mYlNc7/
	g91u6AD1vIjigkgfLghbkzdTFbbrE75khdpwdqzP9dT9ozT1RgXO15VNbMUpTI6W
	zL1BY3dp0G0peymOfMl4AQaZXWrduDmQhsWbSBBN9Zonq/arCw5CP6AKS5K34NQg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7ws0w2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 08:43:22 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5648dH50001948;
	Fri, 4 Jul 2025 08:43:22 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j7ws0w2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 08:43:21 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5646VH06021914;
	Fri, 4 Jul 2025 08:43:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47juqq1406-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 08:43:20 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5648hG0N25100844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Jul 2025 08:43:16 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD6072004B;
	Fri,  4 Jul 2025 08:43:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9846120040;
	Fri,  4 Jul 2025 08:43:11 +0000 (GMT)
Received: from [9.61.253.3] (unknown [9.61.253.3])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  4 Jul 2025 08:43:11 +0000 (GMT)
Message-ID: <6dfdc950-fe2c-4311-b53a-9c1439783d3a@linux.ibm.com>
Date: Fri, 4 Jul 2025 14:13:08 +0530
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
Subject: Re: [PATCH v4 3/3] integrity/platform_certs: Allow loading of keys in
 the static key management mode
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, msuchanek@suse.de,
        linux-kernel@vger.kernel.org
References: <20250610211907.101384-1-ssrish@linux.ibm.com>
 <20250610211907.101384-4-ssrish@linux.ibm.com>
Content-Language: en-US
From: R Nageswara Sastry <rnsastry@linux.ibm.com>
In-Reply-To: <20250610211907.101384-4-ssrish@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=E/PNpbdl c=1 sm=1 tr=0 ts=6867942a cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=NvCG-ebki-3VrmPakVEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: hBUyKwWUPpP25JebkuKlcVWl5zZacEw0
X-Proofpoint-ORIG-GUID: S4zUZkPr5byYyvq0hyiqAQzRlh0-nxqU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2NCBTYWx0ZWRfX4ok3QQ4bhhAd MRLiLEXSplfAsCtn7pSzDdqJc6ge6NrJQxSmFA5UQ5Qw0kNdMF+EhKGSLQtAgJkb86zJyBefUTu AAdOxK9L7uy+NoE0DXFz1rzENm7qInTL/lc+51rEwQ/xXUC/h2p5nH7nwPItHeq33G/lpfGfdgi
 h7O2zRUg92nTADbshhgFaacxc57yFqOl4dSl7KQgyQFQqr5Zw+pRLXN5LKNqUwx6+wzh9Vlezza 7nZ/Y8efy1TlhWDyGOuq7gpdYJogi7gOk4ZzpbSkhzVACzDKGU+1Gzq+j03z33sN/oSp6gp/Q+H pugFSJ34I8HZm4biagAUBAnZ0NKYhM++39g14LOC2KiXsjCpC2C1cGdVNlJV85Yj9dsPXsuDyOu
 +f3ySv7CAv031Us1tw/IiYnfYlwEuynOQoQu+qx5bmq21SlO8Q6uSOnL5WXhkjGJjT19R5RS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040064
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 11/06/25 2:49 AM, Srish Srinivasan wrote:
> On PLPKS enabled PowerVM LPAR, there is no provision to load signed
> third-party kernel modules when the key management mode is static. This
> is because keys from secure boot secvars are only loaded when the key
> management mode is dynamic.
>
> Allow loading of the trustedcadb and moduledb keys even in the static
> key management mode, where the secvar format string takes the form
> "ibm,plpks-sb-v0".
>
> Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
With the following scenarios:
1. With and with out secure boot by enabling keystore_signed_updates and 
keystore_kbytes
2. With Dynamic Key Guest Secure Boot
3. With Static Key Guest Secure Boot
> ---
>   security/integrity/platform_certs/load_powerpc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/security/integrity/platform_certs/load_powerpc.c b/security/integrity/platform_certs/load_powerpc.c
> index c85febca3343..714c961a00f5 100644
> --- a/security/integrity/platform_certs/load_powerpc.c
> +++ b/security/integrity/platform_certs/load_powerpc.c
> @@ -75,12 +75,13 @@ static int __init load_powerpc_certs(void)
>   		return -ENODEV;
>   
>   	// Check for known secure boot implementations from OPAL or PLPKS
> -	if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-sb-v1", buf)) {
> +	if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-sb-v1", buf) &&
> +	    strcmp("ibm,plpks-sb-v0", buf)) {
>   		pr_err("Unsupported secvar implementation \"%s\", not loading certs\n", buf);
>   		return -ENODEV;
>   	}
>   
> -	if (strcmp("ibm,plpks-sb-v1", buf) == 0)
> +	if (strcmp("ibm,plpks-sb-v1", buf) == 0 || strcmp("ibm,plpks-sb-v0", buf) == 0)
>   		/* PLPKS authenticated variables ESL data is prefixed with 8 bytes of timestamp */
>   		offset = 8;
>   

-- 
Thanks and Regards
R.Nageswara Sastry


