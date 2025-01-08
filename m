Return-Path: <linuxppc-dev+bounces-4860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D612BA06302
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 18:07:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSvVC531yz30TJ;
	Thu,  9 Jan 2025 04:07:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736356035;
	cv=none; b=WlWMuhyL1QzWOwF11x5zDQj2pbGTVXxl4u8zandRvkrn+CYjq1NlOlHguHmiMcAWspO/Txdbl6KG876qmV1Bh5zSw3+1rmGln+X/WZxTX98ByGWkfkS7GCixvDRnIuV8uVhzEPnL89Ezj6xWEnqTxEkvyeUhKoIxrKoy/rgyfjZE1DGK0n20Tn2F8aQJge2MCkxg9lhddCWjm19G+cOjp4RmZ8bTUa54hwgGP2w6Y480wVh2O+8WhNh/sMa+oD3Qihv7g8AKUBr94l+/hwU3lYiD0P9drkkCVHuZheBrMPNJPeTjzM1/tkBdh0wIU9qXi3wEWE6ykBPWlgK92RWFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736356035; c=relaxed/relaxed;
	bh=7Rco7cktgzZ8MgePhAM+gb77taf7Sd6JzK6MPuBfnxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkD7Bj4Ts0YvFtbLnZ+NVZrsOX+WyokYxXI9cpQsiFstUUGFYtQ0XZh1RABELQdHLSGusnyoZvInmW2nZ9CjJhO6hPA6J1wP0RjUn2zV3g6D/wcARH7Qanmv69vXzgpTd8Ka+LWjBoGZo3aea9DKi+cp7s2dJqTl4dgXo+M1UiOYP7SpXeXIqiGE6KVr5aiS1wMaYu0779p4DK0MI0PTM3o+Tu85m6lSdya2fuXSgjmwtGoqxwf1rRwgs4RPksZk+kEGaYeAQuyQkubrIMBsIf0v5C6209IiDsDJiSxxEKMSabeOhir/lsWfeixg9rlV5T0hS5UHc55VXGqZLg1yjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fT2Lg/Mz; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fT2Lg/Mz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSvVB50Pqz2y33
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 04:07:14 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508EHPDk009609;
	Wed, 8 Jan 2025 17:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=7Rco7cktgzZ8MgePhAM+g
	b77taf7Sd6JzK6MPuBfnxk=; b=fT2Lg/Mz66ez873RIgd1O7ShK7ptRYqcdSr+3
	dO1pFvlmgdYsxwJFnshZBkntVnWwCiN8FBIE3CAE1AYCis7Y2i6PDLnum+/N1eWp
	ujMFCveqiDAMgcX7trV11NqekbchCgLUhkevM0KNXo07dIZfdiFH9EbddhApTjVG
	gZRLpRx5IfRNAra9XRHU7EVJFvvONIQ3JhlcTQGKfGeoaE1R3iSx3SYNbep7LagW
	MeVqezJ8LNACG0LHGqOaGz1Oeag4GGkbvec0vA1AMdvK4HLdp3PTU+PvSH/W1OnN
	YX92m4+NnpXB8J3wYXHtDyqWQSANMerpT8i7kdC/FlcQYL38w==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441hupuh2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 17:07:03 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 508DlggC016144;
	Wed, 8 Jan 2025 17:07:02 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygtm0qcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 17:07:02 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508H6weY65732980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 17:06:58 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B726B20049;
	Wed,  8 Jan 2025 17:06:58 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 652DA20040;
	Wed,  8 Jan 2025 17:06:56 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.39.20.94])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  8 Jan 2025 17:06:56 +0000 (GMT)
Date: Wed, 8 Jan 2025 22:36:52 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
        Baoquan he <bhe@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v1 3/5] powerpc/kdump: preserve user-specified
 memory limit
Message-ID: <k2eoi22mh5lod4nzee3qfbaagh36yljcqwxcyvvewmzbktcual@mzleqvtlojj3>
Reply-To: mahesh@linux.ibm.com
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
 <20250108101458.406806-4-sourabhjain@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108101458.406806-4-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0k2Nk1NO3SK3S2mkcvoPrnX37nTnCIAg
X-Proofpoint-GUID: 0k2Nk1NO3SK3S2mkcvoPrnX37nTnCIAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1011 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 mlxlogscore=779
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080141
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-01-08 15:44:56 Wed, Sourabh Jain wrote:
> Commit 59d58189f3d9 ("crash: fix crash memory reserve exceed system
> memory bug") fails crashkernel parsing if the crash size is found to be
> higher than system RAM, which makes the memory_limit adjustment code
> ineffective due to an early exit from reserve_crashkernel().
> 
> Regardless lets not violated the user-specified memory limit by
> adjusting it. Remove this adjustment to ensure all reservations stay
> within the limit. Commit f94f5ac07983 ("powerpc/fadump: Don't update
> the user-specified memory limit") did the same for fadump.

Agreed.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

