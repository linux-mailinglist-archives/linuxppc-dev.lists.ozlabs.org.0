Return-Path: <linuxppc-dev+bounces-8908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72098AC1B11
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 06:39:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3XWR03WVz2yMw;
	Fri, 23 May 2025 14:39:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747975186;
	cv=none; b=f2ydkVKWdKB1yV72BQ94pMrg9BisnuvG1jwP63qoqkuz1xWTcEdYb9UW5w2uLPrZ6sqr39YIgS+695mGgV+Yhdi7DF9jZuJGjz7q4h6iatftuANBnHQRtZX5Ngf5UCrrQSstlS6VoMHt0BWv7rK7RPtF4erYiei7r1wNCr/ubmqYkWhV/T4hK1S9DyMJfLsY54Gr2Cej3UKwyUm1QVE2WGzzKyWOE0urD50t1wgOuLI1dvOIoVGGNhm1e7ELzVO2pzNX6Qq+KwIfzXZnh8p4U1zrTZcrPNhyMy6+XAFHd6F87ktKB+YG5U5SkHTq7bKOOC8IPr1KEITocsXG8eqXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747975186; c=relaxed/relaxed;
	bh=5WwsZAyhqCNKq8impC0uPdRnLe811mvhdI4uAc7GwKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OHFK/i7uqwXnntPouZjH1TaReOqJHiJFE76nptq96GrU8gSzj3wXelAfe4fHE34rKabyt7TPcRsRa0ESRNZ0FoyMx00ZvCTKrPgb+9UEJpE75ElYO7MVivnLeA7l+zyth1ByABnziZJc2d1l9qtdL320ZttOx0mU66VA/pOlkOvRJ2wl+hLOT3P7buznIP4xZF8jLY06KpzvmniovE/bEaLvGMSUtPxtNgKbEkdsq39Vwt4OX4YtC7Je0VaJoWnCXec8zOSjxHbnDJg18Pa7ks1pAiJjNUDntC0Romu/myvMBezKwfOlsV4aZE9ihwVHD1STYp2Hw3mUISnQs2KBKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CHB1UIrX; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CHB1UIrX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3XWM6mltz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 14:39:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 634464A959;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E840C4CEED;
	Fri, 23 May 2025 04:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747975181;
	bh=yaSxmxtYpasuc+rufEWrdAWe3aDh1VboHkgvW7Uuxmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CHB1UIrXXIJNnDqoawhvxACuyRxlpr3fsHJOcaMiX78eZBw6bj2aCmamSdxBgr0Q1
	 cv2JxCHOnwvyafgtOlwyLeWkIJcvvmBOc3FGaH7CycNh6ciUxu783i7rIN1Q7uR/YZ
	 egoHkAstCNIvH0Ni9mbt5Ty4Gh02RZ66vXL7zkVg5EvNVKTTIDuVY7AvMEtb0fYV8p
	 mJKUBNr2h5nbAO7s6Ui4esyy2FZgHJ+NnCkDJYKNpnSZCOqTVyO+IRaFk0btgFjTdO
	 S8daDPWHmwFh5MEl/KFRRxM9icxB3PHJq5dg1QlY9jE+fNHEdaX6TMoMVDjrVztIdI
	 PtpSj3RRaZDNw==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 08/14] powerpc: Handle KCOV __init vs inline mismatches
Date: Thu, 22 May 2025 21:39:18 -0700
Message-Id: <20250523043935.2009972-8-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523043251.it.550-kees@kernel.org>
References: <20250523043251.it.550-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1981; i=kees@kernel.org; h=from:subject; bh=yaSxmxtYpasuc+rufEWrdAWe3aDh1VboHkgvW7Uuxmk=; b=owGbwMvMwCVmps19z/KJym7G02pJDBn6v3+dEGvzLNyc4frZMlegpp5xqfLf4qvOhQ6vClwWG c4+vkWro5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCJ6nYwMa39MVvl34OWuxWLC YitLL7uZs+fqxoq1bLk+uZ0hXWGaIMP/IouHmyfNuDCZ8fKpT88FFNw8Sr8vU98je2Fj6/LNOe9 62AA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When KCOV is enabled all functions get instrumented, unless
the __no_sanitize_coverage attribute is used. To prepare for
__no_sanitize_coverage being applied to __init functions, we have to
handle differences in how GCC's inline optimizations get resolved. For
s390 this requires forcing a couple functions to be inline with
__always_inline.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: <linuxppc-dev@lists.ozlabs.org>
---
 arch/powerpc/mm/book3s64/hash_utils.c    | 2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 5158aefe4873..93f1e1eb5ea6 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -409,7 +409,7 @@ static DEFINE_RAW_SPINLOCK(linear_map_kf_hash_lock);
 
 static phys_addr_t kfence_pool;
 
-static inline void hash_kfence_alloc_pool(void)
+static __always_inline void hash_kfence_alloc_pool(void)
 {
 	if (!kfence_early_init_enabled())
 		goto err;
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9f764bc42b8c..3238e9ed46b5 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -363,7 +363,7 @@ static int __meminit create_physical_mapping(unsigned long start,
 }
 
 #ifdef CONFIG_KFENCE
-static inline phys_addr_t alloc_kfence_pool(void)
+static __always_inline phys_addr_t alloc_kfence_pool(void)
 {
 	phys_addr_t kfence_pool;
 
-- 
2.34.1


