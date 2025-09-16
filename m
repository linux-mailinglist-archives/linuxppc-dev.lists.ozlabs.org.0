Return-Path: <linuxppc-dev+bounces-12263-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C105EB58C2B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 05:09:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQn1J2mDCz30FR;
	Tue, 16 Sep 2025 13:09:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757992148;
	cv=none; b=fCgBj2w9dxSACuLAwn92eN7Z/cvGMv0LaFBwK65UB6AGGbSRIWMlmSLXHPPOoRShAtQgk6wFIx7PWfO3Pwg0EzgHa/JBMDr3YgBxjSNrfCTJc0nfFaiWLmHKzqW1rkKN3anozCO5l581pTK6HXIsLgFfTok3Yr9s+IazPFEybVogru0IAO+jnAkMo864yUVIGBdXt7t/9slz9/6aRrvaQFGeqZU5Fsy0HooTbD/Iv5Krfe2BP8eiminGnbvGGNuCSDfB06nvUvqWF88YRkTsWvfC5jsxu3Rqqs80o1Y/qYqItcriwz55y5jta06mB9ly+MM0HnPjrcJx4svrohcJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757992148; c=relaxed/relaxed;
	bh=clS/RriAH6/uzgbxBAN8eXzKr1t8+yo2uadqdbTxw+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRFxcm7tZvVXBkoSvq041BS+R2P8jSgo13cgd38LMrF6eZ2x9LYnojxwps2c6v6G0frCSGlwniBDVLtInCaCO0q54fUz67tIsc4vFNuPjckIiNRe5/sd+HvHm0tzW/nNXa76Z8XDjOJn/C6CpKIytfBPYdQiTie01FyVA32LnCKzn0v9SU+f6CFowpcrwwrv9KfgmYIOsAUDnQAFqRDhQakzCy2ZD5ibSlwY01vL34k7hdpPKqff8FGqzk1NT3i8cuArcoEyrDGKXG+Cp8SVbgk5FScFJ7eJMCooRxtVlzxRCAhVMbq3FX4SUFi/QdvY4gK9rTpO+H8Q6YOOcYI6zA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bBxS8q66; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bBxS8q66;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQn1H58PWz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 13:09:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DFDA600B0;
	Tue, 16 Sep 2025 03:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD31C4CEF1;
	Tue, 16 Sep 2025 03:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757992144;
	bh=clS/RriAH6/uzgbxBAN8eXzKr1t8+yo2uadqdbTxw+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBxS8q66YdKGXiHFPJJ3//BAWLCIYoh1qbHxHfe2QgUS7fzvi8AFYBbIitGKJPiDy
	 J0h5xdTTy4wuRH1ymZPr5e0f/C36eUMrkOUag+lWBj8YkZln2Sd8hzT0pfkU01q17O
	 RT8NuwYenprY6H9Bdb8qKRjkND6VpsGEt1Rf1iUB6mNa5MQsHkHWoiFIr0vmJLaUBy
	 +Mg6Bb5Jrp6AOX9r3GJRBHhtRWiiY7tieeEbNFvl6251o5yIBpkK00NoObReShSwrw
	 BlICrcV2YfDygf6hS1MD81NdPJlMqltFalaDERfXuFBjtYfsWMd22V+qS8nHm3+ffq
	 gVOH5pLBuuEEw==
Date: Mon, 15 Sep 2025 22:09:03 -0500
From: Rob Herring <robh@kernel.org>
To: Askar Safin <safinaskar@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>, Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org, initramfs@vger.kernel.org,
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>, devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um,
 x86, xtensa: rename initrd_{start,end} to
 virt_external_initramfs_{start,end}
Message-ID: <20250916030903.GA3598798-robh@kernel.org>
References: <20250913003842.41944-1-safinaskar@gmail.com>
 <20250913003842.41944-29-safinaskar@gmail.com>
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
In-Reply-To: <20250913003842.41944-29-safinaskar@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Sep 13, 2025 at 12:38:07AM +0000, Askar Safin wrote:
> Rename initrd_start to virt_external_initramfs_start and
> initrd_end to virt_external_initramfs_end.

There's not really any point in listing every arch in the subject.

Rob

