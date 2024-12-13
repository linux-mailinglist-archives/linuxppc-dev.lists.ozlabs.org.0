Return-Path: <linuxppc-dev+bounces-4076-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC639F0302
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 04:21:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8ZP75kLZz30gw;
	Fri, 13 Dec 2024 14:21:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734060075;
	cv=none; b=nJkVINhDIxMddmKiw1o+4vBR0q31ySFLXZ9yTfYh/meysYO2KV2bR6KcJPVsQ7WwE9NShFZnmShiStnKKABk7710G/4CqygQuaE+1IayKmxLCvbKmHa7eiOMAwRkalDYWYJsTIBWs0ZEdZ7dr+sb/1z7ymeuEba/s7ZW19Lv4VDkORMNi+acOkLfs6vVsd1S7g/fI8j1lFUBSwbdBe56NemOQNH6Pi7iDFhW1f1wGXL7cH8dJjJ3zE+6U1MuggmrTQop0YUdZtnNamNkDE3mpL1AQqN2k0tAtLWA7+xkj5KJVxAYtfgctiy8GabHqPa2vFuun6BEqtD72CxGrAY3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734060075; c=relaxed/relaxed;
	bh=wwqtwkWWnH5nao7UTyaduT5sV32y3v5muNnqixvJuAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nAbYjSdg7E6v9OKwRmdgoWemPoe+mPhqEZcLi8ZZEpBEFNGcLCMWS3wIzKS9sCMFV33hPxWfUL8n4cAy9txirhbfAK0YT0w3B/YR0ptKIJWwaQ7k58OIZqMM/vrHCbA5MFdQhLXHd7x69kyXpmIks+CoYXTiK8zdYUXlKag9GFl+QxjdVg8lANMD+GG7TLEzy7Mq/uMH7eXXXgrdEXXR8PEA9bqTTmFYGvDkErlCd3BtnKhehNMItlPX15vcsBjP1bE48DA/WYHvSYHY5/1j1je1fnOumpS1Md/JWN+ejh9tArSE5fGWyBrClmlbbWfaKJeakRbrTZZClHqWNlyolA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rt+/u5Eq; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rt+/u5Eq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8ZP65Y8jz30gv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 14:21:14 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD1vrCf029655;
	Fri, 13 Dec 2024 03:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wwqtwk
	WWnH5nao7UTyaduT5sV32y3v5muNnqixvJuAs=; b=rt+/u5EqqR1fjUlag9ibp5
	G0Y2964ev+xVUvPIGXe7Z30T9auMBCIZQck2vQXnkEiTwmM8THOtrrQPjUwd613S
	ZDVkHZKv8lSEn/Hm2iIf+VYwPvjaBHe+GE4AIdlmrr0ecK4Xf4BbHpQKncGH6Ou3
	O1xBQI6yiXyu7KD9agNmNQsNUk276BrqVJk1ZMFgTmQsToLlvLxqetXueqbU/5dn
	FjmkyIywOt+EByvgDqG9im8ru3HBuMMOce4TOunMmqRQxnKA37Ez8yIO7r32Lxqt
	OnkEdYX70nAv4mIav+0GnOoE/Oc1RA+h0grXUZO02GMOgr97sl9Dj70SbGGwe9+Q
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ccsjxnxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 03:20:45 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD08o6R017052;
	Fri, 13 Dec 2024 03:20:45 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43d12ym1ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 03:20:45 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BD3KhWK32768732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 03:20:43 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4168720043;
	Fri, 13 Dec 2024 03:20:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 06DDD20040;
	Fri, 13 Dec 2024 03:20:42 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Dec 2024 03:20:41 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: shuah@kernel.org, Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/powerpc: Fix typo in test-vphn.c
Date: Fri, 13 Dec 2024 08:50:41 +0530
Message-ID: <173405995390.325393.4623287844597085204.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241204080149.11759-1-zhujun2@cmss.chinamobile.com>
References: <20241204080149.11759-1-zhujun2@cmss.chinamobile.com>
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
X-Proofpoint-GUID: wCBx2gDigqEbpsuzOL9zlUb8Hn95KpDl
X-Proofpoint-ORIG-GUID: wCBx2gDigqEbpsuzOL9zlUb8Hn95KpDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=536
 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412130022
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 04 Dec 2024 00:01:49 -0800, Zhu Jun wrote:
> The word 'accross' is wrong, so fix it.
> 
> 

Applied to powerpc/next.

[1/1] selftests/powerpc: Fix typo in test-vphn.c
      https://git.kernel.org/powerpc/c/3a7a53c8d4813ef510a731f529b8c58208ab8896

Thanks

