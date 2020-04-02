Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B72119BD2B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 09:59:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tFnl3sN9zDqcD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 18:59:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=A6ZJzATV; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tFdw34fnzDrGq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 18:52:20 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id a13so1394345pfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 00:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YDhcDFzxnB0LzwhhhavzuQofpQqoxKbtsiZ2UHnUGxU=;
 b=A6ZJzATVZMdYm6aYjzbAsFnbVu+/ukE/HUOrWoX6wNSXH7TjId503hbalZIcER3qhr
 Y5qB/1CFmXiQvAttlkjKxpgOTqSerdCjb/TPzMe6QvKL8r5gTbbRJSL4V6e2L7JhAA5B
 DOCsSudHTl/uKCgBkojQz+0LCaSqXe0yQNm4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YDhcDFzxnB0LzwhhhavzuQofpQqoxKbtsiZ2UHnUGxU=;
 b=QqfkFErSpf1d07GyedM3xZo0Qar/Ml4Q8a7U/QcWK5je2YFSBtqzOjFuCz4BmLgVWv
 96KrsOI8ZI2qfJyhdgJhYq/qj1PE7H0LU51lmeMNHns69hyRzzWY6J3lVeiyifNRgj+X
 WKl7dOSv7N4ceanC9P43L/ABOGKjRpoZk03N8TWWbqloDDBDzqsVK75m6G01bLhvRmQN
 0CNKPwZmuwh+qFRkf1jHWA8qOPId+6mpKfZj5uuyksxAEG/2WRaWO7H/piR1rS0sAJ4x
 8kq92w+eYe4OMukLt2NIvgD6gRFHWF48BiEEymXBTkdV6r1ubuGEb9rXU8JQpP4yMd4h
 Y+Lg==
X-Gm-Message-State: AGi0PuYWzPulUD4jAHINO608mbNoPm3nT7VkkLYkFYETGRb51EE8pX8l
 THTxKex8rDuYn0G17Wnz1fmf7Q==
X-Google-Smtp-Source: APiQypKB4nOuEy27sAy36sblXB+uB0SHnxgxvV5A0l19f7PmP5vbDtzIT9/IOshcLycLAXLiPPMwyg==
X-Received: by 2002:a63:8c13:: with SMTP id m19mr2113657pgd.44.1585813937373; 
 Thu, 02 Apr 2020 00:52:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m14sm3216861pje.19.2020.04.02.00.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 00:52:16 -0700 (PDT)
Date: Thu, 2 Apr 2020 00:52:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH RESEND 3/4] drm/i915/gem: Replace user_access_begin by
 user_write_access_begin
Message-ID: <202004020051.649C6B8@keescook>
References: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
 <6da6fa391c0d6344cc9ff99a69fcaa65666f3947.1585811416.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6da6fa391c0d6344cc9ff99a69fcaa65666f3947.1585811416.git.christophe.leroy@c-s.fr>
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

On Thu, Apr 02, 2020 at 07:34:18AM +0000, Christophe Leroy wrote:
> When i915_gem_execbuffer2_ioctl() is using user_access_begin(),
> that's only to perform unsafe_put_user() so use
> user_write_access_begin() in order to only open write access.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Why is this split from the other conversions?

Reviewed-by: Kees Cook <keescook@chromium.org>


> ---
>  drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 7643a30ba4cd..4be8205a70b6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -1611,14 +1611,14 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
>  		 * happened we would make the mistake of assuming that the
>  		 * relocations were valid.
>  		 */
> -		if (!user_access_begin(urelocs, size))
> +		if (!user_write_access_begin(urelocs, size))
>  			goto end;
>  
>  		for (copied = 0; copied < nreloc; copied++)
>  			unsafe_put_user(-1,
>  					&urelocs[copied].presumed_offset,
>  					end_user);
> -		user_access_end();
> +		user_write_access_end();
>  
>  		eb->exec[i].relocs_ptr = (uintptr_t)relocs;
>  	}
> @@ -1626,7 +1626,7 @@ static int eb_copy_relocations(const struct i915_execbuffer *eb)
>  	return 0;
>  
>  end_user:
> -	user_access_end();
> +	user_write_access_end();
>  end:
>  	kvfree(relocs);
>  	err = -EFAULT;
> @@ -2991,7 +2991,8 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>  		 * And this range already got effectively checked earlier
>  		 * when we did the "copy_from_user()" above.
>  		 */
> -		if (!user_access_begin(user_exec_list, count * sizeof(*user_exec_list)))
> +		if (!user_write_access_begin(user_exec_list,
> +					     count * sizeof(*user_exec_list)))
>  			goto end;
>  
>  		for (i = 0; i < args->buffer_count; i++) {
> @@ -3005,7 +3006,7 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>  					end_user);
>  		}
>  end_user:
> -		user_access_end();
> +		user_write_access_end();
>  end:;
>  	}
>  
> -- 
> 2.25.0
> 

-- 
Kees Cook
