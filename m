Return-Path: <linuxppc-dev+bounces-6459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05782A43D77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 12:24:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2FcY0HYPz30VZ;
	Tue, 25 Feb 2025 22:24:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740482668;
	cv=none; b=Qi7cj5W7PTCvK7Gq+5JbrNtTldd0hleXQhGDgDppvQ/5F2D2m8y1YnxC89Zh+4ypRZKC4D6pyScaUYLUXYtlJfgJPq/vkYY33rNngXoSo3aIlstZRvV8eA5AJZz12vBMOZ/QVJn3fbBdiNJF+uuKo2CoQW5+IobWwSsEfChES5qUoSk5jvXpMn19p+Lz+6tvMFkt/ZkYzqnGeP0pOlacsp6iYBT+TGbKfOQuq0GZXcx5dLmBRZ+5QBr/knrMfs3h1hmWiIkrOQFG1qo8bzyjLGBPxWShLBBPsTP57x9xO0HsjcsYtQ8USRDy7cPzX0R23kJZqdvu8NDuVgPtVf+HHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740482668; c=relaxed/relaxed;
	bh=SE36g/5H7+HyXqPmkQDAM7/o/R9eF2nmZlquxTi5q8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcmgoCxoX17Co7VqI5LmDS+2+hkYxRstxSOvKVMk4UZN84+QoA+XWlY60kXbcDFfZgYTcYf56oDlbmBQ1nlFpe+ZRe59Qm9O9lCiPgk8gi6ungU0iVskJ8DZenrW12TnzfF7DB5mw7fet2AOJKaI0KlC0nURfqNzWBFIx/JoJjgIb2twZtlGfeHaI3oxMtv1sTZzUxu1MizT/KfkSDYa6YXvS3BWVS14BWP4/buoEGP1SwnKl/9Ug1LDbE3L80JmYyoiOjtiPgTDaplpw04L//qcd+hoFRagQV2swxzCr0nSZcyGOUIDSfyrCVpAqtJUMslrIJiKuV/4+NpfYLic0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vLIeKOVd; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vLIeKOVd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2FcW5Cm3z2ykX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 22:24:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3ADC761236;
	Tue, 25 Feb 2025 11:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD844C4CEDD;
	Tue, 25 Feb 2025 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740482662;
	bh=MirNTPbQz5gTjaQC01Jw/a2iTl1/yY+daEIYiEzXuYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vLIeKOVdl8nhID+IyQy/esaTBoDcVsF3QQztySqida1uICinzlhoj8QrYH5VNi1Zf
	 LNuuXA5KuPmkBWu4ExDD1p1M2aXjH+B35LyRNknPuvEzQYNScpGDI8RXjTNkKGknCp
	 jCNxf9GkTGXJSIuatGoUkyHppwxOFV2ejI5mpXRC52caYLhTsMSbMGBST2IhBn+M3M
	 mzrrmgcnR0Kp4cA5VvZZwbQ5dJl0BOPvqadxjR0uEGafKVLu8lEMs9f2ZJPYLAaI0K
	 ny41ZtFz6WkWycL/51GTpx4UYutgKXLvLXllVJKuaysCABLLzDTr29YIhJKQQM6yZG
	 r+5f5Pg20iqmA==
Date: Tue, 25 Feb 2025 12:24:08 +0100
From: Christian Brauner <brauner@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Amir Goldstein <amir73il@gmail.com>, 
	Andrey Albershteyn <aalbersh@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-xfs@vger.kernel.org, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <20250225-testfahrt-seilwinde-64e6f44c01ce@brauner>
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org>
 <20250221181135.GW21808@frogsfrogsfrogs>
 <CAOQ4uxgyYBFqkq6cQsso4LxJsPJ4uECOdskXmz-nmGhhV5BQWg@mail.gmail.com>
 <20250224-klinke-hochdekoriert-3f6be89005a8@brauner>
 <6b51ffa2-9d67-4466-865e-e703c1243352@app.fastmail.com>
 <20250225-strom-kopflos-32062347cd13@brauner>
 <3c860dc0-ba8d-4324-b286-c160b7d8d2c4@app.fastmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3c860dc0-ba8d-4324-b286-c160b7d8d2c4@app.fastmail.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 25, 2025 at 11:40:51AM +0100, Arnd Bergmann wrote:
> On Tue, Feb 25, 2025, at 11:22, Christian Brauner wrote:
> > On Tue, Feb 25, 2025 at 09:02:04AM +0100, Arnd Bergmann wrote:
> >> On Mon, Feb 24, 2025, at 12:32, Christian Brauner wrote:
> >> 
> >> The ioctl interface relies on the existing behavior, see
> >> 0a6eab8bd4e0 ("vfs: support FS_XFLAG_COWEXTSIZE and get/set of
> >> CoW extent size hint") for how it was previously extended
> >> with an optional flag/word. I think that is fine for the syscall
> >> as well, but should be properly documented since it is different
> >> from how most syscalls work.
> >
> > If we're doing a new system call I see no reason to limit us to a
> > pre-existing structure or structure layout.
> 
> Obviously we could create a new structure, but I also see no
> reason to do so. The existing ioctl interface was added in
> in 2002 as part of linux-2.5.35 with 16 bytes of padding, half
> of which have been used so far.
> 
> If this structure works for another 23 years before we run out
> of spare bytes, I think that's good enough. Building in an
> incompatible way to handle potential future contents would
> just make it harder to use for any userspace that wants to
> use the new syscalls but still needs a fallback to the
> ioctl version.

The fact that this structure has existed since the dawn of time doesn't
mean it needs to be retained when adding a completely new system call.

People won't mix both. They either switch to the new interface because
they want to get around the limitations of the old interface or they
keep using the old interface and the associated workarounds.

In another thread they keep arguing about new extensions for Windows
that are going to be added to the ioctl interface and how to make it fit
into this. That just shows that it's very hard to predict from the
amount of past changes how many future changes are going to happen. And
if an interface is easy to extend it might well invite new changes that
people didn't want to or couldn't make using the old interface.

