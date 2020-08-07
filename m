Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1421723F223
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 19:47:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNXr12x2WzDqfW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 03:47:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=imy5ooMK; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNXnw36GwzDqd0
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 03:45:38 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id t6so1271215pjr.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Aug 2020 10:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ODTsy2l7DCvq5FYJ8roRFOkitYdJCNz7j4/THusjSsM=;
 b=imy5ooMKwPOS0aQs/RWCcwaV4isPXG8mWYl2sIGl+iPsUvcGzM0h4xxEvLSkIFLLuL
 YwZz5JCtYM2ZHFrK+mzJtUsMSa0wfckdKf3XDM06fGN5DkreVDafwk2j8jIQW2HFfhDk
 2Zn+4QEHKi5m4UqRF7UXyhK2JMdJ2oYl76PrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ODTsy2l7DCvq5FYJ8roRFOkitYdJCNz7j4/THusjSsM=;
 b=Sj3nlt5q/bzaMNXqeYQLlbksc2ZlN+XAWrcZFomXXHMO0GrIlZ0vB4I7MrzRUiXDEn
 U4nmZ+7vZzxKd78iT/dke5g6gPnL8iGA6Ryf5eHhGKUj5Zryq7wkmSs/ElwJdRRpco+T
 GmJAam7HdjZ2asPM//8vbwsfVCIWzmyvbJiqJ5HAY/toAgsvQ30Quh6KjF7nVlEXdBW7
 hWZhoT29AmqrMi1iwOjjiR2L9AE3NfKaYN27wEtmjzQmpN0RPwN36mrXymYQDBTHXerW
 okRHNrQjYvjOClE4jxXgaW7FI5L0WCJs+u6QdfHMiX+B8pgIY7tSo5W+Hs2ncoDISWSz
 G8wg==
X-Gm-Message-State: AOAM533yxMjz280xAJZFlwuqtBN1JCDjw+5yLfWk4K2DwlpjwSvMcpRn
 1RHVKXAJEZRLK+tL9wbuklTaBA==
X-Google-Smtp-Source: ABdhPJx2xXxTtydgZISi3Tc3Pg8IIcA/ofEJbMfE0aTRRh8Yk2tk92FIkSWt2cKTg0eG8EBDfQwWZQ==
X-Received: by 2002:a17:90b:2092:: with SMTP id
 hb18mr15011251pjb.118.1596822333949; 
 Fri, 07 Aug 2020 10:45:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e29sm4990922pfj.92.2020.08.07.10.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 10:45:33 -0700 (PDT)
Date: Fri, 7 Aug 2020 10:45:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: [Latest Git kernel/Linux-next kernel] Xorg doesn't start after
 the seccomp updates v5.9-rc1
Message-ID: <202008071043.2EABB8D24B@keescook>
References: <67cd9693-10bc-5aa5-0898-ff2ac1f9c725@xenosoft.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67cd9693-10bc-5aa5-0898-ff2ac1f9c725@xenosoft.de>
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
Cc: mad skateman <madskateman@gmail.com>,
 Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 07, 2020 at 04:45:14PM +0200, Christian Zigotzky wrote:
> But Xorg works on Ubuntu 10.04.4 (PowerPC 32-bit), openSUSE Tumbleweed
> 20190722 PPC64 and on Fedora 27 PPC64 with the latest Git kernel.
> 
> I bisected today [4].
> 
> Result: net/scm: Regularize compat handling of scm_detach_fds()
> (c0029de50982c1fb215330a5f9d433cec0cfd8cc) [5] is the first bad commit.
> 
> This commit has been merged with the seccomp updates v5.9-rc1 on 2020-08-04
> 14:11:08 -0700 [1]. Since these updates, Xorg doesn't start anymore on some
> Linux distributions.

Hi! Thanks for bisecting; yes, sorry for the trouble (I'm still trying
to understand why my compat tests _passed_...). Regardless, can you try
this patch:

https://lore.kernel.org/lkml/20200807173609.GJ4402@mussarela/

-- 
Kees Cook
