Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C59C17A56A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 02:40:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=n8pjl.ca header.i=@n8pjl.ca header.a=rsa-sha256 header.s=protonmail2 header.b=hlGTyd59;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqN9k5Hd1z3cch
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 10:40:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=n8pjl.ca header.i=@n8pjl.ca header.a=rsa-sha256 header.s=protonmail2 header.b=hlGTyd59;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=n8pjl.ca (client-ip=185.70.40.22; helo=mail-4022.proton.ch; envelope-from=peter@n8pjl.ca; receiver=lists.ozlabs.org)
X-Greylist: delayed 21837 seconds by postgrey-1.37 at boromir; Tue, 19 Sep 2023 10:00:52 AEST
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqMJ4124Sz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 10:00:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
	s=protonmail2; t=1695081647; x=1695340847;
	bh=Lli3Yj6tPCTPu+N9cNfbF8RCVOR8MAz0xLiJXkVxWMI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hlGTyd596DF2dmgY1RxK0nQKhn95J6GICdAnV17WrFbnFOG+MUmgHjlK7mvMUvSEW
	 Ny4WgaiMDNZDqse07BwO8txDjO1zp+XCxYLRYfUVTs73ENUZWdUW3K0uwPYGnlgd/G
	 BO/jK2xmW9w8NhmGRL9T08JW7TZ5A05Hcx9idS+msnB0qobVQ7g2S387X/W2cCyH+s
	 +cfQQ5WzCJy/YxylDrE93+mUvvi8MVrAFAbcB+EdRp/WqkuaiR2cNd0V5FTmvVb5+f
	 If3BANatKOYi35sl2kqXvBNdhpWK8CBBDctN/+jKC4EWv2dLWh3Nt1kHLo9r03mTki
	 KBwkIvgnmCEaw==
Date: Tue, 19 Sep 2023 00:00:34 +0000
To: segher@kernel.crashing.org
From: Peter Lafreniere <peter@n8pjl.ca>
Subject: Re: [PATCH 0/7] arch/*: config: Remove ReiserFS from defconfig
Message-ID: <20230919000026.7409-1-peter@n8pjl.ca>
In-Reply-To: <20230918234108.GN19790@gate.crashing.org>
References: <20230918175529.19011-1-peter@n8pjl.ca> <20230918234108.GN19790@gate.crashing.org>
Feedback-ID: 53133685:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 19 Sep 2023 10:39:42 +1000
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
Cc: linux-m68k@vger.kernel.org, tsbogend@alpha.franken.de, jack@suse.cz, reiserfs-devel@vger.kernel.org, linux-sh@vger.kernel.org, linux@armlinux.org.uk, richard.henderson@linaro.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, richard@nod.at, ink@jurassic.park.msu.ru, peter@n8pjl.ca, linux-alpha@vger.kernel.org, geert@linux-m68k.org, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday, September 18th, 2023 at 19:41, Segher Boessenkool <segher@kernel=
.crashing.org> wrote:
> On Mon, Sep 18, 2023 at 05:56:09PM +0000, Peter Lafreniere wrote:
>=20
> > ReiserFS has been considered deprecated for 19 months since commit
> > eb103a51640e ("reiserfs: Deprecate reiserfs"). However, there are
> > several architectures that still build it into their defconfig kernels.
> >=20
> > As ReiserFS will be removed in 2025, delete all ReiserFS-related option=
s
> > from defconfig files before the filesystem's removal.
>=20
>=20
> This is essentially equivalent to deleting the filesystem now. Why do
> this? Is there such a hurry?

This is not equivalent to deleting the filesystem. The filesystem can still
be configured into kernels, and few distros use a defconfig kernel anyway.

>=20
>=20
> Segher

Cheers,

Peter Lafreniere
<peter@n8pjl.ca>

