Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF8458341D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 22:32:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtQT21Sptz3dpG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 06:32:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z7JaTh2S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z7JaTh2S;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtQSL3KBMz2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 06:32:15 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d3so10988pls.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 13:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kjP70k9t0KxDR7jt1AysqjuIaIYJ8FiZnNeTsn+rTAg=;
        b=Z7JaTh2SQlfgpSPA/Q0kUcjq/MQmhJcgBlhsTFZiT2WqUSA+YdovEK4ZLpv2i1+Jzi
         +BL96aly3eCJnRv6rw/T0POK2FweB9Po/Z4mJymG8ie8nNw5r+L5vNX7+B3lu4nraq1E
         +5hEevqPSvjzXY7kVIBaHPWFGApqnY8Yg/T84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kjP70k9t0KxDR7jt1AysqjuIaIYJ8FiZnNeTsn+rTAg=;
        b=O3ij7zZTIqetXDIJG5qQNLMKXvUfG7UEBPCBf4ud261+eCwlUf6Kh98QAReAikhhn9
         3zeD5JpyPd/8jJxszw/WYa59rGtKZ0+HFqRg1CwPKN/q3YGe+NS9xrWtWJENfmc4oDCH
         PCXHLCFshi7ZPzeF2Yrv9I5/9f/S9JXpeOxzA8LAjUm5ZRJ4RHdUn9Hse2xfftURUhT9
         U4dZhVgDXWbOjP50RpTg/2Xzzi2uKTAUfJnxuUdci5BI67zXZKipYwd9i8jR/jRxePFR
         PzvnIYYHkRWdCTJs2QM3Dx4F7v78I1XZelkYOlZHFqtQXMBdyK0VI1PIf4ejW+Dc8nLO
         8kfg==
X-Gm-Message-State: AJIora8QS7IGB1bpJnb57ms/i0egNxauCG2APYmWooZM0kuSx2WQlZBk
	6CABbgOtWx1vS6qsaBZvjcROUw==
X-Google-Smtp-Source: AGRyM1tL3ybzMjXRYP58mGjg0YjcwPF5GkdKSrAUy9bCPWExiEBUk+yEn/bOnOESs02lr8ZGX2hB8A==
X-Received: by 2002:a17:903:11cc:b0:168:eae:da4a with SMTP id q12-20020a17090311cc00b001680eaeda4amr23356939plh.21.1658953931435;
        Wed, 27 Jul 2022 13:32:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q13-20020a65684d000000b00419cde333eesm12401728pgt.64.2022.07.27.13.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 13:32:10 -0700 (PDT)
Date: Wed, 27 Jul 2022 13:32:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Xiu Jianfeng <xiujianfeng@huawei.com>
Subject: Re: [PATCH -next v3 2/2] powerpc: add support for syscall stack
 randomization
Message-ID: <202207271331.B227002C@keescook>
References: <20220701082435.126596-1-xiujianfeng@huawei.com>
 <20220701082435.126596-3-xiujianfeng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701082435.126596-3-xiujianfeng@huawei.com>
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
Cc: mark.rutland@arm.com, linux-kernel@vger.kernel.org, paulus@samba.org, npiggin@gmail.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 01, 2022 at 04:24:35PM +0800, Xiu Jianfeng wrote:
> Add support for adding a random offset to the stack while handling
> syscalls. This patch uses mftb() instead of get_random_int() for better
> performance.
> 
> In order to avoid unconditional stack canaries on syscall entry (due to
> the use of alloca()), also disable stack protector to avoid triggering
> needless checks and slowing down the entry path. As there is no general
> way to control stack protector coverage with a function attribute, this
> must be disabled at the compilation unit level.
> 
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
