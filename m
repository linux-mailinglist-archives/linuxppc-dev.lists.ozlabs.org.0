Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CC36FC87
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 16:36:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWw1C6VM1z2yxx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 00:36:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=aoxU14J5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aoxU14J5; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWw0p0Z2vz2xb2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 00:36:23 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id o21so23625721qtp.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yn6cRUZOgPdZlOt5EBUKFzM6s47R+iRZGiASN1vYsQ4=;
 b=aoxU14J5potZB1dXg9Q7C2x7LFjtZngLn0ahKSp/xAqYDnjc2hQh7xowvDgNRxoIvh
 bD1EAWUgsw3EG4T/CHQstKVUN6kuiwE8Kw25LKuiq7rsry+TX5PciEfYjMd46u5/UHCm
 ChFoJHL7WLq/DAP9PA+FIuYwxIffO755NsywxjdoHut0PXW3FoKVeqqSgK/DlO0pnIOJ
 dLGkgdFBxHArWpThE9tUduLiMBjNudB6WmKCF1AtqKRxyE26IG8LsFG438Rbw/7mQLLI
 ANANW+uL7T+W3Yx9w7rv1qdF8GdYNUXOcOWFleHHrW9eJjSCGue6iTOCHGkuqLgse8Dp
 eMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yn6cRUZOgPdZlOt5EBUKFzM6s47R+iRZGiASN1vYsQ4=;
 b=L4Sd7LCUhGHv2iDfz2u6hEPilhDR57qQ1lorvcQDKjUBWpa01tCAW4CrbUMGgF/wGO
 qllDKMOpyKQV/lTJVI7coyp8j1cUUaztnJIpYqaaHhbyoDYPZMGHO96GIlk49rk9sgwJ
 h8Fq0kM5agFYaZJmI2UR4ngOpY9rT8VpOj7N9zuhzmuWoKOIptl9x4dlESLjiKavJlgr
 Mm7zpOTAQi4xA8ktMBya7rO9q/dSKacANzvZzOTEpKxsRNTe594Kjd/fmj9sxqW0QcAe
 rR9P+6vp/Cucg1ksyR4ZQHnrIDjbi03n3NYh2O01PBz/oorebYBqbNcdk31NtO5jCYZB
 t97Q==
X-Gm-Message-State: AOAM533OKxDRf4lc500+gQi8nxOPK1geJECETRMuJubWQTKqJ0N2lxDD
 poT4KdZvMHKY7t0mcHXf3Hk=
X-Google-Smtp-Source: ABdhPJyYWXW1/5+XXCLmoSfDUVveeDxgw8oPV0pE61dNT8mV2KAhhW8tMLPpeXpbnie+jHyvKi2O9Q==
X-Received: by 2002:ac8:6b8d:: with SMTP id z13mr4744880qts.31.1619793379867; 
 Fri, 30 Apr 2021 07:36:19 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([2804:14c:482:7b04::1001])
 by smtp.gmail.com with ESMTPSA id 190sm1532560qki.115.2021.04.30.07.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 07:36:19 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Sandipan Das <sandipan@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Scott Cheloha <cheloha@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>
Subject: [PATCH v2 0/3] powerpc/mm/hash: Time improvements for memory
 hot(un)plug
Date: Fri, 30 Apr 2021 11:36:04 -0300
Message-Id: <20210430143607.135005-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.30.2
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

Changes since v1:
- Atomic used to disable resize was replaced by a mutex
- Removed wrappers, testing for !radix directly in hot(un)plug routine
- Added bounds to HPT resize loop
- Removed batching from dlpar_memory_*_by_index, as it adds a single LMB 

Best regards,
Leonardo Bras (3):
  powerpc/mm/hash: Avoid resizing-down HPT on first memory hotplug
  powerpc/mm/hash: Avoid multiple HPT resize-ups on memory hotplug
  powerpc/mm/hash: Avoid multiple HPT resize-downs on memory hotunplug

 arch/powerpc/include/asm/book3s/64/hash.h     |  4 +
 arch/powerpc/mm/book3s64/hash_utils.c         | 95 ++++++++++++++++---
 .../platforms/pseries/hotplug-memory.c        | 35 +++++++
 3 files changed, 119 insertions(+), 15 deletions(-)

-- 
2.30.2

