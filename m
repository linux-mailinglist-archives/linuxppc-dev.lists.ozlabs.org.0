Return-Path: <linuxppc-dev+bounces-1361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D05A978BB0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 01:07:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X591h041Mz301v;
	Sat, 14 Sep 2024 09:07:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726266474;
	cv=none; b=M59vdJolGBLZ82a/01TalfUAEJv1eO48DpaHbyx0e7PjmE1C3VUGca17HRBJPqHeHLw5QRG+nxYiP0/wQWE1zjx9GQqM3jigZonSIiR4bIIUn5HIKow/S5kwiq3OtGB/cHaJQQ3bMXXZez8Ht7NnBpPh+ltp8BgXGRq93bQYZYxKzKy15l7M1j0eC4u2LUi+Va6WXOUn8JjU67ZER9bcxV9dq8/GfX5j1CMfyMHkTN7+p+7EXmiN1GYJQlQ4UfCSF2wDhV6lZzfavZwcCmiXQinDuFzQzTUG8xpzLCCddrcD9avS9pn/w45zOPu7LbXDdUyca2eKa3Nn4Ya5EE+Vjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726266474; c=relaxed/relaxed;
	bh=ho4A2dlkxLyKDzVyfgfjhOPRDsg2t0/XpGUELeP46ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6jNsfCFi6l5xxqYncbzEyatktpyI+4ed27HSAkdfWxx8tKP0fMrvgpydXiBwkcPxhCeygwnGUdaQrGBRe5CslrZVuzDkpz6Rh+nGV6Spi6s6aNu6LTeTdBDkpY7nx66h9kuKKBVmh65lkfEHjgCXGI4ObpK+DDC+HU9WWPz0Q2CTaLMOdRror6ghfwlORVACaYJVb1KHHs5vJMvGEZ85vzaUiU3frAM52yi+KmaDpfD4v4gIzUUEFzuhwlcciKVZFUwdvoQqT8ze6AnkC1yhija96Q15+iSFiCPGbPZircdfdW5bQEtsZN8M1CoYSEEvmwbKIFUMF30tAaDJax2vA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BefQDQPx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=stfomichev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BefQDQPx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=stfomichev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X588B0vmMz2xyG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 08:27:53 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7163489149eso1086755a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 15:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726266471; x=1726871271; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ho4A2dlkxLyKDzVyfgfjhOPRDsg2t0/XpGUELeP46ZY=;
        b=BefQDQPxJWCBOhJlkmj91YvbRwpraG39LbdPijy1WgYgSiwjMrAX8p0lIX0V4i1uTu
         SI6BYri3hjFTLTGRzHyk6vyIKQZinJUDAJirE3sodwc8T7CgToJXw8Z7qt7TfMH8xYJb
         IkRKFFMXHiz/XXhJrVuay6Oe32R42pg03oHSU0n8CBi4Rk69yCd4y0DDJ6Kcj9u9EBtY
         MUJdFt2XC3KOWsRkXE1x5KqnIqRrJPEqO5LCJ7wlchL5mxTHNrmr4Z+3V17kB4xDhb7d
         1XX2vBiej/aq79LxL2uuY7nqylEUoSijgdLl9eY1G+4W25j2Czp7x/82YQVWVKmT+UCl
         gkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726266471; x=1726871271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ho4A2dlkxLyKDzVyfgfjhOPRDsg2t0/XpGUELeP46ZY=;
        b=trzOpZLP/uHvMDBfjOS2mN6H5W8E3hZesDndKEEoW9ZHTnBwYFrK8XBvqMPsRUkD3M
         0rZ2OBGM9mUkhD9kt72imCzw93CY5ckNmiPJK1PYocOjz10RWUimeJIMrFtSrwf0lqQK
         h+Q30PZGH5iWAJVNHyVdrMhRmw7PyuZcKgVc/ZDC9O4yhPTJGXIqS6zhuGG5m2+scv7d
         /4582o9nLfqeoz439tobo3g9HUTu7p+w0Dlg0guP4RI+q4nnaf2358qZIUsaU1i6KS6R
         66T3ECbIgZqbpauN+XBtjcC3nv7boU44QuowvGIOvb/IMRuxSlDfPFOTyaP+EcUz9eQB
         n0Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWBeQlPsjaqbc/yPr/Obzto9XwSivk0PZghsrOdjZ/HrVOah/hgvizo9iTiq5PuUhTL59McGeWZTDEyVC8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyumCfpdctaW/C74BQ4g7YSgnDgZChmq1fFHaTq0zqKWhM9pl4h
	HrJNe+nnnF9ktV+abywEiStLqaCfSXlG3/6fw9YOuQOvdUJ/xs4=
X-Google-Smtp-Source: AGHT+IGMD6FwApmJ+MqRiyYkS+omxKRFa7rqnD3JQ7w575O5kdRxfkkNpa2MsAfMisPRNr5f5k6EvQ==
X-Received: by 2002:a05:6a21:3a96:b0:1cf:3e99:d7a7 with SMTP id adf61e73a8af0-1d112b60cdbmr6984887637.12.1726266471397;
        Fri, 13 Sep 2024 15:27:51 -0700 (PDT)
Received: from localhost ([2601:646:9e00:f56e:2844:3d8f:bf3e:12cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a97574sm80042b3a.31.2024.09.13.15.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 15:27:51 -0700 (PDT)
Date: Fri, 13 Sep 2024 15:27:50 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <ZuS8Zp_iiMfi0PX9@mini-arch>
References: <20240913213351.3537411-1-almasrymina@google.com>
 <ZuS0x5ZRCGyzvTBg@mini-arch>
 <ZuS1u8G6M9ch2tLC@casper.infradead.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZuS1u8G6M9ch2tLC@casper.infradead.org>

On 09/13, Matthew Wilcox wrote:
> On Fri, Sep 13, 2024 at 02:55:19PM -0700, Stanislav Fomichev wrote:
> > On 09/13, Mina Almasry wrote:
> > > Building net-next with powerpc with GCC 14 compiler results in this
> > > build error:
> > > 
> > > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> > > not a multiple of 4)
> > > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> > > net/core/page_pool.o] Error 1
> > 
> > Are we sure this is the only place where we can hit by this?
> 
> It's a compilation error, so yes, we're sure.

We also have netmem_compound_head() which does page_to_netmem(compound_head()).
Wondering whether we'll eventually hit a similar issue over there.

