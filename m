Return-Path: <linuxppc-dev+bounces-12285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E25B58ED9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 09:10:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQtNF5kJwz301G;
	Tue, 16 Sep 2025 17:10:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758006653;
	cv=none; b=KHRAMLpUWiR0fgy25KzfpV8YmVGrEfEU5YG/nA48kwEeaFyv/vyZhsTMtda18ytK+/SmHpIsHb+b4706hE77ZYFho+5sh+xPfiX/HHs8HEkgars4T0eBIMm1kw3cg1rC3HoPx1mmqcwGsua6CVqXTKAWqT1pxNR4bhp7O5lQ83oGsoCNj8SqiKI9AeizPU2sYIF168kuOhDABZxWteupL6bov+wcIKwROj2bbRL5VH2FNQ95D4ieJH4aV4OhiY2u27QwTb8o2wKCTvWgOvNDfBkKbzKomMY6dusKhbsS6AuSe3XJ6/6LpFLxQHIFHw25+hgWhH5HQb4dCTnC2sCqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758006653; c=relaxed/relaxed;
	bh=Ogfsa9WfyH3pQwl1usqQ0HzMnrLuRzKkyrb091xPjbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTZONrQuf/gYiLyxoghlbUE6DaQfwfuKaDMn1TSQw95izHMi2F7owaNO1pWsiXSejrdwesCLOVLM/4tmI460J/UrdPzqqd1RvJrTrZ7J6qd/MYWApgc+BrvSnv0/biXTt02q1792kZC2hPDfhXi3Yys/XnZF+tyCELE0R0AXYrijr17neH72KTeBxGjKMLYV2WKG6F1CmzWvwA7u37bXlQpkMZW2wsZl/dy6IJSeRaYn+W8I+rOgzaWBCWc0aNSCdITZk4qgfkuXuN94Rf6U/+qq/27B77CmRl3wSCoFV/wShPEpY5dS5WZTL9nx0gMTC+a2XL5ULSJkeVg993LTXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; dkim=pass (1024-bit key; unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=W9sYFUT2; dkim-atps=neutral; spf=pass (client-ip=51.159.59.229; helo=mta1.formilux.org; envelope-from=w@1wt.eu; receiver=lists.ozlabs.org) smtp.mailfrom=1wt.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=W9sYFUT2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=1wt.eu (client-ip=51.159.59.229; helo=mta1.formilux.org; envelope-from=w@1wt.eu; receiver=lists.ozlabs.org)
X-Greylist: delayed 590 seconds by postgrey-1.37 at boromir; Tue, 16 Sep 2025 17:10:50 AEST
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQtNB3tfBz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 17:10:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=1wt.eu; s=mail;
	t=1758006053; bh=SjDnvp62/lLxeQ44giml4jaGp8oWeHSnwNPwO+xxCic=;
	h=From:Message-ID:From;
	b=W9sYFUT27nEB79RqrVIoMNZvsyRMQAICF+oC9OxhXwgE50B1CKq12V5vRbXxNYPxK
	 J9qF+8/2k2a4QLupgJNeLJVCmu+MW19hcQIdAodpzu5Xwctfmjwc67/xzV9UK9s5fz
	 MniQertvdcMjkAOJJHd2v6z43FChMz0iJ9JaGfzE=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 26141C069F;
	Tue, 16 Sep 2025 09:00:53 +0200 (CEST)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 58G70qZ2003883;
	Tue, 16 Sep 2025 09:00:52 +0200
Date: Tue, 16 Sep 2025 09:00:52 +0200
From: Willy Tarreau <w@1wt.eu>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ash Logan <ash@heyquark.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        officialTechflashYT@gmail.com, "A. Wilcox" <AWilcox@wilcox-tech.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: 32-bit HIGHMEM and game console downstreams
Message-ID: <20250916070052.GA3616@1wt.eu>
References: <3e8cb683-a084-4847-8f69-e1f4d9125c45@heyquark.com>
 <432e049f-886d-4734-ad59-52569a796046@app.fastmail.com>
 <11e667d6-2210-47f0-a9ec-a134a60e138c@heyquark.com>
 <39164c56-78f8-4bac-acd2-a996149c1c57@app.fastmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39164c56-78f8-4bac-acd2-a996149c1c57@app.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 16, 2025 at 08:20:35AM +0200, Arnd Bergmann wrote:
> > The maintainer of that downstream claims to be able to boot modern 
> > text-mode distros on the GameCube' 24MB, which I find really impressive!
> 
> 24MB is impressive indeed. In my latest tests I did not get below 32MB
> (+swap) on an ARMv7 kernel with Debian Bookworm, and major features
> turned off in both kernel and userland.
> 
> On a simpler musl+busybox userland and even more feature reduced
> kernel (no network, initramfs-only) I could get to ~10MB, but then it
> doesn't really do anything besides showing a shell.

When you build your systems from source and install only the necessary
*files* (not packages) you can get much lower. Here's my reverse-proxy
for example (aarch64):

  $ df /
  Filesystem     1K-blocks  Used Available Use% Mounted on
  /dev/ram0          11520 11520         0 100% /

and my firewall:

  $ df /
  Filesystem     1K-blocks  Used Available Use% Mounted on
  /dev/ram0          16640 16640         0 100% /

these are full-featured images with tcpdump, exim, haproxy, nftables,
pppd, ntpd, wireguard, openvpn, hostapd etc and even glibc. I've been
used to installing them on 25128 SPI NOR flashes (16 MB). But yeah
that requires gcc -Os, getting rid of NLS, deciding on a case by case
basis between shared or static linking, and installing the strict
minimum for each service. I even have an old boot loader recovery
image where kernel+initramfs fit into just 1 MB with a small recovery
shell, mke2fs, dropbear and tftp client (i386).

Cheers,
Willy

