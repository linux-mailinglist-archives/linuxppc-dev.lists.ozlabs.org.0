Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD7369A724
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 09:38:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ4wQ1ZPgz3c6G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 19:38:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KiKE9cqw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KiKE9cqw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KiKE9cqw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KiKE9cqw;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ4vT6J4pz3cH9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 19:37:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676623074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MSzy/8JN5jaVlg7s7Ev+cHsdti/OpYprCjQK25MrEM0=;
	b=KiKE9cqw08G2Hjlod0gd0Pa1jGiPzsQUsfmI2EgHWMU8/0FzkedYWbq7gmCmwlvMqO6FxG
	rEvF2gaDOuhoxvVjfWuf3s1sYCf5pyUzo7E+gYzoczbqH1Ld86p72a1SBi/jL/MuVUEiMW
	OwGCu8FyNd/wDZ/6LN40ycKddyirFTY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676623074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MSzy/8JN5jaVlg7s7Ev+cHsdti/OpYprCjQK25MrEM0=;
	b=KiKE9cqw08G2Hjlod0gd0Pa1jGiPzsQUsfmI2EgHWMU8/0FzkedYWbq7gmCmwlvMqO6FxG
	rEvF2gaDOuhoxvVjfWuf3s1sYCf5pyUzo7E+gYzoczbqH1Ld86p72a1SBi/jL/MuVUEiMW
	OwGCu8FyNd/wDZ/6LN40ycKddyirFTY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-At-yQ9mrPxq6w9PWm-TsZg-1; Fri, 17 Feb 2023 03:37:49 -0500
X-MC-Unique: At-yQ9mrPxq6w9PWm-TsZg-1
Received: by mail-wm1-f72.google.com with SMTP id l36-20020a05600c1d2400b003dfe4bae099so307350wms.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 00:37:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSzy/8JN5jaVlg7s7Ev+cHsdti/OpYprCjQK25MrEM0=;
        b=bui57daEZumMPeNCfsgdeqeD47IBdx/4hvmYaIUGofHpOY1ryQcuo8nbIMjG8Qo86N
         bVM2aI5gApWIdFcJNa4srE2FFtAYsKh1XF/CETnKs4sgA19CJgBK9IqTVeJLgPhi4cbe
         6SnMIR566jKrTckrxJ9Cp2ZUG/WiuXiZANkdAPGLdvlDdRwjMS4qklqxnTfrk7hMfcc8
         r9mpiztLTQ5iPeomVIpLFn4SGjgkIW76D9XyrTCGokSDeqOF9cLBdA+LH7UhPzAl+Pos
         5EpNnrGxggm51Qnt3fswfbE2BhCw3dlbmlPLd1a3V2lQOS4lKxGtWsmkFgN/8oO6NDDl
         DeDA==
X-Gm-Message-State: AO0yUKUNI0Mcd+rDLbzlL8jD9tJxnxwxJnoMi5O0GuAj8KOHsqotKo4x
	GtRxAGJXB31oN4hzhYnmDDmP8XS2MshGOTu33py2GCJ8biNm8YStZMNEOBkGs7ANBEB1WZiOAaQ
	HrgjB1rI7DMH1XIPx+3irr29sfQ==
X-Received: by 2002:a05:600c:16c7:b0:3e2:1e01:803a with SMTP id l7-20020a05600c16c700b003e21e01803amr1933587wmn.9.1676623068629;
        Fri, 17 Feb 2023 00:37:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8mFyGd004x7JjuNSnWDCqg+N00uieOFI0jxDxZPqHUm7LxzesmJkc9kYDEF+RIXwKqhhHhUQ==
X-Received: by 2002:a05:600c:16c7:b0:3e2:1e01:803a with SMTP id l7-20020a05600c16c700b003e21e01803amr1933569wmn.9.1676623068346;
        Fri, 17 Feb 2023 00:37:48 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x9-20020a05600c21c900b003e11ad0750csm4292183wmj.47.2023.02.17.00.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 00:37:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 02/11] fbdev: Transfer video= option strings to caller;
 clarify ownership
In-Reply-To: <20230209135509.7786-3-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-3-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 09:37:46 +0100
Message-ID: <87a61cy9et.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> In fb_get_options(), always duplicate the returned option string and
> transfer ownership of the memory to the function's caller.
>
> Until now, only the global option string got duplicated and transferred
> to the caller; the per-driver options were owned by fb_get_options().
> In the end, it was impossible for the function's caller to detect if
> it had to release the string's memory buffer. Hence, all calling drivers
> leak the memory buffer. The leaks have existed ever since, but drivers
> only call fb_get_option() once as part of module initialization. So the
> amount of leaked memory is not significant.
>
> Fix the semantics of fb_get_option() by unconditionally transferring
> ownership of the memory buffer to the caller. Later patches can resolve
> the memory leaks in the fbdev drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +	if (option) {
> +		if (options)
> +			*option = kstrdup(options, GFP_KERNEL);
> +		else
> +			*option = NULL;
> +	}
>

I know the old code wasn't checking if kstrdup() succeeded, but you should
do it here and let the caller know. And same if (!options). So I guess the
following check can be added (to be consistent with the rest of the code):

	if (!*option)
		retval = 1;

>  	return retval;
>  }
> -- 
> 2.39.1

Best regards,
Javier

