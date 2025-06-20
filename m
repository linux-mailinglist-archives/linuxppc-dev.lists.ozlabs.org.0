Return-Path: <linuxppc-dev+bounces-9581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 696CDAE16BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 10:52:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNrnW1qFqz2yYJ;
	Fri, 20 Jun 2025 18:51:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750409519;
	cv=none; b=XKHnzrr6WXQjZF1vUXJBdPy4RSaWIYpd0myk2jI8OxvY9werezjajc83LT0VY1X0qltznqQ/XwWAflqLbZRfs2bj/PFZdJeEd1YMTBlrsDthyEk8FaKux5rF6Bz0wn5Syl+ytW2yxHFbnS22btR4pmYqUaMohhHSJuqo4Ia1twMGRKg0OR7qg39Vk+ETg3W4zDCpuQX6dgfU/mhq5pUdQ9nAnwIvKopHtaAqjV/L+8ii8lnNxfEeIdM4wV7t97LdZJGio6QRSzhEJ04IJAS7Yeb187ITT0osOr0rxa4LsbRdrKcd+BGnf1SRXp5AoHknVGU5kUc8Hzsg686FNnka1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750409519; c=relaxed/relaxed;
	bh=7z86dh4qXhNZTYI7PvvY2BHZbsWCQbSOuedQNshZIAQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iDiE5GV/GsqsmLcLGYyWEM74RyWUKNXO71F3/28aIG3Rj/8hBR5raMK3WuwL1fSwUYIz+v0MBTfuCwiFYrReglDkzgJ16jwBct/HOM+VzhaAz+O1N2pAqaa8VjQpjjcxaDcPQxg+W30HT58xy4OoIhKpzPg6X93Bv83A3RO2yYRl1Ix0j0pmXfLLfYvIKbhbg41MOm33Z/XET2HZotAaA77+ToZshmDE45oVpqvBMhb178QPqY4RjwNv5kBh7JkTMPQwCqezOCdAvN4z7SEcFArweiZ29+0ZA80DmgmdrzLyk5h/kJn+ptgnCHBohXNYXU4BNbfX8jVUmPet2G/+fQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VaAop4LQ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VaAop4LQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNrnT69JDz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 18:51:56 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K7TDvI023584;
	Fri, 20 Jun 2025 08:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7z86dh
	4qXhNZTYI7PvvY2BHZbsWCQbSOuedQNshZIAQ=; b=VaAop4LQi1tDz+S2SE0oB2
	bVkcpZJjY8k37nmcio1QZGyqxCK0YjpZhBi7xbhNtmbsd5BX6kEr+Wu7p9amWETw
	/LUElFcYHnuKUER+9LE0yMj3vjx2eNjBtfIicOC1RZhlj+qYcBAXw8WEFh8A6gaa
	YFoENTjpjU3kogNlfe5ISxXzIxKPrnDyU+A8A61fzTFKaq3fgSUE9JQSctGBcYST
	DwqiFVhAruTKP7xeQp6uqZKVMoQAsN4GRfzEAODeQ2cHyIX8CM+n3TM6HiWtS737
	+YoZHqX1DpC71VmetsaFRIOL1AexsfYcUMPXSQETCXvPLwr6Q75uHcFJu5LEhncQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4794qps8nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 08:51:51 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55K8p8g8002153;
	Fri, 20 Jun 2025 08:51:51 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4794qps8n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 08:51:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4kMvx011236;
	Fri, 20 Jun 2025 08:51:50 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 479kdttgx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 08:51:50 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55K8pn3O27722412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 08:51:50 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD09058045;
	Fri, 20 Jun 2025 08:51:49 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32F3558050;
	Fri, 20 Jun 2025 08:51:47 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jun 2025 08:51:46 +0000 (GMT)
Message-ID: <f617320f0afc758e408b3f2bd525ac942729c83e.camel@linux.ibm.com>
Subject: Re: [PATCH] misc: ocxl: Replace scnprintf() with sysfs_emit() in
 sysfs show functions
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Ankit Chauhan <ankitchauhan2065@gmail.com>, fbarrat@linux.ibm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Jun 2025 18:51:45 +1000
In-Reply-To: <20250620024705.11321-1-ankitchauhan2065@gmail.com>
References: <20250620024705.11321-1-ankitchauhan2065@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: s0yeC42CHfrGHiF9sxlppQA7CrNi-twi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA2NCBTYWx0ZWRfX/DjREGvYfGkF sw8VRNx8HZDogKyJcnAtGoj3xtknJqhtdYIMayQU6oqbzHSpQoXio7Ap/GAq/3BUTSZA1ny1S9n NEjOSvPGZ4bC1QzhZhwHmMI5A7MXSPS14IAMihX5bT/ItWAVF1eWNdTit+BQOqUNcRQwCGysulK
 DAXMlYKl/CxQbbcx7XM/iB7GTfDefCJdp2aclceK6UUZkmuZmYCTmi7EJIhaT0BzM4+M46Qqaqu KE1AG+HOtbEtFQPpwbdDbGqva8XSNUMLQ4Tm76/ymw0NEPsgG0CzhIRPmsh0VAR4V65bCPQilce QyOtH2J8PxJ2wJHAiuoKZ3M08RbCFnwJshRNylJk5XYC2gQt2BxC6GF9MLkYJ7FbNsrt7N2x9U7
 sJaX0QddOH95mZ/gIVJ3oyIkpYnjDG5FLEmaDXlsZosvawO/4DKUKztV6OMsX8Bhy7KKK4Dd
X-Authority-Analysis: v=2.4 cv=NYfm13D4 c=1 sm=1 tr=0 ts=68552127 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=wAt-YwC9e8J5cFVFfmUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: HiMfCx_T6oSwTWmiVMC8VdL7YE42I-bk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=639 mlxscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200064
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2025-06-20 at 08:17 +0530, Ankit Chauhan wrote:
> Replace scnprintf() with sysfs_emit() in sysfs show functions.
> These helpers are preferred in sysfs callbacks because they
> automatically
> handle buffer size and improve safety and readability.
>=20
> Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>

Thanks for the cleanup!

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

