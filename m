Return-Path: <linuxppc-dev+bounces-17115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMO7LdnMnWnfSAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 17:07:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B91771898C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 17:07:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fL2gT6whfz3cR8;
	Wed, 25 Feb 2026 03:07:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771949269;
	cv=none; b=oONh6JJKalVXp8jYx55BI10jtDWol9wKBbALmrtBReKue3Wtgxsu6X3lNrs9obOs+RWhp0ssBQG1gvrxCaO9oALjqly99Sx82dYjupbWVRlI/sS4FqcMU5KgbAW5zGsKjUBKz73Rl+KdFEVQnvDMvjVCUb8FzzVY0IetcjCX3myIWKW0Cq77v1H9Ft7uBN2RW56hsBhz+uLaCX1lOm32FflCKHvtHVso5OZMwA5LMoYcDw0BX8Q1ipNUkCbhcsuz2TsIKmfQt+jMj8UO9MEH6iPZ95fxgn/Oa9CdiXVy2WsBr5D2y4ShjGPltjGNZYYe2MXfKTrHWTAy5iePhOMlFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771949269; c=relaxed/relaxed;
	bh=y9+Qyvr3MRBE2N0qYbpHjPsw/T/XItQtL6iJg7JvaX4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BiVnwxm1zgR225Z9lOf2qP4S9qRkLjErEKP+ssfMmb+hR5SZu7W1di1KCWXB8WZcyq0GkPvuivXlM7U6lnDHfV2CebhrH7Oeuy9h2/asCoLYm7/nDzz9DThYXWZTl54fAUmU8NRRG3ESljgKWXDUmiCU4TrNsPXmFM2/Jh2edWFF0c38Tm84kHjWWu22vJVW0L2iIntaqjk6Zmp4/oKmdpIk180yfDJ6CbbMm8jDx0p51Qs56b5aka28/huPf4tTlXi0NyfqmFn5DhTXnX705rJPnAZlHYcI6zbKqf1mI96sc78g1SM58RDRzIn2vEzTVilZRDKu242QH8Yef3Vx3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CMNT2RV2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CMNT2RV2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fL2gS6fmzz3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 03:07:47 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O91Fdx2495026;
	Tue, 24 Feb 2026 16:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=y9+Qyvr3MRBE2N0qYbpHjPsw/T/XIt
	QtL6iJg7JvaX4=; b=CMNT2RV2Zv6Z5P0CB64avamBiHv9LfPoW05e+2hBYiEShK
	JofimA33XUmHGMpZJWHrCZOLaSGUCm9bt/GVwoOXxrBK56gM9IXysAnByVSX+NBM
	zPYage+3IUb+HCJfvM72qRYeszKggnTCUKD9YPpO+wTIgeSofLJHmBnjA6BNsimh
	kzNKNQkD4UnOlsZ0X5RFg0uUc8Qxk0ViSNvXkP7IqIiAJJ0ENobRKjoKSQW8tPMv
	i0J3gvdzZuZpza0HfCqdvdwJ+uf9/jj9Es+1Km4VmFt5TMZjVGxl2wGgNq5+Eexy
	VToZbct6n+6Dwmf9S/tfxv7kKIs7WOZLko2qWaUg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf34c3shr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 16:07:35 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61OCieCT002215;
	Tue, 24 Feb 2026 16:07:35 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfr1n1h7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Feb 2026 16:07:35 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61OG7XDU57475552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Feb 2026 16:07:33 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF1B358059;
	Tue, 24 Feb 2026 16:07:33 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CFC258053;
	Tue, 24 Feb 2026 16:07:33 +0000 (GMT)
Received: from d (unknown [9.41.102.181])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 24 Feb 2026 16:07:32 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Abhilekh Deka <abhindeka@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        nnac123@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] net/ibmveth: fix comment typos in ibmveth.c
In-Reply-To: <20260224153601.17534-1-abhindeka@gmail.com> (Abhilekh Deka's
	message of "Tue, 24 Feb 2026 21:06:01 +0530")
References: <20260224153601.17534-1-abhindeka@gmail.com>
Date: Tue, 24 Feb 2026 10:07:32 -0600
Message-ID: <87v7fmyvjv.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
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
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDEyOSBTYWx0ZWRfX1kT/VFtPPv7f
 lCELi2+Geia9GPneRwaurVn+7j9FZOb8sDTdJjcDFlTti10+bJqlTnKyxcmI2E0EJQpxa1smxf4
 ZbvPjnnN8Q3/bm+KkGU7w4DGQIZqs7CTpFT58UFRrrw8WmW0TAr6e2W0BFKSpDDCQm5zK4Ey0X9
 q8HgWse7gSSFT8CyPdrit7y6Ygwzm1HSGmo6iqMIe8x3jADMlcGleyfc4Sl6ofdfO5UoKrRHQEY
 ssF2ZsYX2l0zV+WQhpr/YCnotvHy+jOfMc8xT5qe7JFSjrSMZzGn1UBfOkdGA9o3ubLKHn/pBUj
 1FRyT81KO6qw1mz/nWpBmdBKZNlEliM/TpNJ0FH3DM7wIcD8BVYeZEdxO5jxEz4qpHKjcK185M3
 4DCTpEhYh8sp0EJ5KipUm24pLwGZWxD6ts3Ynmmj2pdV2sUvqTvIlCwCUtpTvh70kZCwPvecwCY
 kJcXsEhcgfuMfRp0xTA==
X-Proofpoint-ORIG-GUID: EmJTXNl2OWZQe0kPcioqbjhCBuHrjs1A
X-Authority-Analysis: v=2.4 cv=F9lat6hN c=1 sm=1 tr=0 ts=699dccc8 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=ipUitfybjZBOWcLre3UA:9
X-Proofpoint-GUID: Sl8BzQk4AMyS-9oqVHPk4Bcf7fHbesLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602240129
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-17115-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abhindeka@gmail.com,m:davem@davemloft.net,m:kuba@kernel.org,m:pabeni@redhat.com,m:nnac123@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[davemarq@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FROM_NEQ_ENVFROM(0.00)[davemarq@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B91771898C9
X-Rspamd-Action: no action

Abhilekh Deka <abhindeka@gmail.com> writes:

> Correct spelling mistakes in comments:
> - Fix misspelling of gro_receive
> - Fix misspelling of Partition
>
> Signed-off-by: Abhilekh Deka <abhindeka@gmail.com>
> ---
>  drivers/net/ethernet/ibm/ibmveth.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
> index 3108bf50576f..b2a578e6ff31 100644
> --- a/drivers/net/ethernet/ibm/ibmveth.c
> +++ b/drivers/net/ethernet/ibm/ibmveth.c
> @@ -355,7 +355,7 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
>  
>  		/*
>  		 * If multi rx buffers hcall is no longer supported by FW
> -		 * e.g. in the case of Live Parttion Migration
> +		 * e.g. in the case of Live Partition Migration
>  		 */
>  		if (batch > 1 && lpar_rc == H_FUNCTION) {
>  			/*
> @@ -480,7 +480,7 @@ static int ibmveth_remove_buffer_from_pool(struct ibmveth_adapter *adapter,
>  	 */
>  	if (!reuse) {
>  		/* remove the skb pointer to mark free. actual freeing is done
> -		 * by upper level networking after gro_recieve
> +		 * by upper level networking after gro_receive
>  		 */
>  		adapter->rx_buff_pool[pool].skbuff[index] = NULL;

I'm not quite sure why this was a v3 of this patch, but anyway.

Reviewed-by: Dave Marquardt <davemarq@linux.ibm.com>

