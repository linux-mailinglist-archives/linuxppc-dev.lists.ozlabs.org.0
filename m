Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE67A86A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Sep 2023 16:34:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f/9GjGYX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrLdD1M7kz3c5Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 00:34:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f/9GjGYX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrLcL2CWmz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 00:33:20 +1000 (AEST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1d651ab1d77so4017221fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Sep 2023 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695220392; x=1695825192; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0M1U7qooz1MSsev8bUf20ajQA/cHs54guIocLK69iQ=;
        b=f/9GjGYXdCx9eSn3daXzJRx1leAONwF+WEEhw9z1zo8HtPjAfSYp7yf+3SCuP41Cj4
         PyE608GRZz23AT4INBzb0Si6RwQAL91BikgpvRiyqLGnlQOPfBF6Mi/67wJb27KvecfV
         qPEkxqB5ISHcqOpKbtCOgWJ6GuuoVvhcm5j2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695220392; x=1695825192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0M1U7qooz1MSsev8bUf20ajQA/cHs54guIocLK69iQ=;
        b=Fj+BFmLhcUzALJvQyDAdbqkRz1W7xnyFAHYs2LLlj75KMDkSK/eDyJe/qH17F8sRTw
         7vXGdHgm/0Uzw/vaS9+wKZWoj1Ey/GAErlSC62VUfYiAacxShattaEbs8QTpEPV/6R04
         dazoDNlabew0gmHaaD+Ek642KQnDm6iekJoAG2B/oDbJ9CU0UFN56KUdbqjqKEGqDBiY
         aBz4W2SFqzw7qbviWBHMI701yDMEsx9Xb1lv61gwVgWMAUPul9wPp92h8/JEypBk3/a8
         nup9tdMNvPcl8EeC8+AVnUcklUfCvYmaZ1fEiO4UA1lOMEVAN5bBOi79NoJ+74Ue8akr
         h3kQ==
X-Gm-Message-State: AOJu0Yzy8sBqTfzLWroMh//Gn5ciO8gpOpEJ6FQVoiAohmXziMpYUEt6
	PrW7J5qZZ6uE14WztpdlPTjxYw==
X-Google-Smtp-Source: AGHT+IHnG2fdejIvfQiUN3o+flnl539Mq0RwoAuzUXucWVFbeZV6npGQfTNnuQS5wk243vtr8CwbVA==
X-Received: by 2002:a05:6870:8926:b0:1be:f4b3:7f49 with SMTP id i38-20020a056870892600b001bef4b37f49mr2879591oao.23.1695220392694;
        Wed, 20 Sep 2023 07:33:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t13-20020a63954d000000b00564be149a15sm9614073pgn.65.2023.09.20.07.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 07:33:12 -0700 (PDT)
Date: Wed, 20 Sep 2023 07:33:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] i2c: replace deprecated strncpy
Message-ID: <202309200732.29C44010F6@keescook>
References: <20230920-strncpy-drivers-i2c-busses-i2c-powermac-c-v1-1-0a3e9a107f8a@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920-strncpy-drivers-i2c-busses-i2c-powermac-c-v1-1-0a3e9a107f8a@google.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 20, 2023 at 11:07:35AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> `info.type` is expected to be NUL-terminated judging by its use in
> `i2c_new_client_device()` wherein it is used to populate `client->name`:
> |	strscpy(client->name, info->type, sizeof(client->name));
> 
> NUL-padding is not required and even if it was, `client` is already
> zero-initialized.
> 
> Considering the two points from above, a suitable replacement is
> `strscpy` [2] due to the fact that it guarantees NUL-termination on the
> destination buffer without unnecessarily NUL-padding.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Looks like a straight replacement. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
