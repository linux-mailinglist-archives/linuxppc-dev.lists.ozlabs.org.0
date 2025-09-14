Return-Path: <linuxppc-dev+bounces-12181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A72F0B56C1D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Sep 2025 22:13:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPzr94zRrz3cj1;
	Mon, 15 Sep 2025 06:13:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757880809;
	cv=none; b=FFCtRm92/X4Hi2oLHLUqUF/sXV1aSKzTQbUYNl49C+oSERJd8++HelgQWWeuIoBaOsqxa6SvdZNsEjYEkiTPBnacKJXZwfK2vo6NmhWgOBE89R4n1R+6y4JHxW+oNid7ai9lXyKpfAAXg6eaYVby/xaTYXn5iNlMu4tdOx8JO2Fvgx4kPcU6fObl2A+R6XvvLvrJhFLs8RRXoStG3YBEdyVIF93Bbxt209EuIEOAWfNrwq/0PbpSkQKbkHwK7HgOEATeZD2zlP/b4mGo/H4XfgRAp9LS8YmbGhCyE1ft36fhTyIj9tECiTVVEFq61yOAGSfnuIHkC/NRISSptKg/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757880809; c=relaxed/relaxed;
	bh=ZnyDJvO2Mn+VIk33nJO1BzAqt4g5FhopoIJFFkjc1Ek=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=I/mVM1QT+MsA7g7s+xn918GpsxR/cZVSuFsBbbczHM6haiad4bejGd/iMI9QR2ixWzdlV2rJZUOYG0DVzz15miPpO35MM4FOJAXRfbn/5Wz0HkgbJpHkkOwopHJqOQk4EVyBrhguor3VSGzsHXg1SXx4TWjWFOaPccUtCQ35xJzg7jK3xVHXxSMM31uXH/2daSVhI9tfHT8iSuuC+lxb17f2BNaWIxUppdHY0aFavukWJTduGiNjVIzEaEijxQV32qFVdjGCiHugRgar/kZ6gIxcUGMLW+GCrb2H9cf8aBeoFwMOJit7gUHJvPTM57qwvwKDsTREKXcnAnPvxRid2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=2UPxRGMw; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=2UPxRGMw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPzr65pZFz3cZR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 06:13:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B693437D6;
	Sun, 14 Sep 2025 20:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D19C4CEF0;
	Sun, 14 Sep 2025 20:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1757880803;
	bh=S1O2mYg/nuSFWiepEfi3INn1/VxeJMAKyzsDV4vYqvg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=2UPxRGMw8I/maQZ+HN3ir+gn07zWGBMkkdWTdW2X4OKEgkpUDDbZLiyj3E0pJDtL3
	 1+D42ZKa/D0blrtutGoeATk6sFzQAtpGrIpNKIWACFz+9+7ensOkK9v2abyA5QnetQ
	 dB1gPfBNpyMhvJhlFN9WW4x1lQUIWNYqbIuD5q6A=
Date: Sun, 14 Sep 2025 13:13:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Askar Safin <safinaskar@gmail.com>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, Al
 Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig
 <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Aleksa Sarai <cyphar@cyphar.com>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, Julian
 Stecklina <julian.stecklina@cyberus-technology.de>, Gao Xiang
 <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, Eric
 Curtin <ecurtin@redhat.com>, Alexander Graf <graf@amazon.com>, Rob Landley
 <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>,
 linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, Ingo Molnar
 <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, "Theodore Y . Ts'o"
 <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek
 <monstr@monstr.eu>, devicetree@vger.kernel.org, Luis Chamberlain
 <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Thorsten Blum
 <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>,
 patches@lists.linux.dev
Subject: Re: [PATCH RESEND 21/62] init: remove all mentions of
 root=/dev/ram*
Message-Id: <20250914131321.df00dfc835be48c10f4cce4b@linux-foundation.org>
In-Reply-To: <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
References: <20250913003842.41944-1-safinaskar@gmail.com>
	<20250913003842.41944-22-safinaskar@gmail.com>
	<a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 14 Sep 2025 12:06:24 +0200 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> >  Documentation/admin-guide/kernel-parameters.txt          | 3 +--
> >  Documentation/arch/m68k/kernel-options.rst               | 9 ++-------
> >  arch/arm/boot/dts/arm/integratorap.dts                   | 2 +-
> >  arch/arm/boot/dts/arm/integratorcp.dts                   | 2 +-
> >  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dts     | 2 +-
> >  .../boot/dts/aspeed/aspeed-bmc-facebook-galaxy100.dts    | 2 +-
> >  .../arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dts | 2 +-
> >  .../arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge100.dts | 2 +-
> >  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge40.dts | 2 +-
> >  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dts    | 2 +-
> >  .../boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi  | 2 +-
> 
> No, don't do that. DTS is always separate.

Why can't DTS changes be carried in a different tree?

