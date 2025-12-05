Return-Path: <linuxppc-dev+bounces-14666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D02CA9B31
	for <lists+linuxppc-dev@lfdr.de>; Sat, 06 Dec 2025 01:23:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNTV563fZz2y8c;
	Sat, 06 Dec 2025 11:22:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764977545;
	cv=none; b=ojuW8ffnzDcchBOOqKjpFVk21XQnijwuDBvph4E2/IrbXRFBRdsC7LyLpoILllkqXB9xCdcAX4rGkxLtnQo0V171PDCAIIPTYXU+/t65vWAwx2gtosIHQDrhiB4M6ep3OSuOkuY4G48d8VMkAePW2W4gvq91LFURoETpqsKSNF8b7s9g05XOZupubYlv0KSmNbib8za0pkpR7FKmwY+17RVHjkLDjHkroO6Le02zHTwv1qrKF6wZ5KkV98CdbqJP7x+cXFcYZnrF9lffIIwrChTFjus62P4Ua9LCgScL2iplQK0170Wu0m7bcOs8kcupJNm5Ftwgbqd/gNvJV3Dnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764977545; c=relaxed/relaxed;
	bh=DjASHCs44SnDjJeYh3qYw2ycI6GE9TKZGAruEoGfPyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iv4k7y72GgmEBrvX8uIqecw1IziwpL//blXm0rEuwOwX2ixC9XptTqWK90pIiK6EuiINzzlmfodJGOpdJuwCZB5BiqgmWQkbVlX+yHN6UU/6sU2rGv1wtJqSXEFvRX5jjiKbnSD4Lq7jvVfwQY/YyWmYwmMZhEiXKYsXY4hRexChQx5E/XIRHFQ3bCAVVIOy00A9t9b10P+LYVe4EMFQH8/EyAYRfjymaPLcPHrEfM3F25iaFwYGezq4LNRocEL0IpFSr9WWxyVgBlkm7bdy03KAJsIyMtCpcdw3xdsRyrgFANnRWKQFWcW+aKwnXJ2dusdP8SwpSiylUNcWWPnzKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SBOvCAA2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=joshua.hahnjy@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SBOvCAA2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=joshua.hahnjy@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNSMp3ydQz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 10:32:21 +1100 (AEDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-786d1658793so24229427b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 15:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764977539; x=1765582339; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DjASHCs44SnDjJeYh3qYw2ycI6GE9TKZGAruEoGfPyQ=;
        b=SBOvCAA2bDSxhp05NAQd4n7q5k/T7UGU9NImLNbu0+s6gOCmTpT6S6DF/pAGU/k8tL
         RxhxHCYL9g1CjgUDmKgiYlS5EDuo8PiPanAfMmCmUPVXB54ogrA8Ogqau/ew16oF2wyi
         KAxb6Kg8H01+xpVFeotr6kpmflViw4NEtTtcJPYKJrr44wPP+NqV+ASxZ1fIlgtEk5Oe
         a4Tg8AfAvPhezdBJ2I6lFXAMoxl5QHDRjJ5mbmh8YiXYZoBqBel3zWbSEYzKI5gjAxAG
         fVfjEs9CXhLTreZw9Hexs4Qk97z/kqMxGy4Er5F4EtNSMJ3wKjRGPG8hjRdiOCnCzYr1
         PAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764977539; x=1765582339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjASHCs44SnDjJeYh3qYw2ycI6GE9TKZGAruEoGfPyQ=;
        b=GlX/kg+oCGllxOPS4sMIEbEVkI/cfT9RB8uTgV5P0M9HmslgjNOnDxwPxK9FAWSJEs
         kLWoGE27baCp3oyXTSJ7GCKYxQiybDAkWVYyAk49C/Strcx149fnKDEa7ENU3ehuZUxo
         RXp+TjP5KKNlyhBEStTd3NRfzWhyvRX+Pbd52Qhq2gJEdP7k5GR6fUBEFRYzwl4xXLV2
         vue4uw4Ecz7t2IhWr2S1PooncTyqZKGJfoPZJOcLaecIsn5PfWYxG/zrXIQfmLrHGUxA
         zBH1EKvGkoCtQGF8e9oJBZnBcH7WDInpCO8aYiz7r63G9jOCCJllaE5I8Ej++6xyAX6F
         NiCA==
X-Forwarded-Encrypted: i=1; AJvYcCVIn94klI0LoEGmDAxjf95282qNre8kR6y6335PzJAYWqUCHI7Lmlm/oJcU++CCgsjj5bI2BGbC1vdRiA4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyb8AbHFAWSZ9TCv0quJS8rF1dl7xF7KielgkFa7ykqMr044fee
	WswV7e37oHn5HBeb7OglhU7Fv9Pqq203RlNW1VC72zTbmPCzNAig3+OP
X-Gm-Gg: ASbGnctaALiiBLGtyheFtdTfKpu3QB0vubSyhEwTgXlKwYTvSGUd4H45Cv1kAz0pSqX
	7Dhb9p58Kjsma3talhAJ+jgbT4g7WLUe5w7SMHapKczo5RWX5Ifl+vPiAujObtSUZhBT7ibCs6a
	v6wEpTjDQdsjPq0Zks74JSWaO7TgvyguWfymGj2gbwwQedYrpQJJkaYy2xOyMhxioUE/Ka0hfZx
	OlCagmdlVWsv3isDABxGNrbxftSeURR6GqVX01YuD3rbx7SrrGdd2ExMWjcyqUCqYbNt9dUsG67
	YlBxcljWkRAXmQB72oYc3SoHoZfz1LJ1g/ha+hD7eTgIqXa/30vrTqnJQ24tLjQStkkeFjLG74q
	xHtYfzeHBebPLKvO4R/Cco/daxjp/strzaJ6rMOg4hEeQoWC0yk0aAhOlH4Ecq57hzw0bVxObnM
	jVQgaknK42+DQiP/8dlf5l3w==
X-Google-Smtp-Source: AGHT+IHM12t6gDjzVKLcRmx1gB6wbrzIhaFWpatYaAHdWKPgKCT1195aVWoslNVYKST9kzwC9iOyBA==
X-Received: by 2002:a05:690c:7002:b0:786:4f8a:39b5 with SMTP id 00721157ae682-78c33c9797amr14147897b3.59.1764977538563;
        Fri, 05 Dec 2025 15:32:18 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:4a::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4d66fesm22045327b3.23.2025.12.05.15.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 15:32:18 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: willy@infradead.org,
	david@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel-team@meta.com
Subject: [RFC LPC2025 PATCH 0/4] Deprecate zone_reclaim_mode
Date: Fri,  5 Dec 2025 15:32:11 -0800
Message-ID: <20251205233217.3344186-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello folks, 
This is a code RFC for my upcoming discussion at LPC 2025 in Tokyo [1].

<preface>
You might notice that the RFC that I'm sending out is different from the
proposed abstract. Initially when I submitted my proposal, I was interested
in addressing how fallback allocations work under pressure for
NUMA-restricted allocations. Soon after, Johannes proposed a patch [2] which
addressed the problem I was investigating, so I wanted to explore a different
direction in the same area of fallback allocations.

At the same time, I was also thinking about zone_reclaim_mode [3]. I thought
that LPC would be a good opportunity to discuss deprecating zone_reclaim_mode,
so I hope to discuss this topic at LPC during my presentation slot.

Sorry for the patch submission so close to the conference as well. I thought
it would still be better to send this RFC out late, instead of just presenting
the topic at the conference without giving folks some time to think about it.
</preface>

zone_reclaim_mode was introduced in 2005 to prevent the kernel from facing
the high remote access latency associated with NUMA systems. With it enabled,
when the kernel sees that the local node is full, it will stall allocations and
trigger direct reclaim locally, instead of making a remote allocation, even
when there may still be free memory. Thsi is the preferred way to consume memory
if remote memory access is more expensive than performing direct reclaim.
The choice is made on a system-wide basis, but can be toggled at runtime.

This series deprecates the zone_reclaim_mode sysctl in favor of other NUMA
aware mechanisms, such as NUMA balancing, memory.reclaim, membind, and
tiering / promotion / demotion. Let's break down what differences there are
in these mechanisms, based on workload characteristics.

Scenario 1) Workload fits in a single NUMA node
In this case, if the rest of the NUMA node is unused, the zone_reclaim_mode
does nothing. On the other hand, if there are several workloads competing
for memory in the same NUMA node, with sum(workload_mem) > mem_capacity(node),
then zone_reclaim_mode is actively harmful. Direct reclaim is aggressively
triggered whenever one workload makes an allocation that goes over the limit,
and there is no fairness mechanism to prevent one workload from completely
blocking the other workload from making progress.

Scenario 2) Workload does not fit in a single NUMA node
Again, in this case, zone_reclaim_mode is actively harmful. Direct reclaim
will constantly be triggered whenever memory goes above the limit, leading
to memory thrashing. Moreover, even if the user really wants avoid remote
allocations, membind is a better alternative in this case; zone_reclaim_mode
forces the user to make the decision for all workloads on the system, whereas
membind gives per-process granularity.

Scenario 3) Workload size is approximately the same as the NUMA capacity
This is probably the case for most workloads. When it is uncertain whether
memory consumption will exceed the capacity, it doesn't really make a lot
of sense to make a system-wide bet on whether direct reclaim is better or
worse than remote allocations. In other words, it might make more sense to
allow memory to spill over to remote nodes, and let the kernel handle the
NUMA balancing depending on how cold or hot the newly allocated memory is.

These examples might make it seem like zone_reclaim_mode is harmful for
all scenarios. But that is not the case:

Scenario 4) Newly allocated memory is going to be hot
This is probably the scenario that makes zone_reclaim_mode shine the most.
If the newly allocated memory is going to be hot, then it makes much more
sense to try and reclaim locally, which would kick out cold(er) memory and
prevent eating any remote memory access latency frequently.

Scenario 5) Tiered NUMA system makes remote access latency higher
In some tiered memory scenarios, remote access latency can be higher for
lower memory tiers. In these scenarios, the cost of direct reclaim may be
cheaper, relative to placing hot memory on a remote node with high access
latency.

Now, let me try and present a case for deprecating zone_reclaim_mode, despite
these two scenarios where it performs as intended.
In scenario 4, the catch is that the system is not an oracle that can predict
that newly allocated memory is going to be hot. In fact, a lot of the kernel
assumes that newly allocated memory is cold, and it has to "prove" that it
is hot through accesses. In a perfect world, the kernel would be able to
selectively trigger direct reclaim or allocate remotely, based on whehter the
current allocation will be cold or hot in the future.

But without these insights, it is difficult to make a system-wide bet and
always trigger direct reclaim locally, when we might be reclaiming or
evicting relatively hotter memory from the local node in order to make room.

In scenario 5, remote access latency is higher, which means the cost of
placing hot memory in remote nodes is higher. But today, we have many
strategies that can help us overcome the higher cost of placing hot memory in
remote nodes. If the system has tiered memory with different memory
access characteristics per-node, then the user is probably already enabling
promotion and demotion mechanisms that can quickly correct the placement of
hot pages in lower tiers. In these systems, it might make more sense to allow
the kernel to naturally consume all of the memory it can (whether it is local
or on a lower tier remote node), then allow the kernel to then take corrective
action based on what it finds as hot or cold memory.

Of course, demonstrating that there are alternatives is not enough to warrant
a deprecation. I think that the real benefit of this patch comes in reduced
sysctl maintenance and what I think is much easier code to read.

This series which has 466 deletions and 9 insertions:
- Deprecates the zone_reclaim_mode sysctl (patch 4)
- Deprecates the min_slab_ratio sysctl (patch 3)
- Deprecates the min_unmapped_ratio sysctl (patch 3)
- Removes the node_reclaim() function and simplifies the get_page_from_freelist
  watermark checks (which is already a very large function) (patch 2)
- Simplifies hpage_collapse_scan_{pmd, file} (patch 1).
- There are also more opportunities for future cleanup, like removing
  __node_reclaim and converting its last caller to use try_to_free_pages
  (suggested by Johannes Weiner)

Here are some discussion points that I hope to discuss at LPC:
- For workloads that are assumed to fit in a NUMA node, is membind really
  enough to achieve the same effect?
- Is NUMA balancing good enough to correct action when memory spills over to
  remote nodes, and end up being accessed frequently?
- How widely is zone_reclaim_mode currently being used?
- Are there usecases for zone_reclaim_mode that cannot be replaced by any
  of the mentioned alternatives?
- Now that node_reclaim() is deprecated in patch 2, patch 3 deprecates
  min_slab_ratio and min_unmapped_ratio. Does this change make sense?
  IOW, should proactive reclaim via memory.reclaim still care about
  these thresholds before making a decision to reclaim?
- If we agree that there are better alternatives to zone_reclaim_mode, how
  should we make the transition to deprecate it, along with the other
  sysctls that are deprecated in this series (min_{slab, unmapped}_ratio)?

Please also note that I've excluded all individual email addresses for the
Cc list. It was ~30 addresses, as I just wanted to avoid spamming
maintainers and reviewers, so I've just left the mailing list targets.
The individuals are Cc-ed in the relevant patches, though.

Thank you everyone. I'm looking forward to discussing this idea with you all!
Joshua

[1] https://lpc.events/event/19/contributions/2142/
[2] https://lore.kernel.org/linux-mm/20250919162134.1098208-1-hannes@cmpxchg.org/
[3] https://lore.kernel.org/all/20250805205048.1518453-1-joshua.hahnjy@gmail.com/

Joshua Hahn (4):
  mm/khugepaged: Remove hpage_collapse_scan_abort
  mm/vmscan/page_alloc: Remove node_reclaim
  mm/vmscan/page_alloc: Deprecate min_{slab, unmapped}_ratio
  mm/vmscan: Deprecate zone_reclaim_mode

 Documentation/admin-guide/sysctl/vm.rst       |  78 ---------
 Documentation/mm/physical_memory.rst          |   9 -
 .../translations/zh_CN/mm/physical_memory.rst |   8 -
 arch/powerpc/include/asm/topology.h           |   4 -
 include/linux/mmzone.h                        |   8 -
 include/linux/swap.h                          |   5 -
 include/linux/topology.h                      |   6 -
 include/linux/vm_event_item.h                 |   4 -
 include/trace/events/huge_memory.h            |   1 -
 include/uapi/linux/mempolicy.h                |  14 --
 mm/internal.h                                 |  22 ---
 mm/khugepaged.c                               |  34 ----
 mm/page_alloc.c                               | 120 +------------
 mm/vmscan.c                                   | 158 +-----------------
 mm/vmstat.c                                   |   4 -
 15 files changed, 9 insertions(+), 466 deletions(-)


base-commit: e4c4d9892021888be6d874ec1be307e80382f431
-- 
2.47.3

