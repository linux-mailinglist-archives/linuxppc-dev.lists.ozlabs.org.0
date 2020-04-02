Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 016B819C8EA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 20:39:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tX0M70j1zDrfL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 05:39:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=IEfTzILK; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tWwh55dzzDrMh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 05:36:04 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id c23so2246984pgj.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 11:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MBBRhcWlTmLjshW9NwjTAABOEAhTDX32vhb9ox45OjU=;
 b=IEfTzILKyLkhfpwHgMwKAHNo0SXkWWQIbDRvPlZWRptpe05omv5tLovfYlECAnyWcE
 tiE4YcdCHVMysKGnFUGnEjP0YzlOl8lC/YVB5X+cGbPq+ubht5zYup99LDWEVEf37kzF
 V2Lm4oZXPYl9YKd/oMwN6nHggdELP0qetvbBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MBBRhcWlTmLjshW9NwjTAABOEAhTDX32vhb9ox45OjU=;
 b=EDM18+TtoL7KG1uOfRcDETpAmiDhdewVjdaAu96iantoncOFw9GfpBo0XDSWbIyhy9
 G80ncEEFoIZiwWCZY8kMYUyVvs9bguNQ8dkaHdzy8clmANQgz18G/tf8ywPKUEYWq0Yw
 y7bPAQ8ywbngH6kZWxxQkowNW66Vj5RZogf0Xp5loUAzbBl+sJ3djK860zHWTg0455KH
 91DwfC2vsClBjFTx93myJAp2cCxnNq2dsrsh9096LsRvjzIiMXAgluA3pijqcS28tGEd
 Mbz3hZFgJ7eQ+DZDsGOTODKpBGZ1hX4KeymkVVcHpzbddWZ3VE+L9YOITvg8etobgiYy
 yOiw==
X-Gm-Message-State: AGi0PuaZAXDz7m57sfopsuid5RnLwOTbqKs9E5cw7TRsqVYnrPH2+zxK
 JwK5/Gp4+9FB7zB7NRTVK7XJlA==
X-Google-Smtp-Source: APiQypL88WhZOnrTMVmaoC4rwp7riCtTsgSSYjJzsJsGIRi1RUlgzkKuTBBp5rtjR5K09Q2BMk3zag==
X-Received: by 2002:a65:62ce:: with SMTP id m14mr56221pgv.174.1585852559728;
 Thu, 02 Apr 2020 11:35:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h198sm4203102pfe.76.2020.04.02.11.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 11:35:58 -0700 (PDT)
Date: Thu, 2 Apr 2020 11:35:57 -0700
From: Kees Cook <keescook@chromium.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH RESEND 1/4] uaccess: Add user_read_access_begin/end and
 user_write_access_begin/end
Message-ID: <202004021132.813F8E88@keescook>
References: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
 <20200402162942.GG23230@ZenIV.linux.org.uk>
 <67e21b65-0e2d-7ca5-7518-cec1b7abc46c@c-s.fr>
 <20200402175032.GH23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402175032.GH23230@ZenIV.linux.org.uk>
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, airlied@linux.ie,
 hpa@zytor.com, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, daniel@ffwll.ch, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 02, 2020 at 06:50:32PM +0100, Al Viro wrote:
> On Thu, Apr 02, 2020 at 07:03:28PM +0200, Christophe Leroy wrote:
> 
> > user_access_begin() grants both read and write.
> > 
> > This patch adds user_read_access_begin() and user_write_access_begin() but
> > it doesn't remove user_access_begin()
> 
> Ouch...  So the most generic name is for the rarest case?
>  
> > > What should we do about that?  Do we prohibit such blocks outside
> > > of arch?
> > > 
> > > What should we do about arm and s390?  There we want a cookie passed
> > > from beginning of block to its end; should that be a return value?
> > 
> > That was the way I implemented it in January, see
> > https://patchwork.ozlabs.org/patch/1227926/
> > 
> > There was some discussion around that and most noticeable was:
> > 
> > H. Peter (hpa) said about it: "I have *deep* concern with carrying state in
> > a "key" variable: it's a direct attack vector for a crowbar attack,
> > especially since it is by definition live inside a user access region."
> 
> > This patch minimises the change by just adding user_read_access_begin() and
> > user_write_access_begin() keeping the same parameters as the existing
> > user_access_begin().
> 
> Umm...  What about the arm situation?  The same concerns would apply there,
> wouldn't they?  Currently we have
> static __always_inline unsigned int uaccess_save_and_enable(void)
> {
> #ifdef CONFIG_CPU_SW_DOMAIN_PAN
>         unsigned int old_domain = get_domain();
> 
>         /* Set the current domain access to permit user accesses */
>         set_domain((old_domain & ~domain_mask(DOMAIN_USER)) |
>                    domain_val(DOMAIN_USER, DOMAIN_CLIENT));
> 
>         return old_domain;
> #else
>         return 0;
> #endif
> }
> and
> static __always_inline void uaccess_restore(unsigned int flags)
> {
> #ifdef CONFIG_CPU_SW_DOMAIN_PAN
>         /* Restore the user access mask */
>         set_domain(flags);
> #endif
> }
> 
> How much do we need nesting on those, anyway?  rmk?

Yup, I think it's a weakness of the ARM implementation and I'd like to
not extend it further. AFAIK we should never nest, but I would not be
surprised at all if we did.

If we were looking at a design goal for all architectures, I'd like
to be doing what the public PaX patchset did for their memory access
switching, which is to alarm if calling into "enable" found the access
already enabled, etc. Such a condition would show an unexpected nesting
(like we've seen with similar constructs with set_fs() not getting reset
during an exception handler, etc etc).

-- 
Kees Cook
