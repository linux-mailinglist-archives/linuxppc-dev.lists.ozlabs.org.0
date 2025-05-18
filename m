Return-Path: <linuxppc-dev+bounces-8643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D1BABADAB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 05:45:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0RYS4tS8z2ytV;
	Sun, 18 May 2025 13:45:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747539948;
	cv=none; b=mkNfyWt5MWUaKr+44OZKVuirQ5jsRshGxJ9QAUJlDPka8pbiatemceuFBYk31Cv96cYGe32dWnhQduNO/qjbjeRobAY411wWaob89hCrfUmHeVhb9c0V/vFLFtHa+zgEHB13nNtH4vnsle63sInZLlgyQo9c7J8AHGqqpI4NCE3GpCPzlrbf6IKXGh4D/GIUjzGYQe3ADAFz16/381G5At6IHtYtwDu2kj9zemhikHrcHOfEEvVPcxEJFPO5PMOSRO4pc1rSyVV65n6Lw0YHhKEs9ufj9XxHptiUu/ZyYXkURNUba3TGU0poAXnA8Z8UVp0BePoC3RILpcClUAXcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747539948; c=relaxed/relaxed;
	bh=pHOFSEVOMTefVuiZWo23oTxLvoEYVyE9c1h/ECt/UIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B9dQh3/J1QjQdQhGfS10b7KfirX/EZELlbmJEd5mdTLR5g5evj7iuejaI8+foS8hYNwMTuW026UpyVbIbKOImPC//+soWEV7Q2JVOJmWL6vsqcxf2axuNFrlLBkdX0ai3ODCMiBiwEiEwE6E4p3YxgISwRMYkR04kSPkq/kPr0Bn+Rqa40FHSE5032dO3yVdu1Q+ZiX6CxoF87W0ORv6vMCXhTnN0NFjDp3HgkEJUNS87hOlFR/omccepRCZ3P+CuorGpuJW1TS7vMF0KOsj5TByKI/sqB1jLsNxy3HpvALE04sdZJ3GEe+L3mGCvRjCsk6tTc0S3AV1bnNOY/Rw+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tgKQtHYV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tgKQtHYV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0RYR6N2zz2ysb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 13:45:47 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HNGHcF030018;
	Sun, 18 May 2025 03:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pHOFSE
	VOMTefVuiZWo23oTxLvoEYVyE9c1h/ECt/UIw=; b=tgKQtHYVRzFRgDZMTeKbL8
	tgnVDIi04Z6+rzhdwvCpow1WL0qWBFmOkjB9O1n1XZs8zwqL6NUZllIt5ZRHlMZJ
	AdZofgwkLk1lECLE8VQBhN7+0n/aB/6mRRHXkrhOT7e9Esfz3a45XH6YupkAEwO6
	fh9Ug91jPOBXqVcb5HoT6PsZwjgjNH0PNZGJGY9HVjpauUR2c1hkDbat1uf4D4V8
	KlZ7uvXli1OFdg8FCqoFoNuXZlJ7FcwV4MCT7ka1LI1VFyDtWooP7rIKLEGBthj2
	Plg7iS5YhuGd18KijHE2DcjHTKG9Iv/2ChoVplsn/6f+cgO68VJHH93eORD5nDrA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q05696vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:45:18 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3jIQk029319;
	Sun, 18 May 2025 03:45:18 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q05696vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:45:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I0bM75028874;
	Sun, 18 May 2025 03:45:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q55yghwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:45:17 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3jGZM58327422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:45:16 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E9DD20133;
	Sun, 18 May 2025 03:45:16 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 378CD20134;
	Sun, 18 May 2025 03:45:12 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:45:11 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
Date: Sun, 18 May 2025 09:15:10 +0530
Message-ID: <174753967074.24504.676189265868937968.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20241110162139.5179-2-thorsten.blum@linux.dev>
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfXzFa/PwvIBGgt OsFexqdn6huGOZL0WTvnbpG3irC0tNSTq8Nt5Sbe2767zan4zRoXLtw7+sktvrHxF0Go8pmL39K 35idnPCuA2tGRT5W2BPNdVCH5fJvTlsVjRs6tESOXNo3e4GfD9Kb7QyjX//yrwLlx8fw3zyz+rw
 tS26qij6yQvWXf4khnQJ4c+3icZiwvA+KgP+ZY+5YTwiZW5vc8n75BxmVREIl6bVLKIGQ4Jv10R Kh57eGwWmv+NXLIyUnTG5fHOhgkqUs8nWx6A9TPS7dLyNUxoO5UzRwIhHZj2lAaF+Uh9wH/v2u3 ruSy/xnsyDibjStibsQm5lc9qvDbTz+aCSutvLEIaXrqgoqtA8Wjb/LjKuSPABkt/6xOdodeMIf
 yhj70vv7dZU8TIHNwqRevUxmSIIvD2k8J8UBI9qs+1R5/sCExSemHbfUpYXsKpoyxSun09mq
X-Authority-Analysis: v=2.4 cv=H5vbw/Yi c=1 sm=1 tr=0 ts=682957ce cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=1RRbINDQn9zaYogeI4kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: izCNLpHsxeDokV39_6TPDXYIb8uV8Dvb
X-Proofpoint-ORIG-GUID: 40rC4nPjoPK_GaxmW8rIN7fOpfmxpymR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=748 phishscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 10 Nov 2024 17:21:37 +0100, Thorsten Blum wrote:
> The name is Mimi Phuong-Thao Vo.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: Transliterate author name and remove FIXME
      https://git.kernel.org/powerpc/c/8bc3252436d371e7ac505f9f2685611090680a48

Thanks

