Return-Path: <linuxppc-dev+bounces-14581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51248C9FD58
	for <lists+linuxppc-dev@lfdr.de>; Wed, 03 Dec 2025 17:10:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dM2fg45dWz2yrl;
	Thu, 04 Dec 2025 03:10:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764778219;
	cv=none; b=iSjKYZtyMoRArmNCNEO0cVTqwmIMDd7a4JDFBP0bIb8lvhT+BSyO5kiIAk14cckamWWWI/CUwIYTj7xOozEmvCQxSRZhgnVkmoKfWVTDJ6CrA936/ifp7+AbuUUocOOOwUStOLKjBHmJpIMnfz1gAAcXlKOD5kW0c5cLODT1h55behkD66DtQFQi0s3i7QZOVKYmXZqU+X1a1SuuOqzMG40+SjXeHxzu0USSHb597Oa/otdvT07Uok5/NlevJsMnnxnpC8Xjsa1/xI9Dau6wWQut4vKaVc4cXEmk/PuUgcskpH0poXp5vHfyD/4QRGdikzQkgotZqI/pObOfKIc1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764778219; c=relaxed/relaxed;
	bh=jXScALikZ30hQ2GZgvAK3QYxrVSr7/W2SKCyOSYy+M8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fYcY1Cl5FYdCbf7ToybrV1XTF1JS307v2pxnvQ5jxECrnhcUfmIe4+d+onBHvWH8a93gMA0Z3gQVL8Iino1AgoKnr0612ox0d0b4pEG/Hde7O8aMek05U0PY0/CFO6D5AERZUN918yb1N5rgIj7iwYrl1kZ6dbR+Xvym90yIHfd3hrgRoIRPx6qsS3u2vEM8dK90/HOrLySfJX8IVLO/qCYqf4RYwOkqLv0LXwZx9tTaBYzqY1m8mpH0Y1r3cVbMl64xigAgFEPEJGp01F/l5N/En6XDt2jUCwcEkBBtJTuTdbmsc6GCiDfaJFnSgZfNVqfQ/feuSIrjqLOqEaW1ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OzAaPrJ9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OzAaPrJ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dM2fd1TSRz2xNj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 03:10:16 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B3CO5ib017680;
	Wed, 3 Dec 2025 16:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jXScAL
	ikZ30hQ2GZgvAK3QYxrVSr7/W2SKCyOSYy+M8=; b=OzAaPrJ9niAlz8YUabjc2c
	D2rDIzen8I5c7OyZYxx2URHyV2XunQ2MUcgBaoNzneCJqJaoH45EyqRiZgfDjB+/
	veCs0WNuB+IbYJeej2GoS0RN8J1IpA0hi2OgqVMfSotjONRPs+k2RuSnMpFy8HHN
	uiAleHpdwlEsdAtRS2pAUCQ172+p/m8QMwvQAm9OmQg8jrxQBSxTCS49GJQDM/hd
	YaiXShCl1Wyn3/gTBPTCgGV783dZ+t3yx4e2oTF2YM1ZjRt408LJ08mvqP4uL2wh
	+BFiORtd4IG/QtGj3cFZ2h8ZbcqM1iCSyZ+Ofzu8c0xTKmsr/4136UJDD7xjesdw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh73qnt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 16:09:15 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B3G6PaS010932;
	Wed, 3 Dec 2025 16:09:14 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh73qnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 16:09:14 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B3E9LMX021504;
	Wed, 3 Dec 2025 16:09:13 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4at8c6c5et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 16:09:13 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B3G9B5859572634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Dec 2025 16:09:11 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7232D5805E;
	Wed,  3 Dec 2025 16:09:11 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DA365805D;
	Wed,  3 Dec 2025 16:09:00 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.245.178])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  3 Dec 2025 16:08:59 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v5 00/12] Nesting support for lazy MMU mode
From: Venkat <venkat88@linux.ibm.com>
In-Reply-To: <20251124132228.622678-1-kevin.brodsky@arm.com>
Date: Wed, 3 Dec 2025 21:38:46 +0530
Cc: linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        David Woodhouse <dwmw2@infradead.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        x86@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <94889730-1AEF-458F-B623-04092C0D6819@linux.ibm.com>
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dK+rWeZb c=1 sm=1 tr=0 ts=693060ab cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8 a=NEAV23lmAAAA:8
 a=VnNF1IyMAAAA:8 a=ebG-ZW-8AAAA:8 a=Z4Rwk6OoAAAA:8 a=yPCof4ZbAAAA:8
 a=1UX6Do5GAAAA:8 a=QyXUC8HyAAAA:8 a=J1Y8HTJGAAAA:8 a=JfrnYn6hAAAA:8
 a=oGMlB6cnAAAA:8 a=1XWaLZrsAAAA:8 a=iox4zFpeAAAA:8 a=pGLkceISAAAA:8
 a=voM4FWlXAAAA:8 a=cWRNjhkoAAAA:8 a=FiMq9w3UmxbX_X-K2aIA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Bj2TwAA_C77lQ_X2_dkp:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=Et2XPkok5AAZYJIKzHr1:22 a=y1Q9-5lHfBjTkpIzbSAN:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=NdAtdrkLVvyUPsUoGJp4:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=IC2XNlieTeVoXbcui8wp:22
 a=sVa6W5Aao32NNC1mekxh:22
X-Proofpoint-GUID: 793QMPZ1KY-blGu-SBEcqhhoUxKTBTPT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX0Y2RJ6pY6f9G
 m7cnnUyc3HVayFdbJ8Y4k6LXm7VoMHSKC06j1sstdK8iRNOp43h8/5lXlJzRyMFMOkegM/YL0t7
 uHv9SIDvRWXY/EKqqrIimWlBZRLSRAgOBF4gk2Xot87tbYXsiVnaukxT1saJqjqQ0r0bPe10fQw
 ebRokn+rP5Dr6S57DFJViOyBvzPSu7nMhQXml2iQlGg8l7boxqiMcoTdjYFnse6EYftUPjxeWZe
 MGmnOFTxzjWPZDmm/bKQ+e3L/l/GwpDCojvQuL7j2d5Yz5YuziA0XIkWiBZW3RPXY32AZclnmqt
 wPoca86vF4yKC81xjojgszJzuCIvZcNgdX7sNhM04AVP6ms5j1l2VO43joUDFPf3weZ3oFA5u7V
 hBuOHcByMOvgTlotD8Cjz6ve04L0kw==
X-Proofpoint-ORIG-GUID: -W-wtyUpyFvwADIN6iXaZYxBgTf_cVPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 24 Nov 2025, at 6:52=E2=80=AFPM, Kevin Brodsky =
<kevin.brodsky@arm.com> wrote:
>=20
> When the lazy MMU mode was introduced eons ago, it wasn't made clear
> whether such a sequence was legal:
>=20
> arch_enter_lazy_mmu_mode()
> ...
> arch_enter_lazy_mmu_mode()
> ...
> arch_leave_lazy_mmu_mode()
> ...
> arch_leave_lazy_mmu_mode()
>=20
> It seems fair to say that nested calls to
> arch_{enter,leave}_lazy_mmu_mode() were not expected, and most
> architectures never explicitly supported it.
>=20
> Nesting does in fact occur in certain configurations, and avoiding it
> has proved difficult. This series therefore enables lazy_mmu sections =
to
> nest, on all architectures.
>=20
> Nesting is handled using a counter in task_struct (patch 8), like =
other
> stateless APIs such as pagefault_{disable,enable}(). This is fully
> handled in a new generic layer in <linux/pgtable.h>; the arch_* API
> remains unchanged. A new pair of calls, =
lazy_mmu_mode_{pause,resume}(),
> is also introduced to allow functions that are called with the lazy =
MMU
> mode enabled to temporarily pause it, regardless of nesting.
>=20
> An arch now opts in to using the lazy MMU mode by selecting
> CONFIG_ARCH_LAZY_MMU; this is more appropriate now that we have a
> generic API, especially with state conditionally added to task_struct.
>=20
> ---
>=20
> Background: Ryan Roberts' series from March [1] attempted to prevent
> nesting from ever occurring, and mostly succeeded. Unfortunately, a
> corner case (DEBUG_PAGEALLOC) may still cause nesting to occur on =
arm64.
> Ryan proposed [2] to address that corner case at the generic level but
> this approach received pushback; [3] then attempted to solve the issue
> on arm64 only, but it was deemed too fragile.
>=20
> It feels generally difficult to guarantee that lazy_mmu sections don't
> nest, because callers of various standard mm functions do not know if
> the function uses lazy_mmu itself.
>=20
> The overall approach in v3/v4 is very close to what David Hildenbrand
> proposed on v2 [4].
>=20
> Unlike in v1/v2, no special provision is made for architectures to
> save/restore extra state when entering/leaving the mode. Based on the
> discussions so far, this does not seem to be required - an arch can
> store any relevant state in thread_struct during arch_enter() and
> restore it in arch_leave(). Nesting is not a concern as these =
functions
> are only called at the top level, not in nested sections.
>=20
> The introduction of a generic layer, and tracking of the lazy MMU =
state
> in task_struct, also allows to streamline the arch callbacks - this
> series removes 67 lines from arch/.
>=20
> Patch overview:
>=20
> * Patch 1: cleanup - avoids having to deal with the powerpc
>  context-switching code
>=20
> * Patch 2-4: prepare arch_flush_lazy_mmu_mode() to be called from the
>  generic layer (patch 8)
>=20
> * Patch 5-6: new API + CONFIG_ARCH_LAZY_MMU
>=20
> * Patch 7: ensure correctness in interrupt context
>=20
> * Patch 8: nesting support
>=20
> * Patch 9-12: replace arch-specific tracking of lazy MMU mode with
>  generic API
>=20
> This series has been tested by running the mm kselftests on arm64 with
> DEBUG_VM, DEBUG_PAGEALLOC, KFENCE and KASAN. It was also build-tested =
on
> other architectures (with and without XEN_PV on x86).
>=20
> - Kevin
>=20
> [1] =
https://lore.kernel.org/all/20250303141542.3371656-1-ryan.roberts@arm.com/=

> [2] =
https://lore.kernel.org/all/20250530140446.2387131-1-ryan.roberts@arm.com/=

> [3] =
https://lore.kernel.org/all/20250606135654.178300-1-ryan.roberts@arm.com/
> [4] =
https://lore.kernel.org/all/ef343405-c394-4763-a79f-21381f217b6c@redhat.co=
m/
> ---
> Changelog
>=20
> v4..v5:
>=20
> - Rebased on mm-unstable
> - Patch 3: added missing radix_enabled() check in arch_flush()
>  [Ritesh Harjani]
> - Patch 6: declare arch_flush_lazy_mmu_mode() as static inline on x86
>  [Ryan Roberts]
> - Patch 7 (formerly 12): moved before patch 8 to ensure correctness in
>  interrupt context [Ryan]. The diffs in in_lazy_mmu_mode() and
>  queue_pte_barriers() are moved to patch 8 and 9 resp.
> - Patch 8:
>  * Removed all restrictions regarding lazy_mmu_mode_{pause,resume}().
>    They may now be called even when lazy MMU isn't enabled, and
>    any call to lazy_mmu_mode_* may be made while paused (such calls
>    will be ignored). [David, Ryan]
>  * lazy_mmu_state.{nesting_level,active} are replaced with
>    {enable_count,pause_count} to track arbitrary nesting of both
>    enable/disable and pause/resume [Ryan]
>  * Added __task_lazy_mmu_mode_active() for use in patch 12 [David]
>  * Added documentation for all the functions [Ryan]
> - Patch 9: keep existing test + set TIF_LAZY_MMU_PENDING instead of
>  atomic RMW [David, Ryan]
> - Patch 12: use __task_lazy_mmu_mode_active() instead of accessing
>  lazy_mmu_state directly [David]
> - Collected R-b/A-b tags
>=20
> v4: =
https://lore.kernel.org/all/20251029100909.3381140-1-kevin.brodsky@arm.com=
/
>=20
> v3..v4:
>=20
> - Patch 2: restored ordering of preempt_{disable,enable}() [Dave =
Hansen]
> - Patch 5 onwards: s/ARCH_LAZY_MMU/ARCH_HAS_LAZY_MMU_MODE/ [Mike =
Rapoport]
> - Patch 7: renamed lazy_mmu_state members, removed VM_BUG_ON(),
>  reordered writes to lazy_mmu_state members [David Hildenbrand]
> - Dropped patch 13 as it doesn't seem justified [David H]
> - Various improvements to commit messages [David H]
>=20
> v3: =
https://lore.kernel.org/all/20251015082727.2395128-1-kevin.brodsky@arm.com=
/
>=20
> v2..v3:
>=20
> - Full rewrite; dropped all Acked-by/Reviewed-by.
> - Rebased on v6.18-rc1.
>=20
> v2: =
https://lore.kernel.org/all/20250908073931.4159362-1-kevin.brodsky@arm.com=
/
>=20
> v1..v2:
> - Rebased on mm-unstable.
> - Patch 2: handled new calls to enter()/leave(), clarified how the =
"flush"
>  pattern (leave() followed by enter()) is handled.
> - Patch 5,6: removed unnecessary local variable [Alexander Gordeev's
>  suggestion].
> - Added Mike Rapoport's Acked-by.
>=20
> v1: =
https://lore.kernel.org/all/20250904125736.3918646-1-kevin.brodsky@arm.com=
/
> ---
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Jann Horn <jannh@google.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: sparclinux@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: x86@kernel.org
> ---
> Alexander Gordeev (1):
>  powerpc/64s: Do not re-activate batched TLB flush
>=20
> Kevin Brodsky (11):
>  x86/xen: simplify flush_lazy_mmu()
>  powerpc/mm: implement arch_flush_lazy_mmu_mode()
>  sparc/mm: implement arch_flush_lazy_mmu_mode()
>  mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
>  mm: introduce generic lazy_mmu helpers
>  mm: bail out of lazy_mmu_mode_* in interrupt context
>  mm: enable lazy_mmu sections to nest
>  arm64: mm: replace TIF_LAZY_MMU with in_lazy_mmu_mode()
>  powerpc/mm: replace batch->active with in_lazy_mmu_mode()
>  sparc/mm: replace batch->active with in_lazy_mmu_mode()
>  x86/xen: use lazy_mmu_state when context-switching
>=20
> arch/arm64/Kconfig                            |   1 +
> arch/arm64/include/asm/pgtable.h              |  41 +----
> arch/arm64/include/asm/thread_info.h          |   3 +-
> arch/arm64/mm/mmu.c                           |   4 +-
> arch/arm64/mm/pageattr.c                      |   4 +-
> .../include/asm/book3s/64/tlbflush-hash.h     |  20 ++-
> arch/powerpc/include/asm/thread_info.h        |   2 -
> arch/powerpc/kernel/process.c                 |  25 ---
> arch/powerpc/mm/book3s64/hash_tlb.c           |  10 +-
> arch/powerpc/mm/book3s64/subpage_prot.c       |   4 +-
> arch/powerpc/platforms/Kconfig.cputype        |   1 +
> arch/sparc/Kconfig                            |   1 +
> arch/sparc/include/asm/tlbflush_64.h          |   5 +-
> arch/sparc/mm/tlb.c                           |  14 +-
> arch/x86/Kconfig                              |   1 +
> arch/x86/boot/compressed/misc.h               |   1 +
> arch/x86/boot/startup/sme.c                   |   1 +
> arch/x86/include/asm/paravirt.h               |   1 -
> arch/x86/include/asm/pgtable.h                |   1 +
> arch/x86/include/asm/thread_info.h            |   4 +-
> arch/x86/xen/enlighten_pv.c                   |   3 +-
> arch/x86/xen/mmu_pv.c                         |   6 +-
> fs/proc/task_mmu.c                            |   4 +-
> include/linux/mm_types_task.h                 |   5 +
> include/linux/pgtable.h                       | 147 +++++++++++++++++-
> include/linux/sched.h                         |  45 ++++++
> mm/Kconfig                                    |   3 +
> mm/kasan/shadow.c                             |   8 +-
> mm/madvise.c                                  |  18 +--
> mm/memory.c                                   |  16 +-
> mm/migrate_device.c                           |   8 +-
> mm/mprotect.c                                 |   4 +-
> mm/mremap.c                                   |   4 +-
> mm/userfaultfd.c                              |   4 +-
> mm/vmalloc.c                                  |  12 +-
> mm/vmscan.c                                   |  12 +-
> 36 files changed, 282 insertions(+), 161 deletions(-)

Tested this patch series by applying on top of mm-unstable, on both HASH =
and RADIX MMU, and all tests are passed on both MMU=E2=80=99s.

Ran: cache_shape, copyloops, mm from linux source, selftests/powerpc/ =
and ran memory-hotplug from selftests/. Also ran below tests from =
avocado misc-test repo.

Link to repo: =
https://github.com/avocado-framework-tests/avocado-misc-tests

avocado-misc-tests/memory/stutter.py
avocado-misc-tests/memory/eatmemory.py
avocado-misc-tests/memory/hugepage_sanity.py
avocado-misc-tests/memory/fork_mem.py
avocado-misc-tests/memory/memory_api.py
avocado-misc-tests/memory/mprotect.py
avocado-misc-tests/memory/vatest.py =
avocado-misc-tests/memory/vatest.py.data/vatest.yaml
avocado-misc-tests/memory/transparent_hugepages.py
avocado-misc-tests/memory/transparent_hugepages_swapping.py
avocado-misc-tests/memory/transparent_hugepages_defrag.py
avocado-misc-tests/memory/ksm_poison.py

If its good enough, please add below tag for PowerPC changes.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.
>=20
>=20
> base-commit: 1f1edd95f9231ba58a1e535b10200cb1eeaf1f67
> --=20
> 2.51.2
>=20


