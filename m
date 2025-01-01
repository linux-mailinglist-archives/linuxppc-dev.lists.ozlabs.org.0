Return-Path: <linuxppc-dev+bounces-4557-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE3B9FF391
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 10:09:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNPD40wJ0z300C;
	Wed,  1 Jan 2025 20:09:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735722564;
	cv=none; b=BVMEU+2vcUXizVSP7ZcXWsgjZEn5UtH6zyb2S4lVq3bOmKC7VJMGXOdpFDRD9BHGAIhqkauT72GTI9AoPG0kxpuopU0EHuP95bmNR8uFFojUZ+3hYvzRq2Igvi8ugWrhAz0T3ym2FvgA4AV4hZ+2+SGs1d2je5z3RiT2/EKS/FqT9abu1/KnFC5ilkqLANW+XCwfXVmGOO+g2acfXF6JWZZtU0ZEcfXu76bT9ODy/TwjMa7twgALTOb//uzNXTVW2+z3gb45nqIFVQMY6/NSiAA3bl7/dwHdtwVPTMW8rYehzA9tk1wCWnbg0Z1ZHqlSCKeM79ytRIwjYTPurSNqOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735722564; c=relaxed/relaxed;
	bh=eUlnO3lAWSu+SgjARJ9rFMSzPze9UIH/4H4XRHIm+v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A9cy8j+8yKiTzcHS6I1XlYdQO3pqRiwh2XG7QZHIwbMmoxNP5+/VbdSk/ZI8GLLztvlUGSbCw4X8xbu1aSPfwLTjQqGzFsUnw9MlbHqEiz7Ef/Oo/W8GwKtbnG0oqpcaexyRQR1q11N0UYk/jwB1F5Dkxtr4Gq8FuD0N7Msp1PQ2WMUbnl1cSLil4T7NvwtxJz0gdoJDcVRh4i9AyeGHMNabJKLKa50OjSzam38ctLNnzUWM6hXQgsAxIWkK1QaJfw7ren0pSAzuLOtwfc4ePMl9GkOBxOy24uWgLqp5tGPv5f+BvhGq08iHjwovWXrxXVbDkXMsuKV44eMu0JUIyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GcJkV2/L; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GcJkV2/L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNPD315DSz2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jan 2025 20:09:22 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5018bNEC012976;
	Wed, 1 Jan 2025 09:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=eUlnO3
	lAWSu+SgjARJ9rFMSzPze9UIH/4H4XRHIm+v4=; b=GcJkV2/LfrZWRQ+LkSjEpD
	ut2jqDzP/f0hZc9d2qK+0Hfhg3ynwf58IX/jOpmxbIWoZVVZwGFeiZRWNGLM9nCD
	9W48H17yFwSRuleZNMCc7+JbtT/o6a2lqiOrrxojpV5dsPOA7vBlm7uemruI5SE3
	AZ6ZxYrZ8+ktA2M9soWM31r1C9bBfwkNr9dbauV8e61HmzjQsP4puwTUV1Mu6LrH
	PHqSC/ZeArKKzHrSDunDDzfOlty4RJcSPzXxSCQbzJhX75439/7u/buZF9z2jAJv
	p6DPZB/xuKEZyW0k3elYDJYpzAJlC58IRgIcB8o4Hk4bd8OvqEAZBgxrGW75Ps8w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vx6b8rrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:09:02 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50195aFs032308;
	Wed, 1 Jan 2025 09:09:02 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vx6b8rrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:09:02 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50183Dav004365;
	Wed, 1 Jan 2025 09:09:01 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43twvjwequ-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:09:01 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50198x5j36962728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jan 2025 09:08:59 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CA642004B;
	Wed,  1 Jan 2025 09:08:59 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96B4520040;
	Wed,  1 Jan 2025 09:08:55 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.115.214])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jan 2025 09:08:55 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, bigeasy@linutronix.de,
        ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] powerpc: Enable lazy preemption
Date: Wed,  1 Jan 2025 14:38:53 +0530
Message-ID: <173572211264.1875638.9927288574435880962.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241116192306.88217-1-sshegde@linux.ibm.com>
References: <20241116192306.88217-1-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: UHtJdMHLDq4pgYcMobLJtrcfux28c70N
X-Proofpoint-GUID: NF1HYOG-FAPyw3_wOPBYRecC939baI3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=648 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501010077
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 17 Nov 2024 00:53:04 +0530, Shrikanth Hegde wrote:
> preempt=lazy has been merged into tip[1]. Lets Enable it for PowerPC.
> 
> This has been very lightly tested and as michael suggested could go
> through a test cycle. If needed, patches can be merged. I have kept it
> separate for easier bisect.
> 
> Lazy preemption support for kvm on powerpc is still to be done.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: Add preempt lazy support
      https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=00199ed6f2ca6601b2c5856fac64132303d9437a 
[2/2] powerpc: Large user copy aware of full:rt:lazy preemption
      https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=eda86a41a1c7700757c9217f74b9d57431c3e5f4 

Thanks

