Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5115B1073
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 01:35:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNJX45K5Lz3c4N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 09:35:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KY+PrU0l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KY+PrU0l;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNJWT1vH7z2yp5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 09:34:42 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id u22so16063464plq.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Sep 2022 16:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=XSbBGffu2FVIOAcIwkeNSD8KuaOdq+iesnGMUCwAeTU=;
        b=KY+PrU0lGhQtTLQNN2pWFqcE1LnBpbbWDb0rbOdjRcryAGRzT10mekKUQs/hx5IWfc
         NFnigMwimobNFGgyI+x3a1uPOyWp+GJ57NrlduGzWlADCIfmi4DEvVyxP3klvjGSmK6S
         bIsg/2Kj75aYsnpvzhm/uSVj330L5WzCT/lBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=XSbBGffu2FVIOAcIwkeNSD8KuaOdq+iesnGMUCwAeTU=;
        b=g8jp+xDr3S8H4HDMB+ec4ENE6N975vH9rqD/DwJlR97CW5WJQzmHutE4E7JHnSuMb5
         ToWCXStXMK4TP+RvDq5knUA/Qbo4ttwuJGf08rps07U4UGZeDIOrz7Z6N6KROEZsL5ED
         vnsHfwyKUJd1pZfbXRzJ97WUa9Scw0J+Pz00EQCDnwDzQ/DEBDmPA4CTLEFljjquWDXb
         uRdvs0PlJqBUg81EADpT6X+DgJgCnD3oseSm+KPFwgxK+DaH3AsOGM4edF/FdRPwJFyj
         8CELN5W56R6ZYvFL55U+qDI9JOwNd9SG+xtwOVOCeTMCjCJY1NoHZ1vOxIrooh1UXzzY
         bo0Q==
X-Gm-Message-State: ACgBeo10ihXgLrCYP5vEiHhgeSCU5PIxumgNhf2lbBLfcN9DvlonQ+HD
	3P0cMjwh30DZloVTfJxvUT68ag==
X-Google-Smtp-Source: AA6agR6Rj3Ng4uD4eI/0C1clYjJ/SoLai8r45C+puUVjcvUnjiFrRX0IS6jpxhbi09w8xzFyK3bhEg==
X-Received: by 2002:a17:902:d2cd:b0:177:4940:cc03 with SMTP id n13-20020a170902d2cd00b001774940cc03mr4538114plc.98.1662593680649;
        Wed, 07 Sep 2022 16:34:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l10-20020a63da4a000000b0042c0ffa0e62sm11192333pgj.47.2022.09.07.16.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:34:39 -0700 (PDT)
Date: Wed, 7 Sep 2022 16:34:38 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] powerpc: Fix fall-through warning for Clang
Message-ID: <202209071634.7CEEF9A@keescook>
References: <Yxe8XTY5C9qJLd0Z@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yxe8XTY5C9qJLd0Z@work>
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
Cc: linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 06, 2022 at 10:32:13PM +0100, Gustavo A. R. Silva wrote:
> Fix the following fallthrough warning:
> 
> arch/powerpc/platforms/85xx/mpc85xx_cds.c:161:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
> 
> Link: https://github.com/KSPP/linux/issues/198
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/lkml/202209061224.KxORRGVg-lkp@intel.com/
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
