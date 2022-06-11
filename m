Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DEC5475B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 16:42:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LL0tL48lGz3chC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jun 2022 00:42:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=UYGc4j1X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=qlft=ws=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=UYGc4j1X;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL0sj3tsHz3btQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 00:42:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4A6E60FE0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 14:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4827C3411B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 14:42:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UYGc4j1X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654958531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8XsNMWveW3v/x7u53JLf6fWX09OODXTZVKXlrKRTL14=;
	b=UYGc4j1XtVbnfMAK8TlhjwymMtlm3YyWpDoYXyQAPx+cPR4oMwNUH/paGfI9Y+BgIFJcHL
	OlwbNsY62b4rt/dQXG3Ce6oMhpllwgWqMKQgced44BrI6OL9/zS0iNmBM/OkwnsIDpcvrh
	bv4HTdbxdhrnRrGsPQzbYVEqWAbYl6k=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0aca7769 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <linuxppc-dev@lists.ozlabs.org>;
	Sat, 11 Jun 2022 14:42:11 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2ef5380669cso15462587b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 07:42:10 -0700 (PDT)
X-Gm-Message-State: AOAM532GgPJTKK0WLb+fRGBntsUlq+fe0AZJm79xy3PZ5gS6ybvlqofh
	1PX7wzuHc+l/oIW+YdN6RwTjcjCEoQZPjj6vteo=
X-Google-Smtp-Source: ABdhPJz5kaNE/RndD3vlkyWhsQWFUFJLFK6/QX+q18w97fqoUN3lzUnNNL3H1bfOVfbyaz0Hi7XlJxODgyofj4hOQZQ=
X-Received: by 2002:a81:7d09:0:b0:313:fb25:9104 with SMTP id
 y9-20020a817d09000000b00313fb259104mr2170770ywc.2.1654958530119; Sat, 11 Jun
 2022 07:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220611100447.5066-1-Jason@zx2c4.com> <20220611100447.5066-2-Jason@zx2c4.com>
 <6432586f-9eb9-ac71-7934-c48da09a928e@csgroup.eu>
In-Reply-To: <6432586f-9eb9-ac71-7934-c48da09a928e@csgroup.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 11 Jun 2022 16:41:58 +0200
X-Gmail-Original-Message-ID: <CAHmME9rBWcdZtJCQ1WZAPOJtnA6u4w0ub4s4M+UW60gMSNgWrQ@mail.gmail.com>
Message-ID: <CAHmME9rBWcdZtJCQ1WZAPOJtnA6u4w0ub4s4M+UW60gMSNgWrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] powerpc/microwatt: wire up rng during setup_arch
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Sat, Jun 11, 2022 at 4:40 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> >
> > +__init void microwatt_rng_init(void);
>
> This prototype should be declared in a header file, for instance asm/setup.h

Alright.

> And I think the __init keyword usually goes after the type, so should be
> 'void __init'.

Indeed I thought so too. It just wasn't like this before, but that
doesn't mean I shouldn't fix it.

v3 coming right up.

Jason
