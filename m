Return-Path: <linuxppc-dev+bounces-12501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CE4B8F097
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 07:44:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVX9d22C6z3cf7;
	Mon, 22 Sep 2025 15:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758519861;
	cv=none; b=Z9sHLP+ghz67mbq2knVvtZQdKYVIzaR+OOR3aDUOVMEaulxQANm+5cnm7+UvfYSAmXHDSTf1Gd+KWN0Kax+C8qymn1P7w7wV0c471grPsBQHGQz567alKpNL7+7vXZ9Zf807WCoGzTUdptIX6nPjki2KK0B6yDGHv0zM7GsOQY/xSxUgZNYd0EcqeUh5So/Oa8Gt9FJReTNCbUWxKUnwR6V+WQ5OCleFlsHOSBowaFHQwQ/tk8tAJurXarCL4GOnOkPH8DWWGb/aQ+1rkbx7BOn3SSyquACcMlXmNc3/An7qGJXUu/bFToyN50IPtc76QACBt/lgwRBepFDKsdDFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758519861; c=relaxed/relaxed;
	bh=QZyFyqONOAH11zhMr8nWVKhp9+n8qNVxohhDrJUm9g0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JumnVqFg3eU5md4b3Q7wSBeWvMdJhw0Q9fKTE8VXdajRcaYttCsViUThZlOOFQfHgdoqEhx8v9cMNX9RRIuMci/+BY4efPnvlYlbEvHK3Ohg15gPocuOq1sb+PzH14CD47TYH0pQCdwhF9+3ZYNMlq5QyqM3OZRWvjLBoobvyOecwqDMT+llf4fV1td9Q4Ro6vaFgfvull74OxeqFMDFyTmA4ctGhVupgAQkkVQZ5hfPQ8IgUExxX8pnNfZLQWB+USGPKv9ihZVLAl3KA/0YQL3DnkJaiWLET6X3srSRQHWmJNhaanXIOo/PeZjXIRVpFXkK1ft3ARnuQD1Jyj+lCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HVWRWzX2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HVWRWzX2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVX9c3TKfz30M0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 15:44:20 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LMCS6T016178;
	Mon, 22 Sep 2025 05:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QZyFyq
	ONOAH11zhMr8nWVKhp9+n8qNVxohhDrJUm9g0=; b=HVWRWzX2Gs8k0h/PMRt62u
	UUtzkQ94rrJBFOyCo97kjNMys2EVhmlLd8+8Jwp424YDSkTHkGjJ1Nwf8okJy05g
	7cI+j5HcaPTcZd7ISRyxy1Uw3QxOX3t41J8vnEs3+oZ6pJAh91JPgzugIshzpYXe
	GsE4eMmz3mbD8IGeaOPO+9Sf/quYG56jGIUOGkwYZW7I/0iMOFUbxSl8l130Z9Md
	wtC4n01S3b5la1hQgGi7HT/A9xiAT9KqJiG3aXcvzvOvR3oqBO2696k7nKY60mEq
	nWUUHdrBiqZDH9oPD5QApaeJFlL+RztPXAtW86ulCowiVyTl+hMSUOLvxYXMRpxQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499jpk0gre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 05:44:06 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58M5i6VJ031161;
	Mon, 22 Sep 2025 05:44:06 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499jpk0grc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 05:44:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58M16xL1013704;
	Mon, 22 Sep 2025 05:44:05 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49a8tj4cjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Sep 2025 05:44:05 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58M5i3pJ55640452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Sep 2025 05:44:03 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 915DE20040;
	Mon, 22 Sep 2025 05:44:03 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F47720043;
	Mon, 22 Sep 2025 05:44:01 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.82.69])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Sep 2025 05:44:01 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, live-patching@vger.kernel.org,
        Joe Lawrence <joe.lawrence@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v2 0/3] powerpc/ftrace: Fix livepatch module OOL ftrace corruption
Date: Mon, 22 Sep 2025 11:14:00 +0530
Message-ID: <175851974397.1538174.4405570975421605487.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250912142740.3581368-1-joe.lawrence@redhat.com>
References: <20250912142740.3581368-1-joe.lawrence@redhat.com>
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
X-Authority-Analysis: v=2.4 cv=L50dQ/T8 c=1 sm=1 tr=0 ts=68d0e226 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=hyQcYdjoVnPOfAs-bJkA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxMCBTYWx0ZWRfX7NtLggyMBvaS
 pnixGtmwIPRw1nhX7U8JlBADFX0QNJMdLYqDRE9zXp2Hl1NKcXphojyrbVO5y5sX5wAgdk0GWfu
 eI39LniB9UoA6J/9HX1ADXLsEH5C9JMb+GasRSDjRjcnBgqn0hYu0raGbSGeNWY5+jZ8cRKGq9h
 JDdca3wKiWegw5bTlU2KpfPcZrw9kpcpP9UaAsS74zAlUnJMtWR0I5jAm7p5nWuk4LSTCgJ+vmv
 yOPEqKJ5unljt2MzVTwFmiA4gC0+okuSDVMWEyDZlbtySaN4BqTn94JSThDD9uENmNr+UdxCDh9
 1NCNLeTL1XiDnDNK7v4tNNxZ/UXapufE7BF+4Bkzu0JGN+Tn0dT8zxn3Pc8PfLKwNuXYBpP1WTD
 +075JBJL
X-Proofpoint-ORIG-GUID: HthdyeIkGkHuyzkSUfcQAiGjWpggGrL3
X-Proofpoint-GUID: -Uz33uZKt4UnYKmpmDOuD3VWK543S-AX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 12 Sep 2025 10:27:37 -0400, Joe Lawrence wrote:
> This patch series fixes a couple of bugs in the powerpc64 out-of-line
> (OOL) ftrace support for modules, and follows up with a patch to
> simplify the module .stubs allocation code. An analysis of the module
> stub area corruption that prompted this work can be found in the v1
> thread [1].
> 
> The first two patches fix bugs introduced by commit eec37961a56a
> ("powerpc64/ftrace: Move ftrace sequence out of line"). The first,
> suggested by Naveen, ensures that a NOP'd ftrace call site has its
> ftrace_ops record updated correctly. The second patch corrects a loop in
> setup_ftrace_ool_stubs() to ensure all required stubs are reserved, not
> just the first. Together, these bugs lead to potential corruption of the
> OOL ftrace stubs area for livepatch modules.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/ftrace: ensure ftrace record ops are always set for NOPs
      https://git.kernel.org/powerpc/c/5337609a314828aa2474ac359db615f475c4a4d2
[2/3] powerpc64/modules: correctly iterate over stubs in setup_ftrace_ool_stubs
      https://git.kernel.org/powerpc/c/f6b4df37ebfeb47e50e27780500d2d06b4d211bd
[3/3] powerpc64/modules: replace stub allocation sentinel with an explicit counter
      https://git.kernel.org/powerpc/c/b137312fbf2dd1edc39acf7e8e6e8ac0a6ad72c0

Thanks

