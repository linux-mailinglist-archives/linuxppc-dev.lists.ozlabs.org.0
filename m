Return-Path: <linuxppc-dev+bounces-4487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BCA9FD0AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Dec 2024 07:55:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKGTm6PBdz2yXs;
	Fri, 27 Dec 2024 17:55:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735282524;
	cv=none; b=DbRfEbUmDHrhB5wPudgSJkwNe+Vz9DqiaZt0FeZ/lEDB3AD0i5QBwlOwGWzlx/52T73Sv39NZeITioMqsIcaxouEHeWD3uK+eqZ8CWhKoz/zsD5JfaQISCNOdufs54YqvqmVkxf42R+tflEzT23pMiyYHXClsPn9ajS2wrO/od9a6sxGkJ/RdloF1A154gH1+BYusRY0utNTXkgIeiby7D2hqxh1wz6TxzcW+vKB2LENGp+7Si9YYQdzEc43sCw/fNuj8vmd3hojM2gSxMGMK/ZpJ3pVMh/r9vQkWOjsRJR14BDPrpYT8kXn+Qiw4G+GVjgn9f7qG7VNqQ6hHMAOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735282524; c=relaxed/relaxed;
	bh=de4JdsUr1ahRFmhXUntd+0lWvsmWadTPdGXTvDbmsbU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=jdv81RhgkIvN6SnIvovdpdmqY5os69amvqlGKAqRWsMhQfyX76oCn1dmQtO/49QLs2kp400pN+Gc1ieG4BRvJa9LMNHrZ/6Pty1vpggH0zmwTeOvzjdOY6sL1/IjtlFTKP44WkwTYW7rOulPBrV+63fTO6AjLG7v1vI8pWAeW1Uca801n8pwluAYkjkIvXpLq7crAEZ8eCFkofrRX6W6kE4M//7Uq5cbO40Cg6RKDAifICp5WnFrv/XBiiEm/qB78WWy1xSxA2MPVgbfZySV+1bimLvB2LIgKwVS/KRXPCl4cKy7C3Cad89Q67ak1yUdMOHZrdSgnt/Wh6AzmCxFgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MPmE3sCy; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MPmE3sCy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKGTl4xzQz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Dec 2024 17:55:23 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR3reSM014267;
	Fri, 27 Dec 2024 06:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=de4JdsUr1ahRFmhXUntd+0lWvsmW
	adTPdGXTvDbmsbU=; b=MPmE3sCyQQFG/3aLqESiNR66gB+gPXFiCcdF9ip+0Coi
	hHLzho7C9CKfZY0iZ9RkLueV7Jz8NmIbdrpBJAsIouTG7Qa4WcopFxDr048JkGiy
	th/a3rvS3w1fuT37qd691lQQLjBKVZwkNqM9erUWeDpYN1QeLKq6rdUmXBG/r8/K
	WUQV8S7/z1UFuIds/TojWXn/i31X639mEZclXLK4Y9vKS2zGqWNWlsptPcgBhKuE
	wUYhSq2W9U2acqRXxfUP0MnExqOGtbTPQtfFUtHRnlBsvA5wM6fatLNhShV7a9Zo
	KT5Mv1i6KivdhYKFnbY7VRWCwfcNR/M5/k2T4KXNjA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43smqgrgg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 06:55:08 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BR6sDOA005973;
	Fri, 27 Dec 2024 06:55:08 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43smqgrgg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 06:55:07 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR6Xq5C020177;
	Fri, 27 Dec 2024 06:55:06 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43p8cyn1wq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Dec 2024 06:55:06 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BR6t6a936897438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Dec 2024 06:55:06 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47CDA58052;
	Fri, 27 Dec 2024 06:55:06 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D6925805E;
	Fri, 27 Dec 2024 06:55:01 +0000 (GMT)
Received: from [9.43.15.214] (unknown [9.43.15.214])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Dec 2024 06:55:00 +0000 (GMT)
Message-ID: <abe4d3bb-549a-4e29-9084-e579b81694ff@linux.ibm.com>
Date: Fri, 27 Dec 2024 12:24:58 +0530
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
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: haren@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.13-3 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7TFunwVtmvRXHQfb2gkGwa6A9aCn3jX7
X-Proofpoint-ORIG-GUID: ndC_gkuQCcfKZnBdYka7DSDluA3oUIXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=722 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412270054
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull a powerpc fix for 6.13:

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.13-3

for you to fetch changes up to 05aa156e156ef3168e7ab8a68721945196495c17:

  powerpc/pseries/vas: Add close() callback in vas_vm_ops struct (2024-12-18 14:03:41 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.13 #3

 - Add close() callback in vas_vm_ops struct for proper cleanup

Thanks to: Haren Myneni

- ------------------------------------------------------------------
Haren Myneni (1):
      powerpc/pseries/vas: Add close() callback in vas_vm_ops struct


 arch/powerpc/platforms/book3s/vas-api.c | 36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmduTegACgkQpnEsdPSH
ZJSHxRAAg7koM+HlWA3F+dmFy8H0xU4tKGi1hAFllQLHR03QG6C/YWqlgemIATag
Sv2lX2UvEiS4Ahh0LZ0MjsiSuyV96sb9p26uqdjqlP7PRNEuslnWMlEr9kZ+Eva2
FfHwWsmbxDJ8jgsA1upb+HFGt9V7YU0TzK19wR5mCGxgUnYsCGKWnPyxejfEXQpI
uCc+mKAovRr9H2emeA9b/LaTiY03zKkgZFVgBeBjdPqPQOU7ajkOFZmh1Tccn2M4
+D3uJ3tKvTpNhRhT90TcYxYVH3Fc9I2OPMSoJMqMwd8wdZ9SG7Wb4eDwSyQupe2Q
F+ku+BNlN2xoYmd6/qQeFdrSWbIDpYK52PmfldN+cByw3pwQOyEkpfaN0OfE8krJ
Og50qxvGeoGyMRhJ5HNgPi4/CC28/yMOejc4cQdypeF/aw12K3Sl+4dp7qjC1jJh
gv/SsQBUi3T77t2vwKf8C/JAWcdIEqbOwbbRlphY/wC3/CqsLEBEmVuKnIbig6re
jnBs6f7Uyn5KPb+pYWYNjlhJcmBUielpnZo+t/VcYSrpFoUMg0oHcmkkFeQy4Hyu
uZXo1q3HIe0eOVJogVlpe3o6gRcfpr6z+giC+maU2Uk3Lc530qako5/oAkO5zCmg
ksemzjiNQ5b/1iYb43SvY0y+IIuAjJn8n398oK0Wycsp/I47G08=
=rLAH
-----END PGP SIGNATURE-----

