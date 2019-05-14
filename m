Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EA51C6DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 12:18:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453DDH2x0PzDqMv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 20:18:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453DC04h3RzDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 20:17:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 453DBx2lqDz9sNK;
 Tue, 14 May 2019 20:17:29 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Greg KH <gregkh@linuxfoundation.org>,
 erhard_f@mailbox.org, Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH stable 4.9] powerpc/lib: fix code patching during early
 init on PPC32
In-Reply-To: <015040d922a68fa15c81879cc2fc9ed7ac106e60.1557827275.git.christophe.leroy@c-s.fr>
References: <015040d922a68fa15c81879cc2fc9ed7ac106e60.1557827275.git.christophe.leroy@c-s.fr>
Date: Tue, 14 May 2019 20:17:27 +1000
Message-ID: <87y339s5l4.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> [Backport of upstream commit b45ba4a51cde29b2939365ef0c07ad34c8321789]
>
> On powerpc32, patch_instruction() is called by apply_feature_fixups()
> which is called from early_init()
>
> There is the following note in front of early_init():
>  * Note that the kernel may be running at an address which is different
>  * from the address that it was linked at, so we must use RELOC/PTRRELOC
>  * to access static data (including strings).  -- paulus
>
> Therefore init_mem_is_free must be accessed with PTRRELOC()
>
> Fixes: 1c38a84d4586 ("powerpc: Avoid code patching freed init sections")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=203597
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>
> ---
> Can't apply the upstream commit as such due to several of other unrelated stuff
> like STRICT_KERNEL_RWX which are missing for instance.
> So instead, using same approach as for commit 252eb55816a6f69ef9464cad303cdb3326cdc61d

Yeah this looks good to me.

Though should we keep the same subject as the upstream commit this is
sort of a backport of? That might make it simpler for people who are
trying to keep track of things?

ie. "powerpc/lib: fix book3s/32 boot failure due to code patching"

cheers

> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 14535ad4cdd1..c312955977ce 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -23,7 +23,7 @@ int patch_instruction(unsigned int *addr, unsigned int instr)
>  	int err;
>  
>  	/* Make sure we aren't patching a freed init section */
> -	if (init_mem_is_free && init_section_contains(addr, 4)) {
> +	if (*PTRRELOC(&init_mem_is_free) && init_section_contains(addr, 4)) {
>  		pr_debug("Skipping init section patching addr: 0x%px\n", addr);
>  		return 0;
>  	}
> -- 
> 2.13.3
