Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C97F2126135
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 12:51:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dqwL5YsCzDqsm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 22:51:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dqsq5WKhzDqdT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 22:49:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="iVZiuTv8"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47dqsn6T0bz9sPh;
 Thu, 19 Dec 2019 22:49:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576756159;
 bh=m3hY81qHO7a2k47hLHQcsNjq4SjyZd/McTsEzivltVw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iVZiuTv82Xx6PBD5+ZkMNAHxtQgm3Q8T7MvtNs5BQ/Le5rVoL5jtfTowsYTNg6zVk
 TQZdB+LeRGDQrwAbrTTCxlT5yq8GuZA/I4SebmZX3Bg8hOSBhFEd9ESk5kE7CQG6Ef
 e6EdNhWAzinbIMDQEnBy+i+JXbxM8SUzfIqLg7aN6HNm50Myep5JO24puwgEs1WWPZ
 beWQBPCIBFxfuPhkxyvdgQxbgUTdVp/+dbBMhA0uJICJaCHly3aGbeXexWvcQcSJR2
 iCQIGMzx3cHbUs952puh+OX3lMc8+K44Q5rTMLMhn8ZR61R4Ri2WUTdlL0Y1fzqZpg
 g1ifRi2FGLkTA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Steven Price <steven.price@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Subject: Re: [PATCH v17 06/23] powerpc: mm: Add p?d_leaf() definitions
In-Reply-To: <20191218162402.45610-7-steven.price@arm.com>
References: <20191218162402.45610-1-steven.price@arm.com>
 <20191218162402.45610-7-steven.price@arm.com>
Date: Thu, 19 Dec 2019 22:49:16 +1100
Message-ID: <877e2smt6r.fsf@mpe.ellerman.id.au>
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, "Liang,
 Kan" <kan.liang@linux.intel.com>, x86@kernel.org,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 kvm-ppc@vger.kernel.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Steven Price <steven.price@arm.com> writes:
> walk_page_range() is going to be allowed to walk page tables other than
> those of user space. For this it needs to know when it has reached a
> 'leaf' entry in the page tables. This information is provided by the
> p?d_leaf() functions/macros.
>
> For powerpc p?d_is_leaf() functions already exist. Export them using the
> new p?d_leaf() name.
>
> CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> CC: Paul Mackerras <paulus@samba.org>
> CC: Michael Ellerman <mpe@ellerman.id.au>
> CC: linuxppc-dev@lists.ozlabs.org
> CC: kvm-ppc@vger.kernel.org
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 3 +++
>  1 file changed, 3 insertions(+)

We have fallback versions of our pmd_is_leaf() etc. in
arch/powerpc/include/asm/pgtable.h, eg:

#ifndef pmd_is_leaf
#define pmd_is_leaf pmd_is_leaf
static inline bool pmd_is_leaf(pmd_t pmd)
{
	return false;
}
#endif

Because we support several different MMUs and most of them don't need to
do anything.

So we could put the compatibility #defines to your names along with the
fallback versions in asm/pgtable.h, rather than in
asm/book3s/64/pgtable.h

But I see you also have fallbacks for your versions, so it probably
doesn't matter either way.

So I'm OK with this version, unless you think there's a compelling
reason to do the compatibility #defines in our asm/pgtable.h

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers


> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index b01624e5c467..201a69e6a355 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1355,18 +1355,21 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
>   * Like pmd_huge() and pmd_large(), but works regardless of config options
>   */
>  #define pmd_is_leaf pmd_is_leaf
> +#define pmd_leaf pmd_is_leaf
>  static inline bool pmd_is_leaf(pmd_t pmd)
>  {
>  	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
>  }
>  
>  #define pud_is_leaf pud_is_leaf
> +#define pud_leaf pud_is_leaf
>  static inline bool pud_is_leaf(pud_t pud)
>  {
>  	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
>  }
>  
>  #define pgd_is_leaf pgd_is_leaf
> +#define pgd_leaf pgd_is_leaf
>  static inline bool pgd_is_leaf(pgd_t pgd)
>  {
>  	return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PTE));
> -- 
> 2.20.1
