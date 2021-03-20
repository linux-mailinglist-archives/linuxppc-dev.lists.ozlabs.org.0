Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D143429B3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 02:46:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2NsZ6L2Jz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 12:46:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Xdpq21dU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=bsingharora@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xdpq21dU; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2Ns821xSz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 12:46:17 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id l3so7093147pfc.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 18:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uQvJ/OVGn44ohP4ik8L4ZCZvo4WeHXCrQuFyrKsQHDw=;
 b=Xdpq21dUz7V9qN45GVpK0ttINSmgVso50PVIYAq2wxwT4Sa5OMn3CQXxR7sPGQmM4o
 Wx8vUCJ0dMTNHvC4WhJ6CEK7TADg7yZTvmT1fr1Ov8Px0b9S8z05ow8oScmFaVr7Z1xl
 /zYUUxGzie9IMiqFHkPcYHWd75ou415dNwkA3WR5f7/qewRsTExSnHtX0+P36IQdpBQR
 Ap3PgnVNAOGRqe79Khp7Er1fZzdfoz+0vxQJSuoYSn+/haqNNSycTYhA3lISx/RCN/wX
 hplEdwF2KCQNy2Nvm1yqQfcX0FNBrA7frf8FcyRZzQPq1knvkwGVb55MUsAld/RPgCTe
 b0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uQvJ/OVGn44ohP4ik8L4ZCZvo4WeHXCrQuFyrKsQHDw=;
 b=Sd8Y6In80akaLAEYrXBPPJGN1eV56o48SNoDeR+kIZvYTeeMkE5rgowLi6sBCKLMq2
 QF2j3Df7pfsoizl8G3OuGry+4ZCsaR20eYkVRF8SPCPVIT9MxugmQCYmiMdcXjrRbmmv
 sgXnRjaLe7Tb1z+voT/qbY+TlWh1usIYC/vUhM0hkpRmzvcnuPKJWQw8YLEcz8X56FD2
 gTMyTI7LPHkMuP0XQg1n+WyQuVjiz+V+exv5U6f0KfRnjNwf3QGlQBDUhn7U4XoQH7V7
 BnZJXp5EeH7t1XDzdO106oo4wFBnpf+IabLcx1PgXISZ9YRSVPZ2IreyMJ1xR+TYa3cs
 HKkw==
X-Gm-Message-State: AOAM533wFPmARuwRu2LiWuwKkC1vt+ceQZ0c8zOyISJgVu3I/BVX0w8P
 dm8Bv1M97nNIkXfmZfCideo=
X-Google-Smtp-Source: ABdhPJy85vWAJ0ffrRU9D1z+8S6L5Y3HLtFgLcOlzwnwwwwu0cw1eYJ/p42aWZAD/9tXd2KW53CR6A==
X-Received: by 2002:a65:6a44:: with SMTP id o4mr13646992pgu.312.1616204774010; 
 Fri, 19 Mar 2021 18:46:14 -0700 (PDT)
Received: from localhost ([103.250.185.142])
 by smtp.gmail.com with ESMTPSA id p11sm6305703pjo.48.2021.03.19.18.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 18:46:13 -0700 (PDT)
Date: Sat, 20 Mar 2021 12:46:06 +1100
From: Balbir Singh <bsingharora@gmail.com>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v11 1/6] kasan: allow an architecture to disable inline
 instrumentation
Message-ID: <20210320014606.GB77072@balbir-desktop>
References: <20210319144058.772525-1-dja@axtens.net>
 <20210319144058.772525-2-dja@axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319144058.772525-2-dja@axtens.net>
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
Cc: aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 20, 2021 at 01:40:53AM +1100, Daniel Axtens wrote:
> For annoying architectural reasons, it's very difficult to support inline
> instrumentation on powerpc64.

I think we can expand here and talk about how in hash mode, the vmalloc
address space is in a region of memory different than where kernel virtual
addresses are mapped. Did I recollect the reason correctly?

> 
> Add a Kconfig flag to allow an arch to disable inline. (It's a bit
> annoying to be 'backwards', but I'm not aware of any way to have
> an arch force a symbol to be 'n', rather than 'y'.)
> 
> We also disable stack instrumentation in this case as it does things that
> are functionally equivalent to inline instrumentation, namely adding
> code that touches the shadow directly without going through a C helper.
> 
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>  lib/Kconfig.kasan | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index cffc2ebbf185..7e237dbb6df3 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -12,6 +12,9 @@ config HAVE_ARCH_KASAN_HW_TAGS
>  config HAVE_ARCH_KASAN_VMALLOC
>  	bool
>  
> +config ARCH_DISABLE_KASAN_INLINE
> +	def_bool n
> +

Some comments on what arch's want to disable kasan inline would
be helpful and why.

Balbir Singh.
