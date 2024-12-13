Return-Path: <linuxppc-dev+bounces-4075-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 270929F0300
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 04:21:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8ZNz4x38z30gM;
	Fri, 13 Dec 2024 14:21:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734060067;
	cv=none; b=CCrC/UztPfCx8ibN6oyNs+qggBCsCIhrJ5UNJgQLRJ/ygyLha8nD2Hy+TwbI2j8k4iCh9jAyyBl0E3B8Bf2Hr58DTe8RlhZVaIqiBun79rGB7edTmgdXP6pgeAYo/NrNT4p6BdfZjLIEaZtmPScBP006mtbLwag+UuvRSP59geV0g0EABZgmHY2Wm2zYnbliEfRfpYrG1w2IKjU+RKrste8bb9E5W7HItnVuL1jYIBAdqma/7JW65QzWY5inuCkcg/BJ8PuEisTR+8aKUAC/9zfgDcb/Ctrcia9kSziuLAiICJhjST1VUxM+Y34B5iHR5X11GuJ8v+xKYCFPOquqIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734060067; c=relaxed/relaxed;
	bh=5cz9i3M8TRQA29VottoaesT1DE96npFPnHVhhNxs/SM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jdOE/Wfi64Jnbh5GZszKihc8KDUADa2764Ja+sKdWFsoy+g/thRES5f3mi+EziFb0xzqEC7oXJvjx9E6a3FHhzpBLVYhVtC2iBIqQnCDdhj0OTyYPw4u5SbII5KGVsk2XR1LBTk1YsWjpxPe0pKtG+Q7XqBebWaLPk71aura2BhpR4Yj1LSsFlt6bKGW3ytkzC5xJFOdt2beFDfrpDahesrjhJahec1prL47yurOhubTyD0E2j+q8Qf6WnjTajgJ6SJEntbnsIQFYPmK0o4ttxQb2b6z6bsxoKcaGr3y/g0vaGnmPpChXYxCgZsS4mzMqecySC/MCam5X86pQx8Gtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xp5zhAi7; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Xp5zhAi7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8ZNy4bKNz2yjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 14:21:06 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCNb4b6009143;
	Fri, 13 Dec 2024 03:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5cz9i3
	M8TRQA29VottoaesT1DE96npFPnHVhhNxs/SM=; b=Xp5zhAi7zww9S0PkTNQRoD
	/aeKS++wEt8DzBbUioouJWg9xzgDPJbsofPMuwel+iS4r9jT2F6n68Il35ztu6A7
	NmbkiBYgEBMQGWjRigaOGQUvca3+jFQaE7IYcXaYvzOJycKKECcpwNNCJHSyyd5m
	IE1o3J+l+rgG5W8F7ZqgKFxyxSlCqtM2kZc9ZGWxlEy56RqTNytU4N1ERTWxX4w8
	oC8tQxX4hAHLEkSjcLKuqRiDZylZaDWYLNtAhE5xtk1h4U2BZTBl/O8GRiZ1YUzK
	wFWp82t0cIfXZ3Zawoq/RoRDqTi0o0w+iQ5TrVweQeHM1Nh0LLMc0lkhWXGsu5kQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43g9nb8nva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 03:20:45 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BD3Kjg9012996;
	Fri, 13 Dec 2024 03:20:45 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43g9nb8nv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 03:20:45 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD346OU029225;
	Fri, 13 Dec 2024 03:20:44 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43gcprr1nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 03:20:44 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BD3KfJa49086802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 03:20:41 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF5F020043;
	Fri, 13 Dec 2024 03:20:40 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6858E20040;
	Fri, 13 Dec 2024 03:20:38 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Dec 2024 03:20:38 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>,
        Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/xmon: Use str_yes_no() helper in dump_one_paca()
Date: Fri, 13 Dec 2024 08:50:37 +0530
Message-ID: <173405995389.325393.15062806694742180973.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241129173337.57890-2-thorsten.blum@linux.dev>
References: <20241129173337.57890-2-thorsten.blum@linux.dev>
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
X-Proofpoint-GUID: gVRc9BX8JTfGmUYJNFZwpFZY1lT32Ca4
X-Proofpoint-ORIG-GUID: rxlV9fPZ-xbkuENa81XLFAZDEsVAwKOd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1011
 mlxlogscore=555 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412130022
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 29 Nov 2024 18:33:35 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_yes_no() helper function.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/xmon: Use str_yes_no() helper in dump_one_paca()
      https://git.kernel.org/powerpc/c/6dca1d3af16a82552294596b66fee9e13eed0795

Thanks

