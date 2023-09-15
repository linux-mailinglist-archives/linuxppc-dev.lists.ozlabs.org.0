Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2EA7A2776
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 21:54:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AlplQoDH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnPys0QN6z3dFB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 05:54:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AlplQoDH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnPxz6LSCz3cPX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 05:53:26 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68fdd5c1bbbso1850794b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 12:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694807602; x=1695412402; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CERIXMszobECCcmTb35olIeJedTz3jO0YWogNpKALzc=;
        b=AlplQoDH3Zqsugqcl/sL8KdWCei2XszK+pchsFsF1VBJWfqTVmJ+ULmg6eV/SDvXwH
         YZnya7SL/GiIEOwLLgxjDUsL2IsIj39vwUwry8qK5+LtlJ1Rnk+/brCwKH4TYD0m1agU
         U7oNnMN4IEE2Y8mO9vhwCrn+w6kIUvdEKXUWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694807602; x=1695412402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CERIXMszobECCcmTb35olIeJedTz3jO0YWogNpKALzc=;
        b=gH6hjQW31IbtTMHPY3EQDSxa6NAZ0G2VKvBeJgWn/uYeOJHs/F/274J0TGrtIv31WW
         8hjQefuukMEfo9Eu40rJf6l9aTUHxpg6rjBqOMMRKZCZEV/iKge6WLHd21v275ebWofN
         P5TcXoKKTlygEB0rybK1jP43P9dkGjLGKb8+K2wNs5yYZTT6oLdvNouUk4C+fI92Sn1W
         ZFvAomAEwKBo+1n+KEPW26xJgbzqEWMZDL+AUkvyO6WmC1NEHobfi01GplgYS8Abe6Qd
         5yJfG/PK7VfsiIAKSEp2GtuJQeqSp4H2LDHwCXfpFkCAOByyuOVYY/48pGufWGcfxnqZ
         8NcA==
X-Gm-Message-State: AOJu0Yw8Xa4U0IN86GMB6hxznqyK6aAXXB3AMDzOaYqNgSBmE++wbKHW
	qG+Xo6VumwGSuq8XTDSWWhzdbQ==
X-Google-Smtp-Source: AGHT+IEPvKFh8vTTzZWluYNsudPUjGFO4rE/xMIMo+tGYyEr5KiifbvSDLT3mH3As6hXoBlLo3SNkA==
X-Received: by 2002:a05:6a00:1a11:b0:68e:2c2a:5172 with SMTP id g17-20020a056a001a1100b0068e2c2a5172mr3314996pfv.6.1694807601720;
        Fri, 15 Sep 2023 12:53:21 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y17-20020aa78551000000b006878cc942f1sm3307731pfn.54.2023.09.15.12.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 12:53:21 -0700 (PDT)
Date: Fri, 15 Sep 2023 12:53:20 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] net: spider_net: Use size_add() in call to
 struct_size()
Message-ID: <202309151253.844C8BFCA3@keescook>
References: <ZQSvsLmJrDsKtLCa@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQSvsLmJrDsKtLCa@work>
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Geoff Levand <geoff@infradead.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 15, 2023 at 01:25:36PM -0600, Gustavo A. R. Silva wrote:
> If, for any reason, the open-coded arithmetic causes a wraparound,
> the protection that `struct_size()` adds against potential integer
> overflows is defeated. Fix this by hardening call to `struct_size()`
> with `size_add()`.
> 
> Fixes: 3f1071ec39f7 ("net: spider_net: Use struct_size() helper")
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
