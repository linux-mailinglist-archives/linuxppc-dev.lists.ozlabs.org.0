Return-Path: <linuxppc-dev+bounces-8636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D3ABADA1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 05:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0RWw0R8tz2yrm;
	Sun, 18 May 2025 13:44:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747539868;
	cv=none; b=O61TuKEjyUpe6I7mrNITJHnNJ9C5YNSG4r5IZLfk88hrNcocAifdl9sgiSPJhQSZ3K183+WLw/e9xb0CS5yHxfL7OYTaAaF+JghYusLsLi7mUUzibgWBy5Or/aLBy7tsP6obbKZrU0nKgtQCQK0WGBJeAFXPehX4UYnvq+itG/l1aKOPE6SyxEk1859QibonZ1LH2ogd3Fhubksw+aYXDJo73NesARTOs4pQKDER1c3MmYtJ8+YZY06pCPXcfrlRKeNC4rNYCCOUdyn30Nj2qg5AgHbO3wcDlsglON8JIGDixmWSrl7fXJfbqPZ2TYZObR0Ab7QzmwqzUtNmO1pdqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747539868; c=relaxed/relaxed;
	bh=0NLtNdPGsOUTdZQw/eVOOi/FkxfDbggK1oiQt93kmz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3+yjwuGY2K7md5sjf0J1gaBR7bTPPFe58uLlhiMviWEqNBkuK44rkqvFZ36I9xB39RiyirHvnwaD1x4vOVd0eQJL01LH87j8TzXgAxIde7BbtPUj3y0GR+BFL4mf28Tgj0BvQWhzS+ucaFhLMmZwYlC4B/kZPWouPFYkt4k4jhycm0WvJHfnICRsaGIJv1SdmBkt0etTEm2yMySw1u3wndaumtC05f6CbK5e4iTg7zXv7QMyYJs2jJy+MAvICsZfLUhMeCzpUL2QL24lBYZfh3gMWuZgqKs4QkwJFUb9HQEkDud+YrRwh8uJ24H1OZ9syzxpFh1WLOWBR8+2z1N7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KvhfQlew; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KvhfQlew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0RWv1CPbz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 13:44:26 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HMihsj020479;
	Sun, 18 May 2025 03:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0NLtNd
	PGsOUTdZQw/eVOOi/FkxfDbggK1oiQt93kmz8=; b=KvhfQlewEgC4N1wBFspJsu
	+pjj2Qk7agH2AROaJcluH32K1NtUz9TDL4M96OIEZdK4+7zTkzemu8ukVlcmUi2H
	bYwxlIaEFL0jRWkVhgRsZX2h14JiP1kFQjggZM9ysk1XlpaUDBiK5iHfaJT8Or3x
	XkRA2BFJL45EQFVXb1Z/6o0cV2u1VsY3YBYN7WqvM961eObeI1BN+CL3DS3TAAmg
	R4A7JyN+X8Kkb+ao1TUFfuUMyD4Lk7hDeFX1KzzInWBg5we/4nW+DnHsQXs5ylKD
	T331vea7uiZPNgb/Ou1NO0JGyh6sPPb04wV9RvjnGEOEpq40uoxcsM049iS98GcA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqagav81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:08 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3i7Ig016891;
	Sun, 18 May 2025 03:44:07 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pqagav7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:07 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I1rRV8005342;
	Sun, 18 May 2025 03:44:06 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q69m09td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:06 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3i3ba60031304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:44:03 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0172C200A8;
	Sun, 18 May 2025 03:44:03 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F5B5200A7;
	Sun, 18 May 2025 03:43:57 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:43:57 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix IRQ map warnings with XICS on pSeries KVM Guest
Date: Sun, 18 May 2025 09:13:54 +0530
Message-ID: <174753967072.24504.4432466115640773880.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425185641.1611857-1-amachhiw@linux.ibm.com>
References: <20250425185641.1611857-1-amachhiw@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: tyUeVwDId6Zm-0XCldTvL7iXgQl1Kio4
X-Authority-Analysis: v=2.4 cv=LLNmQIW9 c=1 sm=1 tr=0 ts=68295788 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KkMZSTVgx2o7lePJ6WsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: vS4vSUQTl0senht3RLC4EYfGSIrtNcO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfX/wK0ImeA93m3 YmKcWsC6lmvG4xm7DGtua1R3RbWjL5RgmwrTjoe2/mMf+8CUrT7oFHgrP0lXAup1ZFSxxDv6BfV 8kHuQAckleB4T//zK7xBLmRHkKXqEbFePAnaqaFwd8RziHKsyCiYv9KLL0xLWVSmbuQ2U94KcSU
 WpPFOHnXqm/UNyN+Py2HnTaej3G5SJAmKkSIUMIt9hwoJjrsYfEFsL6cJ0bhKm9FHbDLdrlA0gt wNHN0w2Hu16R9VX8v9KvuUWICedAe5bQrM2JAYTB6ChOKhx4ekndm8XjDlNbkccsfQwUWsWeezB UwKTzV3IY9zKy4TwE4FQl1qUOeB7GhB/Cy3Eti4SP7ZF3wppeJvx5zeVD6S/MuhxPncq2k6xItH
 c3vycgH29mROFJ0EFuLCaKLVxfrWL5RRKPUV47QMEai2HnAvZ3TJGoA4bUxoG1UZQ+Tr7ggp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=833 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 26 Apr 2025 00:26:41 +0530, Amit Machhiwal wrote:
> The commit 9576730d0e6e ("KVM: PPC: select IRQ_BYPASS_MANAGER") enabled
> IRQ_BYPASS_MANAGER when CONFIG_KVM was set. Subsequently, commit
> c57875f5f9be ("KVM: PPC: Book3S HV: Enable IRQ bypass") enabled IRQ
> bypass and added the necessary callbacks to create/remove the mappings
> between host real IRQ and the guest GSI.
> 
> The availability of IRQ bypass is determined by the arch-specific
> function kvm_arch_has_irq_bypass(), which invokes
> kvmppc_irq_bypass_add_producer_hv(). This function, in turn, calls
> kvmppc_set_passthru_irq_hv() to create a mapping in the passthrough IRQ
> map, associating a host IRQ to a guest GSI.
> 
> [...]

Applied to powerpc/next.

[1/1] KVM: PPC: Book3S HV: Fix IRQ map warnings with XICS on pSeries KVM Guest
      https://git.kernel.org/powerpc/c/ccdb36cbe65fe05fd5349c7ee5a59e53be7fe195

Thanks

