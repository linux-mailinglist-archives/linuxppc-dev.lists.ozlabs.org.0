Return-Path: <linuxppc-dev+bounces-12088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1DAB5505E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 16:05:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNbmw1sdcz3dHV;
	Sat, 13 Sep 2025 00:05:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757685952;
	cv=none; b=QlAF2Y5TS5HzdmbdBT5JGMFzw6QV0ECJZX/k11VyS5GNU36AyNkwFHJBJxy4TDTTxs/TNTCszPgMgnQYnk6pMcUoAovpFUw5MiDQaOG//sU4q2KFnLqCrQVSfAaLUzgxYMiWn8LhK/fJR/vJ4vyuX7Qhphu5s1bBu3pQ7E91zC+qRnT0Eax1x6sp7gBgxcrhgy7ETPQVtxaPWbK7pW59uI/QWkWgzf6MHG5C/Z/zkPcFeity59CFcL4fPsC+nynk/OU0wESYFHIRu3bxGlyylvntaPcIm0odXFTuy9N3P48L9ysPiUlDeUk0gAPUKpbu+ZtLl4f5ECxEJHoX9HFpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757685952; c=relaxed/relaxed;
	bh=1Fi+81t5zqEybF/Ll9ApuHFjhXkkb1vHdHvbxL0Vc8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OORbqJDOHzB0K4dfhaCHRS62qzb/I6nVLP0mR9a/Y9a3FGdHr8+NXyC1WoyH7h3BThW60D4pvEDBB53OlmFqpSVoK+iFOD3+ku1hGbwVrw3Q3PduUk45W+52VGQJQlPvOw1Sm6jTNht63jN9GiT273ObMJpFFhkin79yfqH1rBQg+FHICw450fk0KZNQ7CIUOBMsx3rIOiOIjrScZPDVUf/oDeRVxHbQBlvJjmsTKd4r09y7iBfKBjIK6Wi3nXwWgCRxWnIMGzlYBRoXeFkdjJw92jC7kkXvwQ9W4UPgR53yeCr/GQyJoc/OS1UwRNScH/cnWJmaO+vq27PEuGA8BQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JdymV3IT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JdymV3IT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNbmv0fN7z3dHC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 00:05:50 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C386ET024821;
	Fri, 12 Sep 2025 14:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=1Fi+81t5zqEybF/Ll9ApuHFjhXkkb1
	vHdHvbxL0Vc8U=; b=JdymV3ITkTcSWYrGAqYC9vUBwbPERmwdJ7SwSpzPahVcmB
	br9gT4phgvwygUUAi3bNoWfXtnHy6dCZTXY+1IcGYGCd6MSDvQFtwZ59FVh14Zkm
	vfzwu2r9YJDSn9D4O25/8kKQeaXBrfxGz7ow9SGeZK6IqKoWvjNrVhipWaODarli
	GtDPVfrbEzN5BeTqC/p995pcDrx5upjpVdi3aGcDIMnh5WmfSVmAgJWAuMpIitpB
	dx+gg/KyXJBqYUJvppfytE11Gs6VCBfid+zHk9Mld+hpjF8BzLN0R4DoaJen6tmh
	Qsj/3X1kE2+aoD7/v/vGVE9/PNoEAxLm1WFuoGLQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmxby8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 14:05:13 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58CE2ClP009324;
	Fri, 12 Sep 2025 14:05:13 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmxby8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 14:05:13 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58CAOXI1010588;
	Fri, 12 Sep 2025 14:05:11 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910snb7ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 14:05:11 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58CE59N522544674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 14:05:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 536162004B;
	Fri, 12 Sep 2025 14:05:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D07120043;
	Fri, 12 Sep 2025 14:05:08 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 12 Sep 2025 14:05:08 +0000 (GMT)
Date: Fri, 12 Sep 2025 16:05:07 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        Mark Rutland <Mark.Rutland@arm.com>
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
Message-ID: <cdd9bc60-96d4-4f19-86c3-dcf598ccbd92-agordeev@linux.ibm.com>
References: <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
 <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
 <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
 <781a6450-1c0b-4603-91cf-49f16cd78c28@arm.com>
 <a17ab4e3-627a-4989-a5a5-d430eadabb86@redhat.com>
 <9ed5441f-cc03-472a-adc6-b9d3ad525664-agordeev@linux.ibm.com>
 <74d1f275-23c3-4fd8-b665-503c7fc87df0@redhat.com>
 <248b4623-8755-4323-8a44-be4af30e4856-agordeev@linux.ibm.com>
 <b46d3430-fb84-464b-b053-490c6ea083da@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b46d3430-fb84-464b-b053-490c6ea083da@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZMmKMxWqtsslbAtdOPAzBRJYU4GL7wAu
X-Proofpoint-ORIG-GUID: j5mM8DCXgm3DPCWWxntSIgsJIjsuTDHV
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68c42899 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=xegNWJJ1Rn4Hofgs2fcA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfXyQgs4MJipRKm
 Vh4mPp8mP6XTDOkYJ7/naEofqsCMunScyHXUNGqkDffcXe8gbUTaR6visxv0m0kRskga/a5g93o
 Y0rVCYsKPe9P0+nMVlo+OxrV7SEnalYxsvJH/2d4bx8m5Zotd/48CmrUGFK82F0g4ZHLlVG2QyQ
 v9UaEdTcRwYdLo8RFKENqA+3oT6sxrdZPoE2SA+aupZ9ucY0p/3lfsPwTVCbkACKw9viHKZUPh5
 sUwnl0/J1iAjs+cvRsvj5o5BYd545b8qOoQTDQow9AxgiianjYJVfAmcO4Lvo/OxYU1Zraata1S
 PL9YSDjhZWpLjBNA8UeDChKZIto5ViRARZ1acta2OR59pSCA4kyBpUWrv47WX0z1P1aU2UCNZhg
 VoRSX1Jb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 12, 2025 at 03:02:15PM +0200, David Hildenbrand wrote:
> How would that work with nesting? I feel like there is a fundamental problem
> with nesting with what you describe but I might be wrong.

My picture is - flush on each lazy_mmu_disable(), pause on lazy_mmu_pause()
and honour only top-level arch_enter_lazy_mmu_mode_pte(mm, start, end, ptep) 
context on all nested levels.

In theory (and if I got it right, you leave the door open for this possibility)
every (mm, start, end, ptep) context could be stored for each nesting level
(as an opaque arch-specific data?).

But I do not really expect it ever, since arch_enter_lazy_mmu_mode_pte()
is only to be called in PTE walkers that never span more than one page
table and follow the pattern:

	ptep = pte_offset_map_lock(...);
	arch_enter_lazy_mmu_mode_pte(mm, start, end, ptep);

	for (...; ptep++) {
		/*
		 * set_pte(ptep, ...) or something
		 */
	}

	arch_leave_lazy_mmu_mode();                                             
	pte_unmap_unlock(...);                                         

As result, the lazy mmu mode is only "bound" to a single PTE table on s390,
while arch_enter_lazy_mmu_mode() is going to stay NOP.

So when you say you feel a fundamental problem - what that could be?

> David / dhildenb

Thanks!

