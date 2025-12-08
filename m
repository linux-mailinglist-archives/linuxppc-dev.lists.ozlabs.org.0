Return-Path: <linuxppc-dev+bounces-14677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB935CAC0F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 06:13:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPqrr2qJmz2yFT;
	Mon, 08 Dec 2025 16:13:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765170828;
	cv=none; b=mMuEz69JbQM1D0pJYRI1g7IC7tgFKnsNOfTVJw33CpbcEEBvlAu5gIo8pAG+BX9esEHUqq6MeoqhvshuQ8algX65cckgPWdM/O42/XAMvV1LdbYuBtQpIc7FnvkmAU/Zss4PlG6gVyNp+aXvYF/p9MFc6zkuZxyxFtnrvpJfEvDGDOwAQypK064rDYLEuwXdYxVAoPTjidpLNQVEFO2RnUQv9lnq6z1AOr+Co/nMH+jG65sUYQSP4QkcVYDOMKkCUtIV/BO92Crmb9NmutjJnUYM5Wy6sWNxjtbmRBTkeVnwHPD9I5OeP6wbhn/wjTZdntAULUNr/pUBSlsPVLoKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765170828; c=relaxed/relaxed;
	bh=Km6QC7lOynGU18l0cShaDqFNg3I5ywVAls+gwUzV39A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y3B0JE4uSADoqA6kArM9sr6rhaFgJVrIhBybyri6L1wpg7nkuNLF5Vd5TNV+6wW8BgHTcNkL09fD7PwrsCjWmzS1wC5jqSgw9AGJbgVYZDvtGHzEs8Ds0BykiKiqyiN7iTFZGKVGxe446t6Q/I08tNxKBgsgIqousHJIiNhrp0dRdzb6hiu7Vf/jBpoupbuoN5qSjJFkx53AoTHX2kdOYIeDQVP79OgFFt+QIRt2usCommjgYDL35xJnh49yEWzyQttt/YTap/LfZuiEUZriVAWWT+6747T+1KV4G5kuZWzb0099rQkcBBS7W1cHqWL8vpsIdY17pFXx50BZm8Fcpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OBGSK7M/; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OBGSK7M/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPqrp6xctz2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 16:13:46 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B79lOs9005499;
	Mon, 8 Dec 2025 05:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=Km6QC7lOynGU18l0cShaDqFNg3I5
	ywVAls+gwUzV39A=; b=OBGSK7M/ECzGcv3hnaEurxRjSYg4shgvp6dtiwc9cwLw
	ac+yKuP39pdrb6S6oxbqYtX3j2sFsjZg4vCb8SOCdea1jVvb17LwAq4q6DI5AGYe
	h5fJdObtT+66oQ+DCSosWbbuKrq0v22PneaoYShyiNHMoebJavkznX3vXY/IW9zN
	rObu8h5UAALd7ZQX4rr/gPcKGywmxi4sRCwNoZHQR/0OkZ3mPHpeYEDmUf7tFqTG
	63uwHo4y2O/uYaaxB793fgxVA4UOMG2NIybmtTfqb6DK2xrSvqiB8WxMFpVvrWXC
	QWxHqU8htvFeJiLmDmCkNEUcWl0YAElJQXDEir80bg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4av9wve17a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 05:13:42 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B81ZuTv028156;
	Mon, 8 Dec 2025 05:13:41 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4avy6xm4rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 05:13:41 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B85DfMZ21037774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 05:13:41 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4013A58056;
	Mon,  8 Dec 2025 05:13:41 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CD775803F;
	Mon,  8 Dec 2025 05:13:40 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Dec 2025 05:13:39 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Mon, 08 Dec 2025 16:13:33 +1100
Subject: [PATCH] mailmap: Add entry for Andrew Donnellan
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
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-mailmap-v1-1-524d5b9d175b@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwML3dzEzJzcxAJdw9Qk4yRjE7PUZBMjJaDqgqLUtMwKsEnRsbW1ACR
 dJf1ZAAAA
X-Change-ID: 20251208-mailmap-1eb3b346ec42
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: 
X-Mailer: b4 0.14.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2qNT09sdKILuQ0svkFnhx-WOaLb1tM1u
X-Proofpoint-ORIG-GUID: 2qNT09sdKILuQ0svkFnhx-WOaLb1tM1u
X-Authority-Analysis: v=2.4 cv=AdS83nXG c=1 sm=1 tr=0 ts=69365e86 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=gvl4HP8tAAAA:8
 a=fdTXK2tJAAAA:8 a=Z4Rwk6OoAAAA:8 a=uMr1uQFKAAAA:8 a=wVVC0yr2AAAA:8
 a=7CQSdrXTAAAA:8 a=C42O5mjn6tw6bt3Lf9AA:9 a=QEXdDO2ut3YA:10
 a=tRkgsvjveJ3YVe9fnr1q:22 a=Y78AGDMKLiNPS1_snAKS:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=mA13xv-6rAYGTomVCS-P:22 a=rO56R6Vzl73uVzz0xv66:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAwMCBTYWx0ZWRfXxGFRV5vIUKgw
 VL6Af+DMAONhAfvtCMCdWa2561+jCmWIHFsIaaCBUElbD7ulHnktxt5lLjc8jtHJtW2RodGkJHl
 XEjGr9HV3uguXj9YGWPN69Hgyelkxy+bIx5bz2GYRGeGCx+H5lUMZ+yG8EAr38/61fm8BbkDTXw
 gGdRHSlJWSbr6j/mR5HrvScov4C8tepu0bL/A8HvHHVDhV7/XkO51hmiaVnSpdxksjgjlQGxz0H
 VgKy8LJUiYGkMU4nMW2BRmRccHVl9TD83z7W1d0TrRgnDa+eEDn3teaCV0zIskka/iuIigEX8Xf
 M2CHI6cLO9dZ1ola/QCTvL8ByrlS+rjRY4QViheyM2aiO2LazcCFusaxlBXAvy0GMTLhxNL9jST
 AN85v25PgSce488u7zVRHRLK+holNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I'm leaving IBM in January 2026. Add mailmap aliases to switch to using my
personal email for now.

(I will send a patch to update MAINTAINERS soon, hopefully after I can get
someone to replace me.)

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 .mailmap | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.mailmap b/.mailmap
index 84309a39d329c62024117d8e16b2e20983134395..9072457b9d2265f15fcb0cab0d4d2f174d0492ae 100644
--- a/.mailmap
+++ b/.mailmap
@@ -73,6 +73,9 @@ Andreas Herrmann <aherrman@de.ibm.com>
 Andreas Hindborg <a.hindborg@kernel.org> <a.hindborg@samsung.com>
 Andrej Shadura <andrew.shadura@collabora.co.uk>
 Andrej Shadura <andrew@shadura.me> <andrew@beldisplaytech.com>
+Andrew Donnellan <andrew+kernel@donnellan.id.au> <andrew@donnellan.id.au>
+Andrew Donnellan <andrew+kernel@donnellan.id.au> <ajd@linux.ibm.com>
+Andrew Donnellan <andrew+kernel@donnellan.id.au> <andrew.donnellan@au1.ibm.com>
 Andrew Morton <akpm@linux-foundation.org>
 Andrew Murray <amurray@thegoodpenguin.co.uk> <amurray@embedded-bits.co.uk>
 Andrew Murray <amurray@thegoodpenguin.co.uk> <andrew.murray@arm.com>

---
base-commit: c2f2b01b74be8b40a2173372bcd770723f87e7b2
change-id: 20251208-mailmap-1eb3b346ec42


--
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited


