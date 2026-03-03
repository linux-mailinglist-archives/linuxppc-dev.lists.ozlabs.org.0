Return-Path: <linuxppc-dev+bounces-17560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAxvJ3C0pmk7TAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 11:14:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CB71EC810
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 11:14:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQBV25SY5z3bnr;
	Tue, 03 Mar 2026 21:14:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772532842;
	cv=none; b=VuLDWRTDQ3AYFX0lH8bktZPlxSJyKsGUtH7Mz0/BSgTh05R5yRERh/08lxKuoiL8pTg2i2FMpxZuCZMRSIRuiThSBQjqIbJCRyOz0PrTmrWV0Mbfim+0YTw/sf1WTLoO+leNqBwYAX2z6ZdcCNqA+wqBPvHo40XN9VeXdzOBLrKWpH/ZeA/tTHFLo2dPY4ryc2EWIq2/IQtQ+6d4K0QZDPqnLwDz92uoeU+tGwJfb3SWxNe1ppRrkXWPQnabbhjlZ78D2/UJIbpPvlnwF1wJ51gvMCXTFSiPUhFxLvwROPtYiHyxLWmKEPb70o8NKl+cTKWBLCoF4pN5b30C1Kxizw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772532842; c=relaxed/relaxed;
	bh=lChQ9253pajFtzuxe2MbIXO0swUhj0a914oqMgjhyZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OA7Q6H5iUkOdaPM/rvFrq9+/7dAZbLApN7OUgiE0gF0ATHvpwW4pz9WzwkAs4Ts+nUAVwI2thK+nfpy6Xm2+KktIvM9Vee9F5OOFt+FdMMeleszs04Olto0d8jNGa7cWC6Mx7A1EtCdYkXwg1S8Mwg9DDbDxJTSQEye8HtJshL/51w6lKfnG7X2L8HFkRgx8uKels6yULDa94z9PJpWDE3fF6l8rRTWgUNfrwIqlWSdmMY75LF7FuACLxgO8C7lgCZ+JquiS6tMPkHajiuzYu4xM1FJZpIVdIdyMvuXpS4ow/QyqrvwfX0xrfMQwP//dl0AfG0vqauNuQjxMEuvgtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ERzbbXTV; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ERzbbXTV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQBV02jyrz30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 21:13:59 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6232V1li1517870;
	Tue, 3 Mar 2026 10:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lChQ92
	53pajFtzuxe2MbIXO0swUhj0a914oqMgjhyZc=; b=ERzbbXTVo73Id0ik0sztWi
	EM0LJEBwu0Fc9UBuHFMwswqE55DaLNXMIIj6SrBxpTzRg0mYScDWxQirCbHwAnuk
	tMb2QFVsYA2gD2zDdnpVaVn6o6l9cqe0b8u7X8PewJLd67Ch2tABbAP76ZJLPsuN
	Ryg1/iCQJ/zYg5vdn0yWza9PYT0ayUTx4W59aHkon7WIstMA4AJJJM/TVVA/7SDw
	UTOl652ExStaDgDOTZESEDVe1D03ouMkTsaMmvW95VXgC9KQs9wifLR6iy+LVTjg
	/Y7d39GesVy+zf1yoEhSsh4GMLU5sOatG8JHZKtUZZIBaNaquEndwZKYKGF7RFlA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckskctfkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 10:13:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6235DuA3010284;
	Tue, 3 Mar 2026 10:13:45 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmc6k1pfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 10:13:45 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623ADiD36816322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 10:13:45 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC4F758052;
	Tue,  3 Mar 2026 10:13:44 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A43B95805E;
	Tue,  3 Mar 2026 10:13:41 +0000 (GMT)
Received: from [9.124.211.174] (unknown [9.124.211.174])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 10:13:41 +0000 (GMT)
Message-ID: <50bccaf9-9bd8-43b4-8e0f-ddb347a9484d@linux.ibm.com>
Date: Tue, 3 Mar 2026 15:43:40 +0530
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
Subject: Re: [PATCH] powerpc/pseries: Correct MSI allocation tracking
To: Nam Cao <namcao@linutronix.de>, Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260302003948.1452016-1-namcao@linutronix.de>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20260302003948.1452016-1-namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: H3acRpo8jaYiuOvgFu8zs_NHG2147jbf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3NyBTYWx0ZWRfXw9xLJB5imsXy
 +ECmE2s7b+1OWlfr7IbzoQ2QCF4I0122JyJmK3u8O0UNTuSpDS5swvARLUvfSo9y4NIFh51WzjP
 CEpMD5krId7jY2LCfvUtuBw9/VZ2Y4OS3wCt7abv2lvSlfK8ICPTTT/LGrMtZz8q+GGDKf4pmmS
 4EO47DzQkE5jqmO4e5Pc/lE2194ppLJ35K+af3jgTe041I8S0kQIbvRXNPtsSyZlm5aJhaoNNrt
 eQsuCje6z8hNzLDiUuXbwbNGqZ0Ech8TJMG8jsLAfYdd+uJVbPaVclIy4S2DKuGs/hp6Q5rYwV5
 +NmN3PYDuy7YHe2NbiM8vz0GeSEmFY557KqJyMHMc9ST84FC5DtRPgI8RPgjTJ2O+bUXEd201kG
 hDL39hLhAhiSc1YGovoIEXDgZ2TX3Z3aKCd5Lp6t5N0MDaNrohZZSWpdAx89DRFPHSiUO6Ji7Q5
 FbZD6jTfPNTJ7CJ2xNg==
X-Authority-Analysis: v=2.4 cv=H7DWAuYi c=1 sm=1 tr=0 ts=69a6b45b cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=ExDeZcIHuf4lvlsAU-IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: JR31GefV_aJ9Bhzm_9hkjqkRTt-Sc6b0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030077
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 02CB71EC810
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17560-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:namcao@linutronix.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linutronix.de,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_SENDER(0.00)[nilay@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[nilay@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 3/2/26 6:09 AM, Nam Cao wrote:
> The per-device MSI allocation calculation in pseries_irq_domain_alloc()
> is clearly wrong. It can still happen to work when nr_irqs is 1.
> 
> Correct it.
> 
> Fixes: c0215e2d72de ("powerpc/pseries: Fix MSI-X allocation failure when quota is exceeded")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>   arch/powerpc/platforms/pseries/msi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
> index 64ffc6476ad6..8285b9a29fbf 100644
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -605,7 +605,7 @@ static int pseries_irq_domain_alloc(struct irq_domain *domain, unsigned int virq
>   					      &pseries_msi_irq_chip, pseries_dev);
>   	}
>   
> -	pseries_dev->msi_used++;
> +	pseries_dev->msi_used += nr_irqs;
>   	return 0;
>   
>   out:

Looks good to me:
Reviewed-by : Nilay Shroff <nilay@linux.ibm.com>



