Return-Path: <linuxppc-dev+bounces-10144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D243AFAF4F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 11:14:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbJT63h1Tz30Vr;
	Mon,  7 Jul 2025 19:14:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751879642;
	cv=none; b=CFi+H6jmNFCqCsL6PkXq+fhtM7qbA8rHrxU0sleP95lyXzsmIDyYpwd4004/Sv/ungsJHB6RlDkjGGxpt74BVLtBcE4YrH63g9KhO7vaciv0GYFaanPYlVN8kYSN+fqeMVHSMS2Cq9jeUMD7WsGzF4KdnzAtD7v7NK8IHwGM8upp4VJ7VMvOoE+Kq9wxR3D6IsiBD0hxo2wKjEi09Xw0RZnw6bJ4Eap8C4hOzC8vYZ6yxOeseNWFI8jHVVzT+d89xu2ipQ8T/JV+0EUX5PeyNpsmJsAn0yx+TGFzfTjs6ZxijITl3G/kw639Kqx2HYTRaKI86eaEqEoh2SNpCb6Uwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751879642; c=relaxed/relaxed;
	bh=D4xKO0mAENSJ0gKb+UbVcNTvnLfIKJyqZITgDU5rk5E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=djMWYkqvYkfgqj1x/QgVtez5oZE9N5MqLJJzizfmrX3tTGkcYuPJs4qsmMixd4c5G+7pgq3c0MqZ8HCY7azAkyQCa8Z9hc4rq5z5RhPaW2qUbnvEV6xjx4Ik9XjDT0ymlqW8kMLelOE+Mrvlz4qIbZgUaH9j1JyxKRHTt4VuBXvbD69ZKcwCYQMLCxBWd916kmXNiq1G5GbVziT4iwd7HWHUt/as3W+kJ6mJ0twBCX9J2Nvj4Bnfs/FcVcPBf0GTa7dw5MJmDVG/iuGrgO6VXmFc1RvSHDQBJdDXd1VyZA4EbQMi0eldFtWh/rPUectXkIxKmjiMkzG38ElCPAXcDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fxUsH/rq; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fxUsH/rq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbJT53nL4z30VV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 19:14:01 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566NHq4M022110;
	Mon, 7 Jul 2025 09:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=D4xKO0
	mAENSJ0gKb+UbVcNTvnLfIKJyqZITgDU5rk5E=; b=fxUsH/rqjjOMcZcqo5+srY
	BnD6BrBzYnTZ7uvw0MsWAR7ARoF90aF9rR/J2OFqNOmryMlHXm656zJYLWlmxek9
	o2w34Q4nRKoG4+G2xRPFpxoHv9DFVKLcIj0w/xoIc3h6MIT85Bbr8DT0kFXIUgza
	LQh7EZM4H7Taom9nDTFRGdkhrrkVl7d0xBRSzE7/hhZ/Jbqndl/PQ7BFZVKYhE8J
	ekwtJzVJ0PMu1CUDe174/mb+WRz+/AhT/5qP3b54Sr2c/7Zl7dxn5r2abef8td1o
	7FK7di5yI2NG0S7gZh7iuKodYA6km7gOuSDDcHxJ1D6k+qq3RaTrreJbyA7ZgBcQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47puqn05b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 09:13:50 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56799oWL001950;
	Mon, 7 Jul 2025 09:13:49 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47puqn05b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 09:13:49 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5678ibY1025528;
	Mon, 7 Jul 2025 09:13:48 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47qfcnwcc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 09:13:48 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5679Djge24249056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Jul 2025 09:13:45 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 310165805E;
	Mon,  7 Jul 2025 09:13:45 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD59D58052;
	Mon,  7 Jul 2025 09:13:43 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.17.45])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Jul 2025 09:13:43 +0000 (GMT)
Message-ID: <a49c4d5b0aa4cd4d9c39c750cfc4c998999c4547.camel@linux.ibm.com>
Subject: Re: [PATCH RFC 7/9] powerpc/pseries: Enable HVPIPE event message
 interrupt
From: Haren Myneni <haren@linux.ibm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, tyreld@linux.ibm.com,
        hbabu@us.ibm.com
Date: Mon, 07 Jul 2025 02:13:43 -0700
In-Reply-To: <d42ba792-6051-4035-bffd-a984d11c7b7c@kernel.org>
References: <20250702221444.879256-1-haren@linux.ibm.com>
	 <20250702221444.879256-8-haren@linux.ibm.com>
	 <6824e14b-8f79-4fee-85f6-e5f78a8ef265@kernel.org>
	 <b9d2274ae6f4f53ea5ee6ffa23bdeea953181040.camel@linux.ibm.com>
	 <5cb4a9fc-50a8-4b13-8ad7-21610fb5cfe4@kernel.org>
	 <d42ba792-6051-4035-bffd-a984d11c7b7c@kernel.org>
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
X-Authority-Analysis: v=2.4 cv=FZ43xI+6 c=1 sm=1 tr=0 ts=686b8fce cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=3O58WkSSt2X8jydSB-wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: nvsITbCvWX2kg4pRnDLWdAZEjY4REAu5
X-Proofpoint-ORIG-GUID: c_hdtZPlf7fkIuBcZkJ8ypUZvUlqa-wb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MCBTYWx0ZWRfX42oAEc4xLIg9 PL4iFy3A34aBRxYsGCnaDibV2ZmUuS3Jp3gGsZeANOw6+M8kp29Wnu7NplFlMxN2cg/MglpQbi6 bWB4naDXDM2NFSOgq18I4Vcit7apjPlhXKfI/fBDbETAJdJbkN04cz1GJ/6sQKn9Ot9eZfb/M+x
 3GXiL44SxTAVIUcgAIcj7Z+xuyRE2JlvCQhqyOoIjSYtZD5u5nsWvESOkdAC+WJm0mLI9DTK9n+ fPouIiOLFj9oLakrjWGG73gpsXK4+Km5MxYeiL1v0UWlhhxxeOQkQbfhrpqqeo3sFVPx3w6b0c1 0n+wN4W7LXsXiaJ1hVBJOMxHs+x9128NOIv0CLg6EzkcgBE5p9VvNZgXm670rc8esOUSEOzJzjI
 m0iL6KZv3kH75RrZWqhbd04OAva9epi/z6n3FUy8tStZIiLkkn8LIrs/nd7M7fgs/qBZc7aO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=993 clxscore=1015
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070050
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2025-07-07 at 09:43 +0200, Krzysztof Kozlowski wrote:
> On 07/07/2025 09:35, Krzysztof Kozlowski wrote:
> > On 07/07/2025 09:02, Haren Myneni wrote:
> > > On Thu, 2025-07-03 at 09:00 +0200, Krzysztof Kozlowski wrote:
> > > > On 03/07/2025 00:14, Haren Myneni wrote:
> > > > > +static int __init enable_hvpipe_IRQ(void)
> > > > > +{
> > > > > +	struct device_node *np;
> > > > > +
> > > > > +	hvpipe_check_exception_token =
> > > > > rtas_function_token(RTAS_FN_CHECK_EXCEPTION);
> > > > > +	if (hvpipe_check_exception_token  ==
> > > > > RTAS_UNKNOWN_SERVICE)
> > > > > +		return -ENODEV;
> > > > > +
> > > > > +	/* hvpipe events */
> > > > > +	np = of_find_node_by_path("/event-sources/ibm,hvpipe-
> > > > > msg-
> > > > > events");
> > > > 
> > > > Undocumented ABI, NAK. Plus node names should not be used at
> > > > all as
> > > > ABI... and naming does not follow DT spec/style, not sure if
> > > > you care
> > > > about it, though.
> > > 
> > > These new interfaces are documented in new version of PAPR.
> > > Please note
> > 
> > Which version? PAPR defines standard, but not the kernel ABI. You
> > still
> > need to document kernel ABI, just like every other OF usage.
> > 
> > 
> > > that /proc/device-tree/event-sources node is different which will
> > > not
> > > have ibm,phandle unlike in some other node. event-sources already
> > > has
> > > several event messages such as io, EPOW, hot-plug, internal-
> > > errors
> > > events and adding hvpipe-msg events now. We can see the similar
> > > of_find_node_by_path() usage in the current code.
> > > 
> > > io_event_irq.c:	np = of_find_node_by_path("/event-
> > > sources/ibm,io-
> > > events");
> > > ras.c:	np = of_find_node_by_path("/event-sources/hot-plug-
> > > events");
> > > ras.c	np = of_find_node_by_path("/event-sources/internal-
> > > errors");
> > > ras.c:	np = of_find_node_by_path("/event-sources/epow-
> > > events");
> > 
> > So you find more issues. Are you going to fix them? What are such
> > arguments proving? Nothing. If these are bugs, are you allowed to
> > do the
> > same? Obviously not.
> > 
> > Bring argument about the ABI - ABI is documented here or ABI is
> > does not
> > need documentation, because of something, or this is not ABI
> > because of
> > something (although it is). I don't see usage of these in DTS, so
> > probably there is something I don't get, but your arguments are not
> > helping at all.
> 
> Although probably if you do not have any DTS, or let's say in-kernel
> DTS
> for these, it is indeed enough that PAPR spec defines it and no need
> to
> document it twice.

Yes, PAPR defines these interfaces. 

> 
> Best regards,
> Krzysztof


