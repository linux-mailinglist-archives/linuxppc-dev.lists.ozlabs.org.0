Return-Path: <linuxppc-dev+bounces-12500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABDDB8F08E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 07:44:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVX9X6k3yz3ccF;
	Mon, 22 Sep 2025 15:44:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758519856;
	cv=none; b=iCu6L3uG3YEPpfJCyfAe5Ui9bcpCAA8ama8bQm2HN5vvPqSAgfaaekrj5onx94bA1s5ZgiEuQtnEV8edUxBt0W72tZJXEMAA8PypSU5F+sYdJYm0eiDioGTylpw1FomkH3dIWAW6nPDj6R3PrfeWzXmdl6+Hi2U2Xu0RYJYm50OeDioAzcTqbxKFNmudABMkhdJxWlb+YG8ieL8qiUmZcqrpXv/jxtGoIRmMZhUH1XezlMjYeH3ESXgoefd+guIpaiVOsIoqaULQOw6cerMcChnxJXIS0IN0Qp3yUmFo1nWsd0ACLK+75n3gH7jZ6oqaMrlq/MpOrsh2Y21GfeDZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758519856; c=relaxed/relaxed;
	bh=kF+x9jT6+q+YraHc+qb8OebFx5v5C6GZZLjqdse+bmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l/NO0Cr97J7rKeds56uhGScmADxODFi3W2BpH0PpS/l53nvBGr3xuQTIVE3M6SVhOgz3iYSlUhhIxJDKWnay8LbdRbU3KL9c11u2K26JxCXIG5lDahGkzO3e1gA0189TF0fCz/MH+9pwTnVz4VivsDu9z2es2ShmR9cl4F5H62RzbkAmlp5gQe+FI5pYgcDQCFwZyTiK+c1OOWwt4EQd8fIRZsrv68grnRFWof2b2U+vPNmEXk2OgsZCV3+GSlY5nFo23CLJv1laUdWrwMh6plNZjZiHaFbD/ZoyyjhCsSw97491SHGkPPjPrZYPnX9nD+Kj+ZdueAzdRkfmKxYAMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=juoH0ibs; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=juoH0ibs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVX9X1fMTz3cQx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 15:44:16 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M0ug3Y008695;
	Mon, 22 Sep 2025 05:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kF+x9j
	T6+q+YraHc+qb8OebFx5v5C6GZZLjqdse+bmk=; b=juoH0ibsOvj8eTEY7mUeCX
	jxb26T9k9aOdt/w6ufmIsVB7gT54cFh7RzS91n4BcBI64QX2n3VcNwnEarK0C5gU
	oXmB8gkKi5/PsP8zgcSwrmELXxFlh/nTP/YqESFfjF1aj4OO7w0V6Bb7ssB/Skzw
	XtmXEWArW3CjyKB7NVAP1BfQ61SSMsZgZRAkHY9R5mRDwAqTLMhjLh5BJzp1JtFR
	Eba2tZ/xjWq+V3bKDBh54qUCNoL8AL1Dd1BBpLXHi6xrUbyj8bngtGtDVo8iDh1C
	2V4Wa7FNO0aAvEU6cpjYfsSzHY5fRVov3KptGynTIZUOs5LsvCb87INQpFhK8mcQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499n0j8jc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 05:44:07 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58M5RTuG027246;
	Mon, 22 Sep 2025 05:44:07 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499n0j8jc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 05:44:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58M16xL2013704;
	Mon, 22 Sep 2025 05:44:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49a8tj4ck1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 05:44:06 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58M5i0s232309730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Sep 2025 05:44:00 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AFEE20043;
	Mon, 22 Sep 2025 05:44:00 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 578D620040;
	Mon, 22 Sep 2025 05:43:57 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.82.69])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Sep 2025 05:43:57 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, msuchanek@suse.de,
        mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
        shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
Subject: Re: [PATCH v7 0/9] powerpc/pseries: Add hypervisor pipe (HVPIPE) suport
Date: Mon, 22 Sep 2025 11:13:56 +0530
Message-ID: <175851974395.1538174.7277217984110679520.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909084402.1488456-1-haren@linux.ibm.com>
References: <20250909084402.1488456-1-haren@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMyBTYWx0ZWRfX2MjhxXansfeV
 gyJxnkNQ+1tB2I0gVgn9fc+WjiJV+1jZr4dwKWYTk2rSg7qyK+cufr2iN6kJaijKCaE7t4e6knt
 ilZC0Kk5MceN0sYO0O4DMovJHjW7bsrjQVzgYKvaJztajSj4m+xT8ideUEaUl9XBnle3L0YsDNm
 YBaUAmFcbelaHe6VCVS/2IFK4k+xVG5GNqGYHGTsPRyFdrZg68GXBu/4cSDHuYPTEuH9TefeQPZ
 x0oj6tmFlZwHZg79Qb2wX+NVtKS9edokmitGz0YfPe2439BorPsZJFsDIKxHA7OqAVh1wO6y8gO
 x6WDGChjCmvO3Cp1nP+dn6l4N/l1YqBQZhO+yJqMDBHytURwftbTiYRTZ26hOKTq5mKidglMv+x
 J9mYITWO
X-Authority-Analysis: v=2.4 cv=TOlFS0la c=1 sm=1 tr=0 ts=68d0e228 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=f_7qjQwsdODCRKebQYsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: oi0r127N88ggx0DUj9pHXEDaUXv7ZxCS
X-Proofpoint-GUID: lKN5Nd4enhSBrKrkcU10FOsu2U0_SquB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200033
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 09 Sep 2025 01:43:52 -0700, Haren Myneni wrote:
> On powerPC systems, the Hardware Management Console (HMC) is used
> to create and manage logical partitions (LPAR)  and both HMC and
> LPARs exchange information  over Ethernet which can expose security
> implications. Hence the current method of communication is not
> viable for secure boot configuration.  To overcome these concerns,
> the hypervisor introduced new inband hypervisor channel called
> “Hypervisor Pipe (HVPIPE)” which allows HMC and LPARs to exchange
> information with ibm,send-hvpipe-msg and ibm,receive-hvpipe-msg
> RTAS calls. Sources can be any target that the hypervisor supports,
> but only HMC source is supported.
> 
> [...]

Applied to powerpc/next.

[1/9] powerpc/pseries: Define papr-hvpipe ioctl
      https://git.kernel.org/powerpc/c/043439ad1a23cd3f65628310d1f5a06e61f8b431
[2/9] powerpc/pseries: Define HVPIPE specific macros
      https://git.kernel.org/powerpc/c/26b4fcecea05b8927b17c9ace132914ffcb4d97e
[3/9] powerpc/pseries: Add papr-hvpipe char driver for HVPIPE interfaces
      https://git.kernel.org/powerpc/c/814ef095f12c9fa142043ee689500f3a41bb6dab
[4/9] powerpc/pseries: Send payload with ibm,send-hvpipe-msg RTAS
      https://git.kernel.org/powerpc/c/56dbc6678bbb9c011bea91c4a0774a9464ab99a7
[5/9] powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS
      https://git.kernel.org/powerpc/c/cebdb522fd3edd1fe05f7b4a74a27da7dd0f8d86
[6/9] powerpc/pseries: Wakeup hvpipe FD when the payload is pending
      https://git.kernel.org/powerpc/c/da24fb99a1b5cc842b9446f67f6bcda36b49817f
[7/9] powerpc/pseries: Enable HVPIPE event message interrupt
      https://git.kernel.org/powerpc/c/b48b6cc8c655d8cdcf5124ba9901b74c8f759668
[8/9] powerpc/pseries: Enable hvpipe with ibm,set-system-parameter RTAS
      https://git.kernel.org/powerpc/c/39a08a4f94980518ef2eca3c6c6b61094c99f1af
[9/9] powerpc/pseries: HVPIPE changes to support migration
      https://git.kernel.org/powerpc/c/6d84f85151bbd062d36bda6daf37a73945b471c9

Thanks

