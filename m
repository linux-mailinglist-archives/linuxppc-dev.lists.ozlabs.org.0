Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6072C77C3CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 01:14:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B+UBhYRW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPqx60hhkz3cN3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 09:14:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B+UBhYRW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPqwB5Px2z2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 09:14:00 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bc3d94d40fso41973175ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 16:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692054837; x=1692659637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DU30yTGenjwr8H/p0lpH7CNdRUrwWJdI1Z1Jmc0+2Vk=;
        b=B+UBhYRWcaaB0nF1PSoMyqS4qeWPfUbK+TEQp0Xz+nb9+YJm+OLQIVvXNlTkflG3od
         fhQiyV/iWRViJ30fmfywnpUSqv+ZUu/wHolkiLrlRXgZ1S2+NQk+mpL9Rze5S/Tu/ftF
         lv0kUgKX0VbPef7KtkvaOzisUdSyop7bHweUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692054837; x=1692659637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DU30yTGenjwr8H/p0lpH7CNdRUrwWJdI1Z1Jmc0+2Vk=;
        b=Ua7oyha3+kEDwnyd65gp4HKR6Jx1FlollqHIefkhBRxprMo4valZs0N9YPwcrCqTRu
         AnCq5kQfBVQFAmxEhQ+s4GUWff4jIdwZeojtcH/OUE6NbxD1sja+37gETGomwwdXkxtu
         z9H1OyxXbHqJ8ix1eefx631h5oZTmCzmsLzAmcWlLvJRpaku7WB0/Gg1wt9jj84J0lXk
         pjZLSQnhwUE/ablULDHgT55iV4wIBwyE78x/aLlOYb1FmKz6QJb/oC5jXMQLPBB1Wv8n
         yZ58ViaBo00Q+ZYapxi7XBTugyvHcYcCfNJaTmTnbRi+QObT+yqwbQYDC7l5mL0t/nIK
         Twbg==
X-Gm-Message-State: AOJu0YwE2ZwgzrhA+wH6LJp0Pi2iQP2GrO6D2bkDhcQT89yxcSOZckVY
	nH9WDSzQCXAjghGwjveNAqcb/Q==
X-Google-Smtp-Source: AGHT+IG5ZiEaSz4ENoyRdjcIg38pZM9w7tQfNTdMqDXt8HFdYmHBsWQAGJWWYXHDCX1kAl5yiRQHzw==
X-Received: by 2002:a17:902:d490:b0:1bd:e64c:5c7e with SMTP id c16-20020a170902d49000b001bde64c5c7emr3923448plg.61.1692054837613;
        Mon, 14 Aug 2023 16:13:57 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l13-20020a170902d34d00b001bda42a216bsm9671965plk.100.2023.08.14.16.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 16:13:56 -0700 (PDT)
Date: Mon, 14 Aug 2023 16:13:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH RFC 2/3] powerpc/ps3: refactor strncpy usage attempt 2
Message-ID: <202308141612.818819C6@keescook>
References: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-0-301052a5663e@google.com>
 <20230811-strncpy-arch-powerpc-platforms-ps3-v1-2-301052a5663e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811-strncpy-arch-powerpc-platforms-ps3-v1-2-301052a5663e@google.com>
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
Cc: Geoff Levand <geoff@infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 11, 2023 at 09:19:20PM +0000, Justin Stitt wrote:
> This approach tries to use `make_field` inside of `make_first_field`.
> This comes with some weird implementation as to get the same result we
> need to first subtract `index` from the `make_field` result whilst being
> careful with order of operations. We then have to add index back.

I think for readability, it's better to avoid the function composition.
The index subtraction undoes the earlier addition -- I say just leave it
separate.

i.e. I like option 1 of 3 the best.

-Kees

-- 
Kees Cook
