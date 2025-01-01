Return-Path: <linuxppc-dev+bounces-4551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AB09FF387
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 10:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNPCH6hHYz2yXs;
	Wed,  1 Jan 2025 20:08:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735722523;
	cv=none; b=GXM0Ejhhu8Khi4IBA3XEJUj/FGrI7UwsurGdB1vLzvViE7HUsGGlAKp0Rqz4PbEm+AOkAa3OcODeczKVTNRJz23lGXC5lPR0Ngzq26eFZ5B4Sh4lq5+RsulrlGVoXYT5zfugR/RpXop7GKWIbd03/7fXv6oQAuXpXb1TqMgu6uLx+loM7yB9D1njeTXVNTPu4MYI33cW/iSB4f7oJF1ytcAmXJXnSkL9kzxdbmIi9o90f0LWFd35Htx3LmMXqnNCgEeKRAw1ZFHsxNeOrE+o7ZZ9FTuYmtLOEw2op87DnHy4K+SivXDzaQQJiPniv/XrYq0KTMZbhfGE62/sggLiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735722523; c=relaxed/relaxed;
	bh=Jf3b3+hMkA7D8gkJoXdeqZ12F2ikW8JjvjNFIy5bWO0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WuvHdKXAmNAJ7FpKIvm+vGIA2hbJKED626Wx2MY6BsAohQ7tIdAy0bHrnsDXQtXMAGkE1fSdNAePyNwkayYFySAaUVkIguf4MlGNArlAVrYnHItHTAcYz+5BRJrhliQkHPHndU0O0XdDfddkHTF1wIaqc8HYutjV49iIqzvgTycYsth5ZkO0L5X2DNAo1vDWeQZL7gWNJ1N5ijHcPI0f7ThTHhMLEOmmHP1Uy0nP2WZgs8pTO12OTAOPK/EBtSyYdKU5xdU4aL30j4/+gj0eLdLSb8xBzcWcS1Uvmzy+RfzKPj6buxB5vTLlPo5VgOCtgJFbptbrcI2CQwD3gC1DmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hwLr4fcA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hwLr4fcA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNPCG1YQRz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jan 2025 20:08:41 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50185YYW030578;
	Wed, 1 Jan 2025 09:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Jf3b3+
	hMkA7D8gkJoXdeqZ12F2ikW8JjvjNFIy5bWO0=; b=hwLr4fcAwGDvMbYFJVv5Eg
	kPFLZd5qEWNLRzoJAec21Zk1XxGimW1qXctAgboyG29T2/rz08h4Mmzak8rsQTrM
	nXTs5n0C0RklvRBNsa4aJwSsm2aLAveo+OLOv1WqMxoIIx+02s5waI24k59Q3aSj
	SQc4bs6bl5H/84H0kAudw5qecbRxN8mO+UfMOqfkkR38OxnOSdL+xY9h2ZfylWXL
	BAy2zvRl3Swr6KyawPtBuyFeT3O8ZfwO2lfKzBQJmRF8v46Qo17q8iiD+MoAUY+L
	rnlNvLEnMfug9a0/Ig4UKC3If3Uqx1jJUxp7cHpAXOY2W2l5jCIbuaWVKk49AhIg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43w1w2g4gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:39 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50198c8A013169;
	Wed, 1 Jan 2025 09:08:38 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43w1w2g4g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:38 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5016ZLVw010180;
	Wed, 1 Jan 2025 09:08:38 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tvnndnfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:38 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50198aM331851216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jan 2025 09:08:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52D8B20043;
	Wed,  1 Jan 2025 09:08:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AACEC20040;
	Wed,  1 Jan 2025 09:08:33 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.115.214])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jan 2025 09:08:33 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux@weissschuh.net, rbm@suse.com,
        Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Subject: Re: [PATCH v2] macintosh: declare ctl_table as const
Date: Wed,  1 Jan 2025 14:38:31 +0530
Message-ID: <173572211262.1875638.13600288150839690769.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217-constify_ctl_table-v1-1-402ebceaeb8e@gmail.com>
References: <20241217-constify_ctl_table-v1-1-402ebceaeb8e@gmail.com>
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
X-Proofpoint-GUID: yrL62vs-3OgRLXfykiiZoQ9-234UaIeM
X-Proofpoint-ORIG-GUID: je2n305QluO6i3hU2KLSaLw42B6bjsqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 bulkscore=0 mlxlogscore=966 malwarescore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501010077
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 17 Dec 2024 21:55:41 -0500, Luis Felipe Hernandez wrote:
> Since commit 7abc9b53bd51 ("sysctl: allow registration of const struct
> ctl_table"), the sysctl registration API allows struct ctl_table variables
> to be placed into read-only memory.
> 
> mac_hid_files is registered as a sysctl table and should be treated as
> read-only. By declaring the mac_hid_files structure as const, we ensure
> that it cannot be accidentally modified. This change improves safety.
> 
> [...]

Applied to powerpc/next.

[1/1] macintosh: declare ctl_table as const
      https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=e834166822a3c9fb403411c898367df8dabf973c 

Thanks

