Return-Path: <linuxppc-dev+bounces-14392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16BBC771EB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 04:10:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCKwm0l1bz2yrQ;
	Fri, 21 Nov 2025 14:10:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763694647;
	cv=none; b=HGZp5brgt8C9kTs/ApdLmdAKqITYOBjJzyvxglv4wJwnyc9Cmcwdm8rLW+JkfRofByhm0cjQkuDlYCCHP0/Hq+NCM4JQaDWP2elmZjLA7yKM0e7xqEB0w1Xb5OkomZcyO8QYGNcxOI0PF32ZQr3EJUQBsjE+1XHgufhiJpCSKfHAO9NNx1CdkU1Cv7QlgJS+wx0Bgo5bc00x4SJw3jFefmQJ1WHKKp8doqxBjMsAmMuT49ilNdIDc/ajizonWP49fJfEN2ZMysQeh2Acvn6HTy1kUC3nBIyoflqeB8VYYei3Lvxh3DLAeE9QezF9U063E9CjJZY2TPqVh8+5pokUww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763694647; c=relaxed/relaxed;
	bh=UW9FZM5lVJsAU/JoWFOIVhvCGkJkhAtmuBoxh2apQGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTzSB9oXeMl23LrTSv2YwrRL6l1i6oetSseND/mjoMTQ7/pp/bbW5FB9STYMP0wjqlv6Uqh7rXmeIXLrQYnuVrm3S2Vp3ORAzp3Gqs2HL3chspzrTNNbvHF5RAClqu2MTtYSyEOcHq3fNBX5mGFO1czG2mD/JIJHqeQ/ifuKHEplikzH4ghXEj3t4n4ocfmUGhWPlehLqOgO6iMz796CTv6fwDytXZzLY3KCIxrQaoiKR8ZQElTDKz1oTR/5xAIuRu5ub+8RsXuekJgENfeNNKvWYY6lxYLbovhhjP53F9F3VIglnYdYIB4S0BgRl5TTocAMbauiL3rEgXhRn+PD5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=If1MLNrd; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=If1MLNrd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCKwj4dy8z2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 14:10:44 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL0auki002704;
	Fri, 21 Nov 2025 03:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UW9FZM
	5lVJsAU/JoWFOIVhvCGkJkhAtmuBoxh2apQGY=; b=If1MLNrdbdt1UdnXbwF5c9
	RcnTgPCABmf9tf6pHhK6NmFXqq3OtavyWFGzJv+25aKs9PFIpOF+xTwYx9OGcB3n
	iEtgS+EK3Et4glZBLX/DnScqZgPDuq8an5rR1rGGGbQQpHL57a36O/cAbA3rUQWF
	SkYCyazSts3DG6FJiBTnDghfa8fThDfAIt4AFswlyXjbzB0v5qxHx7NH6ZjAG5eW
	gZCeyz9FbMamhYyULJ8eRjdqnem3AueTLGRkZzEEPb7k3/kDSV1IiWJMd+eLnuVy
	zWp73wntRY1887np7WN9MAXSS+AXttmkpt7KIWyVKzWHSxNXDFivR0CRbTZEi9yQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejju878p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:10:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL1K7L6006972;
	Fri, 21 Nov 2025 03:10:32 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af62jsup0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:10:32 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL3AVhW39453166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 03:10:31 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 053FD201F0;
	Fri, 21 Nov 2025 02:53:37 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A85DF201F3;
	Fri, 21 Nov 2025 02:53:35 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:53:35 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linux-kernel@vger.kernel.org, Ben Collins <bcollins@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/addnote: Fix overflow on 32-bit builds
Date: Fri, 21 Nov 2025 08:22:59 +0530
Message-ID: <176369324785.72695.4379046121177352611.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <2025042122-mustard-wrasse-694572@boujee-and-buff>
References: <2025042122-mustard-wrasse-694572@boujee-and-buff>
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
X-Proofpoint-GUID: UeBP00tbsZ-14frfgwDbuOx4ab7KRvFm
X-Proofpoint-ORIG-GUID: UeBP00tbsZ-14frfgwDbuOx4ab7KRvFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX+0sZd4qXyUZe
 Am4dm4hP5LvsdSB4DGp3P6itkxJyss6XqLdsqqRPUtkL8Mb1XZZBa7C0+YEBXymiYy2JGn42C7D
 tILWqbhaOZO/E/iULZxEwNoG38F3UBNlO/TZgxwBfaEW80OS5SJc9LQxIyZ30RYQlhuTDX0us9S
 uQ+eL8K7BiEQlBduRImYBpIa/VChWlKez5cA3qLM1FV2/vqdcQ0XvEU7iYWbXQNWZDFb9IHXX7X
 X02AUDAtSdMPdvU/6S4XfOsWBBW2IMRB3jMuxidbXreQ3KnUViAH9/EmxBj18Fimxj11unv2HX1
 ZetVIPPGHuelNSL18qcQs2yQMtM96SJ38QwwLI3mT8GaY+jwHDd1nyC8O1kI/cxwiPgXOzqY/TZ
 gp2vqrmJ2ZtSXSIHCrAhLqfQ3XkcuA==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691fd829 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UJzsccDuXqNxbPZbGOUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1011
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 21 Apr 2025 22:31:13 -0400, Ben Collins wrote:
> The PUT_64[LB]E() macros need to cast the value to unsigned long long
> like the GET_64[LB]E() macros. Caused lots of warnings when compiled
> on 32-bit, and clobbered addresses (36-bit P4080).
> 
> 

Applied to powerpc/next.

[1/1] powerpc/addnote: Fix overflow on 32-bit builds
      https://git.kernel.org/powerpc/c/825ce89a3ef17f84cf2c0eacfa6b8dc9fd11d13f

Thanks

