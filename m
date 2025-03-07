Return-Path: <linuxppc-dev+bounces-6798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCC6A562DB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 09:46:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8Kd813LBz3cC6;
	Fri,  7 Mar 2025 19:46:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::bd"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741337164;
	cv=none; b=mi55VVzrAm8J1h0s2Z0iY1DNeYSNmRyY0A5tWou8pp07s3lIErwI90gyUef2R5mkXGewIxzadAAkZY8F8zRWps5okhVaCNrUAg3uR/ScCWudAO20OGbuQY9NleJaj+GgKqcFX2DlTmemfd3jYlAzr/4xiCc7B5RALwm/zt1PcuDGtPuQ09A82S2M7IC9eM15AoJ6NoVQISPWwJi8pK0+3NLgNn2xEsGxar5+QJwt9+EsukyMGg7i+HI1DsbAngcs4XCvoPKhkctsywY0RW4uAk9QL+XUKUpHrEzUJTqwCz+8p+2Of54wqGJ/6xRSu690mwz/j9UyWqsxOouJm8f02A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741337164; c=relaxed/relaxed;
	bh=Kz7tr3Ef4wRK05z0FEwMWNGvCaeHxB4UKfPnpbiiwqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5srb9V87DQPt3z7EF242qxkqigkXk9LB9LyCrM9Cq5i3gkdWRaWZq0Jiwi4zvCKGmXZdYNGvOjYs4VZkGlngTSIM4EENMrMOr6G/AmzUROFqzGbwqAUaZWYOafCCJ+QBSEiRl38Z+ROcRKUXROx8afDGpnl+7kY/kX9Ds6jJq6FdL9D4LrSTdqdQpeu1fRZbW+Dl5BysqNcEJoiYeTKrRqLb1ydxAa3ZJWXuc7EQO3kaa84cOYtIC3QhWtgGrcgjoxHW5w9+w90nS5U2h8cdELtLV/DEnTaty3vMPyjK6fOl6XRrsusRyR2//DT9Atuwlud7HzTKjWvEf5R3Z45hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c0U+srwr; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::bd; helo=out-189.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c0U+srwr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::bd; helo=out-189.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [IPv6:2001:41d0:203:375::bd])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8Kd71vhYz3c9R
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 19:46:02 +1100 (AEDT)
Date: Fri, 7 Mar 2025 09:45:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741337143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kz7tr3Ef4wRK05z0FEwMWNGvCaeHxB4UKfPnpbiiwqw=;
	b=c0U+srwrdTCvXelYlglJHrB+xNHlSsaPkftQptchw3kBq2mcWH0laSgUJd9NI8xpRCw5RL
	HPnrvN6Ls7xPWYjkrH0453InwYF+4w5Hc7P/GBp1ns1alCRkIBkutpXKq6qO4A1vOxEG2T
	Axzw8+2NADScVKg8Smqf+CZZwmg+GHA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Thomas Huth <thuth@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	pbonzini@redhat.com, alexandru.elisei@arm.com, eric.auger@redhat.com, 
	lvivier@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com
Subject: Re: [kvm-unit-tests PATCH] Makefile: Use CFLAGS in cc-option
Message-ID: <20250307-7a4556045a53c51e3150da2f@orel>
References: <20250307083952.40999-2-andrew.jones@linux.dev>
 <2c0bd772-0132-4053-bd22-aac88a8dcfee@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c0bd772-0132-4053-bd22-aac88a8dcfee@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Mar 07, 2025 at 09:42:03AM +0100, Thomas Huth wrote:
> On 07/03/2025 09.39, Andrew Jones wrote:
> > When cross compiling with clang we need to specify the target in
> > CFLAGS and cc-option will fail to recognize target-specific options
> > without it. Add CFLAGS to the CC invocation in cc-option.
> > 
> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > ---
> >   Makefile | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 78352fced9d4..9dc5d2234e2a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -21,7 +21,7 @@ DESTDIR := $(PREFIX)/share/kvm-unit-tests/
> >   # cc-option
> >   # Usage: OP_CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
> > -cc-option = $(shell if $(CC) -Werror $(1) -S -o /dev/null -xc /dev/null \
> > +cc-option = $(shell if $(CC) $(CFLAGS) -Werror $(1) -S -o /dev/null -xc /dev/null \
> >                 > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
> >   libcflat := lib/libcflat.a
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks, but I just found out that I was too hasty with this patch. I broke
x86,

/builds/jones-drew/kvm-unit-tests/x86/Makefile.common:105: *** Recursive variable 'CFLAGS' references itself (eventually).  Stop.

I'll try to sort that out and send a v2.

Thanks,
drew

