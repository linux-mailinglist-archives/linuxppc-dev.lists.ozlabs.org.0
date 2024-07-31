Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D07F942872
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 09:57:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TUyLhetf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYkvr26rMz3d32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 17:57:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TUyLhetf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYkv76g3kz3cfx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 17:56:34 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7a264a24ea7so3649811a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 00:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722412591; x=1723017391; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ly6ObXLtZ2Lma9nIPZMb22qFpGXI//9dL0Od4IAzlo0=;
        b=TUyLhetf5Miqidlq5PRSPPfmqKhENslr17v2tvswTrhOz5fKKm6aCELgmdmwtH2MS7
         zSIGO7+yD230Pafjaj5QA153jWHiBAjYI65E22KTNETztQArCeI6kEGDF8OsbSiamd/L
         kebMl7w0WqHTKFGuyPnBk3J2/Iv0yF5NqYqxzf1O8GPL2bdG7KJZPj81h60Iz3BDjMb8
         as0nQ6220Jjd3n9GFXqUFVqlX8P36q56kJTVSF6/2T+ir6SuNGvvtnKslbEA4uI5TrdI
         BP5/vorrwBiEo4qYRx8SnCy0wj0Q69HrKeBBeRQeFo7PGByujIGNoQSA9xNUAil0YG8J
         lFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412591; x=1723017391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ly6ObXLtZ2Lma9nIPZMb22qFpGXI//9dL0Od4IAzlo0=;
        b=BbMpKxqAKUmYdDCiIkN0bqy1GgZsxFM44sBzu3NZL5fYpRVf5oOM5ZDE7XXBfWwP72
         Tv5FYL35yP/smgEUoMkdLtw7B6A7Iilo00OtCQslJANEILH/+RyGjXrnuHpAH6xoo4Yq
         X9wEZAb7ceM9M0E/RRNHc1SYXfKGcKnLBFPWCbILdZexh3+hwhunKvUSSoBASqVe77D+
         5ovOV2Mnlsj0QBD7s+6MNpzP0sF81879YdUP+8F4qocsZa82gYyrUoYXy23j7XGZRWsm
         wEDcHbIZMJEAc3ROgtEZTPAr213t08Utdo4w2a44VR/Q/3t7adlDHE4GkdvBZZ75vdB5
         cU4Q==
X-Gm-Message-State: AOJu0YzHtsy1eOqJxaiuVy/OL4ToktJ0Ub8pAtJ+/EZfIIgFbm7COzGX
	mcza3ZwsctuNTkntaqAy6/d5/vHIXZQKMnWpeP6wi1cHs3ZZGCR0lb5p9w==
X-Google-Smtp-Source: AGHT+IG3M6CVBAdheTgt7ZXnxB4ff0uCMuTJd9WhZVaoC1cs3wr/rJxNB7ZwdaqX1vtiMp7yky16oQ==
X-Received: by 2002:a05:6300:668a:b0:1c4:c160:2859 with SMTP id adf61e73a8af0-1c4c1602c5bmr12194155637.31.1722412590975;
        Wed, 31 Jul 2024 00:56:30 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.83.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e16fbsm9788372b3a.19.2024.07.31.00.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:56:30 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC v1 00/10] book3s64/hash: Improve kfence support
Date: Wed, 31 Jul 2024 13:26:04 +0530
Message-ID: <cover.1722408881.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.45.2
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
Cc: Donet Tom <donettom@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kfence on book3s64 Hash is broken. Kfence depends upon debug_pagealloc
infrastructure on Hash. debug_pagealloc allocates a linear map based on the size
of the DRAM i.e. 1 byte for every 64k page. That means for a 16TB DRAM, it will
need 256MB memory for linear map. Memory for linear map on pseries comes from
RMA region which has size limitation. On P8 RMA is 512MB, in which we also
fit crash kernel at 256MB, paca allocations and emergency stacks.
That means there is not enough memory in the RMA region for the linear map
based on DRAM size (required by debug_pagealloc).

Now kfence only requires memory for it's kfence objects. kfence by default
requires only (255 + 1) * 2 i.e. 32 MB for 64k pagesize.

This patch series removes the direct dependency of kfence on debug_pagealloc
infrastructure. We separate the Hash kernel linear map functions to take
linear map array as a parameter so that it can support debug_pagealloc and
kfence individually. That means we don't need to keep the linear map region of
size DRAM_SIZE >> PAGE_SHIFT anymore for kfence.

Hence, the current patch series solves the boot failure problem when kfence is
enabled by optimizing the memory it requires for linear map within RMA region.

On radix we don't have this problem because no SLB and no RMA region size
limitation.

Testing:
========
The patch series is still undergoing some testing. However, given that it's in
good shape, I wanted to send out for review.
Note: It passes kfence kunit tests.
  <dmesg results>
  [   48.715649][    T1] # kfence: pass:23 fail:0 skip:2 total:25
  [   48.716697][    T1] # Totals: pass:23 fail:0 skip:2 total:25
  [   48.717842][    T1] ok 1 kfence


TODOs: (for future patches)
===========================
However, there is still another problem which IMO makes kfence not suitable to
be enabled by default on production kernels with Hash MMU i.e.
When kfence is enabled the kernel linear map uses PAGE_SIZE mapping rather than
16MB mapping as in the original case. Correct me if I am wrong, but theoretically
at least this could cause TLB pressure in certain cases, which makes it not
really suitable to be enabled by default on production kernels on Hash.

This is because on P8 book3s64, we don't support mapping multiple pagesizes
(MPSS) within the kernel linear map segment. Is this understanding correct?


Ritesh Harjani (IBM) (10):
  book3s64/hash: Remove kfence support temporarily
  book3s64/hash: Refactor kernel linear map related calls
  book3s64/hash: Add hash_debug_pagealloc_add_slot() function
  book3s64/hash: Add hash_debug_pagealloc_alloc_slots() function
  book3s64/hash: Refactor hash__kernel_map_pages() function
  book3s64/hash: Make kernel_map_linear_page() generic
  book3s64/hash: Disable debug_pagealloc if it requires more memory
  book3s64/hash: Add kfence functionality
  book3s64/radix: Refactoring common kfence related functions
  book3s64/hash: Disable kfence if not early init

 arch/powerpc/include/asm/kfence.h        |   2 +
 arch/powerpc/mm/book3s64/hash_utils.c    | 364 +++++++++++++++++------
 arch/powerpc/mm/book3s64/radix_pgtable.c |  12 -
 arch/powerpc/mm/init-common.c            |  12 +
 4 files changed, 286 insertions(+), 104 deletions(-)

--
2.45.2

