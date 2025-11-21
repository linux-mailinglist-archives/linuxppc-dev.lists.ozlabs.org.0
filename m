Return-Path: <linuxppc-dev+bounces-14390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD38AC77150
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 03:56:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCKbs6Fz3z2yrg;
	Fri, 21 Nov 2025 13:56:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763693769;
	cv=none; b=ZSg4zUmyJ6nUE4ZVvzpvaDj5Knlg3Fidlyp5Uhu7yBF3P0isp7FVnr8H0otjZ5UjIf8uigKw7DphGSWBbK/qrTNbpO2/5ln4qQkQiOEq8RBkL3gxKGL6Enqty+7b4lm2KObrLuAhjp75DpxDbrp7sXQlB9ooghfK6WFTI+tynjjDwW3hxd4xcYvmF4LmuYsH+jcuEUC2pzr0HDwHhT5iwiqFUfaOR5mbxwBph66eBJZ38SUtKqegnCGJThVZZRwWUqX+M6CJgeaufW9phNaXp2h2S08LTQZwhuR62aoDVEWMIdn19RJ1pslBeGA55nT0usM39yE3MrnsziuHuGsILg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763693769; c=relaxed/relaxed;
	bh=6qhaxlpEx1AGx5D/2mT+t9VMFsHNi4DaDwx2CARsuvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BxfA5jpJvPFSNyv5gFTdmBSUc4ddUkqvWlA8aoRn1eFdiU4nFeAsubCd1lJfrBj60uF+Q+psSdxnxBl+M3DaBRR5diXxoyjPtEJYs4KN8CfyWGhnQ7Wu1XyUbwT0A0nVGuC2DkCYddKJLx3vwZRQf5PPQItRvjxcxcxccPGw3aOecLDh+Y8uNEZ9E09t+MGdGBaMLPE0NdHvQKeZgWFMJGIlOtDqaL+NI72DCYWR+qB7np82FTOhxO5y0qKFUxdd/134eZbPYw5sqr6sYHKKdDUjyZhjBcfUXs0bsKLE/W2/uVzWjAAy4LT4ZNnSTlXAFdbZezUJiPXuFFONfT3L+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mB5SDe/D; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mB5SDe/D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCKbs18lWz2xqh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 13:56:09 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKM3Bfb029088;
	Fri, 21 Nov 2025 02:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6qhaxl
	pEx1AGx5D/2mT+t9VMFsHNi4DaDwx2CARsuvA=; b=mB5SDe/DZuJn3wC6qPcQbu
	otai1BbvuYNhpKc0Sda4cTsiSQVsWi2T9gkbuns0Hw7BvrYMCl29qK5fVZuu26C2
	i3cHomulZIhEXX+/IjYAXZf31UxEvHQnTjqTB+EPk/3CQwwBB+5FwofzKcSy/08M
	4YarW+fABhrlrdfQL0L4vYIBn4GZesYEnmUNytdhbIFgQHtFHiqspNIDlw+Phq8i
	2U06jZ000xIsWKLUiri4C1eXRmWqXmjgW0jSrvdU8s7aSn1okXgzcNQ8OsX3j4D7
	qPSMVw/ytcTjv4529L6AIL++GOaO2ekUJkxe6D09PMylqQ2xLSjroV5Y9rJZfsNQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1srw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 02:55:48 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL2tmug000933;
	Fri, 21 Nov 2025 02:55:48 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1srw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 02:55:48 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKNc6ok022347;
	Fri, 21 Nov 2025 02:55:47 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4una0fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 02:55:47 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL2thf427787986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 02:55:43 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 083D42019B;
	Fri, 21 Nov 2025 02:55:43 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CDD020199;
	Fri, 21 Nov 2025 02:55:00 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:54:39 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Srikar Dronamraju <srikar@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/smp: Expose die_id and die_cpumask
Date: Fri, 21 Nov 2025 08:24:09 +0530
Message-ID: <176369324788.72695.18054078744608030993.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251112074859.814087-1-srikar@linux.ibm.com>
References: <20251112074859.814087-1-srikar@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691fd4b4 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=pMH8iXYfuX0DPzzJjpoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: qShj5Im0oPX7-aEgSeCH4hmHremRHEHr
X-Proofpoint-ORIG-GUID: RHhbU348MaMfK5XTrs4So9ky7v83G-Rw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXwzfQpiHt0iel
 L7r/ELOIF2wFYkrRpKfJ4tpfIMpcJYaEMmaD2GKoCVKhECDJ3NLa49CROPfpxfGc8Oqg5/AneH4
 ThG6r4sEdU4Uhm9/bKPAi990tUNP7RM7xbHNYvocNa1PK2teNZrIKCpPrT5UvqdFQuocGAocT61
 74ka+f1/P7BxX8C/SBaFrhwbUKCIxBdPIC7SVAJq1ceNegGKiTorv39JLAdRFyAdcEmStJuEy+m
 3OgmPsE35hBuM5BlefQ9y2IiBcqUTbpA/F2llXO4LahN8+Dbm5pfZVHw5NcfxFzvxrdb0D9sUbQ
 +DvE4W+3Oi9hBs8siaj8SqMmamjdYkvBHWcVIhQOiNbyoyRUkEAxt9tf7oRc9E+ZBTCLANRAhEj
 GSQpkFFMnm71ICZhdvny2R6zgmOr2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 12 Nov 2025 13:18:59 +0530, Srikar Dronamraju wrote:
> >From Power10 processors onwards, each chip has 2 hemispheres. For LPARs
> running on PowerVM Hypervisor, hypervisor determines the allocation of
> CPU groups to each LPAR, resulting in two LPARs with the same number of
> CPUs potentially having different numbers of CPUs from each hemisphere.
> Additionally, it is not feasible to ascertain the hemisphere based
> solely on the CPU number.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/smp: Expose die_id and die_cpumask
      https://git.kernel.org/powerpc/c/fb2ff9fa72e20a75cab0ffc9dc8735de68ed4d0d

Thanks

