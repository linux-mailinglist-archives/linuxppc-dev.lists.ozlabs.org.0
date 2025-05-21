Return-Path: <linuxppc-dev+bounces-8805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA62ABEEB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 10:58:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2QLM263Rz3bwF;
	Wed, 21 May 2025 18:58:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747817883;
	cv=none; b=TI8Hzbf6xlSXOxgQAHyBwj4y/iRYbHYGqL7Gcal3u5O6z2LjBG3eYOPg8B1hRJBbuXQ0qZn7Pmv3RmkSE/WKet8lKxd2+w67jORJzMoDccC9G/tyOy+FgNSNmh3tDsLYuVgSJ1UwA05I7plplmqh3OZof12qcsG1C8Ot9mNxUhCJu2qruxvAOre9ePWs0dBOs2iFcYbmDHcy+qpIfvPlZYQbJ+Zs/w6WqbFKxwsTk8/99s9IshXoKI0wZdzE7I4DPwfO0o/ygMhDLHzrrFFkc4ulF/zmtKHdNLbj/OQA4nnSYrK+pS1jgrn/eVStdZFfmw76WRFo3NcAXfCi+Dhd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747817883; c=relaxed/relaxed;
	bh=UMauxADDaycls4yTQRLAwPcUeeW2wbI0fDJ20OwzP3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XY9DOVsv5ov3yrVsVwS4/LV6FXcSMyvCpg7YldNasIGRWHUDoqDjO4fqiTcxoclEjPpArNmu3RtHKOjlcacePBWLBouw3cjBcl4KRw5XVRlITTFyPhTrluesfhRcQ/Ku1/u+APn4IwYKsS8QZFu4ZqjPwxOTyXbIEOC3YAI5RZQpp8SPn99FJpOozHKsR/hUK4eyRAF56rrWCA+Sv+mySTqJamJytCLMt/TUy4rLS3IJweP/9SCtyp6YGiTu0qZbHE04mb22nyUpK6Xoc1ZGlvainRGv3mipLnymb3GjptbF41XdFCf4oFzce88KPUpwvxd0s/ab8hNZ31fXUrmVuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qnbh/9kI; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=pali@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qnbh/9kI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=pali@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2QLL1zkhz2ydl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 18:58:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2CEF8A4E695;
	Wed, 21 May 2025 08:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70438C4CEED;
	Wed, 21 May 2025 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747817878;
	bh=ua7q+H1WgOWVcLV6yULMClYrx7Bnz34PuVBhzv5mcnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qnbh/9kIwlewmeCrHEnn70KkQc7O6ES+h8TW8j/oXsWNJ8+b91k9gp3+D3oZZAEac
	 35c3sk+4H9+LrdhVh3+BRIaFwTuEgCY/r5l2yO92nXgCMQy61/k0yoNjWKeGc2V/Si
	 NY9oILnzoc9TzjFhgfrBKetfvo6MC0PZqBtDlnbkaS/ubj3EVJQy1dj6E+ibksH16G
	 rJDUt+ooLqAAhB6VGuaiYtoqpd4RD5k+dgbtaPRgKAslON+3YvDyq2wtTcroGVVnt0
	 sLcgQKTGtDmhr5cPTHPpW0YoTRs0xFSaPqveGoMro01wO/uvx2kF19riNOx4IWeT06
	 9A24umMO5i9CA==
Received: by pali.im (Postfix)
	id 61EBE723; Wed, 21 May 2025 10:57:55 +0200 (CEST)
Date: Wed, 21 May 2025 10:57:55 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Dave Chinner <david@fromorbit.com>, Amir Goldstein <amir73il@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
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
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Tyler Hicks <code@tyhicks.com>, Miklos Szeredi <miklos@szeredi.hu>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org,
	Linux-Arch <linux-arch@vger.kernel.org>, selinux@vger.kernel.org,
	ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org,
	linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr
 syscalls
Message-ID: <20250521085755.4bucg7vq2kb3mbfk@pali>
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
 <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
 <20250515-bedarf-absagen-464773be3e72@brauner>
 <CAOQ4uxicuEkOas2UR4mqfus9Q2RAeKKYTwbE2XrkcE_zp8oScQ@mail.gmail.com>
 <aCsX4LTpAnGfFjHg@dread.disaster.area>
 <sfmrojifgnrpeilqxtixyqrdjj5uvvpbvirxmlju5yce7z72vi@ondnx7qbie4y>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <sfmrojifgnrpeilqxtixyqrdjj5uvvpbvirxmlju5yce7z72vi@ondnx7qbie4y>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wednesday 21 May 2025 10:48:26 Andrey Albershteyn wrote:
> On 2025-05-19 21:37:04, Dave Chinner wrote:
> > On Thu, May 15, 2025 at 12:33:31PM +0200, Amir Goldstein wrote:
> > > On Thu, May 15, 2025 at 11:02 AM Christian Brauner <brauner@kernel.org> wrote:
> > > >
> > > > On Tue, May 13, 2025 at 11:53:23AM +0200, Arnd Bergmann wrote:
> > > > > On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
> > > > >
> > > > > >
> > > > > >     long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> > > > > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > > > > >     long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> > > > > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > > > >
> > > > > I don't think we can have both the "struct fsxattr" from the uapi
> > > > > headers, and a variable size as an additional argument. I would
> > > > > still prefer not having the extensible structure at all and just
> > > >
> > > > We're not going to add new interfaces that are fixed size unless for the
> > > > very basic cases. I don't care if we're doing that somewhere else in the
> > > > kernel but we're not doing that for vfs apis.
> > > >
> > > > > use fsxattr, but if you want to make it extensible in this way,
> > > > > it should use a different structure (name). Otherwise adding
> > > > > fields after fsx_pad[] would break the ioctl interface.
> > > >
> > > > Would that really be a problem? Just along the syscall simply add
> > > > something like:
> > > >
> > > > diff --git a/fs/ioctl.c b/fs/ioctl.c
> > > > index c91fd2b46a77..d3943805c4be 100644
> > > > --- a/fs/ioctl.c
> > > > +++ b/fs/ioctl.c
> > > > @@ -868,12 +868,6 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
> > > >         case FS_IOC_SETFLAGS:
> > > >                 return ioctl_setflags(filp, argp);
> > > >
> > > > -       case FS_IOC_FSGETXATTR:
> > > > -               return ioctl_fsgetxattr(filp, argp);
> > > > -
> > > > -       case FS_IOC_FSSETXATTR:
> > > > -               return ioctl_fssetxattr(filp, argp);
> > > > -
> > > >         case FS_IOC_GETFSUUID:
> > > >                 return ioctl_getfsuuid(filp, argp);
> > > >
> > > > @@ -886,6 +880,20 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
> > > >                 break;
> > > >         }
> > > >
> > > > +       switch (_IOC_NR(cmd)) {
> > > > +       case _IOC_NR(FS_IOC_FSGETXATTR):
> > > > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FS_IOC_FSGETXATTR)))
> > > > +                       return SOMETHING_SOMETHING;
> > > > +               /* Only handle original size. */
> > > > +               return ioctl_fsgetxattr(filp, argp);
> > > > +
> > > > +       case _IOC_NR(FFS_IOC_FSSETXATTR):
> > > > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FFS_IOC_FSSETXATTR)))
> > > > +                       return SOMETHING_SOMETHING;
> > > > +               /* Only handle original size. */
> > > > +               return ioctl_fssetxattr(filp, argp);
> > > > +       }
> > > > +
> > > 
> > > I think what Arnd means is that we will not be able to change struct
> > > sfxattr in uapi
> > > going forward, because we are not going to deprecate the ioctls and
> > 
> > There's no need to deprecate anything to rev an ioctl API.  We have
> > had to solve this "changing struct size" problem previously in XFS
> > ioctls. See XFS_IOC_FSGEOMETRY and the older XFS_IOC_FSGEOMETRY_V4
> > and XFS_IOC_FSGEOMETRY_V1 versions of the API/ABI.
> > 
> > If we need to increase the structure size, we can rename the existing
> > ioctl and struct to fix the version in the API, then use the
> > original name for the new ioctl and structure definition.
> > 
> > The only thing we have to make sure of is that the old and new
> > structures have exactly the same overlapping structure. i.e.
> > extension must always be done by appending new varibles, they can't
> > be put in the middle of the structure.
> > 
> > This way applications being rebuild will pick up the new definition
> > automatically when the system asserts that it is suppored, whilst
> > existing binaries will always still be supported by the kernel.
> > 
> > If the application wants/needs to support all possible kernels, then
> > if XFS_IOC_FSGEOMETRY is not supported, call XFS_IOC_FSGEOMETRY_V4,
> > and if that fails (only on really old irix!) or you only need
> > something in that original subset, call XFS_IOC_FSGEOMETRY_V1 which
> > will always succeed....
> > 
> > > Should we will need to depart from this struct definition and we might
> > > as well do it for the initial release of the syscall rather than later on, e.g.:
> > > 
> > > --- a/include/uapi/linux/fs.h
> > > +++ b/include/uapi/linux/fs.h
> > > @@ -148,6 +148,17 @@ struct fsxattr {
> > >         unsigned char   fsx_pad[8];
> > >  };
> > > 
> > > +/*
> > > + * Variable size structure for file_[sg]et_attr().
> > > + */
> > > +struct fsx_fileattr {
> > > +       __u32           fsx_xflags;     /* xflags field value (get/set) */
> > > +       __u32           fsx_extsize;    /* extsize field value (get/set)*/
> > > +       __u32           fsx_nextents;   /* nextents field value (get)   */
> > > +       __u32           fsx_projid;     /* project identifier (get/set) */
> > > +       __u32           fsx_cowextsize; /* CoW extsize field value (get/set)*/
> > > +};
> > > +
> > > +#define FSXATTR_SIZE_VER0 20
> > > +#define FSXATTR_SIZE_LATEST FSXATTR_SIZE_VER0
> > 
> > If all the structures overlap the same, all that is needed in the
> > code is to define the structure size that should be copied in and
> > parsed. i.e:
> > 
> > 	case FSXATTR..._V1:
> > 		return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v1));
> > 	case FSXATTR..._V2:
> > 		return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v2));
> > 	case FSXATTR...:
> > 		return ioctl_fsxattr...(args, sizeof(fsx_fileattr));
> > 
> > -Dave.
> > -- 
> > Dave Chinner
> > david@fromorbit.com
> > 
> 
> So, looks like there's at least two solutions to this concern.
> Considering also that we have a bit of space in fsxattr,
> 'fsx_pad[8]', I think it's fine to stick with the current fsxattr
> for now.
> 
> -- 
> - Andrey
> 

It is planned to extend this structure for new windows attributes as was
discussed. And seem that the current free space would not be enough for
everything.

