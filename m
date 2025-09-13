Return-Path: <linuxppc-dev+bounces-12143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95641B55EC8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 08:01:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cP0yz2rHgz2yrN;
	Sat, 13 Sep 2025 16:00:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f9:3051:3f93::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757743259;
	cv=none; b=OcWshV1uFX6wDVc2+nQbfpbX2NuF9W5bEcLoY8hVKAhaToap23J0XJf5s3Ee5TpMcP2lCxHUR/zKmyg350r0CcX+vSVYTRiRXXCZ+C0uYiUWbQIV599auMx9kEEDTmzMEbZegvqh0IekMifKTrtHPPVWtdhxRSxDz5xw+A3QdQkqDZx0m3P5KlYmm8VpxB3adQodCmSyzhGG+zASnlt0PxwKlK17cDb8lKtEzcJukBA0XVpGdl2xjrZcQF2BLwGpvAdsp5ogbskYJq4zNzF2CoR4pcLn1tbEFKHDK5c23Uv11dXPV1ohLdQeGwBujHwwZ34qlF3+Vxo+5AaiD+5eDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757743259; c=relaxed/relaxed;
	bh=ukCkckAuGMje9cA2p4fcL/eu4iSUrEgrcmTG6KbdR1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwpaCCnUTCCcZmZP1EbMmKFjhMM+ZcXGXAl4/j9jtnYWFmHiQVz0U6CpAT322saHYXVIn2kGQB35ESArkKwNLrHSu9P4HN2GGGxrw/f9mFq2lHS/agrSQVGUs5eAcPiYxrmMQyvzUchtDYSUlkShXuGRqvOGVSm+lUsoXA7PRVsPnZMEeLs+q4zGSLMPIXHYBDB68Y4ICDGfL/RAcToYLhhtNW7vhqjWos+x68tQwIopYANkLhTuxnIEKP5k6NLWicESjET6OMp/L3UqNArw/najIZPkbUzwjpTlcYAKxU46hDEY4utWcDWREGy4mrVaH/R9atN4PDOhergH4mxWTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=M+CzmzEW; dkim-atps=neutral; spf=pass (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=M+CzmzEW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cP0yx4lMTz2xnr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 16:00:57 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A0B8040E016D;
	Sat, 13 Sep 2025 06:00:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5iEw13_6N0hx; Sat, 13 Sep 2025 06:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1757743247; bh=ukCkckAuGMje9cA2p4fcL/eu4iSUrEgrcmTG6KbdR1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+CzmzEWar56cJJ17KOTR6P8eSnXvk4pSviym3bg7uW6BkqS0j+mtX3BQDzmjsLKN
	 cBfUjtOzG0dtMWCm8gmhsUa3Xxo4FILO/a/EoDcNG+tlw8kR4uStWeJwPdhqSPG8vi
	 dptoTCZKzdi0Lb7IKesUGcadI0V7LIgtuqv7+ljIAgi+MxFM4i8iy5ZzhN+eNcVDkT
	 2U5qJFAQwTYKNKjXv/HnQbujbbxSSpVXj5bVy2aRYmWxFocdRZ21hDbVAksBWj/ayB
	 IyVl/MGqAXPtO85g0YsubzV7s6ahQw9h0Csu9TVUFWQlf+WnPcHv5LpdW2BLaZTSLx
	 MMPWrLyToEYejhS/laszKvXwNVgYIRKtn46zcfAmgWcVrksJjmgrxaFWOjZaf7IcIu
	 69gMcfJR5mcDILFbprN0LrSSpnH27j6cHrFVqj50Pgarn5Z+5kEA74Cuh7F+wkwKag
	 IgiVg9veF2ZWXTokCLUb6KziC0viJ3MFRPeERhFpkN9McnxLf/Lom5CWCUO/GLLsrO
	 Ik0vYi9bLtv3NWaKGrZ5U38zUX6p3F6aTmchXQOEPOWj3S4lIPOayyV2rrbopxaE+l
	 7bAPj5LxiMGFgfJow+wWYdkCpmcS3w+RlVWftduP1hFNqKDXn6mv7Glb2r+ccLg5uk
	 Ktt/rgo0zlxIwboDscbgVlBU=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 3961D40E015C;
	Sat, 13 Sep 2025 05:59:52 +0000 (UTC)
Date: Sat, 13 Sep 2025 07:59:45 +0200
From: Borislav Petkov <bp@alien8.de>
To: Askar Safin <safinaskar@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>,
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
Message-ID: <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
References: <20250913003842.41944-1-safinaskar@gmail.com>
 <20250913003842.41944-29-safinaskar@gmail.com>
 <20250913054837.GAaMUFtd4YlaPqL2Ov@fat_crate.local>
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
In-Reply-To: <20250913054837.GAaMUFtd4YlaPqL2Ov@fat_crate.local>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Sep 13, 2025 at 07:48:37AM +0200, Borislav Petkov wrote:
> On Sat, Sep 13, 2025 at 12:38:07AM +0000, Askar Safin wrote:
> > Rename initrd_start to virt_external_initramfs_start and
> > initrd_end to virt_external_initramfs_end.
> 
> "virt" as in "virtualization"?

Ooh, now I see it - you have virtual and physical initramfs address things. We
usually call those "va" and "pa". So

initramfs_{va,pa}_{start,end}

perhaps...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

