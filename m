Return-Path: <linuxppc-dev+bounces-17721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDc0ICI6qGkTqgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 14:56:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1669F200D13
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 14:56:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQvNX70Pbz3c1T;
	Thu, 05 Mar 2026 00:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772632604;
	cv=none; b=cjQ+XWkgzsaotKWVzj+DkSxXey6wsEa7ANcRcoiEa9yybB9D9FuZkDw7YVF6hkxIh6Bpjj5bBtk+jx1I3QyQGH9AoVCU9yZVSQyac3Y8EfQBZodwHqMSGaJJxYgeQCTS7qEV111DYd3bKfpK312+9WeH1c/M1unhRTZ9Zp13ybyq92koa9rfifqWP7al15NeM/zzlzVGclfX968g8v8U9HTt3/J3tl1cMVUf4t5rkDBvf/9vtr5z0aPaIyIHa4vW3wsMDIhDAN/sepmubYViZUO1HsdNgLA66HjBwxw0EKPzz5wWTBpQH6roeN1ucFx5/k9CZMsG29fXj1YdxKVzCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772632604; c=relaxed/relaxed;
	bh=XvWO//MuUaF6FBIn1Hrn9Rw3nUdY24HmHHsAA/muNLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrrMe7TkoHdfWnVlo2rIsue/3gNlXkZrMHZDM7TRyJvsKRDRLNky/n/666iYDe4zxW1G43zE3Ch6TlugbqdYK2+UXmYv3gZbRRrtsiEfVNlb+IWv3lNx1ogt3hN/A/CCRpzUzEsTY6rNZsbMhjQbAWGcHqixgdo6TMwGh4EDexagWXOnc1Ris5QomL0nQLP77i2lhJjAYNxqRymQLfkbySt7dKZpflcUxfm5b5nN3WI+L+MbT4oxWghpW6eIih3HT3OAiRogVaYImy0SEcSIn2ut0S58SvlRlDxU+BrHpa2m/R1Bc2tDbxzH324Ou01it/aIKaGwH3xl3pqmHH7UFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=imS/u9Bv; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=imS/u9Bv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 564 seconds by postgrey-1.37 at boromir; Thu, 05 Mar 2026 00:56:41 AEDT
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQvNT4NmPz3btg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 00:56:40 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id DD8AC240027
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2026 14:47:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1772632028; bh=XvWO//MuUaF6FBIn1Hrn9Rw3nUdY24HmHHsAA/muNLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=imS/u9BveXyiCdVz3nuiVXmt0F72RQBrDvQqnbvEjJKKUIBqKC/hovKSaG9kra/WP
	 2BFeOlA9f4dAgXaT5dblKaaepKJWe7U3MSXbC1Q+c7rKa7KZOIjX3T0qNabn1peoWN
	 zr7bUkZVmrEFQymu8ApIyz0wTJEhRRsY+Xh8CMq2jGLDhVB4wOQR3EOUNQwQu2n8BL
	 WYGCfKT/bNLs9gmMp8tDMf+O6a0szmYcCX965XBQ+9BaW97d1rWpR/+95WtAPDZ3hx
	 rlI5a/V9oGoMlcL0XoVKvjD9/FPaLaZsXmD7/+fycM0mikxUHHVF/t4exNVg/G9Z/z
	 qtEz1UBYsbcow==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fQv9Q1f3sz9rxc;
	Wed,  4 Mar 2026 14:47:05 +0100 (CET)
Date: Wed, 04 Mar 2026 13:47:08 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] powerpc: dts: Build devicetrees of enabled
 platforms
Message-ID: <aag32bMA9aiEbSIP@probook>
References: <20260303-mpc83xx-dtb-v1-1-592d27492019@posteo.net>
 <CAMuHMdXZYuDn5RRFFUp7kXFDn_fMZuqHbXmSJie4ofEv8NxXfw@mail.gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXZYuDn5RRFFUp7kXFDn_fMZuqHbXmSJie4ofEv8NxXfw@mail.gmail.com>
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 1669F200D13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.net,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[posteo.net:s=2017];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17721-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:j.ne@posteo.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[j.ne@posteo.net,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[posteo.net:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j.ne@posteo.net,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[posteo.net,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.net:dkim,posteo.net:email,linux-m68k.org:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 10:34:26PM +0100, Geert Uytterhoeven wrote:
> Hi J,
> 
> On Tue, 3 Mar 2026 at 16:56, J. Neuschäfer via B4 Relay
> <devnull+j.ne.posteo.net@kernel.org> wrote:
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> >
> > Follow the same approach as other architectures such as Arm or RISC-V,
> > and build devicetrees based on platforms selected in Kconfig. This makes
> > it unnecessary to use CONFIG_OF_ALL_DTBS on PowerPC in order to build
> > DTB files.
> >
> > This makes it easier to use other build and test infrastructure such as
> > `make dtbs_check`, and is a first step towards generating FIT images
> > that include all the relevant DTBs with `make image.fit`.
> >
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> 
> Thanks for your patch!
> 
> > --- a/arch/powerpc/boot/dts/Makefile
> > +++ b/arch/powerpc/boot/dts/Makefile
> > @@ -3,3 +3,158 @@
> >  subdir-y += fsl
> >
> >  dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(src)/%.dts,%.dtb, $(wildcard $(src)/*.dts))
> > +
> > +# PPC44x platforms
> > +dtb-$(CONFIG_PPC44x_SIMPLE) += \
> > +       arches.dtb \
[...]
> > +       icon.dtb
> > +dtb-$(CONFIG_EBONY) += \
> > +       ebony.dtb
> 
> This fits on a single line (many more below)
> 
> [...]
> 
> > +# MPC5200 platforms
> > +dtb-$(CONFIG_PPC_MPC5200_SIMPLE) += \
[...]
> > +       tqm5200.dtb \
> > +       uc101.dtb
> 
> Even when it wouldn't fit on a single line, having separate
> 
>     dtb-$(CONFIG_FOO) += bar1.dtb
>     dtb-$(CONFIG_FOO) += bar2.dtb
> 
> lines not only makes it a little bit shorter, but avoids the churn of
> adding a backslash to the previous line when adding new entries.

Sounds good, I'll do that for v2.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

