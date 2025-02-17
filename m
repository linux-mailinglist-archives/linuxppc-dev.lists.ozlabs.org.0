Return-Path: <linuxppc-dev+bounces-6250-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 725E1A37C27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 08:28:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxDlc6KXCz2ywM;
	Mon, 17 Feb 2025 18:28:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739777292;
	cv=none; b=ZXHlRgIYRlmcim7asxRJRjw49z3nepLYletHTkA9Oa5x9PtIPELiP7XHNfij6BAjE/7qcZvImC82A/85iwBYQNqGprBFLZAIAYipPUOGofSjxQ49QX5mAN64nyZPex2Cqx3QKJEdhP+rEnMXtC3txzUHVCbhurvS6CVKKhEI2gQj41EPaBv3CByCfAhP899Bw/80kwPQKSiyKIdy91ZqsvHglWWtA0e0QDTHCw+c+6QF/olxMwtONP5i5cLqyn7/4offD5u4ouriH+LKGjZofcp3Rd/ROltR8I0/yHmqN3fpUiBN5fnORscbGsxqzVFJVf4dnfxeiHAnGDFAOvJ/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739777292; c=relaxed/relaxed;
	bh=zXfuGGE9EStGvSjg9LEBp6/svSYYySIo/hFcvBUz89c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fV2uWIcMExGmlUYZRHv6XIrPuk0jFk612vUymjcLL10q5BwBxVDj0+5MRLv/Z2Q03caDBSQu1D2qMp5QVKexQ8/z6U8CMdt3f2yVYKWImurME7zsoerOmjeB1BeaONzPRkA5ffDpyrSWK0U+JEeZPUoxOaaH4/jnoI+uLVmfUyW28UeWTmf5C3fkm6vKfLs0BCJsv/a3aBDQcV9emGGOTQavKbGiGdI5PW76rVW1BiznXkKGsXJydP913f+vZ2pIlW/4cgD+KgO6E+DqulEBwg+SLHmp9DLt4xjySIcIrFf1AOZXaRta37ANKea8rWh942Fm95WvjPQV261rfAKlOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yjc3X8+T; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yjc3X8+T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxDlb72MQz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 18:28:11 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51GMpaAw031817
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zXfuGG
	E9EStGvSjg9LEBp6/svSYYySIo/hFcvBUz89c=; b=Yjc3X8+T5jQ97vgH1tEKKK
	yGr6+ZXQjdEOf8efJxiP4JELOECaJWKDL55ApacnxGGA9boaNEgMXqLQgLXV1Waw
	FnuCHepkb7OUhxOoVuWe7lV8ixbsNinmRPOJdIvU4GFQkVSBwKu7JYtJfh3yTHOs
	5ehvE+nPsrVbr5pNYLdwr/Ic91fe3bd5ZbbyUkwuvOTggNfQzKW2THAlN3e9mXOt
	MnCbaWTxcgCx2u5JYCxY+KGyTDMka6iRUutwWsnKQhtrp+Q9+SMDsDegBB+D1miX
	bXAAvwhIMUfH80ZHxYKYGt8rXFtsHNhszJ5OIlFIXbuUJ7TuD5WiVMefqN9lu74g
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44us5a1pr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H35EMR008114
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44u58td5va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 07:28:08 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51H7S48v56557860
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 07:28:04 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F9D12004B;
	Mon, 17 Feb 2025 07:28:04 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 939D420043;
	Mon, 17 Feb 2025 07:28:01 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.79.72])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Feb 2025 07:28:01 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: atrajeev@linux.ibm.com, hbathini@linux.ibm.com, adubey@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 RESEND 1/3] powerpc/pseries: Macros and wrapper functions for H_HTM call
Date: Mon, 17 Feb 2025 12:57:57 +0530
Message-ID: <173977700764.476837.10524965597423020327.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250113164039.302017-1-adubey@linux.ibm.com>
References: <20250113164039.302017-1-adubey@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: x0Py5HBWkPilFwGZc5OFf14KluvimOR2
X-Proofpoint-GUID: x0Py5HBWkPilFwGZc5OFf14KluvimOR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=724 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170060
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 13 Jan 2025 11:40:37 -0500, adubey@linux.ibm.com wrote:
> Define macros and wrapper functions to handle
> H_HTM (Hardware Trace Macro) hypervisor call.
> H_HTM is new HCALL added to export data from
> Hardware Trace Macro (HTM) function.
> 
> 

Applied to powerpc/next.

[1/3] powerpc/pseries: Macros and wrapper functions for H_HTM call
      https://git.kernel.org/powerpc/c/708220ae50251212d8d33683c7b48eb5c4db237e
[2/3] powerpc/pseries: Export hardware trace macro dump via debugfs
      https://git.kernel.org/powerpc/c/81c3d637c30f82966e551452e061d6e7b0d8df37
[3/3] powerpc: Document details on H_HTM hcall
      https://git.kernel.org/powerpc/c/ddcb883fd49c5d81f0d6e8c60332bab5d3b4c86f

Thanks

