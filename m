Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD685F7705
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 12:42:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkPyG0FVjz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 21:42:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aipWrbBL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkPxJ2kwnz3bry
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 21:41:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aipWrbBL;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MkPxF3b4nz4xFv;
	Fri,  7 Oct 2022 21:41:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665139281;
	bh=UR2MeUI/j4OkA0mD873etMijpD0UYiYWP9Zb1OCdxjg=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=aipWrbBLdtlHUXM+gEo+Z09U66kWuoZNPADrORyjauQ+Ffu2gbxkrM8J+FwivjZWt
	 o+Jm5Gjup/rL8wJB96PeEBJdRxex3nsMf1aFIko1HEbifuFNvurHYWEnJfcg2p9+V5
	 9wk81uErqIstEh9pAhQDvj2sQHsreDGuDU/NACk3W6a2Wp2j3dDyCxm1ydfyM4U/sE
	 vEd0EIBs7bxW0oxeGv+6yTHUyzNdxwFmx+MxuliVlfFICfIbfyRcvQA/UhYOPyiivG
	 KMNh9K2gSFtSrtwER4oX31OHccxY+u10E08wqcW97McDTpia7wi7s6F5CodBt692Rt
	 N510M7/9tN2Ng==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Lynch
 <nathanl@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, kasan-dev <kasan-dev@googlegroups.com>
Subject: Re: [PATCH] powerpc/kasan/book3s_64: warn when running with hash MMU
In-Reply-To: <9b6eb796-6b40-f61d-b9c6-c2e9ab0ced38@csgroup.eu>
References: <20221004223724.38707-1-nathanl@linux.ibm.com>
 <874jwhpp6g.fsf@mpe.ellerman.id.au>
 <9b6eb796-6b40-f61d-b9c6-c2e9ab0ced38@csgroup.eu>
Date: Fri, 07 Oct 2022 21:41:18 +1100
Message-ID: <87h70for01.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> + KASAN list
>
> Le 06/10/2022 =C3=A0 06:10, Michael Ellerman a =C3=A9crit=C2=A0:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> kasan is known to crash at boot on book3s_64 with non-radix MMU. As
>>> noted in commit 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only
>>> KASAN support"):
>>>
>>>    A kernel with CONFIG_KASAN=3Dy will crash during boot on a machine
>>>    using HPT translation because not all the entry points to the
>>>    generic KASAN code are protected with a call to kasan_arch_is_ready(=
).
>>=20
>> I guess I thought there was some plan to fix that.
>
> I was thinking the same.
>
> Do we have a list of the said entry points to the generic code that are=20
> lacking a call to kasan_arch_is_ready() ?
>
> Typically, the BUG dump below shows that kasan_byte_accessible() is=20
> lacking the check. It should be straight forward to add=20
> kasan_arch_is_ready() check to kasan_byte_accessible(), shouldn't it ?

Yes :)

And one other spot, but the patch below boots OK for me. I'll leave it
running for a while just in case there's a path I've missed.

cheers


diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 69f583855c8b..5def0118f2cd 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -377,6 +377,9 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *=
object,
=20
 static inline bool ____kasan_kfree_large(void *ptr, unsigned long ip)
 {
+	if (!kasan_arch_is_ready())
+		return false;
+
 	if (ptr !=3D page_address(virt_to_head_page(ptr))) {
 		kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_FREE);
 		return true;
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 437fcc7e77cf..017d3c69e3b3 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -191,7 +191,12 @@ bool kasan_check_range(unsigned long addr, size_t size=
, bool write,
=20
 bool kasan_byte_accessible(const void *addr)
 {
-	s8 shadow_byte =3D READ_ONCE(*(s8 *)kasan_mem_to_shadow(addr));
+	s8 shadow_byte;
+
+	if (!kasan_arch_is_ready())
+		return true;
+
+	shadow_byte =3D READ_ONCE(*(s8 *)kasan_mem_to_shadow(addr));
=20
 	return shadow_byte >=3D 0 && shadow_byte < KASAN_GRANULE_SIZE;
 }

