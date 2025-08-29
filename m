Return-Path: <linuxppc-dev+bounces-11504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAB7B3C370
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 21:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD8Cg1FM0z2yfL;
	Sat, 30 Aug 2025 05:56:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756497375;
	cv=none; b=ArzVqtsk4o9/GlG4Qy/7p/yye3tlwBKwBzKnueQVHtlgbAB0D4h4pp22JG52mD6IE2CknBYj0MDTSsaRuOvTUhleamp0+OYBxsgdccrV3UDJMtWlARjb0wp6FA63KUY0BvwMcTJn6IeQr/lUgitShLGRcfwh0UBu1jWNqguzfi2h9Rkh0asy6SLRYoRO4khl6tC4GYZSfyETCQu5jqPfxqVKUqqstDisvzyps2Wxd2hFlYmtFPtJ9mrte7rHuX4GjQzBeKUgNcOIawgQhgJxiu8Xm8EqyZ0fT6eyVu7to9hefTOV4Gnz54D4fWetRRfTIgVh9LlvAqN8TMp9RJTVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756497375; c=relaxed/relaxed;
	bh=/NbJ+1LTByTLzlej7bH7RmC+kJdAUmxXGGKZw3kQqsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QK+D/PTb2Nmk9oZkGTqLFyLWPHeSjTwf+Nut8IhBaknjy8NWvTQLQ1AYpXXQmMdVXP8Uy7wqk1uoS13wTFo8oWWhnonK9bmM/ib/tRlq2VbZU46IHU7zVzVsBsnIG+yRF8bM96OV7cZ8AZKamIfDVpkIl7Qahhouq5EqD7URRsA1rl3BzCFNR/P1OZU3G6091tU0V3Pquwca2cVFBnVyQlyEqcZdeHKMNj3VgxY3xfWRChAiqcqpyyq58C4960T53rTcGkfhIhDLSydkQ0AVe1JuaSJ5QwLfS8oXDGxFV9cBL6nLfVlfdqGOfznUfOgpaniK23MAFoxOmrfC1/wlXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q1SiFVGH; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q1SiFVGH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD8Cf2NR4z2xWQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 05:56:13 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TJ9W6g006204;
	Fri, 29 Aug 2025 19:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/NbJ+1
	LTByTLzlej7bH7RmC+kJdAUmxXGGKZw3kQqsg=; b=q1SiFVGHW64BgvXe1xLB0o
	4JYndicnMKomyXNa+r7NlarkLzOJaWvBMgmNYHizOrwAnLjP0tpLl/Cv9X4s3dNq
	54jMMaTiKuchyA0wctIxPAyjdoPsux2+/OeSHpndkhYsMRxaVLtfA+oIUzZn/e/l
	QnT0YSCcm9uyPh7jrGgVi9vxe+YeSE7VbGsvV8jDVbZ1Ux/9oEo+G5ExtrHFBgur
	AuM30Y3ctdNzdd98MuX25rD4cWOte0AKBTIapO6U3nDbgBdh10B+m7cRpVpoTsMD
	CkFEt0W95CCqbwj10XiyYRzh/gGZlWHJPdZpbRBgPWC/CFiddzTRzAv0d+2NMMzA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tuaj678p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:56:05 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TJrYGs009151;
	Fri, 29 Aug 2025 19:56:05 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tuaj678k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:56:04 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57TIJASU024084;
	Fri, 29 Aug 2025 19:56:04 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48uhcn09x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:56:04 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TJu04G17760844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 19:56:00 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A15E5805E;
	Fri, 29 Aug 2025 19:56:00 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C8C358043;
	Fri, 29 Aug 2025 19:55:59 +0000 (GMT)
Received: from [9.61.25.56] (unknown [9.61.25.56])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 19:55:59 +0000 (GMT)
Message-ID: <68e13ad7-98a1-4fff-a5aa-a8aa4ed04266@linux.ibm.com>
Date: Fri, 29 Aug 2025 12:55:59 -0700
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
Subject: Re: [PATCH v3 8/9] powerpc/pseries: Enable hvpipe with
 ibm,set-system-parameter RTAS
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, hbabu@us.ibm.com,
        shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
References: <20250828230845.2291249-1-haren@linux.ibm.com>
 <20250828230845.2291249-9-haren@linux.ibm.com>
Content-Language: en-US
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20250828230845.2291249-9-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bmAS296rP4nQzeepUqNMh0lKx8msivfe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDE0MCBTYWx0ZWRfX3U4XrPC1ONng
 AeNrEDKBOAXVsMcQFW2U+FSHjNgKOScxzvViiqj8TOUbiSTT9cjyTFpJTlEeOcAVAJNGwML+r2D
 4uuvpAX6EcWzi5VQUJBZW12xlirJY+bOrwWCl7+OxJlBqhAD0ZqL2rZzy0QWPK+6sgn+tO7a/53
 wI8iYivocsEpPhf+kS/Eav1gfWcdve67Oc3u7YfajEtU2+RafKooqC6CUeRjJLQ641uy4eHZJq2
 0JjsM0RBf8JDCB7pQoLhHG+agk6mlAEtRqgaI3qRok9LUEbxGNCWDBp0ZYcviOR27khNKKzN1KE
 Ta0bQJWzbZuOktbVJo0aWKfGFyvpmMHJIgMzWaphIGpHMmWzTsImZxyy7QJeHkAoCEmxCGkQ/8p
 2KWPNMPL
X-Authority-Analysis: v=2.4 cv=YfW95xRf c=1 sm=1 tr=0 ts=68b205d5 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=HGfhSP7TIIcU6b9eYqsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: PicBb9ec8YMkgGVgI0xfBc5L0JpGUyOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280140
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/28/25 4:08 PM, Haren Myneni wrote:
> The partition uses “Hypervisor Pipe OS Enablement Notification”
> system parameter token (value = 64) to enable / disable hvpipe in
> the hypervisor. Once hvpipe is enabled, the hypervisor notifies
> OS if the payload is pending for that partition from any source.
> This system parameter token takes 1 byte length of data with
> 1 = Enable and 0 = Disable.
> 
> Enable hvpipe in the hypervisor with ibm,set-system-parameter
> RTAS after registering hvpipe event source interrupt.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

