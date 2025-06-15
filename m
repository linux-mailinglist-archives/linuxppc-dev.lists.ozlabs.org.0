Return-Path: <linuxppc-dev+bounces-9382-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA81ADA0A6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jun 2025 04:39:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKcmC6VyQz30QJ;
	Sun, 15 Jun 2025 12:39:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749955179;
	cv=none; b=Ozs0ME++8s4nJXm5Y7bg4jnQbfiN/Vp17/GjdPPwZ4LsoJiq6nun9sJXh2O0MLtB2UxwzhvmrKI8iTrWA9oI4+iGkQewikJV6n9C71ZlFVVKqOxMqsvhVtVo7RHuxSBmOuiSWELYBPndKu641/kh/C5BgnoqO20PDDUnaeIZkDZs41BwKCLAcs2kT8ngs84kjAuavCYvHEvZBv9B19gLaoQtRIwiQbbWGVTGF21FfbpzVrMABKMl1e7k5V7Lkyi5XDvhfwRG2gPbPzUsqLRXzCYY3r+ObqR89/F201dddF4y44YWHo0YSIno3BtSE11t11IY5sT13pyGbFFVPYCfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749955179; c=relaxed/relaxed;
	bh=RFGH16GGdoY5MgLXBFHrjkm9SgutJ80FqnaTT37LV9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kideItwB4rcSGyeSIdj6hSv8ZHlr3NBZYIQQqjsVsRrYXxQaeJSWrtvUeo7Zww6s+BdGpaVKesogh++duMPOKd4EYz9RyHZ1+vsNMdzbcDm70nw/srRnUc34n1oRWSilU2C6X4+nj2QdPXo29dRswR3bPAUZK7vjOM+Rf/dpJy1ou2qdV919tO3xhBmGsyymY2EcM9wUfsVG1taSw8hEgiFFnFO4FBgU6ibsCqedLn6NJJP3Mofb1PLBWkWI5ALn7+8PjtyVDRK/85ZB/lOZjxYAzXp2qWNmbGGmBzkCbuXQurLwVBvSXBzWFZnQEeGR1cWQsv4y5A1Eer1gb2PQfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i32WEGSt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i32WEGSt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKcmB2bbVz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jun 2025 12:39:38 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55F0hWvk006879;
	Sun, 15 Jun 2025 02:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RFGH16
	GGdoY5MgLXBFHrjkm9SgutJ80FqnaTT37LV9s=; b=i32WEGSt67Z74JGdDgKfZH
	xibZpXo4Fb6hpxx4q8ilY3aUAcHb3JE4fmP5cDlL1J01sHeRj6GOtjK2cCg53S0w
	IbFf9NYsQbQhXWBqvb2NqYqugJHaHOjSlm5dRnOgKeDc881Jry004t90mefn3khy
	9aAuoOHGuZNhkMFDC6pUUwQxPaXf8S/CFOU+thB9wMIarso8ChrCuW9ZyqtKwa0y
	Ko5OFU3yahZNGhj2JyPhfWeBJX61vzSgnMToFhZddi0L6LxvZVhXvLRKKDTAfxPH
	PMdzaOTHPentbjMXkIpCHj6ul5BUuwHdFvroD9P7LklkDTJoakxOzAc539uuHM6g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790r1kgxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:11 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55F2bUci025682;
	Sun, 15 Jun 2025 02:39:10 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4790r1kgxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55F0BUqO010862;
	Sun, 15 Jun 2025 02:39:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 479kdt0emf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 02:39:09 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55F2d8YE46334386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 02:39:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4206020043;
	Sun, 15 Jun 2025 02:39:08 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6935F20040;
	Sun, 15 Jun 2025 02:39:02 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.64.23])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Jun 2025 02:39:01 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        =?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] powerpc/microwatt: Fix model property in device tree
Date: Sun, 15 Jun 2025 08:09:00 +0530
Message-ID: <174995502359.107804.5514512556440228037.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611-microwatt-v2-1-80847bbc5f9c@posteo.net>
References: <20250611-microwatt-v2-1-80847bbc5f9c@posteo.net>
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
X-Proofpoint-GUID: hH3GaEOIoB9oOaXCYEM74vgXlzAyih1D
X-Proofpoint-ORIG-GUID: FkPBedZPuMCHHeUhjVZyhtzBFJH7h2A4
X-Authority-Analysis: v=2.4 cv=AqTu3P9P c=1 sm=1 tr=0 ts=684e324f cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=LvaVYMoGVpd5GIVMe5MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDAxNiBTYWx0ZWRfX4W4JBZXwnjBR wkngYZiPjFIf94/j61WX3YAgdlW5TZWtjbGNweXPNt3+9vBnylnFq4+08Sg7ePgJCdPnj0RJe1M stNgboseLZUKMgl2iqx1PfainZT982P0CMgUzkA2kuWr4MQTvzu4oEQsg4zGMBAfZXPmkOBhchN
 jOV+ryItbOS7WeH/Sjs5s4Ww8k1dVgk76a9RRSUp7id/3TyMX2TB28cpyB+D2WPqQph89ewhFSQ vXrCdw1HMLKg2RWeogx1NNM049w9udC0+tKhQooucAu4v7B2BHD9S5Q64NI/UG2Ok1ki/hjc6aG aTC2SmKRh0z4W7jGEmMwW2My96lQiKxclxcBnC51pNHEcMVKQcjt0ZXCY9Z4zFKBJkj44gpH+TZ
 S3rDM2PlX/9Qp89Q3Q/0RStqoYws+RJeHIbi+C/RjUJr/duMkwP6kKpZsgp2x5BXuvxjBWHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=801 mlxscore=0 spamscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506150016
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 11 Jun 2025 23:07:49 +0200, J. Neuschäfer wrote:
> The standard property for the model name is called "model".
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/microwatt: Fix model property in device tree
      https://git.kernel.org/powerpc/c/4e6d080acfda5344ccbc63afe778830e22be4be9

Thanks

