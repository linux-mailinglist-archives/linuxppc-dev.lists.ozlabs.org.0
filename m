Return-Path: <linuxppc-dev+bounces-6456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8A6A43B49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 11:22:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2DF83h0wz30DL;
	Tue, 25 Feb 2025 21:22:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740478956;
	cv=none; b=GZP2mWAFTD36Lg2nijf+aPyZocb3aQfstZ0PpTT141Pa942AmnCrclyjleMUjmMm2EQQ2pFGvfDUq1uL0R4yToJ0RrP2G9oJSX7IMlKVu9BNfMB11RFVq6hoNmQd5ocNxI9h2E/HfCD070fFoxXy7530h0UexLRFvvUoSyKMaIybNb4u4sVcVe5nGwPwanvQN8lUs3NYYJvSwmuOVmcoApe73Y8jpz7OaommI+Mrgt3OzQIwcLqInMy53+ouZd5zWIULP2S8M7bcOVBFXke4im9yAogiUhdInydTYXc3nNpWGiCmv+drKH6c6rINWZFeFOmylXEQ5IOdQmNRQBR81g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740478956; c=relaxed/relaxed;
	bh=9joJ5lAMoQVd6/QxOHtknGOH3Jwd7fDHmxdMpAvs0mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hgec/bMQHPlcEfdczju3r9Pp8Q8yqJRqAP9SEvtr4u2AIf21bnAHXmOqVa1ZDsnzA2eOob88QdfrKtWJB41O+nwJautYSPhPoU2ieIfEefi+A/sQnyjuagfV+MReEX7oO8m1eAn3iEvga5KhMdgpNIab8ZG4sIrM8luRW5jxgL8IboF3/WSuPO671bMuetZaa5Gf9K1yfARMvsk9eP81i0iWwrLW60/uu4fsZZDYbm1Hr/BDedLrGWLk8KFE2BuicfRnGcgKQogwYq5EXVpIw6L9etFSUnV40CSzH5DbrCko9HiD6rqdbhI5TLnaO66DHn5lfWZ5Rngs9auI5oLtfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QLdVe9QX; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QLdVe9QX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2DF73tWfz3048
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 21:22:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 722FF6126A;
	Tue, 25 Feb 2025 10:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F22EC4CEDD;
	Tue, 25 Feb 2025 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740478952;
	bh=5HOkE2YqQG0nj7GKm31VM9cru6617nBuKvCY1GMnDrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QLdVe9QX36ZATBZopGaFS7xncV75FrVifGUmO8YFcq0fsqRsaJ22u5r4/RZQOJ3Sp
	 yMEl/oKfTZihFmWVtEKikhl/HfJsgdlkCrNq55W9eyV/njTytIaMD9k7zFgv1x4TaI
	 I2IADYz/CQiWBy3kUYdqd4/6a+d9wa1OJ63tEswPaPSmhJ9mvyvjSLPOfrMnC+lJSK
	 LaosnjwljP1fU1QllOJcPmhDfG/AbY9BKKl5qhnGon0GvGM+IMN1WKFPOeumOwG/Tb
	 8wfL7+oJ4DopnrX8olKXaLI8joRoQgVk7Ykgfi+0FSJvIaTDPVShiCTVbRLd3HNrPp
	 6XmUqt0gTmi9g==
Date: Tue, 25 Feb 2025 11:22:17 +0100
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
Message-ID: <20250225-strom-kopflos-32062347cd13@brauner>
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org>
 <20250221181135.GW21808@frogsfrogsfrogs>
 <CAOQ4uxgyYBFqkq6cQsso4LxJsPJ4uECOdskXmz-nmGhhV5BQWg@mail.gmail.com>
 <20250224-klinke-hochdekoriert-3f6be89005a8@brauner>
 <6b51ffa2-9d67-4466-865e-e703c1243352@app.fastmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b51ffa2-9d67-4466-865e-e703c1243352@app.fastmail.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 25, 2025 at 09:02:04AM +0100, Arnd Bergmann wrote:
> On Mon, Feb 24, 2025, at 12:32, Christian Brauner wrote:
> > On Fri, Feb 21, 2025 at 08:15:24PM +0100, Amir Goldstein wrote:
> >> On Fri, Feb 21, 2025 at 7:13 PM Darrick J. Wong <djwong@kernel.org> wrote:
> 
> >> > > @@ -23,6 +23,9 @@
> >> > >  #include <linux/rw_hint.h>
> >> > >  #include <linux/seq_file.h>
> >> > >  #include <linux/debugfs.h>
> >> > > +#include <linux/syscalls.h>
> >> > > +#include <linux/fileattr.h>
> >> > > +#include <linux/namei.h>
> >> > >  #include <trace/events/writeback.h>
> >> > >  #define CREATE_TRACE_POINTS
> >> > >  #include <trace/events/timestamp.h>
> >> > > @@ -2953,3 +2956,75 @@ umode_t mode_strip_sgid(struct mnt_idmap *idmap,
> >> > >       return mode & ~S_ISGID;
> >> > >  }
> >> > >  EXPORT_SYMBOL(mode_strip_sgid);
> >> > > +
> >> > > +SYSCALL_DEFINE4(getfsxattrat, int, dfd, const char __user *, filename,
> >> > > +             struct fsxattr __user *, fsx, unsigned int, at_flags)
> >> >
> >> > Should the kernel require userspace to pass the size of the fsx buffer?
> >> > That way we avoid needing to rev the interface when we decide to grow
> >> > the structure.
> >
> > Please version the struct by size as we do for clone3(),
> > mount_setattr(), listmount()'s struct mnt_id_req, sched_setattr(), all
> > the new xattrat*() system calls and a host of others. So laying out the
> > struct 64bit and passing a size alongside it.
> >
> > This is all handled by copy_struct_from_user() and copy_struct_to_user()
> > so nothing to reinvent. And it's easy to copy from existing system
> > calls.
> 
> I don't think that works in this case, because 'struct fsxattr'
> is an existing structure that is defined with a fixed size of
> 28 bytes. If we ever need more than 8 extra bytes, then the
> existing ioctl commands are also broken.
> 
> Replacing fsxattr with an extensible structure of the same contents
> would work, but I feel that just adds more complication for little
> gain.
> 
> On the other hand, there is an open question about how unknown
> flags and fields in this structure. FS_IOC_FSSETXATTR/FS_IOC_FSGETXATTR
> treats them as optional and just ignores anything it doesn't
> understand, while copy_struct_from_user() would treat any unknown
> but set bytes as -E2BIG.
> 
> The ioctl interface relies on the existing behavior, see
> 0a6eab8bd4e0 ("vfs: support FS_XFLAG_COWEXTSIZE and get/set of
> CoW extent size hint") for how it was previously extended
> with an optional flag/word. I think that is fine for the syscall
> as well, but should be properly documented since it is different
> from how most syscalls work.

If we're doing a new system call I see no reason to limit us to a
pre-existing structure or structure layout.

