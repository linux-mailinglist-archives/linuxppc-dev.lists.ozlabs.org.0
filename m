Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC26338690
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 08:32:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxcvx2VdRz3d5c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 18:32:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=U1Aax+Gx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U1Aax+Gx; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxcvS02hWz3cH8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 18:31:45 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id 6so3107929qty.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 23:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wTTL3epqLr8n/6ho+8HvrvB50DNSmJF+IOAwdRQ37Jw=;
 b=U1Aax+GxxM2k71AkvU4mXJXmXQk/7ENUFn9AAmEijKBQ1GuuDiSmPOAjF2KqEdZTTP
 ivX3CWgyOEzMYN0Vo3SVkfvwhhfgVRonJWO2FLLBQFldQBCSEtWbufV5nFeCMhlbh+u3
 yq5f/5KAjtchym0M0Z9H8bwXFhBI4C0QbRYY9lxC2g1vaemG2av+dBiM+cNw9NX8kIR9
 e6UhwhPasOK/N3Nhs/vvE4rN8XKVBUrGiZmZ9vgkwgYzSkeYSB2T35oWNoqWk2CETPef
 4Kd/YlbXEM744cv8GSEyknAd6BEFZJacr6NK0TwLntGLGLTguy5fqJvkHxpvazVoZ8hO
 7OEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wTTL3epqLr8n/6ho+8HvrvB50DNSmJF+IOAwdRQ37Jw=;
 b=UEJuUShHpZKHwzKuGbenC+P1oKzyt4aXVNAE6h54IuvGC7+UtgFIDeGOFi9V1sSjBN
 /YVbK5umF1bizk4b1cT/hWGvoW225VlMiL7bMgG9MPKWBzsf3jRgoyGLVHnmO9AQwMnX
 hID1E4K99BeXVx5ayw2yXs57KRGFFLL/ogIZmQYzvr7sEBPTsvmuxjg46MpQ8UDNXodK
 mJT7K3Ttu9D7BBGh0D1LROgRCXrUeMqx3MQiHrZV3oK1S5x6DADTtq1ye0t5PAgQ3IMb
 3w3BI3zaGFMom60cRG8grLXncfq4Fv4XFZyhMJb0JBVdzITirieaJ1W46Ha81LXwbBHG
 SBZA==
X-Gm-Message-State: AOAM53017wlxu5/JR5YbF6ydsgNLlMxm7MQsLl1JNzCGB8RiTBysRh7w
 XW4Yq9iAWvE0dT+HNmfR1JM=
X-Google-Smtp-Source: ABdhPJxJe0h1hfDAK/LtqJvlL29vIrVqqNPbLGXTE5YMdHJa0P/iNR0RKkEaRP7MQm78oCW/YEhzPw==
X-Received: by 2002:ac8:4543:: with SMTP id z3mr10845208qtn.286.1615534303274; 
 Thu, 11 Mar 2021 23:31:43 -0800 (PST)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 (177-131-89-8.dynamic.desktop.com.br. [177.131.89.8])
 by smtp.gmail.com with ESMTPSA id t6sm3434026qti.2.2021.03.11.23.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 23:31:42 -0800 (PST)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leonardo Bras <leobras.c@gmail.com>, Sandipan Das <sandipan@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>, Mike Rapoport <rppt@kernel.org>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 Scott Cheloha <cheloha@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 0/3] powerpc/mm/hash: Time improvements for memory hot(un)plug
Date: Fri, 12 Mar 2021 04:29:38 -0300
Message-Id: <20210312072940.598696-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset intends to reduce time needed for processing memory
hotplug/hotunplug in hash guests.

The first one, makes sure guests with pagesize over 4k don't need to
go through HPT resize-downs after memory hotplug.

The second and third patches make hotplug / hotunplug perform a single
HPT resize per operation, instead of one for each shift change, or one
for each LMB in case of resize-down error.

Why haven't the same mechanism used for both memory hotplug and hotunplug?
They both have different requirements:

Memory hotplug causes (usually) HPT resize-ups, which are fine happening
at the start of hotplug, but resize-ups should not ever be disabled, as
other mechanisms may try to increase memory, hitting issues with a HPT
that is too small.

Memory hotunplug causes HPT resize-downs, which can be disabled (HPT will
just remain larger for a while), but need to happen at the end of an
hotunplug operation. If we want to batch it, we need to disable
resize-downs and perform it only at the end.

Tests done with this patchset in the same machine / guest config:
Starting memory: 129GB, DIMM: 256GB
Before patchset: hotplug = 710s, hotunplug = 621s.
After patchset: hotplug  = 21s, hotunplug = 100s.

Any feedback will be appreciated!
I believe the code may not be very well placed in available files,
so please give some feedback on that.

Best regards,

Leonardo Bras (3):
  powerpc/mm/hash: Avoid resizing-down HPT on first memory hotplug
  powerpc/mm/hash: Avoid multiple HPT resize-ups on memory hotplug
  powerpc/mm/hash: Avoid multiple HPT resize-downs on memory hotunplug

 arch/powerpc/include/asm/book3s/64/hash.h     |  4 +
 arch/powerpc/include/asm/sparsemem.h          |  4 +
 arch/powerpc/mm/book3s64/hash_utils.c         | 78 +++++++++++++++----
 arch/powerpc/mm/book3s64/pgtable.c            | 18 +++++
 .../platforms/pseries/hotplug-memory.c        | 22 ++++++
 5 files changed, 111 insertions(+), 15 deletions(-)

-- 
2.29.2

