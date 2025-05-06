Return-Path: <linuxppc-dev+bounces-8326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C8FAAB5F3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 07:39:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zs6fJ09Kyz2ygK;
	Tue,  6 May 2025 15:39:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746509975;
	cv=none; b=hBcfy1uKHY47Nz0vOlflkiPNLhj7vkhObIyuRyuGv1xE2s61Bi29FvM1Hb+vkdnpOt4cCA2WSWKFoNAHLfykmL2XBT+IgRy8laOvY/j23FBspFzDlvUHfzw2ou4JUV1LYUSlsnz3IyPxgCcyGZM2QE1n9w3gNiQaQpzQJ2BjYDPV+iFggJa36YT0wgAmLBsNdhvg2+c22ax5ZrS2OMkvfsL8oIJjndz/+qn97QvkPLaE8jgELlCpZ+p92iogBGN1XjRBRLiDf2OIDn8ZMFTYQnvnnzWFsMkUIJ78neAN0xenNhmlWWzVqGrlPaIeQw3HdSakdB/qyHV0acV9nKvHEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746509975; c=relaxed/relaxed;
	bh=Ts/lpYgRvVW3tUCks4eC9rvGcvaiNAjci7VsczPQ+oc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=k2X5TmNLjWSz1JTeekfYarlgsvlHIiYWURzJ4490FkguzeFUOcowRsxHx+5qxfiqZ4Uhgx7ohfIsHHTCM8taxEq6kFqr49Vf9uB6Z16VGKchSl++Cf6fPpykcZpnLa7dNrBiHew7NjxP1N78uvaPiaa1niEL2f4LQfrBLcDjhROdHfHFFafSYg9g9WY6kBENHCcjje+yzArewECnGc7Tjx+rmUMwNpUfHDXYqcSuBwzsv0IOSg1o4BxtDi8AVAjf94iP3g9g94y9WioHkspOVX8Z+x54lMHDxj3HAIxAVe3SAZ40qmjsCd3kiU2zMY5UnFiGww1lb1Z2gbsJX/ov7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EGT2q7gL; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EGT2q7gL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zs6fG5CkFz2ySN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 15:39:33 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545Lcwpv002195;
	Tue, 6 May 2025 05:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Ts/lpY
	gRvVW3tUCks4eC9rvGcvaiNAjci7VsczPQ+oc=; b=EGT2q7gLjEK8wrzTLibyFA
	tI4LbyhPF6wFVkdvlmO+QYwrdwZIyyodrhB/bjecmPPcnT8JjDGPdUPGgoy7ao8Q
	+LwPy3tlo1TNsTaZRyI0l1b0fbSejlEb/XRt40XMSwWNVK3FQjFlpVfhuUtAwj5E
	bSpcDufKn/kVURGgibQmRXrV+Q4TnraC4t7dqT3o7fC6jYVCEGJxVRUl//3GrDk3
	RS8J/8ypDFgK/P96VNj2Gkf2KEXcsbl/6GYYidKEamDqEgGwLDJY0eXOBu50iA4b
	w2QdvnIJ0O0nm9Z9DRoKsbcjyp2nYbVxrpEoZGTdEKt6T6Mz6WVLTG/X7MzRZ0Xg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46f5e8hdng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 05:39:03 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5465ZZVQ023969;
	Tue, 6 May 2025 05:39:03 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46f5e8hdna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 05:39:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54636dYd001353;
	Tue, 6 May 2025 05:39:02 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dwfta50f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 05:39:02 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5465d1Td28115502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 05:39:01 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75F1558060;
	Tue,  6 May 2025 05:39:01 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0C325803F;
	Tue,  6 May 2025 05:39:00 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 May 2025 05:39:00 +0000 (GMT)
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
Date: Tue, 06 May 2025 11:09:00 +0530
From: Misbah Anjum N <misanjum@linux.ibm.com>
To: Ritesh Harjani <riteshh@linux.ibm.com>, senozhatsky@chromium.org,
        yosry.ahmed@linux.dev
Cc: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG][powerpc] OOPs: Kernel access of bad area during zram swap
 write - kswapd0 crash
In-Reply-To: <87ldrujhr5.fsf@gmail.com>
References: <89bfdedb74416156423d36d28c5b92e9@linux.ibm.com>
 <87ldrujhr5.fsf@gmail.com>
Message-ID: <3374b7cf6a68364c389a260d7ec9067f@linux.ibm.com>
X-Sender: misanjum@linux.ibm.com
Organization: IBM
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=X4ZSKHTe c=1 sm=1 tr=0 ts=6819a078 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=xe_K4BuX0dQdScSaYpsA:9 a=CjuIK1q_8ugA:10 a=QQLMaIiM1wwA:10
X-Proofpoint-GUID: e--iastPlMmjXy9FL-UQycqA02G4JAZ1
X-Proofpoint-ORIG-GUID: 4Gwlx4U90MbmYYcnk0a4-ytVh4HX2e7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA1MSBTYWx0ZWRfXzj/UyGbhywwb RLwbZzJ2n/P7SjvOG20klsZCiGuA84n+tZGLeGRmdZz2h2+IxQqel7GtRkQp+Zv+nBWUyZlORPq tXXungA72HjLoIcNpvDDnZY2/NdDKyW6zHptjVuqCpm0Wx+iuU5sPrDmejCuUnwMNXKOPXMV+2j
 zU23p8Zj+bolJOw/YM+skyVNUGnCihMlMNOm4YXjoA0GRsg6idvQYkIdqHYC+DV6L7UZeQ0D3vS mQRbKddIctZm6uyGbdz6Jg+OLzK4NYUVKVX5CJ17hPIl2g1HbIz/5oV9sUcffM5xf8KnxNzBCuJ WRUwjdstbImlnOCUcka4Tx7vP9R/yqwowMusswyw3Xz5iyJLICvX23Ac4ab8rzWb6ThWSDdZh6u
 ZPQUVxPmnSosvw+pA5njXdawkSYdhZ7UoB4fDN7PMdRvfVfFvNt9LkZwmYFNUM49LJ2ndjpX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060051
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

I am facing this issue even with the latest kernel: 
6.15.0-rc4-g5721cf0b9352
The suspecting commit is: 44f76413496ec343da0d8292ceecdcabe3e6ec16. The 
commit introduces zs_obj_write() function.
Link: 
https://github.com/torvalds/linux/commit/44f76413496ec343da0d8292ceecdcabe3e6ec16

I was not able to reproduce the issue by reverting to the prior commit: 
e27af3f9360ee130b7ab0b274088f92146a0855b
I would like to request assistance in debugging the issue.

Thank you,
Misbah Anjum N

