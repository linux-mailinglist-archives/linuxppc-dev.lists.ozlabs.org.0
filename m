Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E645D77EF63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 05:07:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aPA1/rjM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR90V5JXQz2yWD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 13:07:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aPA1/rjM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR8zb4W1tz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 13:06:33 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6bca38a6618so6060070a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 20:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692241591; x=1692846391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2p3LkM2+1hMmzQH3J+BFjxfC28vADf3DXoxU36vbMDU=;
        b=aPA1/rjMUK8W3JORIST4/I7j1HEp0cHG4g62ZAyQudWm1rQKZrOgMb/DKnk8CQdeNH
         8R5JlJ4U8WgV4zmqADgANt5XxW96VBla1tjrlHye4RhkQrSfbMoWzMZXvjcgE5J/DXrB
         PkQ8NuE+Cyrto1kmD2CcFQ4aUh3F8rav69bLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692241591; x=1692846391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2p3LkM2+1hMmzQH3J+BFjxfC28vADf3DXoxU36vbMDU=;
        b=mI5b6xzU981gK6UQmIR4Zab8wO0AAxTXzb3Ns1i93CDzVVGwUYlyZPy241TjXtU8J6
         sGLnWrbUWrfNbWisO/T3w1AqZNHxWlVUqUeyqfk5vSYM1kwqh9zmb0HjOhGZW78y4QzX
         7A8gE9h6LZRmyShy/YFWpFlEsZ+vGYmEfywTLAdyrj7WzbHdZx9RVnkM84NYMA5B7BTP
         iCCwAX7omQqvrl4re9SfSgrihsqWW4jRTaevHsn/nRMGPy1MXgZAf5J6VElsA/U59qcG
         yhkF3Sn8QkS1+tSKXkuB+SL2yVped5B4ck9M5OtukE7o59miqDTqXk9iK1uzvpTaqThq
         kZ3g==
X-Gm-Message-State: AOJu0YwmwPX4xyPgOckVDLNzBq8Y5+PmkR7bf0bVjudc8G93LOM2yPXY
	gAKPFSPxYGvoFeHuNIQBH3wA9g==
X-Google-Smtp-Source: AGHT+IH1oVDvqjD3T3jAtvKneAa+KIiuN6VtidgwyIxoKunNFZPWMy7NBrz0MStgvao4aq4yjLarZA==
X-Received: by 2002:a05:6870:4713:b0:1bb:68ce:382c with SMTP id b19-20020a056870471300b001bb68ce382cmr4951014oaq.8.1692241590803;
        Wed, 16 Aug 2023 20:06:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g3-20020a17090a290300b00263f40cf83esm498114pjd.47.2023.08.16.20.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 20:06:30 -0700 (PDT)
Date: Wed, 16 Aug 2023 20:06:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] powerpc/ps3: refactor strncpy usage
Message-ID: <202308162006.497A819DC@keescook>
References: <20230816-strncpy-arch-powerpc-platforms-ps3-repository-v1-1-88283b02fb09@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816-strncpy-arch-powerpc-platforms-ps3-repository-v1-1-88283b02fb09@google.com>
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
Cc: Geoff Levand <geoff@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 16, 2023 at 09:39:24PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> `make_first_field()` should use similar implementation to `make_field()`
> due to memcpy having more obvious behavior here. The end result yields
> the same behavior as the previous `strncpy`-based implementation
> including the NUL-padding.
> 
> Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
