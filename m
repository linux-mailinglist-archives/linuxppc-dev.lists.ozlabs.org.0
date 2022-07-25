Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0FD5802AF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 18:29:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls5962pb2z3cdj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 02:29:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U4/ItNyN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U4/ItNyN;
	dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls58S2mz7z3bXZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 02:28:55 +1000 (AEST)
Received: by mail-qv1-xf30.google.com with SMTP id j11so8771400qvt.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 09:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D9jayUJ70LH8CbIWJGpGOTA1AeV4fof3pzfT+UJy1Rk=;
        b=U4/ItNyNQNuRxXWqGEzyZ7n0ybqvDu/aedYL4Xh8lPayVkbetD172/WLCe6ohgzBG8
         ArIndK45c4NbVGzvhVyG2P8K2fPJzDwlJrTJrKWt2HMCrcXCPDq7IP62V7T4nxSU8r8B
         hZE9dTyCS0Qhk8XmCJ7OlqGH7BLbBHSHRHb6ekjoMZFBhGu3z693T2qhoi9L3pMoBhoN
         BToZQZKvRA9WB82ra5KvCz1vjCKOXkcZ0yDCF1OGPe2EbxGoOBcIx1sFiexxzpcIiXEu
         MbN3wmzKSTpHmN/cj8ldR4/0EbLSjUzEjS+ULTJCdVL3S6HbZrXCYNu8XkRKparUn66y
         ZyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D9jayUJ70LH8CbIWJGpGOTA1AeV4fof3pzfT+UJy1Rk=;
        b=TgYpLKgIFIEM5poF25pAQUCunqBLSN1xsKHl2bpFA+Cx8Qih9RbjkAR1sdKxvfRVxX
         zY2PzxYK0M8Pnqr6BjxarEIfT0N/7VmcRTExVZCthvjymqEO2Q0l1DlGxKE3T+F61CQ6
         vUZ2UeHzKLIeDK6GlHxR0AqW3cdsLEO5ABw1iLTdNHrP6LVdMraGMimHBwwMvv3rFbzT
         rWtnGGeHp4tkz0mmtARnLWIN7cR0PsHo9AXhkBW1NqJ9Z0J8WzO6+s6QSBs4EMvJfUx5
         LcGQnWcqu95RPsMpKbyvP08KzalpJijgl0XtiognxKT+p6M9HDRSrpheQJgfMzwilk37
         b+sw==
X-Gm-Message-State: AJIora+p1c7TlzP+bimyfCl24Elgb5tRz687mD1FyQfgQAQQSeoRzwDF
	I9EHbP8WQ61EBsRyz/6ywBk=
X-Google-Smtp-Source: AGRyM1vw9DdU6tiZc6B7msB2VfNWpClP3iavSCiPsNVBrZ/DFZU6H5B0Ur4PHoGGozEWeTqqQKn7hQ==
X-Received: by 2002:a05:6214:e69:b0:474:77:1fe5 with SMTP id jz9-20020a0562140e6900b0047400771fe5mr10951464qvb.27.1658766531421;
        Mon, 25 Jul 2022 09:28:51 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:1230:2e4b:4ce0:4ade:bf5e])
        by smtp.gmail.com with ESMTPSA id y11-20020a05622a004b00b003051f450049sm8131847qtw.8.2022.07.25.09.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 09:28:51 -0700 (PDT)
Date: Mon, 25 Jul 2022 09:28:50 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc: drop dependency on <asm/machdep.h> in
 archrandom.h
Message-ID: <Yt7Ewi2vu49fW1ZJ@yury-laptop>
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-2-yury.norov@gmail.com>
 <8735epd204.fsf@mpe.ellerman.id.au>
 <87wnc1bcwa.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wnc1bcwa.fsf@mpe.ellerman.id.au>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 25, 2022 at 10:22:13PM +1000, Michael Ellerman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Yury Norov <yury.norov@gmail.com> writes:
> >> archrandom.h includes <asm/machdep.h> to refer ppc_md. This causes
> >> circular header dependency, if generic nodemask.h  includes random.h:
> >>
> >> In file included from include/linux/cred.h:16,
> >>                  from include/linux/seq_file.h:13,
> >>                  from arch/powerpc/include/asm/machdep.h:6,
> >>                  from arch/powerpc/include/asm/archrandom.h:5,
> >>                  from include/linux/random.h:109,
> >>                  from include/linux/nodemask.h:97,
> >>                  from include/linux/list_lru.h:12,
> >>                  from include/linux/fs.h:13,
> >>                  from include/linux/compat.h:17,
> >>                  from arch/powerpc/kernel/asm-offsets.c:12:
> >> include/linux/sched.h:1203:9: error: unknown type name 'nodemask_t'
> >>  1203 |         nodemask_t                      mems_allowed;
> >>       |         ^~~~~~~~~~
> >>
> >> Fix it by removing <asm/machdep.h> dependency from archrandom.h
> >>
> >> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> >> ---
> >>  arch/powerpc/include/asm/archrandom.h |  9 +--------
> >>  arch/powerpc/kernel/setup-common.c    | 11 +++++++++++
> >>  2 files changed, 12 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
> >> index 9a53e29680f4..21def59ef1a6 100644
> >> --- a/arch/powerpc/include/asm/archrandom.h
> >> +++ b/arch/powerpc/include/asm/archrandom.h
> >> @@ -4,7 +4,7 @@
> >>  
> >>  #ifdef CONFIG_ARCH_RANDOM
> >>  
> >> -#include <asm/machdep.h>
> >> +bool __must_check arch_get_random_seed_long(unsigned long *v);
> >>  
> >>  static inline bool __must_check arch_get_random_long(unsigned long *v)
> >>  {
> >> @@ -16,13 +16,6 @@ static inline bool __must_check arch_get_random_int(unsigned int *v)
> >>  	return false;
> >>  }
> >>  
> >> -static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
> >> -{
> >> -	if (ppc_md.get_random_seed)
> >> -		return ppc_md.get_random_seed(v);
> >> -
> >> -	return false;
> >> -}
> >
> > I'd rather we didn't have to force this out of line.
> >
> > I think I see a different way to fix it, I'll just do some more build
> > tests.
> 
> Of course my idea didn't work :}
> 
> So I'll just ack your patch for now, and maybe I can get the headers
> cleaned up in future to allow it to be out-of-line again.

I understand that it looks like a tradeoff - we inline a couple of small
functions with the cost of uninlining an almost innocent victim. 

The complete solution would be probably a splitting ppc_md declaration
out of asm/machdep.h. I wanted to do that, but I'm not a PPC guy, and
just don't know how to split the header correctly.

Anyways, thanks for the ack. Applied on bitmap-for-next.

Thanks,
Yury
