Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB3A644E86
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 23:25:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRZjT33scz2xml
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 09:25:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Cb0ulpSu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRZhZ4k77z2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 09:24:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Cb0ulpSu;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NRZhZ3Rmwz4wgr;
	Wed,  7 Dec 2022 09:24:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1670365454;
	bh=N1fw1IMkHBVhX/CbWRjxTd+/XEkaFCAEBJnB/rhcwEg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Cb0ulpSu9ILgfGgw48CRy88dqFOmrrsKgU3HZmgurQuSIpwuUYtgeM6ME+ccXjA5Y
	 f9fz6y3NKXLmu0gk8N0ksiXXuN6ht44Uy3L0OfSffJg4EO+tQcc+tpbQ3NMK7ANdeb
	 7qNlvBEJL8FAAl/Kr2KJjsN9siDhmumAFB7KeFnxdHiYfi1A5g63SD0pm2CxOSiGL2
	 faX4sBHPSjsXo8XEL06G9kgkiE3v4EDxBnDzXRvayn92y417aeYOTK8lV5fjlkRoZu
	 QSs9TF0z6JqgDrNxFNBfOF4ZNvARkMW5YXAx2tLWXxVaxlGforZevAQ6bmENTVrKNa
	 zh1il5mwmRE0A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] powerpc: mm: Implement p{m,u,4}d_leaf on all
 platforms
In-Reply-To: <20221118002146.25979-2-rmclure@linux.ibm.com>
References: <20221118002146.25979-1-rmclure@linux.ibm.com>
 <20221118002146.25979-2-rmclure@linux.ibm.com>
Date: Wed, 07 Dec 2022 09:24:12 +1100
Message-ID: <87k034rx0z.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rohan McLure <rmclure@linux.ibm.com> writes:
> The check that a higher-level entry in multi-level pages contains a page
> translation entry (pte) is performed by p{m,u,4}d_leaf stubs, which may
> be specialised for each choice of mmu. In a prior commit, we replace
> uses to the catch-all stubs, p{m,u,4}d_is_leaf with p{m,u,4}d_leaf.
>
> Replace the catch-all stub definitions for p{m,u,4}d_is_leaf with
> definitions for p{m,u,4}d_leaf. A future patch will assume that
> p{m,u,4}d_leaf is defined on all platforms.
>
> In particular, implement pud_leaf for Book3E-64, pmd_leaf for all Book3E
> and Book3S-64 platforms, with a catch-all definition for p4d_leaf.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> v5: Split patch that replaces p{m,u,4}d_is_leaf into two patches, first
> replacing callsites and afterward providing generic definition.
> Remove ifndef-defines implementing p{m,u}d_leaf in favour of
> implementing stubs in headers belonging to the particular platforms
> needing them.
> ---
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  4 ++++
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  8 ++-----
>  arch/powerpc/include/asm/nohash/64/pgtable.h |  5 +++++
>  arch/powerpc/include/asm/nohash/pgtable.h    |  5 +++++
>  arch/powerpc/include/asm/pgtable.h           | 22 ++------------------
>  5 files changed, 18 insertions(+), 26 deletions(-)

I needed the delta below to prevent the generic versions being defined
and overriding our versions.

cheers

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 44703c8c590c..117135be8cc2 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -244,6 +244,7 @@ static inline void pmd_clear(pmd_t *pmdp)
 	*pmdp = __pmd(0);
 }
 
+#define pmd_leaf pmd_leaf
 static inline bool pmd_leaf(pmd_t pmd)
 {
 	return false;
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 436632d04304..f00aa2d203c2 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1438,11 +1438,13 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
 /*
  * Like pmd_huge() and pmd_large(), but works regardless of config options
  */
+#define pmd_leaf pmd_leaf
 static inline bool pmd_leaf(pmd_t pmd)
 {
 	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
 }
 
+#define pud_leaf pud_leaf
 static inline bool pud_leaf(pud_t pud)
 {
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 2488da8f0deb..d88b22c753d3 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -147,6 +147,7 @@ static inline void pud_clear(pud_t *pudp)
 	*pudp = __pud(0);
 }
 
+#define pud_leaf pud_leaf
 static inline bool pud_leaf(pud_t pud)
 {
 	return false;
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 487804f5b1d1..dfae1dbb9c3b 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -60,6 +60,7 @@ static inline bool pte_hw_valid(pte_t pte)
 	return pte_val(pte) & _PAGE_PRESENT;
 }
 
+#define pmd_leaf pmd_leaf
 static inline bool pmd_leaf(pmd_t pmd)
 {
 	return false;

