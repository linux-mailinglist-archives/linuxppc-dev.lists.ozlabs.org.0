Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B52EA375785
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 17:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbd3q52Zzz304Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 01:36:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm3 header.b=hdYJWH8e;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qf4gh/Oo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm3 header.b=hdYJWH8e; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=qf4gh/Oo; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbd2q1s2mz301N
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 01:36:02 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 42165580B72;
 Thu,  6 May 2021 11:26:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 06 May 2021 11:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:reply-to:mime-version
 :content-transfer-encoding; s=fm3; bh=idfxFi2niIlXphs1rSRpisMaNe
 RwPzwfRsm8hAUYBvQ=; b=hdYJWH8eNG6Nd+MRc3r283kN9IufmtoATaqfCU96YH
 ZKyLzDOs9mGhZSlD83jeL7H3DOqnFDCXn/VXD229UiHg68Vz+1cHYe64OVsP7fXV
 7i456IoTE2D8mIiUzaHreIvLE4WMfptERGMoBchm/EYEioelxClLvi0cEjk2Z8se
 Arvfi8vRUcvLA33pxjnXxQmlCVsyXNryd5LfhOBp+3pZvqI36t6IK+pdROusiIec
 gXu5SgWTBHSw0qxydioj5F1Ec3AtLzDDc5vIue2gJTGi+JN2UwBs88PaeFZ6CQwn
 7QhhXtghvdNckXVzjjQVUrQkB4SzeptEzI7DHQV/sbdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:reply-to:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=idfxFi
 2niIlXphs1rSRpisMaNeRwPzwfRsm8hAUYBvQ=; b=qf4gh/OodsbTyJHDo4/xMy
 XWnV10CwU190E3R4EbQH9v7/GANI/SHKBnKoNo+YtkMbM4Vnc0BA5STeVvOx5JAk
 QbOEJpYSN6+uvVxGfYHFJ7L3SvqPtmevmMEDxN1/w8HICPWdYg8gr/6WF1OWeC4H
 x2aX6/hzkjEnSGvUlD4WKg8F33YuV3SGpHhpJSiE/1iJqiNVsfPZAdb84Jetu6qY
 XNunEtvZhRhT1qIed+Qn+KrN2qp8++eFknjSTrCea322qDnqF8r0r698iXZ52kMQ
 De9S9QiodAWedpRqKM1DYX+rI3FeGwLbUo0bV5DgW4WFjPJIr4TakXPY/JZ5BjHg
 ==
X-ME-Sender: <xms:uAqUYGrwd9gPeAKsoo4Q35DN0k21ih8YX-F7vzB6dcZOwBTsluMPHA>
 <xme:uAqUYEq1vsKttdYmZns8vQbuUYqZk39i0XwlelX-r-VtyfJ3I2ACSUXUGpHbFA3EP
 wWe297Cea3xOilLwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkfforhgggfestdhqredtredttdenucfhrhhomhepkghiucgjrghn
 uceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepleetvddtvd
 dttdetffdvkeehffdtjefhkedtheffjeehvdejueektedukedufeffnecukfhppeefhedr
 udeigedrvdegiedrfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepiihirdihrghnsehsvghnthdrtghomh
X-ME-Proxy: <xmx:uAqUYLMErIUfUFgMn1Vg0Q8SCoKDDurhsnrKYRq-xtYdzqauGYzLgw>
 <xmx:uAqUYF4-Xkq7P3NYOoeHTxUKG1hdAQ7AhkWafRv4kOcorhVsc6ei9w>
 <xmx:uAqUYF7GFJU0sPIbPhr2222mLMhPSovf0-OhxdVibP6BnVZGPfaFkg>
 <xmx:ugqUYJrOGyYPTPEPpXL4CcsRluA-FRybwYHrtZtKjxQVPTg6ZHctJQ>
Received: from Threadripper.local
 (ec2-35-164-246-34.us-west-2.compute.amazonaws.com [35.164.246.34])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu,  6 May 2021 11:26:44 -0400 (EDT)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [RFC PATCH 0/7] Memory hotplug/hotremove at subsection size
Date: Thu,  6 May 2021 11:26:16 -0400
Message-Id: <20210506152623.178731-1-zi.yan@sent.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: Zi Yan <ziy@nvidia.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, x86@kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Zi Yan <ziy@nvidia.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zi Yan <ziy@nvidia.com>

Hi all,

This patchset tries to remove the restriction on memory hotplug/hotremove
granularity, which is always greater or equal to memory section size[1].
With the patchset, kernel is able to online/offline memory at a size indepe=
ndent
of memory section size, as small as 2MB (the subsection size).

The motivation is to increase MAX_ORDER of the buddy allocator and pageblock
size without increasing memory hotplug/hotremove granularity at the same ti=
me,
so that the kernel can allocator 1GB pages using buddy allocator and utiliz=
es
existing pageblock based anti-fragmentation, paving the road for 1GB THP
support[2].

The patchset utilizes the existing subsection support[3] and changes the
section size alignment checks to subsection size alignment checks. There are
also changes to pageblock code to support partial pageblocks, when pageblock
size is increased along with MAX_ORDER. Increasing pageblock size can enable
kernel to utilize existing anti-fragmentation mechanism for gigantic page
allocations.

The last patch increases SECTION_SIZE_BITS to demonstrate the use of memory
hotplug/hotremove subsection, but is not intended to be merged as is. It is
there in case one wants to try this out and will be removed during the final
submission.

Feel free to give suggestions and comments. I am looking forward to your
feedback.

Thanks.

Zi Yan (7):
  mm: sparse: set/clear subsection bitmap when pages are
    onlined/offlined.
  mm: set pageblock_order to the max of HUGETLB_PAGE_ORDER and
    MAX_ORDER-1
  mm: memory_hotplug: decouple memory_block size with section size.
  mm: pageblock: allow set/unset migratetype for partial pageblock
  mm: memory_hotplug, sparse: enable memory hotplug/hotremove
    subsections
  arch: x86: no MAX_ORDER exceeds SECTION_SIZE check for 32bit vdso.
  [not for merge] mm: increase SECTION_SIZE_BITS to 31

 arch/ia64/Kconfig                |   1 -
 arch/powerpc/Kconfig             |   1 -
 arch/x86/Kconfig                 |  15 +++
 arch/x86/entry/vdso/Makefile     |   1 +
 arch/x86/include/asm/sparsemem.h |   2 +-
 drivers/base/memory.c            | 176 +++++++++++++++----------------
 drivers/base/node.c              |   2 +-
 include/linux/memory.h           |   8 +-
 include/linux/mmzone.h           |   2 +
 include/linux/page-isolation.h   |   8 +-
 include/linux/pageblock-flags.h  |   9 --
 mm/Kconfig                       |   7 --
 mm/memory_hotplug.c              |  22 ++--
 mm/page_alloc.c                  |  40 ++++---
 mm/page_isolation.c              |  30 +++---
 mm/sparse.c                      |  55 ++++++++--
 16 files changed, 219 insertions(+), 160 deletions(-)

--=20
2.30.2

