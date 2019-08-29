Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4247A19DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 14:17:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K1nx65x2zDrfM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 22:17:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K1kp1LCzzDqwN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 22:14:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46K1kn0WSMz9sML;
 Thu, 29 Aug 2019 22:14:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/mm: tell if a bad page fault on data is read or
 write.
In-Reply-To: <4f88d7e6fda53b5f80a71040ab400242f6c8cb93.1566400889.git.christophe.leroy@c-s.fr>
References: <4f88d7e6fda53b5f80a71040ab400242f6c8cb93.1566400889.git.christophe.leroy@c-s.fr>
Date: Thu, 29 Aug 2019 22:14:38 +1000
Message-ID: <87o908tbgx.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> DSISR has a bit to tell if the fault is due to a read or a write.

Except some CPUs don't have a DSISR?

Which is why we have page_fault_is_write() that's used in
__do_page_fault().

Or is that old cruft?

I see eg. in head_40x.S we pass r5=0 for error code, and we don't set
regs->dsisr anywhere AFAICS. So it might just contain some junk.

cheers

> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 8432c281de92..b5047f9b5dec 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -645,6 +645,7 @@ NOKPROBE_SYMBOL(do_page_fault);
>  void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
>  {
>  	const struct exception_table_entry *entry;
> +	int is_write = page_fault_is_write(regs->dsisr);
>  
>  	/* Are we prepared to handle this fault?  */
>  	if ((entry = search_exception_tables(regs->nip)) != NULL) {
> @@ -658,9 +659,10 @@ void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
>  	case 0x300:
>  	case 0x380:
>  	case 0xe00:
> -		pr_alert("BUG: %s at 0x%08lx\n",
> +		pr_alert("BUG: %s on %s at 0x%08lx\n",
>  			 regs->dar < PAGE_SIZE ? "Kernel NULL pointer dereference" :
> -			 "Unable to handle kernel data access", regs->dar);
> +			 "Unable to handle kernel data access",
> +			 is_write ? "write" : "read", regs->dar);

>  		break;
>  	case 0x400:
>  	case 0x480:
> -- 
> 2.13.3
