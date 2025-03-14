Return-Path: <linuxppc-dev+bounces-7026-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2ACA607DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 04:47:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDVg34BgZz3byh;
	Fri, 14 Mar 2025 14:47:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741924031;
	cv=none; b=kFNSjWvkgFislVxDIMLaC6MUX+7mtnHTaYZL3kDbpjlg8ptS/kFmx+Knng+OtIqFK4O0G9rgED+6qZGtgfQNKUyv/Ij5STfBJXGsUCCtPuKEf3yKC49edtbFzLqoNUeSHJvG8odhOgTKvIbowi2fzxOm7sMI589oL3fjzNnthw35Th+dbGx+VZeE0YwF6huYUCs8ElC9OMsFpNlnOU2uVgvXOSXiKo00+JtDzJja/V6l5QcTyCxqDD3UNDp6PQ+Oj3E+bl4ws2ocab8taImKijApPrBUbqOiqUNbgZCiOPkM95FD23KQQs5iA4nw/CJUNUmJYoDagTAnkgsOV5SLtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741924031; c=relaxed/relaxed;
	bh=JXua5caTwTNUTtdBvGHDVqyhcKPAlSgEyDPOfiwv554=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k80DE7uHUxMFwrD6zFOqfJ5hVfIOh1i5d715qmdo7/ClmWtvjkuTR83HAQrKVMivp+VGmfRdypaHPqsTLSgpu1OI3fLw9+/qG3jMqszpF4OXwTdnQewTjNS0+o2MEsRQW9TED0MvUVg8CfTlCtbA7NlELkIfCp4xHfEDELDjmY5j1zxgWSdPWTcvr74jZ482Ztub3LwDPSFtlTdGHyFUWQ+sMyDAJCzJOSh+khO6r/3kfrB/CVN2WrQ+/PV7e+FafynCVuyywTQuJs1NqoTYf7l9xQfeZHc0P/vjIVOu1iyv4JJsqqDJFc8l8MbzrjNjVW4vJJpfG44Uf+Imx8i2Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qsb9XeYS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qsb9XeYS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDVg01chfz3bsZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 14:47:07 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNOuSx030460;
	Fri, 14 Mar 2025 03:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JXua5c
	aTwTNUTtdBvGHDVqyhcKPAlSgEyDPOfiwv554=; b=Qsb9XeYSWL6uv6usciKbcH
	6j8mtMqjAlvVTbvYL0Z8cwvqAODUDf4AVUSDCXjQJbADa7QZNsOIFizxuhnsD/mt
	yDy2FHcXvhUf4RxpO7V10v81zPY28NCqMOUP4E066bOQNNo9Or1rGAvrmaFA7+E3
	tfHguPylMLn0XkMkQKRGortUB0ZRP1514ykq9dq0GVQaO9TPExs+JziiQYhZCUxa
	DpDLhfZRe6Q1gApAVtkN6lTKaBwz5VgmrFJqEuj0eQa+BUaP8VZMwTBn2ZT2/6Dw
	Dk40THwCA2ddQfwSgh7dDko5vTbaDW1m+JAwElj33q4fFRRFeYm0JVMmHuWS0yTg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45byd8v1ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:46:53 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E3jDN1014449;
	Fri, 14 Mar 2025 03:46:53 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45byd8v1nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:46:53 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNlWnS003127;
	Fri, 14 Mar 2025 03:46:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atstw3a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:46:52 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E3km0331719790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 03:46:48 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D06F120040;
	Fri, 14 Mar 2025 03:46:48 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F1D620043;
	Fri, 14 Mar 2025 03:46:46 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 03:46:45 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, kvm@vger.kernel.org,
        stable@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH v3] KVM: PPC: Enable CAP_SPAPR_TCE_VFIO on pSeries KVM guests
Date: Fri, 14 Mar 2025 09:16:45 +0530
Message-ID: <174192385435.14370.11531277481779566442.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220070002.1478849-1-amachhiw@linux.ibm.com>
References: <20250220070002.1478849-1-amachhiw@linux.ibm.com>
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
X-Proofpoint-GUID: I-iNyNSGkOlt7gHk5ndV6xI-yg1ozl1W
X-Proofpoint-ORIG-GUID: HfY6S5Tm98aVoIP7IKzo1zopnf1RSUjU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=679 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140026
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 20 Feb 2025 12:30:02 +0530, Amit Machhiwal wrote:
> Currently on book3s-hv, the capability KVM_CAP_SPAPR_TCE_VFIO is only
> available for KVM Guests running on PowerNV and not for the KVM guests
> running on pSeries hypervisors. This prevents a pSeries L2 guest from
> leveraging the in-kernel acceleration for H_PUT_TCE_INDIRECT and
> H_STUFF_TCE hcalls that results in slow startup times for large memory
> guests.
> 
> [...]

Applied to powerpc/next.

[1/1] KVM: PPC: Enable CAP_SPAPR_TCE_VFIO on pSeries KVM guests
      https://git.kernel.org/powerpc/c/b4392813bbc3b05fc01a33c64d8b8c6c62c32cfa

Thanks

