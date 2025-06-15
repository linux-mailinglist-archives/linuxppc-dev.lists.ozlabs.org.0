Return-Path: <linuxppc-dev+bounces-9381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A918CADA0A4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jun 2025 04:39:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKcm70Lnbz30Lt;
	Sun, 15 Jun 2025 12:39:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749955175;
	cv=none; b=fv1BZwEYiB6cLesbo74hNe+JsMTgW4cS2csdr6olT0xmwhsjWb5NvnwIS+bAFfMsFTPpPbho7uBHEsVdhYObMWJcOfDHUZJAd6h44jLPzhNxRe1xIjRXf8S3DVXIQGJXwX53C9wS079N9nxLfNnQjwp3rGRhC9a2IGGl8lh6EJYQWlAyJs+Ui2I6uplm5CScyu8PHGimZfUOPlgP5XLOA9h7hqWcgO+VsNjN1H5QedQ7MbmZG6AO9BNWUVhZZAOyK3yA/N7V4ryIYcFsRMYCVzqKj1Sqfccljfl8CNuMZu98zxRoN/sC3J4YxZp0SLF6fL3J9Qes1/48egRPpV/j+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749955175; c=relaxed/relaxed;
	bh=ZtktQOPnFoKlak5ysRK1khk5sH3XbnHeHQOUs5Fj250=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cCUrcHhYz9JVo1VhIS2vsHyscALRiW/UVFDPBCpEyFQQdsfrI4fg3Rrc9eOQw5v0HMRhg/WLqVd1t1Hw3PWclI+NwKaWJAOe/BjnUXWy7RqYoKvV5LFVYRRilesXT/ypeGP/1HC2ObUnzUCgsCxj3eD/jaViD7ebH1nncFKAOhaFOP5Ovuh+UC/IqjnGJrPDe49Ey4DcjeF+NpVrYMPJzwwzIpad2vQ2Rff/zT64+8yIJWQvUz65DZJoipwrC1APIsmXhEVOuRNwSRqe03QhbTh6mZovC1S9wMZpAbfetQ1mwGOkCIxJTjsTU7EMjEkQWNieHXgnkM+0gtMI28NLJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ug3t7O4g; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ug3t7O4g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKcm62RJHz30DL
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jun 2025 12:39:34 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55F1vndd010916;
	Sun, 15 Jun 2025 02:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZtktQO
	PnFoKlak5ysRK1khk5sH3XbnHeHQOUs5Fj250=; b=Ug3t7O4gx5qB0JIIBmp1Ca
	CA72+74xhC9qcARuqdhsyi/zkgWouQOYmrwRNj1KLQuBRN4YWc7lrJmpUhT6nqnp
	So8CZ9e2ju59b46B/QumtJHSTw41UDwhLYIeR15rBDZcAnKZsNeJQlGi33cu7KTl
	g6bif8lNPdjjpN/9X3V9iC0ghYAL+NYLJq2tLKP8onn/oYpA9BLtZ8s05VtFdnuz
	PxHQEWifPESZPa6DnXPlvXGqMSqDTLIIhtoIpzgxYAeTa8TybQw4wTj/xwV54ZWo
	CRWPz/pEzSor4vjMmqwsmT2qRh7E+/FXvx2IFs5YcoT67MJfzW+HBkFo6BM8BLFQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790tdkkpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:18 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55F2dIvs005763;
	Sun, 15 Jun 2025 02:39:18 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790tdkkpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:17 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55F1MZEV003333;
	Sun, 15 Jun 2025 02:39:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4751ym8vdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55F2dFYZ48497096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 02:39:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52E7320043;
	Sun, 15 Jun 2025 02:39:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4F6B20040;
	Sun, 15 Jun 2025 02:39:10 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.64.23])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Jun 2025 02:39:10 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Tulio Magno <tuliom@ascii.art.br>
Subject: Re: [PATCH v2] powerpc: Fix struct termio related ioctl macros
Date: Sun, 15 Jun 2025 08:09:08 +0530
Message-ID: <174995502360.107804.7845597683053293.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517142237.156665-1-maddy@linux.ibm.com>
References: <20250517142237.156665-1-maddy@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: QhvFM_yIPD9i3vM0H3CU3ItgcnAlAYgz
X-Proofpoint-GUID: zoI1vLP8zkwBOvrh2VqAjV_YaPAaMQqg
X-Authority-Analysis: v=2.4 cv=c92rQQ9l c=1 sm=1 tr=0 ts=684e3256 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=OmUB6_jOa-9XBfra82UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDAxNiBTYWx0ZWRfX64zlV4E4gRYs 2CD4HfK+MkquMn/iXG7zTFGIi3x9RgHMpXIoCazXGoeA6av3DmSzEcUK+NuqZ47zVlhutzv6qnN XhW7nflgkUj8CuxoZSdY1piHJ/Ww1dcvT6Q/9wgtUIPVw5WGfKA1Q+kG7TNTGFdW5U/u2PUPLZj
 A2YtkXZ2dBacQWjTIw0uuLR3tnZeAjQJbaHEDRGR4ygeGSoyX5oEbgzRzdwSzcAGcPXSKHHpdYX m4fH5pC+I20MUp3m5n+4H6xjjAHhuI3amPNfm5xyDDXgh5VJ0A+PVuiWIgKNSCHzG7tiBcRyx+Q AzxDkmk2613pAGVRqHkJzzjxt0mnAPZEriRAHrfgm64nQvlq6Ndyi4TkRynhKQsJhlYA9C6MZbA
 W/fEHcb+mCcHiiyX9OFP9B/3W7BuyJd3BxmDUOFLo5+C0w4HaIrs6EgSP/RX1FCkcZw/ZIXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=716 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506150016
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 17 May 2025 19:52:37 +0530, Madhavan Srinivasan wrote:
> Since termio interface is now obsolete, include/uapi/asm/ioctls.h
> has some constant macros referring to "struct termio", this caused
> build failure at userspace.
> 
> In file included from /usr/include/asm/ioctl.h:12,
>                  from /usr/include/asm/ioctls.h:5,
>                  from tst-ioctls.c:3:
> tst-ioctls.c: In function 'get_TCGETA':
> tst-ioctls.c:12:10: error: invalid application of 'sizeof' to incomplete type 'struct termio'
>    12 |   return TCGETA;
>       |          ^~~~~~
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Fix struct termio related ioctl macros
      https://git.kernel.org/powerpc/c/ab107276607af90b13a5994997e19b7b9731e251

Thanks

