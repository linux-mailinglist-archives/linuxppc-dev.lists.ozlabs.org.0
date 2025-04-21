Return-Path: <linuxppc-dev+bounces-7857-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB073A94F32
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 12:10:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh1Mw2Nrwz3c3W;
	Mon, 21 Apr 2025 20:10:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745230236;
	cv=none; b=hNoW0t6BvbHZbhhSb5D860unFS+s7JX0JiL1eq9+n2y4q+8yEvE4ZUZ9uBSq1LiMNlW8JJOV+RMrUJA/ikckCZzW4Yj5denkqiExQxnTsP74xPwLV20ByGO7aSnYiuACknNt25lOzjYhd9RNY3uzC0FxR+o/3d3Zyi6DZfwSsBmHREWy87sHcp+GQSh9Axzctp0235YM6GWbXyxrM94x1UnV8eaaG7aZMeyE/vw0C7OZaLUcSETiiVhNiY/UoD/vejVelyL3NFdmpZM6lCA/lK9VeSxWg655lHE4KO//atZyCwU+ehsI3X3rAGoZPu7gvq+WGUcn4/HHzlAM4Qvg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745230236; c=relaxed/relaxed;
	bh=t25gV2LlHuZm499XnU/ddA/QM2wW6pt4RXEvXLzehkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XDJj3ys1Eky7jx/atBHwrsBJxfK2q8pEGJX+lccH01T2/GrpWuvtN7mPjrIwMVv1rgQxCy7FpHJXDgJi7lm3Ir92ICuLwAHe94Zhn7uBgBLI81nMZk3nCaJHnw99ohf06h2M98rsRBdRPr0W39T0aZOosA92hIAUGB7cTmB9Cm8hcpg5/v8mTynFg2ckal2wfLVqjX9E8tjVHbOSa8lunrQpUDSSAiyjciZmRjgLQfpHxAIaqv5oJRgZBFDOq9eDRrRIX+PB8yoyYjBXFsRMZeJgzt52QvUBJAfExPoyvesQdibdbZhyT73+eS+a4UnR5+Bx3tX1DeKS/6+qZ+Q4Ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XbXrSGMt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XbXrSGMt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh1Mv2MLLz3c2H
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 20:10:35 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KNnI5Q002831;
	Mon, 21 Apr 2025 10:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=t25gV2
	LlHuZm499XnU/ddA/QM2wW6pt4RXEvXLzehkE=; b=XbXrSGMtdR9IQ19lTW9NdL
	HvGUW0EBJvYcyVY4ZNwAWg4t+Ya2hZas7/YHlVbwxMwphrTbtaKwGU1DQX3/5l0h
	RCeCqZVaoMoMmkRs0oz3gaAf7NiRp7igc359bQsVFuXiF9c9TMshS2YXxru9+8Sg
	AR8CcbgO/g3Uf9EQ9N/1S9AotWK5pSOixTXhZ0YBFNq5kWraaMYOS6lThK8dXsGY
	tHmKB4IIKNo0TvQ8HUpwiyX4K3so87xUEuHNgzU363iNF3OtvMauJmOL9MkxTezx
	nl9OUrtXlhxagVShUTcMi7GEx6J8fmuUEQQS31O1mQlhyui9VcxNF1MKKSrKLgrQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465aw09xp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:10:30 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53LAATFq014004;
	Mon, 21 Apr 2025 10:10:29 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465aw09xp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:10:29 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L7Bc2a002953;
	Mon, 21 Apr 2025 10:10:29 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464q5ndugm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:10:29 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53LAARnY47776160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 10:10:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 315782035E;
	Mon, 21 Apr 2025 09:41:28 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 370AA20344;
	Mon, 21 Apr 2025 09:41:25 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.29.154])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 09:41:24 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Donet Tom <donettom@linux.ibm.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v3 1/2] book3s64/radix: Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
Date: Mon, 21 Apr 2025 15:11:22 +0530
Message-ID: <174516637905.525631.9346675264920846918.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <8231763344223c193e3452eab0ae8ea966aff466.1741609795.git.donettom@linux.ibm.com>
References: <8231763344223c193e3452eab0ae8ea966aff466.1741609795.git.donettom@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 5Yag2i4zegRLQx9j11rUWX9OvDdXdqK1
X-Authority-Analysis: v=2.4 cv=HKjDFptv c=1 sm=1 tr=0 ts=68061996 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=uNbs28uO5FCRLVzZPbMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: sjBL5zfOm7OHP_N2ftAJ_rfiVvEAq5u-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=638 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 spamscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210077
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 10 Mar 2025 07:44:09 -0500, Donet Tom wrote:
> Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
> 
> 

Applied to powerpc/fixes.

[1/2] book3s64/radix: Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
      https://git.kernel.org/powerpc/c/29bdc1f1c1df80868fb35bc69d1f073183adc6de
[2/2] book3s64/radix : Align section vmemmap start address to PAGE_SIZE
      https://git.kernel.org/powerpc/c/9cf7e13fecbab0894f6986fc6986ab2eba8de52e

Thanks

