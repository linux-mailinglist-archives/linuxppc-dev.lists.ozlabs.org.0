Return-Path: <linuxppc-dev+bounces-6660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6DDA4D394
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 07:14:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6QPB5chfz3055;
	Tue,  4 Mar 2025 17:14:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741068846;
	cv=none; b=A9TjZvU1nc10dRsqL/OiomqiXlbY9jFs7QL/DFb14ZGaZbKK11mf18Ph1aBMzEXGlAy/TbNJAnepLRv0ArRphMpQAaGjRaQWxadfuvhwpDAJC27OlglhS/831nMR0Wwk6qdUWV1LfLqBg7XMH8+yjDIu5gRcaZe5Obfjcqwwe3qcw4OJJi9qNn4rNj/7geSXgeN9iHZhjUwY12CTUEpe6qaKgRGcg0fDfoW2jYjju+ZeW0FTv+etNmcSA5BsgTVgueXn2qxxzUgZNFaBNFJfe/FH1gGAKJOR4jPcA66L499C4zP5HXqTtpjxdThIGumgot1+/s953dtsXnop1m/5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741068846; c=relaxed/relaxed;
	bh=a5BV+SxL8+Es1imNgFblJNa3ir2+3xn4jrC/hhK3tVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nJxh4BKhzFDhelFHC/4nSAwXQ4UdMOisN5/R6wFaLWBJYBRw2rIBdoSsN7Jyrc/X3yNjxKmBLdUmGbuMGnVPFsYXGkdz1C2p0WjkoPljWsH5J7v7pKLW9y565m+ULA6jhJn5tzbvJ62+7R+CjbglpLumk/Y1fUoUfGtY8/7UnVLwZuWu4ItqOc9ND4cnm1P7BRyCbffMtF+txaAhnKqM8tCCtYNmaxnubl3TGpBf4d/5iGY6Ob+eovsKItIfdJDzm95f3g/knnqyqiAV67ukmNds5TpuWn7esuzgmvTZwI+l6zVBLDefC9wxC+ZMRarvzuQSFDK2sWGBXJP46n0pug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gX6nNpzk; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gX6nNpzk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6QP94w37z2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 17:14:05 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523KdhZi019982;
	Tue, 4 Mar 2025 06:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=a5BV+S
	xL8+Es1imNgFblJNa3ir2+3xn4jrC/hhK3tVY=; b=gX6nNpzkqudh7X+mT7ypfv
	dSx2em3igMxsOC2Mr9DEo2PCVvyb2k9wExRfcKAjGtQ6M3rus2NSik6zGndFkdJo
	S4OQTObJoytSkkW2MvlJnzUF08b5ebp+EINBwt/Z2z7B0uUHS4YC4KOn3UQUl3GT
	udrz2Q6KZNBFUYE1n//eZ/OC8bZ/ZvL9EuZTmw50Dj+kdHuwtW290F4DTIlrj9cm
	AVhpisERwihU9xsfVKlcFIdxdqhBmfwCke3TO9W3OHmd99v7IuOIncgDZoC6EGMS
	qKAZNtq0B2wOJT2LXCTicRdH/7wYE1AfHA9tvOGaFVIANbOYYnOIXk4z4zxeIwpg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 455kmyj2cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 06:13:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5242uaGH032680;
	Tue, 4 Mar 2025 06:13:50 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 454cjsv5t1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 06:13:50 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5246DoKL25363126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Mar 2025 06:13:50 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 585AE58059;
	Tue,  4 Mar 2025 06:13:50 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D499758055;
	Tue,  4 Mar 2025 06:13:46 +0000 (GMT)
Received: from [9.43.105.169] (unknown [9.43.105.169])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Mar 2025 06:13:46 +0000 (GMT)
Message-ID: <47aa8b75-96b6-4e37-bb62-ad758b414076@linux.ibm.com>
Date: Tue, 4 Mar 2025 11:43:43 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: Build Warnings at arch/powerpc/
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NEfGyNMC3dJmZxbfR_uXgeNFAFsu3hBe
X-Proofpoint-GUID: NEfGyNMC3dJmZxbfR_uXgeNFAFsu3hBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_03,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=913
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040049
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 3/4/25 10:42 AM, Venkat Rao Bagalkote wrote:
> Greetings!!
> 
> 
> Observing build warnings with linux-next and powerpc repo's. Issue is currently not seen on mainline yet.
> 
> PPC Repo: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge branch
> 
> PPC Kernel Version: 6.14.0-rc4-g1304f486dbf1
> next Repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master branch
> 
> next Kernel Version: 6.14.0-rc5-next-20250303
> 
> 
> On linux-next kernel issue got introduced b/w next-20250227 and next-20250303
> 
> 
> Build Warnings:
> 
> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe84: intra_function_call not a direct call
> arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: unannotated intra-function call
> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call
> 
> 

Can you please specific the compiler and compiler version you found this issue with

maddy

> If you fix this issue, please add below tag.
> 
> 
> Reported-By: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
> 
> 
> Regards,
> 
> Venkat.
> 


