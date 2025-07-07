Return-Path: <linuxppc-dev+bounces-10132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED51EAFAC83
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 09:02:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbFYm2R0Wz305n;
	Mon,  7 Jul 2025 17:02:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751871772;
	cv=none; b=WBqXIDpDRi20UMvay84E8puHV1H5AJjMmtWrpQuDbuy81paT+sO3jQD1e9t9AfDh4uvGg9cKVhjQP5CtiM4GiPEIXz1CpBw2WJskaEjo6eJCgwiiIFJWK0nLoyp/KaWdlvUCrBdwL97u/gpqh5mrEsJLkjmFQL5zqnBQvdZAQ6txPUmXjPUAbo0YTtqxFqvFV0svczlScmycwt9ye6kDW1WqME5lfaTGLLsRdRI1+ciELloVl+q8J7dqqREqpjKtTEMdjkScujQPRkH+/+nAx4vDfU1KJ43igUHwtM9EBbf0nHPk/UgeM82q4GA2QCYo8QGK0tPmEbKGwfncG5ha/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751871772; c=relaxed/relaxed;
	bh=tCxyTsAZmBWMD+s+ODsHyMkvyw/VkAGxngcLgz3ayQE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=Yf1ISPGJGHErVdJdslHyao+CqGQ6S8WXQu+i50QuDHaVNwUjnstgZ0VitIMh2P/vFOzhQPSZB38NJQ3e42vXBkob92HTwpOiSqgW+T+33GTB/pkq09WEYLZqthw+v1tAMg6G9TKYPruv/nkoZHREkLcWU+eHNnu19HStQSQlCMc4/jCgswz6Wg0ZvVkNzXXGYV6ECS9uUF3pdxGscjuK7zykmyvYBCw3N4c02mgvhKiqH4t/unw6IICfMe0G+zRw91xIIT2yPTDPs062wkiH93UaDSp6C8hfmGSV6EEJqd0qAomhfPoI39oQUAM+lw+j1GAg9R4HF4dOvToKSulwog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PdXWI2/7; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PdXWI2/7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbFYk6q1Jz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 17:02:50 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566Ju0pd004960;
	Mon, 7 Jul 2025 07:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tCxyTs
	AZmBWMD+s+ODsHyMkvyw/VkAGxngcLgz3ayQE=; b=PdXWI2/7elCizyBwwjEXvu
	Gk55bxOnOrHk2aJnj+SOrfnI1hJ7sV2ti53ufsMBRZkb/zeXI95Vjn1B5yYqaUur
	nJKZut66Qydk4Haz+bVPg8CKbEuXrksvoMOSrQ1j4Pxsp2ixGV9kt0kK6H3ueKQw
	ecXz33q1Ki0wjp1BU0Txsj59b612tBoT5sOIGN9Qiag6bjzh7GcM0NnBA8cFJR4g
	GQKIDsH4y1VphGN3UmPb4Sic28ubhXgbyvpUlFG8+tFm1AOQSU94j9jiTzQF6TGl
	D1Jj+ekgiIqatc7wdo+CVZjXv3nY7odaoboIzIbh+Vd5qeTfTU88TS8X6ax68lZA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pur6qy43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:02:35 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5676rUgl026280;
	Mon, 7 Jul 2025 07:02:35 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47pur6qy3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:02:34 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 567686Mg024317;
	Mon, 7 Jul 2025 07:02:34 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47qh324kgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:02:34 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56772Vwj17236480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Jul 2025 07:02:31 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F81F58056;
	Mon,  7 Jul 2025 07:02:31 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADB0958063;
	Mon,  7 Jul 2025 07:02:30 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.17.45])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Jul 2025 07:02:30 +0000 (GMT)
Message-ID: <b9d2274ae6f4f53ea5ee6ffa23bdeea953181040.camel@linux.ibm.com>
Subject: Re: [PATCH RFC 7/9] powerpc/pseries: Enable HVPIPE event message
 interrupt
From: Haren Myneni <haren@linux.ibm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com
Date: Mon, 07 Jul 2025 00:02:30 -0700
In-Reply-To: <6824e14b-8f79-4fee-85f6-e5f78a8ef265@kernel.org>
References: <20250702221444.879256-1-haren@linux.ibm.com>
	 <20250702221444.879256-8-haren@linux.ibm.com>
	 <6824e14b-8f79-4fee-85f6-e5f78a8ef265@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-27.el8_10) 
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
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAzNyBTYWx0ZWRfX7S2LnYM6MnpY VLPNVQ2D6P5dix6F2QMRTdreJO38B9T+zxIMfJp21KiqTVpoZGEE3S5DE/lAcFfi7iGdHUmaT6D QtY8NWHeK3K+DxOCfcYAm3lF0jUCyAgyOqgJxjDHtMAxcN4UnW3j9HvI55C+Vq0LQ83dS2kYiGF
 MjOCrgDpECuGbXua7/VsO9t13qhCOQfB/VW4Ikcv27W7nsZnWMQpvAewt6rt+MpMre8QiW409yL Z9jls1FLmDqBAgoSBU2EkuP+DPKOp1LpDZpJ2BOKCPZFbBl8ka9glRzgebCmDa/uaWNL2WaH87G eFb7oUkov3I6HOXBi8mReTp9ITQ+cjgo7kmL19EcfoFXWg3FD5YrGAczPqX3rqXbOmYPwRVo+Kp
 YIMus8jHlS31zwGugkfHOHaI5BgYY3KiKtP+/1l38VZpQt13iSG8K5mDGn2PvTOzKKxb1M/o
X-Proofpoint-GUID: Fkgfh3EQ9XNJJZGqm3EzX1fnW5J9Uyoe
X-Proofpoint-ORIG-GUID: QGKpgmCuOyow83VSfruoKpoF7Vj_Z9CS
X-Authority-Analysis: v=2.4 cv=W/M4VQWk c=1 sm=1 tr=0 ts=686b710b cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KoqQlwpedmUWV5ve8pkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=745 bulkscore=0 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070037
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-07-03 at 09:00 +0200, Krzysztof Kozlowski wrote:
> On 03/07/2025 00:14, Haren Myneni wrote:
> > +static int __init enable_hvpipe_IRQ(void)
> > +{
> > +	struct device_node *np;
> > +
> > +	hvpipe_check_exception_token =
> > rtas_function_token(RTAS_FN_CHECK_EXCEPTION);
> > +	if (hvpipe_check_exception_token  == RTAS_UNKNOWN_SERVICE)
> > +		return -ENODEV;
> > +
> > +	/* hvpipe events */
> > +	np = of_find_node_by_path("/event-sources/ibm,hvpipe-msg-
> > events");
> 
> Undocumented ABI, NAK. Plus node names should not be used at all as
> ABI... and naming does not follow DT spec/style, not sure if you care
> about it, though.

These new interfaces are documented in new version of PAPR. Please note
that /proc/device-tree/event-sources node is different which will not
have ibm,phandle unlike in some other node. event-sources already has
several event messages such as io, EPOW, hot-plug, internal-errors
events and adding hvpipe-msg events now. We can see the similar
of_find_node_by_path() usage in the current code.

io_event_irq.c:	np = of_find_node_by_path("/event-sources/ibm,io-
events");
ras.c:	np = of_find_node_by_path("/event-sources/hot-plug-events");
ras.c	np = of_find_node_by_path("/event-sources/internal-errors");
ras.c:	np = of_find_node_by_path("/event-sources/epow-events");

Thanks
Haren

> 
> 
> > +	if (np != NULL) {
> > +		request_event_sources_irqs(np, hvpipe_event_interrupt,
> > +					"HPIPE_EVENT");
> > +		of_node_put(np);
> > +	} else {
> > +		pr_err("Can not enable hvpipe event IRQ\n");
> 
> Best regards,
> Krzysztof


