Return-Path: <linuxppc-dev+bounces-11411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A44CAB393D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 08:33:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCBRp3XV0z3blg;
	Thu, 28 Aug 2025 16:33:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756362806;
	cv=none; b=lYs420EsbGEbzDZLXW9vSnUacmj1NERslp1RdbCjFppW73BtTNF1CcjEEbPMyAH00r1j8KlT2j93mks3tUQYv7vnF30K3/NLX5fT2Ski7NJjQ1Ni9JkcL6qGYtxGt8hYzwEWVYBDff0j5EmDID4Bc6/PY3jXizYd0r6NUZIinqMKbv0L2Mtx+Dt7PsBzKZipqeaAxTNjzFkCldcbHVep4jw1NdFGnENOW8pMLBzP8IgUI36G47Jm4f1VOgZ0I9UpwK4RvUvU0YuZIU42nN0TlsEQEX4d5dwDxKpXwjw61VAa2t+8A14qCmLndYrz9Rbh7wB5hPz79xZw24g9s3+Djw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756362806; c=relaxed/relaxed;
	bh=UdteRhN0oIumWhmj8MyPl9h3QcIsR9j/IF0BjUA2qHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nDUc+Ja9+VvGHjiX8U9wmr7yGzmyXS7WqVxqPKYqmkGXZemsvaJzMoCXp7WvIiPfQcEFOgerAZzvZSQoyonX4n7SB6oGcciMEmqC+1vX8QYR87XV5Co3lZI2c3BU0YhxTQidugPdDScFN4/i8USbWb0pc6cNMPae3qkrdPnBdPhmV8nRtS8Ai4Nhs0tTYYtdH0Crrl+5DMg+kMY4YhP4/B6ppDGtreIQql7WgoMEbzkvbNQrvcxP4plEsEb6Wr6UwMqenr9uJDa6BOXUKrH9z6peJOcXCWFKIfD1hEMqEDrCMOFpGoT0OTCQAb31sTMyoEnL8/6JT0noDnIR2NSBzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h622a4qZ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h622a4qZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCBRn5m41z30WS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 16:33:25 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RKCfG1003642;
	Thu, 28 Aug 2025 06:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UdteRh
	N0oIumWhmj8MyPl9h3QcIsR9j/IF0BjUA2qHA=; b=h622a4qZpGX74OYUW5T42J
	nHzEJ5le3JATtntTE5u3Ye4mhYNc6orsWYf6Rres/NjkGqPFca2ZtzFj8Ib951oQ
	6wu50EgoeNvSJPv13BDi6je0HAttHRUdJOo0Mvb5nBBVBe4cGEgdjt+PTyS6HRc3
	XFprprdRQsrqXFEzqxf/yY/8QoghABcwEOy8dddo3ym9Gl203qL7YZRmAxrAQbRJ
	V5mwmIxof7IyCK8Ctz7CQa8nd4hkMeKc4fS3yQe6aIm5K9ALPwaoCVgAdH6d0tJk
	OLU/esipsBOxAPjdAPuT/C7BQZY/veaD5Z2/Y5Mu9F2QHW+9rhjBZLCo9HOd5Oaw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avr4d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:12 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57S6RhJc008848;
	Thu, 28 Aug 2025 06:33:12 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avr4cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:12 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57S1b7LP017993;
	Thu, 28 Aug 2025 06:33:11 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qtp3karm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:11 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57S6X9kA54657302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 06:33:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D90A20040;
	Thu, 28 Aug 2025 06:33:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B974C20043;
	Thu, 28 Aug 2025 06:33:07 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.64.161])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 06:33:07 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: use always-y instead of extra-y in Makefiles
Date: Thu, 28 Aug 2025 12:03:06 +0530
Message-ID: <175635911051.1554354.17796747269761979092.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250602163302.478765-1-masahiroy@kernel.org>
References: <20250602163302.478765-1-masahiroy@kernel.org>
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
X-Proofpoint-GUID: OTSHjafgNsHDmaUCHT8hD7eKSWBsgDtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX0YiAhqyuwOPc
 fGZCPaBZ6s6llflvvReftBjXaFhfY/xEf6fTlOB9Fax/Ko3nXoa24aJXUxVEmP9LEq/VMgFRIBa
 IrGAmjoev0XQqbpy1Soq5FGEq0oy1FvotrrpR9jQt5+dTvT+8nT7W3PPVJ+lLDcPgeI2ZVEev5s
 kmJSVBAGvphmAdVYt+z0kPn4pGpj+/gC+pWdAde1FGjZz9m2H2TlJ3zQdXhRv8gILK1wSdIW25Y
 FzPBL4I4oXd4XzEjJMGW83ImANJJW/uLPnJdc4JhYzcLJ+YKc4j1kbRUSM7CMpO2HzG/LCHoVNz
 x7z4ido1BTqrCOJMwtqD67MxwvoHSLdOdo8izgZxytCVYAL7ZK2GIta/PCiSNYBl4QR8aXsfVBd
 PpuChwrC
X-Proofpoint-ORIG-GUID: HNjSYfscMMii3yopLrozSM_UDW1smLKe
X-Authority-Analysis: v=2.4 cv=SNNCVPvH c=1 sm=1 tr=0 ts=68aff828 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=Kmu8P2dTHJ2v_Z3hexsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 03 Jun 2025 01:32:24 +0900, Masahiro Yamada wrote:
> The extra-y syntax is planned for deprecation because it is similar
> to always-y.
> 
> When building the boot wrapper, always-y and extra-y are equivalent.
> Use always-y instead.
> 
> In arch/powerpc/kernel/Makefile, I added ifdef KBUILD_BUILTIN to
> keep the current behavior: prom_init_check is skipped when building
> only modular objects.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: use always-y instead of extra-y in Makefiles
      https://git.kernel.org/powerpc/c/eb59d4c5948d93e940b5dde9d1bf3b33367fbcb8

Thanks

