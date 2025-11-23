Return-Path: <linuxppc-dev+bounces-14427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF40C7DC9E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Nov 2025 08:09:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dDg6z2x58z308l;
	Sun, 23 Nov 2025 18:09:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763881755;
	cv=none; b=mPlr8zMybKxq0vZHJAFIa+FYtW1vtDVqC1sR4Z9TZYabCQ9t00sI8xVtEaUrX0dCA+oGRtTLElqzuVpvnyQCPpVMhqxdP9itvacFsVLgdCbed2tTsS2Oa0KZ9v6b9fp9rc4L5duvI+VhuRR6BQf6qui278rTYsFLfhhjPtZImSAN4KlVcOutcPQtnKag+a0YI9sOd8YQ6LXRc4RtfSSteI5D8wJo4cDkJDkL5WiS2gsvaiXEqAQvYuFgioSZxQqcnXFAYwj3RG+s69WWNsCC05KFgrPTeZLBRtt8nTHnDjXlVOaUWuNcn0gWGFT/adhZPcZO4EqzLwLsV1xb2Nyc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763881755; c=relaxed/relaxed;
	bh=fWVoqRCJJQzeqwmG+uZqGF4Sif6dBJSA9rBhyQq0L5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EHsPY8MItHjeMXjh2+XAhLHv/yLTKNPdZmaKgnA3PO6Dh+rzeL0CJxoKrFJe6PcgDmvMThPPpHe25rVJZVwMTpfw8/1EvpjhZ60ptXqT0jvtTmxkaBkIP4KYFoDq5IK0mUW4XgxSBmM0cyVKzysWJ/TNmL+pCpDEIP06BDjBzZ7srOTuTbhfF9F5CnYisrX0IOR+zfozApeXO2UJOeG89MOCF8J1W/lG3yiPbJr0t9nBTbI2kqpI0aJJ/NffqJPsT6xhN+Jx+JAS7MRAa3CTGVfAJFcjGRspBT49tNVoBKKd3n4J/3AvNBBgbN4n0hTxvJury3y/L7LViQosTZmtYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n2SgyKt1; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n2SgyKt1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dDg6y5nG8z2yv8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Nov 2025 18:09:14 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AN57K1V012347;
	Sun, 23 Nov 2025 07:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fWVoqR
	CJJQzeqwmG+uZqGF4Sif6dBJSA9rBhyQq0L5k=; b=n2SgyKt1Imzb3KshltZ4kw
	GCk30khNq5je2WSuwv7gP4nkkY/QSxrZyRHU99w3vKZ0cIk1O2Sopfz0x18sUrtU
	wsvBlgijJfA1k4feoZVX25y0a1vJ3F1TS9tdywFHEvFzeufHZcaIWrTLY2uhRG0j
	bzxN88XhDiNqMAaOuoyH7zYrLrP7whdYfVDgLQR7+So4NMZdw0JO01YWhwIn71C9
	Q+yHhW8cqo93XVAd7fKEpzWfFIpVRIobew9C03V8aj+6p8U3oJmfRQlsbRFOyEky
	KBwWy3d4Vo1zlBxfz3TwXg87Pz50yImWcDK1DSxVz2uZLHsMdvKa+LHHhHxWquqQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4phkt0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Nov 2025 07:08:50 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AN78AsC025230;
	Sun, 23 Nov 2025 07:08:49 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4phkt09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Nov 2025 07:08:49 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AN6fQ9K030768;
	Sun, 23 Nov 2025 07:08:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4akqgs10ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Nov 2025 07:08:48 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AN78kNd29491478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 23 Nov 2025 07:08:46 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C134C20043;
	Sun, 23 Nov 2025 07:08:46 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28ED820040;
	Sun, 23 Nov 2025 07:08:44 +0000 (GMT)
Received: from li-ec1c5fcc-2902-11b2-a85c-a56d12941531.ibm.com (unknown [9.39.28.54])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 23 Nov 2025 07:08:43 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nadav Amit <nadav.amit@gmail.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Dave Vasilevsky <dave@vasilevsky.ca>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3] powerpc, mm: Fix mprotect on book3s 32-bit
Date: Sun, 23 Nov 2025 12:38:42 +0530
Message-ID: <176388153643.266380.17169073097404532999.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251116-vasi-mprotect-g3-v3-1-59a9bd33ba00@vasilevsky.ca>
References: <20251116-vasi-mprotect-g3-v3-1-59a9bd33ba00@vasilevsky.ca>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAxNiBTYWx0ZWRfX2E+dZydoBIjq
 j/a/Fuhl1XWmEEj5AHgqhURViq8wIUsLzFFYnFIPDULo8sKfC64ctWWtkuiBy/5BCSeTkGXVPce
 Q1P77wvL8O5Uub/5FHar82Ek5l3npYFRBmUn6YZ8j8yMhmLRmHPIYaUS2O0hoAhVsMuOPyngDLu
 QbGTjOg2AnDtHItFHSaPv8RUGU8Jm6BLkww3vhoF7tQyVbpZapuW2c1+MBVFLQ7Ssp+rQ8ELLT4
 4W8/o2HcsIsCqHi2DZBFeWxzP50Vvqkhmyhg4KhOhL+Dw7URkF4FE4+p9xPCoLln3zxp/6qJ5DV
 7fD0hLLjK9dtf3/bjd2gUim3IaF4ypPgp71M9c073fhgwlCB5u4i1D64PDD/naIH7beI1MkaVWC
 9x3WW8VpHeebPQ7zNTM1xAg4IcQspA==
X-Proofpoint-ORIG-GUID: FI8kl5yIzH5v47u0HKj_StUJaVkAQRz_
X-Authority-Analysis: v=2.4 cv=CcYFJbrl c=1 sm=1 tr=0 ts=6922b302 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=qxS73Cczoj_2XmlJWXgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: OPEAhxgTMF36rTxy6rRkhAlgEqpEQIwu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-23_02,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511220016
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 16 Nov 2025 01:40:46 -0500, Dave Vasilevsky wrote:
> On 32-bit book3s with hash-MMUs, tlb_flush() was a no-op. This was
> unnoticed because all uses until recently were for unmaps, and thus
> handled by __tlb_remove_tlb_entry().
> 
> After commit 4a18419f71cd ("mm/mprotect: use mmu_gather") in kernel 5.19,
> tlb_gather_mmu() started being used for mprotect as well. This caused
> mprotect to simply not work on these machines:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc, mm: Fix mprotect on book3s 32-bit
      https://git.kernel.org/powerpc/c/78fc63ffa7813e33681839bb33826c24195f0eb7

cheers

