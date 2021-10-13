Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A11742B860
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 09:03:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTk5t4ksqz3cYp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 18:03:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Yu/d1w7s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Yu/d1w7s; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTk4j0Tsvz3cPp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 18:02:44 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so3723474pjw.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 00:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=efB3Lcg8IS6RzUiO27f4O4XhGBeoDlQrvifyp9iElT0=;
 b=Yu/d1w7scx0araRrouwcPv6x4zAyT5UDwg8br0GJKxvpbtbYX8o2X/sT0DZJj85xPu
 GeOG1cedBC9ir+WJzzTn0DlJjTcSrRwmj6JY0uqPzF+FpwjUp67IJwMyMJy7Xmdg24ud
 6JNdT8Dwc4xpSiQj6cf4wp2M/y/7wOCbdXf/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=efB3Lcg8IS6RzUiO27f4O4XhGBeoDlQrvifyp9iElT0=;
 b=BNgIDz0NIhF/4Fdlupkt3kXKkWWJVf4P4v56jrbUju4yseoblN/6OsTXeFqiQ0TCwr
 gtud194kQc7lwQNfQSKQ4rhHWTYldFJGVkl+UP3VhoFysxN2xEvDhdd2UVekRyYo9u0R
 zslShPX6IFfZObHQiiWThdQPKO6DHG8mLnYD6ZLmuIaQs4rt3itpIU/nCUwU/vWUNmOj
 ndVs00i+QdYW5RAvsMCJ24UY4j1yhzYHBqQz1CRSUUdJj1Z+CMgv/1DYOVaxeDn1mET3
 CoRHpNAx4Hc9T/IyRaLXsWpl1FO/8XrF/bacIFXvuHmybqqVnHLPy+1CUIKRIGV7Y8BD
 zxQw==
X-Gm-Message-State: AOAM530ycnYh95WqIv262VOLjLjS/Y5UeLJNSTFTGUSIIuYIZ11IwV9Q
 QiLOwVcmcs8QQjKkmv0MY5HESg==
X-Google-Smtp-Source: ABdhPJx2yhgK3ntHhywGbHAC8jYO6ehQsn+GhjQrHT7BjbF3OFKwU6TjoJG8lD6XMAvpgbQCPNEisw==
X-Received: by 2002:a17:90b:17cc:: with SMTP id
 me12mr11443156pjb.147.1634108562933; 
 Wed, 13 Oct 2021 00:02:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u19sm3124045pgo.73.2021.10.13.00.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 00:02:42 -0700 (PDT)
Date: Wed, 13 Oct 2021 00:02:41 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 07/10] lkdtm: Force do_nothing() out of line
Message-ID: <202110130002.0FC7878252@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <b353a85e50ac336c385b46459a5fc43f4a6171ac.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b353a85e50ac336c385b46459a5fc43f4a6171ac.1633964380.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 11, 2021 at 05:25:34PM +0200, Christophe Leroy wrote:
> LKDTM tests display that the run do_nothing() at a given
> address, but in reality do_nothing() is inlined into the
> caller.
> 
> Force it out of line so that it really runs text at the
> displayed address.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
