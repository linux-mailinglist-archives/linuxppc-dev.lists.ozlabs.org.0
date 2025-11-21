Return-Path: <linuxppc-dev+bounces-14402-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27575C7747E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 05:44:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCN0P29PMz2ySq;
	Fri, 21 Nov 2025 15:44:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763700245;
	cv=none; b=FjX0nSe6X8VNGkpbPe8/SnMpuqFwLX1EaJ9wVC8CW4kmjOcb7ldeU8cOBsDyIUA/aLYiipnoV1VgY9cn8Qx8jyujhmz3BYaxEeBhacw785JQlnfQocUFt4Bkd27jjLkzvpp7HKPLRN0/EWSwjWktrJqk4sMfu5teBu9iSqCzZx8o/E2SqnMSCERQvrcBj3bWxiXhBZ56tgDH8iJuq310gi0JfvwtYhcHiQkdosVd3PcR9dOV49sDKC/iZ41jxuWmpECy+eX8o6Dr2JfohCftmZ9+nOhUgc0VFbtfnkSNmPopRE5Ur2BCvQTu1JlB9bz+eX+djXCMNVpmBkpBiS8peQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763700245; c=relaxed/relaxed;
	bh=mSgUzLnLD915xYFIP3h6yHFURl+MqrAOMj73lQ0/8DE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OTBvLoULdAPxUBZvEsAUE09WwJwTss9aV2ZdRzQAEU9wSoOi3VAXO9wCAHShI0/+XxS40UjZju/vuM0JoJcQBEY6aUFnPi73l2XWVuycPrMePVDsSIRyDxYwvHJe6FwuXR6O5dQRXjk3C/vyO1l7hns+yXZlVcBcwxies7Ka4oiPVumqoTOG0avmyXfefp0PAHw9Sg2YQP6icj+fnzjArQni3lHzjw1eDntNgH0utpLlWVr5IUSdotmd4K1BpeKKxk/lgcsaNsmSt2hnLEwLzpHLccSXYpXOxrixd/W68jD6U1EM6qdt/umAke7r3rxxLgey0j1P+lj3Behe3CoXQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hGLbUBVp; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hGLbUBVp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCN0N4C41z2yG5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 15:44:04 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL029W0022167;
	Fri, 21 Nov 2025 04:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=mSgUzL
	nLD915xYFIP3h6yHFURl+MqrAOMj73lQ0/8DE=; b=hGLbUBVpkURq2rFmiEKAQb
	5sgLfTnnbdeJUyAytZ9dzS7GchBzF/DIk+3EWWOVtq7G77dPUUy3K3Mh1r8yzBx+
	26aak+//0+qnoqX9JgkSrIAqPj6GudNM6brzKd6Vl6L7kmIeu1zUKAua0huhT8O5
	Ew1a5KOtM4uD7EFlsTKtP23OfNShmVaJm5y13CJksgmc0M5Zi/hgqpdWoyP5V1zY
	JiEf9AnYoSk3DhArtvL8pMIH+jFs4nXr0jvRgtU/+XpOR8BCrBFXuyrRm6PqtRfr
	Fg/ijctHjItFqNxFLa5YeWCgp85xMI6HtCXOy07Exxz4STHbudMSr/zY/WkHIAig
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjwj10y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 04:43:54 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL4hV9m030439;
	Fri, 21 Nov 2025 04:43:53 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjwj10v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 04:43:53 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL3uYtC030791;
	Fri, 21 Nov 2025 04:43:52 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47yaex1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 04:43:52 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL4hoi837224826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 04:43:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 076E820227;
	Fri, 21 Nov 2025 02:55:41 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77E0D20225;
	Fri, 21 Nov 2025 02:55:39 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:55:39 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] arch:powerpc:tools This file was missing shebang line, so added it
Date: Fri, 21 Nov 2025 08:25:14 +0530
Message-ID: <176369324786.72695.1499057531584706988.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20250722220043.14862-1-unixbhaskar@gmail.com>
References: <20250722220043.14862-1-unixbhaskar@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691fee0a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=lRvuG5QBYdQmf6PcME0A:9 a=hgk7dpVKL6SFfQEr:21
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXz2GvIfoAB3Kf
 yr+g1GTAxNTwmLkooZ+c5ALsJaxT9lpYdr4wIfmn4RGkC4qwZpc7n3eWTKPgX3qR6KpNr1KSqtu
 XCVBRUBQI292OKYVUN2iNkeoF/zuz4RUrjToCrJsZJC5AIImqua6/Qqd057xPRmDtlpK6VlKfuH
 HRs0x8MyxUl+boAEBYRvyN5F8mrMYpS8XUn4j34FYf4SAsBTcmCUMjyK2gPxGO+kqrClU9ErPUZ
 Y5CXyjQXxM4ai8KWACneaIbqxuXJ185NiqZK2mB9O0FKgjYo9k3II33vBsBppe27gaSUJ/ET2TA
 USAKwauIam5dowP21CK4DB3nyKdLYSpUgbIXHIc2Os1bG2Y101RnTgRNy+g/EBBxnfl+U/VLjIg
 KOs3oHSeQZQqD29rLRmO4KTwi8KCKA==
X-Proofpoint-GUID: sKRGHORz9a5gpMaUcW_tMNBQE64cJUlW
X-Proofpoint-ORIG-GUID: wYbrPTbKMyzx52cALqBsZYnhT3NEodKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 23 Jul 2025 03:29:36 +0530, Bhaskar Chowdhury wrote:
> This file was missing the shebang line, so added it.
> 
> 

Applied to powerpc/next.

[1/1] arch:powerpc:tools This file was missing shebang line, so added it
      https://git.kernel.org/powerpc/c/f90d28443b1f4dbbbdcfea1be5295f6903acc94c

Thanks

