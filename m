Return-Path: <linuxppc-dev+bounces-11412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A48B393D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 08:33:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCBRs3Qy6z30WS;
	Thu, 28 Aug 2025 16:33:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756362809;
	cv=none; b=bOtPNHe8Tj0EV3EYCa3nAbSXimLnLanWrW0q2/Jj3F+rg1rwos6neJLaUwxDp6HC2efElkG4CXRkYZcVg2I4UfmrJ7BIGXSW2nQcU0CpGpPbu/2/S0cGrdfL9CtXgSjXkaeKYiyMRFXWDdHLd0zY5KlGKlAVEDhylwy5ubGmdPaKytYWh7mTv9OI1AUonFnm6BHmhb+l3Fcv6sRHLUNLnRELEXvExaocsWvBL1fJtuIxSEILxobgUlj0I1JqI2bOwmWN/Pk+OcE1XXt9ew9jFmCtJUlXnYh1Opd6hzkx39cb8fT458haOyDMJUalsiT/PN07EPiCe9UMx7i+Q36OCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756362809; c=relaxed/relaxed;
	bh=Y4tJpnmaSVm0XKtlWBoiq+6XChRtbBTbGgMlfO7RY+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eqxqc/VpoiCg7nY2+V9MdTgd9K5mfFNMtyAxOOzuLkhQu+OdjYsmzQJDy2Ay8mBTseAX0TpNQZe09wsrCs70dODTt3RwDQLQLyW0qyKKoNJsl1YTksR1CBGIZeAedP9c13m0ABlVDsPmQ3T33hK39uZ8qMKta37igqFvPP47kbgEkAr2kE81PjRWjYjTSVLJL75GbHs0UB6B/U8Gzx7s+Akay+HHD/eZc00mscZTCnjwAsv37rFe2LDRChvhZuRtdg0FjXlUDHWmImHzBTNJBLPpGS/uc+ZRjfQr0aHGEKh3uNttXtc7JpGnaVEw61SKP28CCS0fox/dtwPJLPbrmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LjLbq1ty; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LjLbq1ty;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCBRr6g2cz3cYg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 16:33:28 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S2ARto003786;
	Thu, 28 Aug 2025 06:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Y4tJpn
	maSVm0XKtlWBoiq+6XChRtbBTbGgMlfO7RY+Y=; b=LjLbq1tyHrN6SUzVaH5QBa
	VpMOi80T9XdecxPqcYRMYAlKNmE4Tri0NaFgiLgbRi2LQ3Ojz9gv+gW4fVVpfUX2
	eXMEWRyUt4gaNJZbbhnDOseChUZ1MzIRkzxcvmScrDJZ5uhR46GHbTv65l4hcPBv
	38r1tcMObkLYEgn3BlKM0k4L1eg4ruVwhHQCVCQSaO3dP4LMzS5tgwLO3cwMIzxX
	aBIF2kuoZDYFVmqhZtUrAl0GUjGJdFlPu8bk3eEdwl/N+5XKeRo/8IZyAL2vo9Rb
	Ul346v7LMazlU/d7Qn8J/LQikhRx8+Y9myLcnBX6UOevdMA2h7yYtBUrL+/q1+IQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avr4da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:16 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57S6VxUD016762;
	Thu, 28 Aug 2025 06:33:16 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avr4d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5aFZX029957;
	Thu, 28 Aug 2025 06:33:14 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qsfmuj87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:14 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57S6XCUk46006560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 06:33:12 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93D6A20043;
	Thu, 28 Aug 2025 06:33:12 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F6EC20040;
	Thu, 28 Aug 2025 06:33:11 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.64.161])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 06:33:10 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, Xichao Zhao <zhao.xichao@vivo.com>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/64: Drop unnecessary 'rc' variable
Date: Thu, 28 Aug 2025 12:03:09 +0530
Message-ID: <175635911050.1554354.5226234621328451734.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801035908.370463-1-zhao.xichao@vivo.com>
References: <20250801035908.370463-1-zhao.xichao@vivo.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VExv-ZE7OWcx9B5d4oHRybycscjQ_2ZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX7cl2AZIplOI7
 nHSDCnmhccYyD+4dymlP1NnCAiJs415DhpoZ3un6D9CVfx5dG0kakLxMZzUUHwJ/9A2Ms0fVBrY
 3mSZij042XgzoJN7LKVOjKw2hah6ML2WT88sr/V8edtYytne3X5GX7aWglUSb02CPZzY2loH/EW
 Dn5LnInxp14Zf8nE33yNIXz+fH3JLqbGp9hLc8xZCjUo7REfCYpfFTIU/JHjXvllNq1KIXjqlu0
 CLF+r4Cdqsfydjofz1dR35G1HuNNixTSLfePPkwIGB7mPtzex2fKyZMDD2cEc1jXhFTAfqYdJPY
 zRn/wXz3hzRMkQ73uKBh2XyAJ5K1vtssWqof7LrYj8oPwDm7YCaH//Nr+QVpZ154kIZ0wizzE3M
 kFrkWsEh
X-Proofpoint-ORIG-GUID: p4KGUqfMXWHFcTISzsguXEn3ufH5N0lA
X-Authority-Analysis: v=2.4 cv=SNNCVPvH c=1 sm=1 tr=0 ts=68aff82c cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=kQJjBC78qQ7jkp6vknIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 01 Aug 2025 11:59:08 +0800, Xichao Zhao wrote:
> Simplify the code to enhance readability and maintain a consistent
> coding style.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/64: Drop unnecessary 'rc' variable
      https://git.kernel.org/powerpc/c/8b5d86a63bc9510e094a15d7268c60bd4347b95c

Thanks

