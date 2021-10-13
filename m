Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 315C742B871
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 09:06:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTk8c437wz2ynV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 18:06:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y9iLi2Jr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Y9iLi2Jr; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTk7x3Xrhz2xr4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 18:05:30 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so3703951pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 00:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6tGvcqjwGnkwXapVdxREWLfq3SeiEzYltujninCiyHk=;
 b=Y9iLi2JrztwgqJU7WxouRqkcs19pQmlvc+dwqmTt/LsB2A/+LkmdmebziJqWx90+1l
 QGUBkBxPvUXkDNRhn2WfhIRnIA//lJRWBR6Sy4+Bvt3AZnPK5owInFUImk8i6ZlkNfXx
 3PbBkcLhCoweDrO9NiqjhNF4c3MLWR35u5DiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6tGvcqjwGnkwXapVdxREWLfq3SeiEzYltujninCiyHk=;
 b=KFse9PBqkt/x48AaU28gfXBpY/Ld2N9GxChsfge9uH00Ua9GQF1DJqAUCikN8JmPzE
 TeIAIFEHpfJfasmeSNgnPaYG4aNhwDzEszcqVf6kVnPPhCvMVym9jhviJAjVRFq1hFbS
 D37SEdyeDk+5KVG0T+IgCdzCpQnGwRbDQL+h61MwwV2p+LaxVCY0H0Vu6Rbx0vBDVGzE
 mlOOmoQSW2gBBeivsAWjl+1tZesTZkwMJ0N0DJ9dJufYjQdH0WgyENOk7Di4iSrmEQ0H
 IrSymdYwroa0rlW/dPjsN9bG2YVXDy5SSU46R/qwFU1MOMWfwtS2WOAUo/Ml2hH0yt7j
 ps2A==
X-Gm-Message-State: AOAM533Yb7WvpSo54ID0jDQ790IMaw9grPwonum4OZMuvl5mhDqLI9xR
 gDMH2ZC0wa0S8YSsz+bhPCwYWQ==
X-Google-Smtp-Source: ABdhPJxyo+lKj4DVYPaWC7XDi86I8yDjK4zmQZScEiHVyq9xnd6FexVoNrQNr9v1X26KMPGowX7ckA==
X-Received: by 2002:a17:90b:3b44:: with SMTP id
 ot4mr11523975pjb.73.1634108727909; 
 Wed, 13 Oct 2021 00:05:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id ip10sm5334805pjb.40.2021.10.13.00.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 00:05:27 -0700 (PDT)
Date: Wed, 13 Oct 2021 00:05:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 08/10] lkdtm: Really write into kernel text in
 WRITE_KERN
Message-ID: <202110130004.880A6C841@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <624940395e5d81967246f911a65740b9a15b5a70.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <624940395e5d81967246f911a65740b9a15b5a70.1633964380.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 11, 2021 at 05:25:35PM +0200, Christophe Leroy wrote:
> WRITE_KERN is supposed to overwrite some kernel text, namely
> do_overwritten() function.
> 
> But at the time being it overwrites do_overwritten() function
> descriptor, not function text.
> 
> Fix it by dereferencing the function descriptor to obtain
> function text pointer.
> 
> And make do_overwritten() noinline so that it is really
> do_overwritten() which is called by lkdtm_WRITE_KERN().
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/misc/lkdtm/perms.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 60b3b2fe929d..442d60ed25ef 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -5,6 +5,7 @@
>   * even non-readable regions.
>   */
>  #include "lkdtm.h"
> +#include <linux/kallsyms.h>

Why not #include <asm/sections.h> instead here?

>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
>  #include <linux/mman.h>
> @@ -37,7 +38,7 @@ static noinline void do_nothing(void)
>  }
>  
>  /* Must immediately follow do_nothing for size calculuations to work out. */
> -static void do_overwritten(void)
> +static noinline void do_overwritten(void)
>  {
>  	pr_info("do_overwritten wasn't overwritten!\n");
>  	return;
> @@ -113,8 +114,9 @@ void lkdtm_WRITE_KERN(void)
>  	size_t size;
>  	volatile unsigned char *ptr;
>  
> -	size = (unsigned long)do_overwritten - (unsigned long)do_nothing;
> -	ptr = (unsigned char *)do_overwritten;
> +	size = (unsigned long)dereference_symbol_descriptor(do_overwritten) -
> +	       (unsigned long)dereference_symbol_descriptor(do_nothing);
> +	ptr = dereference_symbol_descriptor(do_overwritten);

But otherwise, yup, I expect there will be a bunch of things like this
to clean up in LKDTM. :| Sorry about that!

Acked-by: Kees Cook <keescook@chromium.org>

>  
>  	pr_info("attempting bad %zu byte write at %px\n", size, ptr);
>  	memcpy((void *)ptr, (unsigned char *)do_nothing, size);
> -- 
> 2.31.1
> 

-- 
Kees Cook
