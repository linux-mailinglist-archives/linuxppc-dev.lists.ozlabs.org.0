Return-Path: <linuxppc-dev+bounces-7358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFF6A73E8C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 20:26:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNtvH5MW2z2yqn;
	Fri, 28 Mar 2025 06:26:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743103611;
	cv=none; b=Xuh5jj3iDL+uWp0ETrLiX2PA2eNbdysM4qzv7XOZ8vl2/kMBP4QCfHSzf4ygM8LIZIs+6V5sw4jkGUvldasiaublbBf8tRXzXGoGqzUdHKjzoaa0bk6QH1oKZ4ctTVcm28mADDuHRwyW92+b9D8FyKonRKH0YMoFXmkW55QVWqFq/hQEZY7mlSbLkF03cg/+9RWvNKK218kiD5IhWJr5XV5NQbsR3b2zUT4VpIF6Tu9bnzNCYa2uU3O7jfEvAvkEB2Ke5rsnESYbU2gq6F+UBAS/GpxqjiJ5AH6zvSV0YWGhflmnvQxtbwnPp4R285eT6V4/QXBdVba0isbBcxDzqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743103611; c=relaxed/relaxed;
	bh=PbXbzFPJA4S5sJQtm3lB3Ll7RzdOlxhExphdhajQFDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ayvdm18jhAm2jiPAkwBIPOB9mFuJT899fl9q+QuMA0AHADrcFAne04FAkLu9GXfRl6XYxbf2fuMar7r607+MujMPLXVit1bTytaIqeJxxY2+orsPbQs09G1j6PF6Nt+rIEPH8GUKZxIApvHeph8v31Nn8qjS5ZRR78xMexbD/sQPhcZlV5cdnEs36xvwpKXU2IG9i/x5VY1Gsr85dfVJwRXPUACAuMcE4KCc3TVfh7Y6gVGRBqQRCd+SJ5+8LiAYX+pP9bexmuS3sZcznqm8556s07ss1NXEknlji6jGmCbKhaLtC0795oCG164urKp/rJFZl/UIu7uetzmh71oQNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QVvBARqG; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QVvBARqG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNtvF4qkpz2yhW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 06:26:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49E0C5C639E;
	Thu, 27 Mar 2025 19:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94481C4CEDD;
	Thu, 27 Mar 2025 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743103605;
	bh=g1CYlQqdxlwZLruKDHJtfRscrIkZVdAluXQtGU8MRKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QVvBARqGWv0La9m5OD6QDfWqM9kOlX+iu8S7VdV0a3+BiKOoX7iyf19xR8d084NJE
	 X1zYvhSfbd+RX1TIl/Bfrfc3Q9RStkqq+I33SjeBdL3rbFVYoZ5mFxGK8qI53tgWhG
	 E6mcP1CgG1E+q44I66ol4u4AHCkZMht3LsXbAsn7vmffwlODEHOCmWg/b+WE6Q9U6/
	 b02uVG8iTfSg6I2dn4Kk+KUlaD5N37Wo5lJQJSyN3f6Ociw2MEYrLpjJKtxIWJ64j5
	 opIEUTU1kj8mWi/xXf+XCIv9e+n8yqAy4VDIpHMidzJ06JW9buLjpZU7A5J8P70XMi
	 M9Nm3l25jb54A==
Received: by pali.im (Postfix)
	id 490BC81B; Thu, 27 Mar 2025 20:26:29 +0100 (CET)
Date: Thu, 27 Mar 2025 20:26:29 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org, selinux@vger.kernel.org,
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org
Subject: Re: [PATCH v4 0/3] fs: introduce getfsxattrat and setfsxattrat
 syscalls
Message-ID: <20250327192629.ivnarhlkfbhbzjcl@pali>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <CAOQ4uxjQDUg8HFG+mSxMkR54zen7nC2jttzOKqh13Bx-uosh3Q@mail.gmail.com>
 <20250323103234.2mwhpsbigpwtiby4@pali>
 <CAOQ4uxiTKhGs1H-w1Hv-+MqY284m92Pvxfem0iWO+8THdzGvuA@mail.gmail.com>
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
In-Reply-To: <CAOQ4uxiTKhGs1H-w1Hv-+MqY284m92Pvxfem0iWO+8THdzGvuA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thursday 27 March 2025 12:47:02 Amir Goldstein wrote:
> On Sun, Mar 23, 2025 at 11:32 AM Pali Rohár <pali@kernel.org> wrote:
> >
> > On Sunday 23 March 2025 09:45:06 Amir Goldstein wrote:
> > > On Fri, Mar 21, 2025 at 8:50 PM Andrey Albershteyn <aalbersh@redhat.com> wrote:
> > > >
> > > > This patchset introduced two new syscalls getfsxattrat() and
> > > > setfsxattrat(). These syscalls are similar to FS_IOC_FSSETXATTR ioctl()
> > > > except they use *at() semantics. Therefore, there's no need to open the
> > > > file to get an fd.
> > > >
> > > > These syscalls allow userspace to set filesystem inode attributes on
> > > > special files. One of the usage examples is XFS quota projects.
> > > >
> > > > XFS has project quotas which could be attached to a directory. All
> > > > new inodes in these directories inherit project ID set on parent
> > > > directory.
> > > >
> > > > The project is created from userspace by opening and calling
> > > > FS_IOC_FSSETXATTR on each inode. This is not possible for special
> > > > files such as FIFO, SOCK, BLK etc. Therefore, some inodes are left
> > > > with empty project ID. Those inodes then are not shown in the quota
> > > > accounting but still exist in the directory. This is not critical but in
> > > > the case when special files are created in the directory with already
> > > > existing project quota, these new inodes inherit extended attributes.
> > > > This creates a mix of special files with and without attributes.
> > > > Moreover, special files with attributes don't have a possibility to
> > > > become clear or change the attributes. This, in turn, prevents userspace
> > > > from re-creating quota project on these existing files.
> > > >
> > > > Christian, if this get in some mergeable state, please don't merge it
> > > > yet. Amir suggested these syscalls better to use updated struct fsxattr
> > > > with masking from Pali Rohár patchset, so, let's see how it goes.
> > >
> > > Andrey,
> > >
> > > To be honest I don't think it would be fair to delay your syscalls more
> > > than needed.
> >
> > I agree.
> >
> > > If Pali can follow through and post patches on top of your syscalls for
> > > next merge window that would be great, but otherwise, I think the
> > > minimum requirement is that the syscalls return EINVAL if fsx_pad
> > > is not zero. we can take it from there later.
> >
> > IMHO SYS_getfsxattrat is fine in this form.
> >
> > For SYS_setfsxattrat I think there are needed some modifications
> > otherwise we would have problem again with backward compatibility as
> > is with ioctl if the syscall wants to be extended in future.
> >
> > I would suggest for following modifications for SYS_setfsxattrat:
> >
> > - return EINVAL if fsx_xflags contains some reserved or unsupported flag
> >
> > - add some flag to completely ignore fsx_extsize, fsx_projid, and
> >   fsx_cowextsize fields, so SYS_setfsxattrat could be used just to
> >   change fsx_xflags, and so could be used without the preceding
> >   SYS_getfsxattrat call.
> >
> > What do you think about it?
> 
> I think all Andrey needs to do now is return -EINVAL if fsx_pad is not zero.
> 
> You can use this later to extend for the semantics of flags/fields mask
> and we can have a long discussion later on what this semantics should be.
> 
> Right?
> 
> Amir.

It is really enough? All new extensions later would have to be added
into fsx_pad fields, and currently unused bits in fsx_xflags would be
unusable for extensions.

