Return-Path: <linuxppc-dev+bounces-7956-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 552FDA9A75C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 11:06:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjqpT6l6Yz3bpG;
	Thu, 24 Apr 2025 19:06:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745485585;
	cv=none; b=l6XCbs79pPACUO8d0rZs13eNIzXik6pYzks3CmuzwZ5UguZP03kD8Ce3dDyIBETT1R1bjHQpZps3z0g2uzZsWZAHwGWlM3twloG1nIg6onD7ojJq+ZA4akQDBeIgD4ppESQuxKML83clcQkKQ99cCoNbNPkMxEVzLxnT1THXshP1MaEvUxvtCPnvJZlxVqWuadgJzr/tPgYZdjsL9c2LUj/jYSQD8tsfUpYE616j4rFyxFLaIhziJ8tpOE+Jlu6/Xd/NpuNrCs5lMQTt3LVpvxmIN483v8TmQLL0OBJ/p4SYshJJb6EIaNeUfhjVaQQmhxnRxPDq/L+njwRgx6qCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745485585; c=relaxed/relaxed;
	bh=JsSm+8P4/x1ip2NmntClsT7PEM9SxljjVJd+glaI45o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OknKWf1qkOq+CdRXpkWlM5zjEMykEdotKjZKPaHP1nmf6gwcaT4dP8h7quauOvbdw3sfv4lRtv2wb5Lbpe9cKsOKKD4ntrIlbQXSQkYNVuBVe4Kx7qTjWv/arV6DYZQzHQQtOyxloOPtY3gkC723xK3zeKHOkFpj7aBbH1PDBy0RtOn1+FHYzjNBCAhtgun3XdSfW6U8hPQGFkhFk5eCJmqkr/4E3lhPzw4jlrdNyKjqwEjKZIrkkGbqtQ1mw8yGgxfpKSlHQSDqQiaVBmDVSyvxg5LSgjbMIDiEnhTSiUkAlBwxNvzxcRQI3/lp6bwmfnW6Wz78HCT6w/RLhFr2gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qPzQ2EtO; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qPzQ2EtO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjqpT0NVjz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 19:06:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3068C5C634D;
	Thu, 24 Apr 2025 09:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF029C4CEEB;
	Thu, 24 Apr 2025 09:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745485581;
	bh=g6bxeBGFz+ZfAiISf78nYF5d6OuqVi+zKYMYmkzuYww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPzQ2EtOhRHjvqeIqmfEs41n41+fPOpo5wVb0WXRA0Y64JK63Z0piOH/6q1TuKDwD
	 WTI9c9BorspnKyVAu3DQkYsACDPHLJTqVVPTN6kTMVKEScUaCBv3GdtHESuUO5NqC6
	 pqjqzGFZkOK5FpMLm1+UNv77/mYGep1Zag5d47x0b6vZpoHTEkoNH1VrlBp4U0AaKU
	 qsF/Vn2vnRvvp1Kn7/YXcOkrtYa0w4Ynlqq5gkE0B8hjxnGwh/iyaywzNfxrIZA9z+
	 2pzSBGKxX+TFKn8wOJih4WXcFzFXNu3Sjb1AkS/krSZea9kudjKkOe+16Pk7titbWK
	 ch3/3zyDdzWnA==
Date: Thu, 24 Apr 2025 11:06:07 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH v4 3/3] fs: introduce getfsxattrat and setfsxattrat
 syscalls
Message-ID: <20250424-zuspielen-luxus-3d49b600c3bf@brauner>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
 <20250422-abbekommen-begierde-bcf48dd74a2e@brauner>
 <rbzlwvecvrp4xawwp5nywdq6wp5hgjhrtrabpszv74xmfqbj4f@x7v6eqfc5gcd>
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
In-Reply-To: <rbzlwvecvrp4xawwp5nywdq6wp5hgjhrtrabpszv74xmfqbj4f@x7v6eqfc5gcd>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 23, 2025 at 11:53:25AM +0200, Jan Kara wrote:
> On Tue 22-04-25 16:59:02, Christian Brauner wrote:
> > On Fri, Mar 21, 2025 at 08:48:42PM +0100, Andrey Albershteyn wrote:
> > > From: Andrey Albershteyn <aalbersh@redhat.com>
> > > 
> > > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > > extended attributes/flags. The syscalls take parent directory fd and
> > > path to the child together with struct fsxattr.
> > > 
> > > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > > that file don't need to be open as we can reference it with a path
> > > instead of fd. By having this we can manipulated inode extended
> > > attributes not only on regular files but also on special ones. This
> > > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > > we can not call ioctl() directly on the filesystem inode using fd.
> > > 
> > > This patch adds two new syscalls which allows userspace to get/set
> > > extended inode attributes on special files by using parent directory
> > > and a path - *at() like syscall.
> > > 
> > > CC: linux-api@vger.kernel.org
> > > CC: linux-fsdevel@vger.kernel.org
> > > CC: linux-xfs@vger.kernel.org
> > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> ...
> > > +		struct fsxattr __user *, ufsx, size_t, usize,
> > > +		unsigned int, at_flags)
> > > +{
> > > +	struct fileattr fa = {};
> > > +	struct path filepath;
> > > +	int error;
> > > +	unsigned int lookup_flags = 0;
> > > +	struct filename *name;
> > > +	struct fsxattr fsx = {};
> > > +
> > > +	BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> > > +	BUILD_BUG_ON(sizeof(struct fsxattr) != FSXATTR_SIZE_LATEST);
> > > +
> > > +	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
> > > +		return -EINVAL;
> > > +
> > > +	if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> > > +		lookup_flags |= LOOKUP_FOLLOW;
> > > +
> > > +	if (at_flags & AT_EMPTY_PATH)
> > > +		lookup_flags |= LOOKUP_EMPTY;
> > > +
> > > +	if (usize > PAGE_SIZE)
> > > +		return -E2BIG;
> > > +
> > > +	if (usize < FSXATTR_SIZE_VER0)
> > > +		return -EINVAL;
> > > +
> > > +	name = getname_maybe_null(filename, at_flags);
> > > +	if (!name) {
> > 
> > This is broken as it doesn't handle AT_FDCWD correctly. You need:
> > 
> >         name = getname_maybe_null(filename, at_flags);
> >         if (IS_ERR(name))
> >                 return PTR_ERR(name);
> > 
> >         if (!name && dfd >= 0) {
> > 		CLASS(fd, f)(dfd);
> 
> Ah, you're indeed right that if dfd == AT_FDCWD and filename == NULL, the
> we should operate on cwd but we'd bail with error here. I've missed that
> during my review. But as far as I've checked the same bug is there in
> path_setxattrat() and path_getxattrat() so we should fix this there as
> well?

Yes, please!

