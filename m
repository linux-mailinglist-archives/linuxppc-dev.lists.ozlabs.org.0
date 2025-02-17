Return-Path: <linuxppc-dev+bounces-6252-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4C6A37C2A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 08:28:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxDlq4CqYz305X;
	Mon, 17 Feb 2025 18:28:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739777303;
	cv=none; b=UlGqSRv9YHUvqtoU83cx8G7LAsuIbRLO//CfQm4p1qJFKEg+5EqAjpnwtQ1YDHBi1uV28UB8mEWskrv1uLmh4wqpfF0Rp3fqacMz+bqQtCcARuwDnOv8AWzmohOL2GQ1i3apqXHfH4XwhzL/7burtrT1V4/3fZ3OYKqinZUdHJtqLkk+Fl9OUxkM5Zln9dWu60Rb3trLN9yk2LiRV2X886bTHHbgLdE0Mf/TyOqqdptI8Sc78GymgUYogkJDDRChIuPBn8h3GyBasHzX57dCr9zvo/X0IzkJDX86cEqnqgxQYj+KnQJzPlVdT7GOkYxxsBGKMLD3wKQ97kZEhQuuAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739777303; c=relaxed/relaxed;
	bh=D6HMs9pXm88fq+a+e52uoT/DyehiSWM1n15SJwI2A90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KMhfXQ/gmolEDLTZ7iGV3Cv06E5FZlZuVkwP0qAqwBhgeowq+vvXtyP/4gJT8Z8KGYnF2vmMoHYKN2UiXPT5VRAsZoJ0v5JuLjYpPFj1z8pPIOzQQsmIZ5IFkokf3BkbZrZpyJCMEn8LVK6mZaK4C77R7AHvxG7A2/JhoUNVo3MKxYMyV0SaeHUg7zeEZ0+VVJRydMBdCVwmPoJbcKE+1kZbLZCf+FIz5M8GAYMwOTqMWG5cbuagHfG0WGDdp4QoXej040kkosXqtQW/XEu0BwzY+8Mv7Egb1N9zPxIVsGsADGIcQz459eI/3S7xG8KBdnvCtJZ3I1nnzeFmUeFZLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DR4PTkmU; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DR4PTkmU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxDlq0Gm1z2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 18:28:22 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H5O9aE031302
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=D6HMs9
	pXm88fq+a+e52uoT/DyehiSWM1n15SJwI2A90=; b=DR4PTkmUv4dGUJw7alQ0Yl
	2JpVQN/eQBBZlmXqmKyhPzAS924ofWZ9LjFgCP2zdf20HtkguxnDOatXTtm53gYl
	zE2+SZWOccwrYIdPBuB9ihOLOWx4sFurtn+uijMskdD4SPpHhfdBfVlaQRvm0T5i
	FYu+tPUGggap20igDNesi7OSLT0bNiY9Ca3TUe0fQIUDMZFTEp8izwveikHrfpVt
	Kh9VworK/1y7KGCR3CNvxTJpGqkevPAv0T1ahdni3li2q6uT2HjDEP0aAhGKtHPa
	6qA9Sku9KCGC7fCLi4+iLZzb2n6To1xb6J3k1VQxj4UKX04j2L09nrF8dX6zA3Gg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44uxx7rgdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:21 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H3HDHr001673
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:20 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44u5myn3ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:20 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51H7SGoh50921876
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 07:28:16 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D13920043;
	Mon, 17 Feb 2025 07:28:16 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C9FD20040;
	Mon, 17 Feb 2025 07:28:13 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.79.72])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Feb 2025 07:28:13 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Cc: kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
Subject: Re: [PATCH V3 1/2] arch/powerpc/perf: Check the instruction type before creating sample with perf_mem_data_src
Date: Mon, 17 Feb 2025 12:58:11 +0530
Message-ID: <173977700763.476837.11093384027470754012.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250121131621.39054-1-atrajeev@linux.vnet.ibm.com>
References: <20250121131621.39054-1-atrajeev@linux.vnet.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 82s-KXfLD8jT8R0Z6tVdWyPzFNQQtHaS
X-Proofpoint-ORIG-GUID: 82s-KXfLD8jT8R0Z6tVdWyPzFNQQtHaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 mlxlogscore=834
 lowpriorityscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170060
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 21 Jan 2025 18:46:20 +0530, Athira Rajeev wrote:
> perf mem report aborts as below sometimes (during some corner
> case) in powerpc:
> 
>    # ./perf mem report 1>out
>    *** stack smashing detected ***: terminated
>    Aborted (core dumped)
> 
> [...]

Applied to powerpc/next.

[1/2] arch/powerpc/perf: Check the instruction type before creating sample with perf_mem_data_src
      https://git.kernel.org/powerpc/c/2ffb26afa64261139e608bf087a0c1fe24d76d4d
[2/2] arch/powerpc/perf: Update get_mem_data_src function to use saved values of sier and mmcra regs
      https://git.kernel.org/powerpc/c/f848e7ee1588d66539da7315d9a99bfaeda3b970

Thanks

