Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 356514848BD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 20:45:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT34506r0z3bd0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 06:45:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iT1aZ9ke;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iT1aZ9ke;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=iT1aZ9ke; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=iT1aZ9ke; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT33P6v8lz2xsj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jan 2022 06:44:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641325470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pVpW4f5n/S0S6HV+zomyaoFiFeW+Dl4rjMkt6Jm1LkE=;
 b=iT1aZ9kebKATazeYF7nEV0qv4Ya636qIz5hqBCT/Mg3pHTEp8eOLJMefnFplkSJ4pDYAqa
 PX9GBUqWvN5en8lKIpqcgXtgLBjg11thyGxsW0XUTJhhkunYz+pwQbzETnyxNUdmIeJoNx
 jEXW5YOAfi7jaXfvN/nlZwDfR2l0OjE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641325470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pVpW4f5n/S0S6HV+zomyaoFiFeW+Dl4rjMkt6Jm1LkE=;
 b=iT1aZ9kebKATazeYF7nEV0qv4Ya636qIz5hqBCT/Mg3pHTEp8eOLJMefnFplkSJ4pDYAqa
 PX9GBUqWvN5en8lKIpqcgXtgLBjg11thyGxsW0XUTJhhkunYz+pwQbzETnyxNUdmIeJoNx
 jEXW5YOAfi7jaXfvN/nlZwDfR2l0OjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-WIKoIBCFP9SpOYXJnQ47UA-1; Tue, 04 Jan 2022 14:44:29 -0500
X-MC-Unique: WIKoIBCFP9SpOYXJnQ47UA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57B3181EE62;
 Tue,  4 Jan 2022 19:44:26 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B63CF1948C;
 Tue,  4 Jan 2022 19:44:24 +0000 (UTC)
Date: Tue, 4 Jan 2022 14:44:22 -0500
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 03/13] powerpc/module_32: Fix livepatching for RO
 modules
Message-ID: <YdSjlgflqKi6Raof@redhat.com>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <d5697157cb7dba3927e19aa17c915a83bc550bb2.1640017960.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5697157cb7dba3927e19aa17c915a83bc550bb2.1640017960.git.christophe.leroy@csgroup.eu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 20, 2021 at 04:38:09PM +0000, Christophe Leroy wrote:
> Livepatching a loaded module involves applying relocations through
> apply_relocate_add(), which attempts to write to read-only memory when
> CONFIG_STRICT_MODULE_RWX=y.
> 
> R_PPC_ADDR16_LO, R_PPC_ADDR16_HI, R_PPC_ADDR16_HA and R_PPC_REL24 are
> the types generated by the kpatch-build userspace tool or klp-convert
> kernel tree observed applying a relocation to a post-init module.
> 
> Use patch_instruction() to patch those relocations.
> 
> Commit 8734b41b3efe ("powerpc/module_64: Fix livepatching for
> RO modules") did similar change in module_64.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Russell Currey <ruscur@russell.cc>
> ---
>  arch/powerpc/kernel/module_32.c | 44 ++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
> index a491ad481d85..a0432ef46967 100644
> --- a/arch/powerpc/kernel/module_32.c
> +++ b/arch/powerpc/kernel/module_32.c
> @@ -18,6 +18,7 @@
>  #include <linux/bug.h>
>  #include <linux/sort.h>
>  #include <asm/setup.h>
> +#include <asm/code-patching.h>
>  
>  /* Count how many different relocations (different symbol, different
>     addend) */
> @@ -174,15 +175,25 @@ static uint32_t do_plt_call(void *location,
>  		entry++;
>  	}
>  
> -	entry->jump[0] = PPC_RAW_LIS(_R12, PPC_HA(val));
> -	entry->jump[1] = PPC_RAW_ADDI(_R12, _R12, PPC_LO(val));
> -	entry->jump[2] = PPC_RAW_MTCTR(_R12);
> -	entry->jump[3] = PPC_RAW_BCTR();
> +	if (patch_instruction(&entry->jump[0], ppc_inst(PPC_RAW_LIS(_R12, PPC_HA(val)))))
> +		return 0;
> +	if (patch_instruction(&entry->jump[1], ppc_inst(PPC_RAW_ADDI(_R12, _R12, PPC_LO(val)))))
> +		return 0;
> +	if (patch_instruction(&entry->jump[2], ppc_inst(PPC_RAW_MTCTR(_R12))))
> +		return 0;
> +	if (patch_instruction(&entry->jump[3], ppc_inst(PPC_RAW_BCTR())))
> +		return 0;
>  
>  	pr_debug("Initialized plt for 0x%x at %p\n", val, entry);
>  	return (uint32_t)entry;
>  }
>  
> +static int patch_location_16(uint32_t *loc, u16 value)
> +{
> +	loc = PTR_ALIGN_DOWN(loc, sizeof(u32));
> +	return patch_instruction(loc, ppc_inst((*loc & 0xffff0000) | value));
> +}
> +
>  int apply_relocate_add(Elf32_Shdr *sechdrs,
>  		       const char *strtab,
>  		       unsigned int symindex,
> @@ -216,37 +227,42 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
>  
>  		case R_PPC_ADDR16_LO:
>  			/* Low half of the symbol */
> -			*(uint16_t *)location = value;
> +			if (patch_location_16(location, PPC_LO(value)))
> +				return -EFAULT;
>  			break;
>  
>  		case R_PPC_ADDR16_HI:
>  			/* Higher half of the symbol */
> -			*(uint16_t *)location = (value >> 16);
> +			if (patch_location_16(location, PPC_HI(value)))
> +				return -EFAULT;
>  			break;
>  
>  		case R_PPC_ADDR16_HA:
> -			/* Sign-adjusted lower 16 bits: PPC ELF ABI says:
> -			   (((x >> 16) + ((x & 0x8000) ? 1 : 0))) & 0xFFFF.
> -			   This is the same, only sane.
> -			 */
> -			*(uint16_t *)location = (value + 0x8000) >> 16;
> +			if (patch_location_16(location, PPC_HA(value)))
> +				return -EFAULT;
>  			break;
>  
>  		case R_PPC_REL24:
>  			if ((int)(value - (uint32_t)location) < -0x02000000
> -			    || (int)(value - (uint32_t)location) >= 0x02000000)
> +			    || (int)(value - (uint32_t)location) >= 0x02000000) {
>  				value = do_plt_call(location, value,
>  						    sechdrs, module);
> +				if (!value)
> +					return -EFAULT;
> +			}
>  
>  			/* Only replace bits 2 through 26 */
>  			pr_debug("REL24 value = %08X. location = %08X\n",
>  			       value, (uint32_t)location);
>  			pr_debug("Location before: %08X.\n",
>  			       *(uint32_t *)location);
> -			*(uint32_t *)location
> -				= (*(uint32_t *)location & ~0x03fffffc)
> +			value = (*(uint32_t *)location & ~0x03fffffc)
>  				| ((value - (uint32_t)location)
>  				   & 0x03fffffc);
> +
> +			if (patch_instruction(location, ppc_inst(value)))
> +				return -EFAULT;
> +
>  			pr_debug("Location after: %08X.\n",
>  			       *(uint32_t *)location);
>  			pr_debug("ie. jump to %08X+%08X = %08X\n",
> -- 
> 2.33.1
> 

IIRC, offlist we hacked up klp-convert to create the klp-relocations for
a 32-bit target and then you hit the selftest late relocation crash, so
I assume that part is happy after this fix. :)  Thanks again for the
testing.

For the livepatching implications,

Acked-by: Joe Lawrence <joe.lawrence@redhat.com>

-- Joe

