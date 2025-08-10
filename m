Return-Path: <linuxppc-dev+bounces-10779-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C01B1F83A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Aug 2025 05:12:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c02r72Xl3z30WS;
	Sun, 10 Aug 2025 13:12:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754795543;
	cv=none; b=edoanDZz9llxBOnrR77pam9CqZW2UR7mcOsMO/2nvfIsAFnHIpseEYrSrHQydsVK7G5gcmrapu3WoGob25W4QhexxBJ838yzLHVAWuGVQOo8GQbB+/S98Ecsin7e0xqzLnaJvMlIUqMqUVmYwwODPy95t9Ip0Tj8jY1Cw0NQHiBtvMywvu1sUbXWK0BUtnBhl1LiG48Hv42HUoXOF66JQv6fVWtgB/Y83ISLTBYcVxMdI/3qDNJE1DlOQd+anJ+WkibbkxZOfXQlqY+tIhpSIVen0vY7YKDQPKwICo7tq61YKtCF798tF5pxexMMgfywdG+vr0k20SgI7Px8flPGMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754795543; c=relaxed/relaxed;
	bh=/rWEef+GROeethEgQyGg1pyX3ju1W12RQqzea0JqpTE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LEvm20JFMt1HMFcUHi/584htqm5U3vBoTKi5qwPSTVMaJMhhFT9sxiiL/XHLjZ097OZymDDzkkL4XVCAnc/bhQ+zqfrvfMDghn1DS5+n8oJVD0Av2oVb5sltpcgdJkL3CZ2u6y8gSgeSFw1jyTKDlqHU5vvcRgo9ZWHBQkAKd91vBjJWOvy0DetV/2Z/Yi0jp4Of4/dkNdOJvDT0GRN8T2H138mXHSeS0AMHZnlLWNQWCNHgfEnZ6+cMMck7ybmDE/YttBAihiIf4KSaERCL9/imYUwHb/SonoAqo5Ikc0EdclL/dfP4gMzmgJHe28WwAC+FTXylj1mw5DkG2otrpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=YgrkMb5S; dkim-atps=neutral; spf=pass (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=jk@ozlabs.org; receiver=lists.ozlabs.org) smtp.mailfrom=ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=YgrkMb5S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.org (client-ip=2404:9400:2221:ea00::3; helo=mail.ozlabs.org; envelope-from=jk@ozlabs.org; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c02r50wYyz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Aug 2025 13:12:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1754795538;
	bh=/rWEef+GROeethEgQyGg1pyX3ju1W12RQqzea0JqpTE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YgrkMb5SkuNotDU6BW2ojMfstTVT3dwJgJdsRYZuUDPnR8BEMmhRmFvzOU7P7ZzLc
	 L4hARhmCpOU9ByrFkFe5d7gA8mOT1Iomhhhl8vPtfXyZt4HoC8RMmcxSAEAPgFGuHH
	 sgjaG0ZTmtmMEcO80d2snnGZA6zotBDIT+CqJwJKewzQP8i9eJH5QTnBf08cLUIcqN
	 1WkWWkT+lotxwZfbS3/Hc4fv/f+qW1KfrhMGjE6M8YfM4J5oIdLMUBjG95/+H/fWyv
	 gZ1sepFnLICgRU0i/MAUYLYSrfx598/y8tEDorlqVSAYD5bI6QU07ubSLDDM8G6ohr
	 /INis+K0aSM9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c02r167s2z4wvg;
	Sun, 10 Aug 2025 13:12:17 +1000 (AEST)
Message-ID: <cd2ee23092e3749f707b0f730af741a94f0986f0.camel@ozlabs.org>
Subject: Re: Ozlabs patchwork notification not working anymore
From: Jeremy Kerr <jk@ozlabs.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, LEROY Christophe
	 <christophe.leroy2@cs-soprasteria.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Date: Sun, 10 Aug 2025 11:12:16 +0800
In-Reply-To: <20250729183222.15adbb95@canb.auug.org.au>
References: <8f6e5825-9468-4499-9bbd-4588a1eccc94@cs-soprasteria.com>
	 <20250729183222.15adbb95@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

I've (finally!) had some time to take a look at this. Looks like
timezone behaviour had changed, which affected notification expiry.

It should be fixed now - I'm seeing test notifications myself. Let
me=C2=A0know how go.

Cheers,


Jeremy

On Tue, 2025-07-29 at 18:32 +1000, Stephen Rothwell wrote:
> Hi Christophe,
>=20
> On Tue, 29 Jul 2025 07:41:40 +0000 LEROY Christophe
> <christophe.leroy2@cs-soprasteria.com> wrote:
> >=20
> > If I remember correctly you maintain the Ozlabs patchwork aren't
> > you ?
>=20
> Actually Jeremy Kerr (cc'd) actually manages patchwork on
> patchwork.ozlabs.org (I just admin the server it runs on).
>=20
> > For more than one year now, patchwork for linuxppc-dev hasn't sent=20
> > notifications about patches status changes. Last notification I
> > received=20
> > was 11 June 2024.
> >=20
> > Is there a reason for that change ? I recently got questions from
> > people=20
> > asking me why they didn't get notified when I started looking at
> > their=20
> > patches.
> >=20
> > Is it possible to restore previous behaviour ?
>=20


