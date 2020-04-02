Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7D219BD40
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 10:03:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tFtr5SdSzDrQ2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 19:03:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=NEr/HOuF; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tFjj0v0FzDqqW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 18:55:36 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id h8so1471977pgs.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 00:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cNKPt9zws6tETOtG4clSFgvYQggRaWY4PbOPgRy3R/Q=;
 b=NEr/HOuFOs50bDB/L0pQZVsoQ+Nyg7UDyLD4S8+MDPajx7NSq21pauFLuu8fuuS5HT
 dA7TbZA2aW9xfHzx8uCcccW9e7W+yaqO5sU6kFMZUqI2AY+iLus6FD4e+eesLB4+PTnk
 oebi07I1vQWsVfSymxAqSpu68Tvq2bSlWm8+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cNKPt9zws6tETOtG4clSFgvYQggRaWY4PbOPgRy3R/Q=;
 b=XTJEhZF7amZyTaV12N/zLKgdYXNSVd3VrKnxUYDJ2YCOmA8HwhZaiDq5HEF2Hyo/gh
 yi7hOXnHFlUwIPAigmIlisZE/OPndebrw1Biz4gdIWtBNEvq+fZXt21gtLsLanC8nWE+
 hJRwrhGsA2ghlMsO6TtsOtYko3c8tpRldvBdyG6kM/y6F8Gz0CuwAEpTI2mvC6R1glLC
 qAA6e0PrY9Zfjs11lmveXOGxFQiQ9zbpt/BpPw2jwtXFOrL7ddw4DSPqRaIGhAB3Wmr2
 Y5MDgconYhbHjlpaWZgTfPDOLJG7ZpFZWuZAnT2jUvJ+NWgc5I5+pIZaliRB9Vt5dCo1
 59Sg==
X-Gm-Message-State: AGi0PuYDkKsOwejjY0sLZO24b1IGNqqaddBHAfUG0+qQWF6sOg0XDFmI
 1fVTTPJ+lcvefepqwL3dPlCbnA==
X-Google-Smtp-Source: APiQypLB2ZurOAtjAAZY1rw1Oc9/IReJTqNfIyojiVL6ct3p3zeLZXi1W1njrDdywOR0TVbU9jwgMA==
X-Received: by 2002:a62:1c4c:: with SMTP id c73mr1880326pfc.64.1585814134808; 
 Thu, 02 Apr 2020 00:55:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u21sm3185973pjy.8.2020.04.02.00.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 00:55:34 -0700 (PDT)
Date: Thu, 2 Apr 2020 00:46:56 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH RESEND 1/4] uaccess: Add user_read_access_begin/end and
 user_write_access_begin/end
Message-ID: <202004020046.96A2D21F@keescook>
References: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, airlied@linux.ie,
 hpa@zytor.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, viro@zeniv.linux.org.uk, daniel@ffwll.ch,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 02, 2020 at 07:34:16AM +0000, Christophe Leroy wrote:
> Some architectures like powerpc64 have the capability to separate
> read access and write access protection.
> For get_user() and copy_from_user(), powerpc64 only open read access.
> For put_user() and copy_to_user(), powerpc64 only open write access.
> But when using unsafe_get_user() or unsafe_put_user(),
> user_access_begin open both read and write.
> 
> Other architectures like powerpc book3s 32 bits only allow write
> access protection. And on this architecture protection is an heavy
> operation as it requires locking/unlocking per segment of 256Mbytes.
> On those architecture it is therefore desirable to do the unlocking
> only for write access. (Note that book3s/32 ranges from very old
> powermac from the 90's with powerpc 601 processor, till modern
> ADSL boxes with PowerQuicc II modern processors for instance so it
> is still worth considering)
> 
> In order to avoid any risk based of hacking some variable parameters
> passed to user_access_begin/end that would allow hacking and
> leaving user access open or opening too much, it is preferable to
> use dedicated static functions that can't be overridden.
> 
> Add a user_read_access_begin and user_read_access_end to only open
> read access.
> 
> Add a user_write_access_begin and user_write_access_end to only open
> write access.
> 
> By default, when undefined, those new access helpers default on the
> existing user_access_begin and user_access_end.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> Link: https://patchwork.ozlabs.org/patch/1227926/
> ---
> Resending this series as I mistakenly only sent it to powerpc list
> begining of February (https://patchwork.ozlabs.org/patch/1233172/)
> 
> This series is based on the discussion we had in January, see
> https://patchwork.ozlabs.org/patch/1227926/ . I tried to
> take into account all remarks, especially @hpa 's remark to use
> a fixed API on not base the relocking on a magic id returned at
> unlocking.
> 
> This series is awaited for implementing selective lkdtm test to
> test powerpc64 independant read and write protection, see
> https://patchwork.ozlabs.org/patch/1231765/
> 
>  include/linux/uaccess.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index 67f016010aad..9861c89f93be 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -378,6 +378,14 @@ extern long strnlen_unsafe_user(const void __user *unsafe_addr, long count);
>  static inline unsigned long user_access_save(void) { return 0UL; }
>  static inline void user_access_restore(unsigned long flags) { }
>  #endif
> +#ifndef user_write_access_begin
> +#define user_write_access_begin user_access_begin
> +#define user_write_access_end user_access_end
> +#endif
> +#ifndef user_read_access_begin
> +#define user_read_access_begin user_access_begin
> +#define user_read_access_end user_access_end
> +#endif
>  
>  #ifdef CONFIG_HARDENED_USERCOPY
>  void usercopy_warn(const char *name, const char *detail, bool to_user,
> -- 
> 2.25.0
> 

-- 
Kees Cook
