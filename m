Return-Path: <linuxppc-dev+bounces-10427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 868E1B14598
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jul 2025 03:11:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4brckN5gqtz306d;
	Tue, 29 Jul 2025 11:11:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753751500;
	cv=none; b=lBuEaJT+NNrjjOEcyl9E733PaIUfVAHj1/yHPmDZ82XKFTstLmJDDsTanQgd9eE40PUBBbFSDIxHb8FPXpbx6u0HSqVMn39CVkUyi4gVkHX0FBmSvg7/Uwj37bwF5JpNa/6dUx9zgWWmPKqHY6E3XlU5ngNw/1h1expina9jpr56y/5x78DKdKZZioB/rJY+Tbibeeklc5I8qo4m01U5CISCuHghoGRIMgMqg3nBTPmPyDv4liuU/Wp6wyQenHnGJabhrp1PQsHDsD0+HuBZj707tG1dKKqdq+bXr0aDAhrt4JZy+DUOnGMlgIWIyaqLgU6EuiKeMh7BDn49XVtj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753751500; c=relaxed/relaxed;
	bh=yr8KDwnS8yCHzRHikp953ERke/RESR+CuC69C8dL30I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AJrh3SMsB8CjK1+3bZPKsugUuPFn1McZRzoDgLrzgE/68Nbaw5g7HYgFGmShF/5EOFYOjfv3dVF2970uxay7z5Q7gSX1CA2R+jIrEvQojoqoybtFh9+c6H/U8Iw6ZB9y4YWMXmbejGu01TKGNLmI4ansAnqe9Y2tnkwj1NI2fNMHn+QDBD7c1EU9bdW+3OXm9/+Trc82d8CcmjzQc1OdvBTxiDzGvLVhfThT5ZKu9GMx9sS4yX+3e0P3IVvmElo1YQfU0CMxtJw/2JqVHsLEQINcV84r8hVXkaGDWtvQEbxmGyq45mLXzxK7VZ8UFd/J/xZ41qONUhE97Hvq50RLkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VYacduDB; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VYacduDB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=pr-tracker-bot@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brckM6M4dz3064
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jul 2025 11:11:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1D7A601EB;
	Tue, 29 Jul 2025 01:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A19EC4CEEF;
	Tue, 29 Jul 2025 01:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753751496;
	bh=8ZaxoHBTEhVL12axKf/WX+LwUM3Y/BFGh5lAMOgD5zg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VYacduDBsz15Xg+SgB5nuf2LLCwR/ZQLnHAeY89QssQwJkwueQk+gOc3P9X3M8ERc
	 StQHaCIjU+ApLe7jJ1kkQ1SZSrlnoE0XfZBTw8Yh+roL1ES9ZIfl3oMlPK7Nd5vIme
	 keZEIUjTWzO7k+Xn5laz3kmccx4u/wXUQCxvKazPAkCcbgCoN5asGQOK49wsxNUWzg
	 4V8Tr4vXYS3H1wOaKUIe57TRZzvYstxc8p2ZRo6fWA+RbWlSndzB3fEL4aGd9Fgn3b
	 ZBNnQvFR6RJKhSTgEfjDhuJgvmCxPS2qK55MY85inxik6zCKjNO7RH2cHI8IhVIhst
	 yOtThARlrGBsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34A0C383BF5F;
	Tue, 29 Jul 2025 01:11:54 +0000 (UTC)
Subject: Re: [GIT PULL] execve updates for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <202507261437.F2079B3B7@keescook>
References: <202507261437.F2079B3B7@keescook>
X-PR-Tracked-List-Id: <linux-sh.vger.kernel.org>
X-PR-Tracked-Message-Id: <202507261437.F2079B3B7@keescook>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v6.17
X-PR-Tracked-Commit-Id: 7f71195c15dcf5f34c4c7f056603659374e3a525
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d900c4ce638d707f09c7e5c2afa71e035c0bb33d
Message-Id: <175375151288.918485.7118599213274098690.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 01:11:52 +0000
To: Kees Cook <kees@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Akihiko Odaki <akihiko.odaki@daynix.com>, Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>, Andreas Larsson <andreas@gaisler.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Chris Zankel <chris@zankel.net>, Dave Hansen <dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Dishank Jogi <dishank.jogi@siqol.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, "H. Peter Anvin" <hpa@
 zytor.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonas Bonn <jonas@southpole.se>, Kees Cook <kees@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, loongarch@lists.linux.dev, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Oleg Nesterov
  <oleg@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Richard Weinberger <richard@nod.at>, Rich Felker <dalias@libc.org>, Russell King <linux@armlinux.org.uk>, sparclinux@vger.kernel.org, Stafford Horne <shorne@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, x86@kernel.org, Yin Fengwei <fengwei_yin@linux.alibaba.com>, Yoshinori Sato <ysato@users.sourceforge.jp>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

The pull request you sent on Sat, 26 Jul 2025 14:39:20 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d900c4ce638d707f09c7e5c2afa71e035c0bb33d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

