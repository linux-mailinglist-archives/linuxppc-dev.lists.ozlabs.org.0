Return-Path: <linuxppc-dev+bounces-12142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250DDB55EA4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 07:50:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cP0kF4PRLz2yrN;
	Sat, 13 Sep 2025 15:49:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f9:3051:3f93::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757742597;
	cv=none; b=Pz//KRdvZncq8tgf1LOHpxkhBEw1OeOMgAf7YeAO4djLacUI8EWVBiKNj6xYOFDBMDGuo1n+Ha2ZjntxW8td6mbof9HN+quFKwKUN3VzXolaywkZzb3jwfhl8hU66AY2nCZHopmBh+sJ8AeaaH26AccKADZQNWr5zNE81p49t8NMfuTVB5XMbsTeKXwSIg1fTzOZqCm3QJnXRf/DhXARbWVo348CrTDgTUO38xEKMLvMqBGihXI7zpCVYA7+30laoSkEtgisCkieh75g14pUnuwEmAJN93TVTX5BDUZqh0uNh7E69OBYx6ghnxYOwCjhixwNrhNkePTx+LnXv05HDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757742597; c=relaxed/relaxed;
	bh=msWjE/k4XDYFNkRqUljSzhRmzL+P+KgKrTjqUiQu4aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dyPcIvIMdRP4bSHJtPEBi+Da2O/em0QZCOAvwRoqtnpd+kw7lO/eTwhf+zwGeCXAzKudTVRiX7MnYKVXNWNAVFq5rGZh8oA8uTmT9XSxPFMcOKvWzeiCPa6ekG8srS2han0iUKLiTRUL0wDlz77SC3QWsZmzDLbjkvGcQWM2YyYHx7XQkBkFa60kQ2pKL9h1dXFwKN37uP9QGB5IhueybxmmIV54EJyNNwr8j8wos8/pfBbP9XJkopkFDstGhI5mYjsDTkybNwx6hfJTJ4sWAXvbTl+CDW8UovRRlH16lRIm12Mr0xGIuB4UsYV1voqljxR2lZx0Pzdi1oEf+mk0xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=jlbk0Qit; dkim-atps=neutral; spf=pass (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=jlbk0Qit;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cP0kB3gP0z2xnr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 15:49:51 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C3A3940E0174;
	Sat, 13 Sep 2025 05:49:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ojZM34cNAwPe; Sat, 13 Sep 2025 05:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1757742581; bh=msWjE/k4XDYFNkRqUljSzhRmzL+P+KgKrTjqUiQu4aI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlbk0QitQVlp4rvpHe4vCXkRS2hvjoafx60Hi3+Hnx26MFN20WwiEWDlh3HCMXF/Y
	 B7stY6Fyr3vILBwsJcBAqlOW5BxLtsbMmB1EXIFUnlm4GzKlbw7UGM+DEcOseX75hg
	 FPGD/5ZdIiie/I55kLSBsHbTf5YW4dXDvezwU3bEqbq+FV7hIpAAHI6N3sgA2AvmXD
	 3vQ0WadXH8uby4Ww6hVk8ohOCEr7dq/AnKiN+L5+0Qzw4HOeJ3KVUC98nYqPW67/YW
	 aWpHSco3t3XyDwybSqnHdHsxJKU+VPv8otpwQRhG6Y850pLGVP+5QN03U8HBcvg3qJ
	 YYfb20vCSvE4Ai0U8A9cSf9IR1mIJgy5iyavsFYWrU9iyZHBF0AYZx+WI/zWF0+N3j
	 yYr/9bod0cW556Z6BwicNX0j4oLecbtI6kPTnTbfq9PIQRnjY49acw04OtWrRYjsbI
	 DQkmlnaai3jYlBnsa1AnTSuTPIrVsWOuuni4+sHz/DQnxpwepInt7QWlTbdwLusW58
	 k1GUpFnyMOR6rD+nZ2jz9MpyEHSQd/x6SVjlXFFhbnW6MajvATDtW+vN0PIKR+kSvH
	 J/wpw42BbFvcsBnYbs2215b0y4rQlOHZTMFHZvjKHk3GMUIDXA+gFVW3s7E2BwGo8u
	 197mO9Gq+6sAN+bvVMZHrolI=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 8EFB740E0140;
	Sat, 13 Sep 2025 05:48:45 +0000 (UTC)
Date: Sat, 13 Sep 2025 07:48:37 +0200
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
Message-ID: <20250913054837.GAaMUFtd4YlaPqL2Ov@fat_crate.local>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250913003842.41944-29-safinaskar@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Sep 13, 2025 at 12:38:07AM +0000, Askar Safin wrote:
> Rename initrd_start to virt_external_initramfs_start and
> initrd_end to virt_external_initramfs_end.

"virt" as in "virtualization"?

That's not confusing at all... :-\

And "external" means what?

> They refer to initramfs, not to initrd

Why not simply initramfs_{start,end} if they belong to it?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

