Return-Path: <linuxppc-dev+bounces-7028-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B490A607E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 04:47:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDVg71BPGz3cWH;
	Fri, 14 Mar 2025 14:47:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741924035;
	cv=none; b=RuGq5q6h7pGBJWK3+GIXxnFoYktphrGJOpiAb+sJvVS7ebPKBuJ/ZKzZ+jXhevofKop5GutdTron/keK+2mK2qy0xV9PkvMWj2qhIPrF7XFGF3zLQrs8DNiQxndmFHLOALf1D4YPxFFZs0J2DryjUkOaENmzyl7niOh7+uOKNIFdNFUSBcfc/xjNLBlST/Cfvu1pQqBBCcbrNkeQAzCRBfM/RQJziR4aqiWkWDKx+Yj7FGuIzQwH6dANpkLhiQxQV5Obxkq55p08uXDcrgmF9THxw9pRxO3+6DhuFEJm3M6etwMpXv2YrAWdI5v8TX1GqTeGZKlaSEksqkbiobTOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741924035; c=relaxed/relaxed;
	bh=rbqld69R34rgENIWGoUFrOQVwaLRsNaSOgh6SwTMhD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PqnfNpshzDim29K0e1k5YaqwUecmo3GxV+6Mjc+8lQC2310smrK7kmdOWRVfgbozFz6DzPMSXh+FS9Kl26aRxsOQRXtBfk5+s9Dxf5vF4axX1mUxx0YUg3khOjVsowVG/Zp+fUkR08qOxOGeUhJqqsSKPorPgXiMPwucuqeJe0aN0KAefm4wvjZzNuhjpROVtd/xG1wtj8ZHzRY6hZ9fLsQIRqb1d/BufaNYRayl4D3rUcHhF/wafvPshOoQEnNL71qheHfdDdzGFf4uVlOvs35KhBMn5oyu6281QhsKeD8LmpND8X295l8soKk0xW2+ukGh/dgkSN0AQ5bRErPRdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jyrJ8goX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jyrJ8goX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDVg61H7Kz3cW2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 14:47:13 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNPK1W007584;
	Fri, 14 Mar 2025 03:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rbqld6
	9R34rgENIWGoUFrOQVwaLRsNaSOgh6SwTMhD8=; b=jyrJ8goXBp4h4+9cA91g6u
	JXTTTc8HXPUM9kllvGpB2zhAbcE29cJL6UrWTibkEtJn8uo3cDo7/yuTibZxnAVq
	O0GtYH7zMGcVn0auRCEBkQ2MuR8ScfmVEbU7hJB0Z1tev/K89C2mfPE6pI+ah8kM
	WrTMbfeBIVwTm/y3+lnsESG2SU6lNtXKzMbRytdFPa4SUqP2C8VOHk+HmMUPUWoN
	nyB85DSXcQ2PAuK9Dsd0WErOXVxkwTQb6eWLQTucif00mlDgxbVGpAuvZlK6lzMQ
	b4nab/6ER84D+BPjh8C3fCzUROUWHjBVqn0Gh7FTDQ/nTysDNlXP4U79xzPiLqBg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6s59ak5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:47:02 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E3jhBV025695;
	Fri, 14 Mar 2025 03:47:02 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6s59ak4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:47:02 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E01DHN027072;
	Fri, 14 Mar 2025 03:47:01 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsr51mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:47:01 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E3kxwI34865796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 03:46:59 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DB172004B;
	Fri, 14 Mar 2025 03:46:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9A8120043;
	Fri, 14 Mar 2025 03:46:57 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 03:46:57 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/kexec: fix physical address calculation in clear_utlb_entry()
Date: Fri, 14 Mar 2025 09:16:56 +0530
Message-ID: <174192385438.14370.6065221233235431919.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <dc4f9616fba9c05c5dbf9b4b5480eb1c362adc17.1741256651.git.christophe.leroy@csgroup.eu>
References: <dc4f9616fba9c05c5dbf9b4b5480eb1c362adc17.1741256651.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-GUID: chj51oLoDwGWiyO2fapE5MVDQSAK-Zby
X-Proofpoint-ORIG-GUID: QWZwaoJnNhxJM0EPcnXZLKAhgYMgabFH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503140026
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 06 Mar 2025 11:24:28 +0100, Christophe Leroy wrote:
> In relocate_32.S, function clear_utlb_entry() goes into real mode. To
> do so, it has to calculate the physical address based on the virtual
> address. To get the virtual address it uses 'bl' which is problematic
> (see commit c974809a26a1 ("powerpc/vdso: Avoid link stack corruption
> in __get_datapage()")). In addition, the calculation is done on a
> wrong address because 'bl' loads LR with the address of the following
> instruction, not the address of the target. So when the target is not
> the instruction following the 'bl' instruction, it may lead to
> unexpected behaviour.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/kexec: fix physical address calculation in clear_utlb_entry()
      https://git.kernel.org/powerpc/c/861efb8a48ee8b73ae4e8817509cd4e82fd52bc4

Thanks

