Return-Path: <linuxppc-dev+bounces-8275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEFCAA83C2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 May 2025 05:22:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zqqhv1RMzz2xlQ;
	Sun,  4 May 2025 13:22:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746328943;
	cv=none; b=GVpHGu5u+pEHZ9X1BSgQhofLq8tJqxcMTOfhFgFhm10CgwXim9pPQppA/2Abb2aYwTPXblr6qgGLLKqDujbnfY1656JrSh7p2nhISS2OVwBovtDuY5NtaLbbYF1c7nqn6xXlWYIOFWHsK2m7F3NTb8g838Qrs9OX8lnDkKWSs8bDTBoYzh4z9Wzsep1u7NnQU7d5xch9W/flqJZd4kwD54+GWc9VMljHKo7EF83FPbEHJzvb4SWswDtA20QKe3w/lfRLs3J1jQDd+ZA0Gspo9K81AdED4Ar8XjtHJSWkSnzys50U1wvWDfX7zKF3gxvwCuDtagajdWtHu9y+MOyymw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746328943; c=relaxed/relaxed;
	bh=22mBn0N6rBJv9Kt3/UD3q1JXkhXpZ/MI+ykrV2o8QJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oiz3LituruJnRM5CndVehFXoyUbpmkZ6PHRqCK2YPrbOw2WVJdNfwJAWRTkuSGb2JnZbodHANpgBsaCxzjUyYMxdktWsCuj0ya/+Sacek1I8mK2I0SID3rQVHvCglaaxu0qKvtuD4B9ylUbZS8iid77V10zPtyCowxE6PYMI1dZ/Bz986Fjz4Pb3AqAH0y2SmyWb7TZB/m98OKpnsH/uKNxb2tDXHzAo2oE2cU6tacO+eXEFwLbTEZ4v7BxXgDU5lc7ke+is6/fuys6NkfXHiZLL1BoC31tLlSWktu4rQCmWe1skRU2SyZFrvJuwnO1g3s5Bmu76t3G2KKZ2Adgz9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T66E2a2Z; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T66E2a2Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zqqht3bqJz2yrR
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 May 2025 13:22:22 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5442hdB4002998;
	Sun, 4 May 2025 03:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=22mBn0
	N6rBJv9Kt3/UD3q1JXkhXpZ/MI+ykrV2o8QJU=; b=T66E2a2ZWlD+rcc69AXVFx
	6mgbeCJgOLZllPZ/YjYtd136F40V1hNVVig6pq0CVtuzJUpiCbWt5C8VV/iROg2k
	nsqOz94ZRVWrvy7XUlOHSkqNAf8DXzzFX/IvgBuhT9EOjibEUofA2STCzpQK9jP4
	DSPN+LcRehd9nQV7KKatNciuuVufFO9Xg/3ZsJMjf/Gtn1OJX1BQkghaQJu1xdxk
	uUWKEMRzcN4wPIP0mhb6micIc+JXaahSh8xeogcnO9plI/LgCZu4ayFDtktHSJsW
	mE+FZQdA1OgWUb3B4hZwyzxuTkitvqOskUVNajdP9GylauxqhdeTN1MpO+4ahxQg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dtqk0r9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:22:00 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5443K3RT004379;
	Sun, 4 May 2025 03:22:00 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46dtqk0r99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:59 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5443FOc7013816;
	Sun, 4 May 2025 03:21:59 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46e06200hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:58 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443Ltgf21430770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:21:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58C3320043;
	Sun,  4 May 2025 03:21:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 612FE20040;
	Sun,  4 May 2025 03:21:47 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:46 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        Hari Bathini <hbathini@linux.ibm.com>
Cc: "Naveen N. Rao" <naveen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3] powerpc/bpf: fix JIT code size calculation of bpf trampoline
Date: Sun,  4 May 2025 08:51:44 +0530
Message-ID: <174632869187.233894.15123233166233915904.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422082609.949301-1-hbathini@linux.ibm.com>
References: <20250422082609.949301-1-hbathini@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyNyBTYWx0ZWRfX6DyEKWU6QnYo 7greZNW8+yitmYLrtirthyZIHy+J/v/fyGCEVtGPaap2hYhJypSsH+8Z0joHOKf4XAMDMEGP6xp zJWCO4UyJuCjdiQSMqQAK9aDVg5lF4KIqaLfZXYYcHEokKdgvjXYGUUcR4ivtd+BX27VFaQVO2j
 s7todX2lRV6gmX//LTRrQeuTrLuE5f4r2x6h21Zy6p1DnRzNhWT6qwb7r4+G6x0sBAM6a6tkx3d fPtI8sZLlHmpWwS66jHYq7CkFWeuMYTek5bKl5o2YQxAX5xrJFhTGMqKOccLCAU6KLGBl7dlZ4S oD51yiulgbqF5e1RDOrUnCANHFn95IN3dnKnwE/hDVhjOXqFw4ecs7uaOFyBIdt4xaOxcFScj0N
 J/n7bnoAPSRe5A6U7xXYaJSdluRkjrrxVux5bY0j+4zDDzNDpbtlbpJx/BPG8lb7BUkfITKh
X-Authority-Analysis: v=2.4 cv=FaY3xI+6 c=1 sm=1 tr=0 ts=6816dd58 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=wIAToBHDtcCUFXZOyw8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: x6L6hjTrPTYSDUjvsLx63oLgbUoeAn3v
X-Proofpoint-ORIG-GUID: uLhNmylByxGXvY0cDMqdsxSzNLPfZwOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=406
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040027
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 22 Apr 2025 13:56:09 +0530, Hari Bathini wrote:
> arch_bpf_trampoline_size() provides JIT size of the BPF trampoline
> before the buffer for JIT'ing it is allocated. The total number of
> instructions emitted for BPF trampoline JIT code depends on where
> the final image is located. So, the size arrived at with the dummy
> pass in arch_bpf_trampoline_size() can vary from the actual size
> needed in  arch_prepare_bpf_trampoline().  When the instructions
> accounted in  arch_bpf_trampoline_size() is less than the number of
> instructions emitted during the actual JIT compile of the trampoline,
> the below warning is produced:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/bpf: fix JIT code size calculation of bpf trampoline
      https://git.kernel.org/powerpc/c/59ba025948be2a92e8bc9ae1cbdaf197660bd508

Thanks

