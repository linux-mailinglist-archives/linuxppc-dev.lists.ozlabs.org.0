Return-Path: <linuxppc-dev+bounces-2380-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B39A449D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:30:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVWtp3pz7z2yD8;
	Sat, 19 Oct 2024 04:30:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729272626;
	cv=none; b=nF7p0LgGYuHM8BCVvIhWmvmODBz0o/6mSEtclVZdXAWsMD5JPMeYmDRVCgbA52VPrtcruWUqOUE/7MOfkWplGEqLagfGcda+pX2di+XxaqLJJxiDWAjveChAzMBTr57cKpaHInsmUn/836txAs4uMtrIz5UEJ01JzbJjkR1eGSzGt6ro9YuqSNIXBd2GCrXUpXs+e91pz4xfsHIj4L8fEL+V20vm+Qj+5j71/Sy82w8RjD25gSmscG4dppDo3sUQhAyUM4hRdENkWsg9TRdxUFz+QVQRCCNBtnlGdPYzbr6CkwauAypVKcEfFos9+/2GgiZ7oi5wq61wp+qRr2BdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729272626; c=relaxed/relaxed;
	bh=/kexGPHg7BP7JEy0b70rSKtUMi9zN66ceCEdb7Ha4D0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OrcCdZuiOFpkheYVvOpPOL4S1tphbVZdbwI+0uThNZ2XILnn/CFgY6lsZgiqL22cMtGoYxb9lbqQsL/NbQVKOietJIoQWzAlA2Dy9Ygt5Y2FXKXaSj/0B+QBhbW+ng0cnugo9+Tyk1KupiGEwDkyGApf1HA4OrKFkOsA6Mf1Fg2VT7sdHCzlgVeLXLrhg8bf5KF4CFRPd+si2KaTPGyARujG1DmgOF10xjrK9JWwTUPnFn19ya8fChARJ0SYyIGUeKV/CPb1jKLBzFIY4WC1hrm7SowFtGvWggFzg62syJTp8iGJ/yO8Z0llDJkCybPegJvMK9IZ8IepzFkYqzOI3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K1xWhROV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K1xWhROV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVWtm1nCfz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:30:22 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7db637d1e4eso2452997a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729272619; x=1729877419; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/kexGPHg7BP7JEy0b70rSKtUMi9zN66ceCEdb7Ha4D0=;
        b=K1xWhROVapvsIuAOVb1EIoYwu4RJFoAs9oiSJTETWFg6klk+AsNgQJA+Lb+IlTpCaJ
         tEage1TeUv7KS3t6sBWH4ZnIHHCuwWwrEK90gvl3oHciHtfHeKmLAXi1wFUy0tSzJkhw
         Mk7nCDIYYfkEI4qxb2mXIcPjytmbceQYQXzUpI7qaQZ082Zu93W3bTyaC1Owp6H17g1z
         UrCs+b85dvJ/8Ih92rlfLBxwXydZyxY0tn8ecQ3Iz9uB8YAV9V7oCvvD/U1T06pQeCVd
         VoSDCLhJbVLQbq2Zwd4PK6AD7I/HXr1CnVYvr81W0VJBgy34K+Lkz7pzRigRmcQ77Ct6
         aCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272619; x=1729877419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kexGPHg7BP7JEy0b70rSKtUMi9zN66ceCEdb7Ha4D0=;
        b=ehgfiTQL6T5PLreDCO6UtDLoW+wYlR0Vd54M9baKpmd2Ke0wipHJW/zf5c6/d76jrd
         MFKvQyhhI4x7xPDZTA9v9dPewNuFrK2as0RFaq17vOgcTIOLFaVq73jbWAsctWJZu8Z/
         ew6OG/kTItPcFH0ScJidIUi7Un1tb4E2Ov6bnLDaf4MXNX5MympucXhxuFLRVfXBDoOr
         7nvtEWO34h0VOFb7YqTWo1qwEbBnJo22KYmNk1TZ4f/AlS7L1HjFCPeupeDy4RqEsW+g
         ls9SxQ0F5iKedEIwjv9XLMyMxveeggxBLr05nvljeTYe6kSx9fmsko9y7iZouUPxR647
         OaiA==
X-Gm-Message-State: AOJu0YyxtCU3bdOVnLDAqOZPXtaN7Vy+KalT/y7/pj94v/hS4dlW7KMw
	oyKRJwsP4eS9gMl13oRQYpVKTo+6ywH5RFLPSMvAFQgG5OXsSfm1rHM3+3Nh
X-Google-Smtp-Source: AGHT+IEbOGLNKLJrJFImzQpsiOOXU0drvvKYT531il5KzE7IqW3k2drNkmi6NFk+P7Ia/vyxbbkhgQ==
X-Received: by 2002:a05:6a21:164a:b0:1d6:e6b1:120f with SMTP id adf61e73a8af0-1d92c4dffb5mr4996670637.11.1729272619178;
        Fri, 18 Oct 2024 10:30:19 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f51sm1725242b3a.36.2024.10.18.10.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:30:16 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v3 00/12] powerpc/kfence: Improve kfence support (mainly Hash)
Date: Fri, 18 Oct 2024 22:59:41 +0530
Message-ID: <cover.1729271995.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

v2 -> v3:
============
1. Addressed review comments from Christophe in patch-1: To check for
   is_kfence_address before doing search in exception tables.
   (Thanks for the review!)

2. Separate out patch-1, which will need a separate tree for inclusion and
   review from kfence/kasan folks since it's a kfence kunit test.

[v2]: https://lore.kernel.org/linuxppc-dev/cover.1728954719.git.ritesh.list@gmail.com/

Not much of the change from last revision. I wanted to split this series up
and drop the RFC tag so that this starts to look ready for inclusion before the
merge window opens for powerpc-next testing.

Kindly let me know if anything is needed for this.

-ritesh

Summary:
==========
This patch series addresses following to improve kfence support on Powerpc.

1. Usage of copy_from_kernel_nofault() within kernel, such as read from
   /proc/kcore can cause kfence to report false negatives.

   This is similar to what was reported on s390. [1]
   [1]: https://lore.kernel.org/all/20230213183858.1473681-1-hca@linux.ibm.com/

   Patch-1, thus adds a fix to handle this case in ___do_page_fault() for
   powerpc.

2. (book3s64) Kfence depends upon debug_pagealloc infrastructure on Hash.
   debug_pagealloc allocates a linear map based on the size of the DRAM i.e.
   1 byte for every 64k page. That means for a 16TB DRAM, it will need 256MB
   memory for linear map. Memory for linear map on pseries comes from
   RMA region which has size limitation. On P8 RMA is 512MB, in which we also
   fit crash kernel at 256MB, paca allocations and emergency stacks.
   That means there is not enough memory in the RMA region for the linear map
   based on DRAM size (required by debug_pagealloc).

   Now kfence only requires memory for it's kfence objects. kfence by default
   requires only (255 + 1) * 2 i.e. 32 MB for 64k pagesize.

Summary of patches
==================
Patch-1 adds a fix to handle this false negatives from copy_from_kernel_nofault().

Patch[2-8] removes the direct dependency of kfence on debug_pagealloc
infrastructure. We make Hash kernel linear map functions to take linear map array
as a parameter so that it can support debug_pagealloc and kfence individually.
That means we don't need to keep the size of the linear map to be
DRAM_SIZE >> PAGE_SHIFT anymore for kfence.

Patch-9: Adds kfence support with above (abstracted out) kernel linear map
infrastructure. With it, this also fixes, the boot failure problem when kfence
gets enabled on Hash with >=16TB of RAM.

Patch-10 & Patch-11: Ensure late initialization of kfence is disabled for both
Hash and Radix due to linear mapping size limiations. Commit gives more
description.

Patch-12: Early detects if debug_pagealloc cannot be enabled (due to RMA size
limitation) so that the linear mapping size can be set correctly during init.

Testing:
========
It passes kfence kunit tests with Hash and Radix.
[   44.355173][    T1] # kfence: pass:27 fail:0 skip:0 total:27
[   44.358631][    T1] # Totals: pass:27 fail:0 skip:0 total:27
[   44.365570][    T1] ok 1 kfence


Future TODO:
============
When kfence on Hash gets enabled, the kernel linear map uses PAGE_SIZE mapping
rather than 16MB mapping. This should be improved in future.

v1 -> v2:
=========
1. Added a kunit testcase patch-1.
2. Fixed a false negative with copy_from_kernel_nofault() in patch-2.
3. Addressed review comments from Christophe Leroy.
4. Added patch-13.


Ritesh Harjani (IBM) (12):
  powerpc: mm/fault: Fix kfence page fault reporting
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
  book3s64/hash: Early detect debug_pagealloc size requirement

 arch/powerpc/include/asm/kfence.h        |   8 +-
 arch/powerpc/mm/book3s64/hash_utils.c    | 364 +++++++++++++++++------
 arch/powerpc/mm/book3s64/pgtable.c       |  13 +
 arch/powerpc/mm/book3s64/radix_pgtable.c |  12 -
 arch/powerpc/mm/fault.c                  |  11 +-
 arch/powerpc/mm/init-common.c            |   1 +
 6 files changed, 301 insertions(+), 108 deletions(-)

--
2.46.0


