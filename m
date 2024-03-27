Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 718AD88E887
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:22:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a8VDp2WD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FfeBvTQ1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Vll1cflz3vfV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:22:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a8VDp2WD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FfeBvTQ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4Vl14jRFz3dTw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:21:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711552905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4RJOr7EzuI0DVaYxx+XjeXTwjAi2iT7d0lhMZ/VIsjg=;
	b=a8VDp2WDVgyboA8qBtWpRsUNHVKyVsc8ecB42vWPaCxi7L2I6aLlzUsd12wEni6Bz/IF9e
	0DXN5FhKemqb74DMpAYYLlKJHsHzh215527tymhMbeAWXwr+MxbzPf1WY3DZBqtdywpvhG
	TRGFzUEXQPGmKnzuovOS49QyXr5qhPA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711552906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4RJOr7EzuI0DVaYxx+XjeXTwjAi2iT7d0lhMZ/VIsjg=;
	b=FfeBvTQ1YOCM6sVNyKpde99nQEnNF1bbiPegJ6LoRMJz4OLuzJ7Fw8hizVP/xUyE3pUtTI
	pg2pnt6R7jteuiaraKjG1pwwKNW7Pah3Zsuf+7wcy8fZNtwkEprZkD3msgiSMEzEZw4TX7
	h/hxo47DbbYOVBC3z3m8yRRJ/luCImU=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-QV8Sbxr-NLuNHktA2OPcDQ-1; Wed, 27 Mar 2024 11:21:44 -0400
X-MC-Unique: QV8Sbxr-NLuNHktA2OPcDQ-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6e4fe655c93so2425755a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711552903; x=1712157703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RJOr7EzuI0DVaYxx+XjeXTwjAi2iT7d0lhMZ/VIsjg=;
        b=WYB5aSfSSEcfoaf6b5SpHFalUTbuXsMojk5+PcVhYUesAeqI0MRKsYyuhSrT/b/W85
         4rSGPliY5bwC0nlXaac0LciekCdJrn19oXZbzMDBv64YsH8LGhXjScSHRmP9ZgbtOWjd
         /BZxyvC2hlCGiJa8JwzJLMSF9BEOg8y4bEvi9cPRF/wCeKDpfqeFSvGhNuKLUW/7DTwO
         3R5lyK2jhBuUQDMvUtBIKMG0VXtxYindWius6B4ibyCJ2xecXw/z58Z7U5SmjdkTy7OT
         5YAINo00gd21cMLbte/c/iWNAcCbU5eVBJl0+iWT1W3d4vzKtJZYwlrdyGQcNGZWoxme
         TK4w==
X-Forwarded-Encrypted: i=1; AJvYcCXr3x6HYWTwZA7fY+JA/jeSuonbxPDV/B2lU5d4ECTxPs05RX4KtVxZvRZQQEGUgoXSkQVSfVdnAXZF8dA9I26Aq46PIGbogupSULMOYw==
X-Gm-Message-State: AOJu0YzqYeIMsxXMuuEeP1Qvd+U+e675rNJQYRxiI5wRyfSp6iuJSiBM
	0axDswC0An56IHs12YEU4atKvnnDZ4jP2MChqwVffNDJzPWtXKJB9c+/0R0NRGj87fxue6gytVn
	6CfWxfcr+LpAQuZavaVaUJo1vjws45QM0oH6+KpL3AzWoJ4J82HbctFdFQgMlY5o=
X-Received: by 2002:a05:6808:128a:b0:3c3:d729:1d56 with SMTP id a10-20020a056808128a00b003c3d7291d56mr316754oiw.0.1711552903442;
        Wed, 27 Mar 2024 08:21:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxT5qAZWntttFMbBHTXwtvywmg90pV0zoL9F4zS7SQ4GsHwDy+Ru4KfcRdtRpsXZfeVg5bqg==
X-Received: by 2002:a05:6808:128a:b0:3c3:d729:1d56 with SMTP id a10-20020a056808128a00b003c3d7291d56mr316719oiw.0.1711552902921;
        Wed, 27 Mar 2024 08:21:42 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id r15-20020a056214212f00b0069698528727sm2350243qvc.90.2024.03.27.08.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:21:42 -0700 (PDT)
Date: Wed, 27 Mar 2024 11:21:40 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 0/3] mm/gup: consistently call it GUP-fast
Message-ID: <ZgQ5hNltQ2DHQXps@x1n>
References: <20240327130538.680256-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240327130538.680256-1-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 02:05:35PM +0100, David Hildenbrand wrote:
> Some cleanups around function names, comments and the config option of
> "GUP-fast" -- GUP without "lock" safety belts on.
> 
> With this cleanup it's easy to judge which functions are GUP-fast specific.
> We now consistently call it "GUP-fast", avoiding mixing it with "fast GUP",
> "lockless", or simply "gup" (which I always considered confusing in the
> ode).
> 
> So the magic now happens in functions that contain "gup_fast", whereby
> gup_fast() is the entry point into that magic. Comments consistently
> reference either "GUP-fast" or "gup_fast()".
> 
> Based on mm-unstable from today. I won't CC arch maintainers, but only
> arch mailing lists, to reduce noise.
> 
> Tested on x86_64, cross compiled on a bunch of archs, whereby some of them
> don't properly even compile on mm-unstable anymore in my usual setup
> (alpha, arc, parisc64, sh) ... maybe the cross compilers are outdated,
> but there are no new ones around. Hm.

I'm not sure what config you tried there; as I am doing some build tests
recently, I found turning off CONFIG_SAMPLES + CONFIG_GCC_PLUGINS could
avoid a lot of issues, I think it's due to libc missing.  But maybe not the
case there.

The series makes sense to me, the naming is confusing.  Btw, thanks for
posting this as RFC. This definitely has a conflict with the other gup
series that I had; I'll post v4 of that shortly.

-- 
Peter Xu

