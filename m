Return-Path: <linuxppc-dev+bounces-14426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF228C7DC9D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Nov 2025 08:09:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dDg6t6hc8z2yvc;
	Sun, 23 Nov 2025 18:09:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763881750;
	cv=none; b=UjnOxme/RpKOAhzuVETBjqC4tgNHYAar3kKo+djbNNacHGkcnWbT3py0k+X/mKvOHMhHGi+t/ThsWRjTwjl1QZfjdFdRCCM90UkKgAn4cCOOguebTSNIOcVv0Qz5dZqvCdJJoaTC2h1nf2jU+Saayrqcd4va7gMPgda2Mrvn1afjx7EbHK9k6J7cYTLbXhWhTqF0JYeOHqllvxjiHYxOGsznS3itYHu8HRsvJA4OEJA33wxM3KsMNpG5bDLemAYVfnkDCaD+OrPcq9Va1rJmLxAYt/NBJ3AzgsjsMCtze8i7M2iY7KecgVwoTtCYQFoe/JkB5W3Lzwg+7aEceg9+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763881750; c=relaxed/relaxed;
	bh=XkUmPDEpEq+MVpyM0TDH8MQvATvpU0NSKxCehJJworA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UG//htJpNtQobG13jsLcOdXtS4P9qS2JiSWYgHbyrzMSKjGsfvuZgSQ6k3Ai/q0TCn8Q6tyAHuvgR0YegF+HWqbO0VoJjbIqZgQ7k0d9+387agGQSsWp7phiu+EqvA5y3JrVaREL1N5Z1twOhswCKbekkcKi9qkwiFZjE3IZc4Lc3+dQExN8sp3MuEbJEeVcHYM0ub0wS1awdxYmU3nvhmdbbf+LmQ75zVJjHxY6hJaHHKCpxeTPO042T8olDkRovtPHfSuBsz0zapjHFNB28ItAKAe1Wvr2bzeF4IcEEHU2cep5O53mL3obzop+OR6bOcBmJ7ncM3Liivab0gg14w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XmFkHKfs; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XmFkHKfs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dDg6s333wz2yv8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Nov 2025 18:09:08 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AN2L524025267;
	Sun, 23 Nov 2025 07:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XkUmPD
	EpEq+MVpyM0TDH8MQvATvpU0NSKxCehJJworA=; b=XmFkHKfsgzjBHVHVGi+AIO
	ZExsnWa5N3ob1h/1THWXh2iKIZ/0aETdo8KjDoEVfD3byhPKanM0xwPaRDtxT7B8
	3sKWzSHqT88LSJmoMuBrYcfbqsTG48kRpBSt+AjenqiU62L1ZnsiAnfJySWBIN/l
	hjk6cR8e/ZLbc7+1Ei80D+NZB1qje1ltntRichfJMTYCLhVb31PeI0hf0jDP/HJ9
	g55LSSdbqV+lndPPBH7+H2U42HRHHmCcDZNCYroop8mkdjpO1ixvebCnG2a/qkJW
	F+V72H3MDVTDEO8PSDxbx8xFq9BuIyh+hfxePpdRO9O2YPy2GdPy6z5vDpbjgEZw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4phkt0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Nov 2025 07:08:56 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AN78trU027028;
	Sun, 23 Nov 2025 07:08:55 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak4phkt0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Nov 2025 07:08:55 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AN1rODE016428;
	Sun, 23 Nov 2025 07:08:54 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aks0jrrnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Nov 2025 07:08:54 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AN78oeY47710690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 23 Nov 2025 07:08:50 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3899C20043;
	Sun, 23 Nov 2025 07:08:50 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09E9520040;
	Sun, 23 Nov 2025 07:08:48 +0000 (GMT)
Received: from li-ec1c5fcc-2902-11b2-a85c-a56d12941531.ibm.com (unknown [9.39.28.54])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 23 Nov 2025 07:08:47 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Mackerras <paulus@ozlabs.org>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
        Donet Tom <donettom@linux.ibm.com>,
        Pavithra Prakash <pavrampu@linux.ibm.com>
Subject: Re: [PATCH v2 00/11] powerpc/book3s64: Hash / SLB fixes & improvements
Date: Sun, 23 Nov 2025 12:38:47 +0530
Message-ID: <176388153645.266380.12828407470372851622.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1761834163.git.ritesh.list@gmail.com>
References: <cover.1761834163.git.ritesh.list@gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAxNiBTYWx0ZWRfXxtMol4REx/cR
 j/7rMkbvkY7xUmvNd/jE6V4EOk/SxUjNGJSpHsI/wdo+8/xVMv50TbiPCc+PiDza51vULWkLHUw
 UqQ3Z4FC8sSlhkPsVCfV7OXL4D3XMjuUztEEhB0VZHVPfMglc17I/R7GabLf2K549JeZP8KNotx
 wJvWthUvvMZKtwAWi9uAJ4StY+RKn0hHK44/lnoHUmEIU/72plvTzWSM5xW0kEnmaBzbzZVrxJI
 jAJA/8KvOlieOMi5HZSEUD1eAN8Sd4olXFXr+KYImp+VvfzEDbW6E8th7LVeBbgG+CkFqA0uB4L
 vCHs6blwT9g8CDJXx8/cO4U9cIsvvD4gN1eFQDkjdrD8lBclB4D4xoa/076OFqIYY7wyBPBN3y6
 UxNZv0w8V1c49t1b0+GEW00mAXIRMA==
X-Proofpoint-ORIG-GUID: pKpRVDuQXbLpZbqNxhoBmDFk5YYkMdR1
X-Authority-Analysis: v=2.4 cv=CcYFJbrl c=1 sm=1 tr=0 ts=6922b308 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=gFstJOV2qH21C7eGfXEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: h4ruE9CUeCe2qDonVOS_BgtO_DVyOfyk
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

On Thu, 30 Oct 2025 20:27:25 +0530, Ritesh Harjani (IBM) wrote:
> While working on slb multi-hit issue we identified few more fixes and
> improvements required for Hash / SLB code. This patch series is a result of
> that.
> 
> RFC -> v2:
> ==========
> 1. Addressed review comments from Christophe.
> 2. Added PATCH [5-8] as improvements patches.
> 3. Dropped the last patch which adds slb faults to vmstat counter.
>    I'd like to do some more testing of this internally first, and if it proves to
>    be really useful, I will send that patch separately later.
> 
> [...]

Applied to powerpc/next.

[01/11] powerpc/64s/slb: Fix SLB multihit issue during SLB preload
        https://git.kernel.org/powerpc/c/00312419f0863964625d6dcda8183f96849412c6
[02/11] powerpc/64s/hash: Restrict stress_hpt_struct memblock region to within RMA limit
        https://git.kernel.org/powerpc/c/17b45ccf09882e0c808ad2cf62acdc90ad968746
[03/11] powerpc/64s/ptdump: Fix kernel_hash_pagetable dump for ISA v3.00 HPTE format
        https://git.kernel.org/powerpc/c/eae40a6da63faa9fb63ff61f8fa2b3b57da78a84
[04/11] powerpc/64s/hash: Fix phys_addr_t printf format in htab_initialize()
        https://git.kernel.org/powerpc/c/178dd2ee2b72817a67a8814c35a65fd901b325ba
[05/11] powerpc/64s/hash: Improve hash mmu printk messages
        https://git.kernel.org/powerpc/c/fec40fe7e6dc08c97370420301377ee031199a6d
[06/11] powerpc/64s/hash: Hash hpt_order should be only available with Hash MMU
        https://git.kernel.org/powerpc/c/b80691e25ec632d020b90eb9de3af0f956dff0a0
[07/11] powerpc/64s/hash: Update directMap page counters for Hash
        https://git.kernel.org/powerpc/c/b296fda58d1d095c95c8207b09856b2ceafa1397
[08/11] powerpc/64s/pgtable: Enable directMap counters in meminfo for Hash
        https://git.kernel.org/powerpc/c/6394f0e8abe7ca3132faa1321c97c53d0994aecc
[09/11] powerpc/ptdump: Dump PXX level info for kernel_page_tables
        https://git.kernel.org/powerpc/c/3d44be297e7e01357b95dd13d2b335e6550ccfcd
[10/11] powerpc/64s/slb: Make preload_add return type as void
        https://git.kernel.org/powerpc/c/2a492d6b38c2943c9d2f9008f31a8bb3afc3a40b
[11/11] powerpc/64s/slb: Add no_slb_preload early cmdline param
        https://git.kernel.org/powerpc/c/5b3a426affbd30a4293d284ab0d37164a4064531

cheers

