Return-Path: <linuxppc-dev+bounces-7859-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F17A94F62
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 12:29:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh1nP5hrgz3c57;
	Mon, 21 Apr 2025 20:29:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745231353;
	cv=none; b=DjXHpeteZENHguZxzbe10RmxrGtBSO+ymOm7fdKo7T5iVwqvEPmItaom9ylLgZh49+QyVKNMzI2XDw+1swG0zi7NhfAy7JUrSbrOiIBy29MRx3fix0gFuGfJ+JgsO5jHPhylXHyjeN1aMRQIjtwPfjc4geGrna4uckcjFOiX+t2NEqmxXl8BLl1keEfiAEyNiNI9HNIVvy3pEL8hQblHBUqZvS2dCylFieP6iO9MXnWjdr2X/9xBgxIXbdK6JBeOldDrAIQz56TkyR7NUUtgdXW0tihsNSh4zwvYdf+4KvR5fWtIoQuuS3QP6/GRNmtuiAsf/ZVeasAJjAb5L4MN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745231353; c=relaxed/relaxed;
	bh=L0xUgiFjBF9ckzvpFPtv32i8AsR73TYYMr2z5xC99YE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ccv535svQjvTs8JEREb8LEWigdAue/DbWb0ErXMUaO5xxUD2IQk/ymvz3gZ/tK+pTfoGrnLqvA3jPBqVOq57VwW+NUhygxgC18cqq5HWSN3OaVDepwVwosnSe9kZ3KT+BXmqrwSYGMwuE5vsyefmIpVT1j7eDRaVzT0tT+V8DT0no6LkEgM8cyuISwLoxzCH07FGKrjKih50sHZ1Nc0IPYyPaJgn002D1spplCRRc5gArn7tAnWu4u247nfb8rULxxp0YjZ5p3ofqg4zqK7OYbSuXDwIn4DKiH3g9FakyjHIhUBI+MV1EtB/OeJbYbc1j2Z0PGHC9MbaZIwwIY1TDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c+67RXue; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c+67RXue;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh1nN2bZ3z3c4V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 20:29:11 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LA4Opr008043;
	Mon, 21 Apr 2025 10:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=L0xUgiFjBF9ckzvpFPtv32i8AsR73TYYMr2z5xC99
	YE=; b=c+67RXueBPDsUErB4DNy+mnHfbFsvwehEKesq+y/PPEeNWrfgVsryy8Yc
	jHjnhtL3X86G2B76PByUYOCcaabIgVtpuoopUkWhv1VlsS20uylTR4GYpoERFie1
	BAw5asegE0qopKe8Z6817qnfnRJhrsb3rbAfVrLmKDdlLA5JgyCGXr+j1fT8hHOZ
	BLnctUvxp5eGgFGb+hkDcj4NimUCWe0YRs+VpJSvNcyoEKbH6yuXQ18J1DZOlwPz
	LXml46oFc//cU/zur/Wkqyd0O6GaWauBUVq33UWMeYbpRttAkuNSq6c2wBU2gSqW
	nxDVx9Laat/B68ooVmtcD7KbfpXjA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465kxj82cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:28:54 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53LASstf023811;
	Mon, 21 Apr 2025 10:28:54 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465kxj82cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:28:54 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L8UFkf001858;
	Mon, 21 Apr 2025 10:28:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 464rcjwp69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:28:53 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53LASnC837290416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 10:28:49 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE53D20076;
	Mon, 21 Apr 2025 10:28:49 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0227620073;
	Mon, 21 Apr 2025 10:28:48 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 10:28:47 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, sshegde@linux.ibm.com,
        gautam@linux.ibm.com, vaibhav@linux.ibm.com, bigeasy@linutronix.de,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] powerpc: kvm: generic framework and run posix timers in task context
Date: Mon, 21 Apr 2025 15:58:35 +0530
Message-ID: <20250421102837.78515-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e062lehdojYXH920C7zR7zRas0Puc7uv
X-Proofpoint-ORIG-GUID: qJ84MpjFxkvipmNnJenQY64OzvN8LPYy
X-Authority-Analysis: v=2.4 cv=HLDDFptv c=1 sm=1 tr=0 ts=68061de6 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=4hYohHL7dauzwWFtQuwA:9 a=ZXulRonScM0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=887 mlxscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210077
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Gautam Menghani <gautam@linux.ibm.com>

This is an effort to use the generic kvm infra which handles check for 
need_resched, handling signals etc. i.e xfer_to_guest_mode_handle_work. 

kvm guests boots and runs stress-ng CPU stressor on PowerVM and on PowerNV. 
preempt=full and preempt=lazy was tested on PowerNV and in both cases the
KVM guest boots and runs stress-ng CPU stressor.

Please let me know if any specific testing to be done.  

Kept the patches separate since they differ functionally, but kept them
is a series since 2nd patch depends on functionality of 1st. Also this
could help in git bisect.  

This is based on tip/master

Shrikanth Hegde (2):
  powerpc: kvm: use generic transfer to guest mode work
  powerpc: enable to run posix cpu timers in task context

 arch/powerpc/Kconfig         |  2 ++
 arch/powerpc/kvm/book3s_hv.c | 13 +++++++------
 arch/powerpc/kvm/powerpc.c   | 22 ++++++++--------------
 3 files changed, 17 insertions(+), 20 deletions(-)

-- 
2.48.1


