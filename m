Return-Path: <linuxppc-dev+bounces-8815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4616ABF00B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 11:36:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2RC53fSsz3btq;
	Wed, 21 May 2025 19:36:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747820209;
	cv=none; b=A2HAfMAnycp441xhfsNc1abat3JSdWQAzZKhQCrdPQu+EjpvZrAcsLuWcb9Cfc41WeiGUeuvVv+PJLNeBptSA26ctMMQ1W/jDMhiWHbmzHwzsbID5Y+8h0sJ/Vgmn2pNwQyUDTO3JGL5ym49H9T3As9seFumobj7OnG0ApWfKnlV8cVI8iQ/6d2lHqc4ftM8ZtZsvXCArtIx4GIaA+rsoaJTLm053liIYVSQfnzhu3D8aFyUV1J1OGwwqayq4sZgqT79d6WzLxzoxnAuBw4GWK4kZZjaYRShYJzpumYNTovt9lE0jgIwz0HUuUWjJc3wNrCMfvYnRgqQ2XY65yU0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747820209; c=relaxed/relaxed;
	bh=1fDT/rPyS09cFNKeRhfGuyH5tO25pffu2I+mqbu+oKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYtDhi9hiBBXJQJERbfDKs9AarIH/6YZMxwq1Aszc3HhkHW3TPP/9N+bD4KUuqWId6A7Cm7nh3ZfaAHs1qv1QPwu4qLs36mFB9dEB1mfDqDeo+zKVTgPNt5L7asGVCwS11a9ILzWwrIcT8M6jvn9a5jSLQjb2I2VCvcMYhJd3LjNULN34G4KWnP3v7JANVDKFiDcxMeeZR66T9fNKFVIGEb8M7KlZcIy/T7G4Iyk8OTOdfIz9rDJXjEJsQYXECmIOrxyf5r+3iCOkNng3yttDdKi3o8ESoLF6dTPdqiRfpnUJ6CGmx7dCuN+w83Oxf12Kxz9snj2byqJxiS68/fS/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ebE7OeJF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ebE7OeJF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2RC33q1bz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 19:36:47 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ad216a5a59cso925420466b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 02:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747820203; x=1748425003; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fDT/rPyS09cFNKeRhfGuyH5tO25pffu2I+mqbu+oKo=;
        b=ebE7OeJFBHKiaoV4T1SXfge7cMUgiun2Yis+fz2lLPlgvvzCNkGoonc3ORKNUxGhEm
         P0IDxwhARnIGM5UYoxqW5DiWwBXWGRDr3fPIItEyA7ITTaonShH2X5mqscDAyzck1g1c
         ND5ez5uHFGlVAdI5O3EnyN6lW2+zx53EBJK59WxRakzgK8LwmIeM3DiYzy6kPywIN0O/
         kmTdPS/6TfkhmzJRhCRURq/ebAzc1YrYSIuglYkjeb4rUVBTqL/mIlRLAcbZ3kXeRZI4
         sUd7jVBSG+pPAwixjTLc3L31E8kfJs+9pV1mhyuelLtpDrGOyXXnsO3bbVipLFVZA77k
         LwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747820203; x=1748425003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fDT/rPyS09cFNKeRhfGuyH5tO25pffu2I+mqbu+oKo=;
        b=QBB21pGAmsezJVwc6jEE1F+wPD7JtVb13UdFRhLTdXVPVT95IYQDy3/1kkrUW4lbUT
         AzFdh2iaHKq7qEO79oovtQJJn7kosL4P+9Fa0S7iZ1zTtIr+SDIEHhXcN2cvEgzeYUxJ
         BHRfjDjYIjTzVtEZIlgDflEvWAm633i4KD7l0yxUA6UDNVQFbDSBgJBnfInTDtUhNCjx
         +G3Wcue4SeSkcYvhduLfsGbT0juvtAw0xOnhjeTe7xx5Ld/1vTAK/V9vFN3O9rpBsYYs
         2ndBqNRC0Nhb65oNVJOKWzuqFXQfU0GutcI8XCFvsVA+18Me1fZns7CrorDq2GccLv2Y
         KkKg==
X-Forwarded-Encrypted: i=1; AJvYcCUTz5un2W+NsPZ3bw5+5Alahmhi8xse03OycfxvQwOMgentjuvuKyMexbsOrnkMHx71Ya+TCXQwBa/ssMY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVHLzBU5RlvkazGwOkOFUM7xOKDSGi7OoJ8W1urqsVpRMOG1wx
	RVqD8h920fNByBFP+EtwC6NPHDhdqMmWaabXSErZhCiLRh3r3lU1Wbildr+O8kQqUZ6rzpgBlXK
	Rjc2yVOPjQ5aUCUlnq2WE27bHAwnIOq0=
X-Gm-Gg: ASbGncuFyo+kt4uUnyC87uXamZAjo+gSrcD4JSLIEKrV5Gd4nKKt4bjHijB5hoZiub8
	sXHOsixeBptZUJH9uwlZQFLGUgsAfIQSmslv2xyqLyZA0KQkdneBr2jq0Z/qI1vcTTLMuOXp5w+
	iEiTgSN96pLRbZQ8XnfzxrYjtCn7hD2BSk
X-Google-Smtp-Source: AGHT+IFRnJEcWleyx7qwRg7vCSphUUiTic92QQTbjBIO27j1RZLPz4oc9+NYTvPTi3d4hgYaU1hHw6EOra2vJZB7M9Q=
X-Received: by 2002:a17:906:2b1b:b0:ad5:3746:591b with SMTP id
 a640c23a62f3a-ad537465cf1mr1369436966b.55.1747820202406; Wed, 21 May 2025
 02:36:42 -0700 (PDT)
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
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
 <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com> <20250515-bedarf-absagen-464773be3e72@brauner>
 <CAOQ4uxicuEkOas2UR4mqfus9Q2RAeKKYTwbE2XrkcE_zp8oScQ@mail.gmail.com>
 <aCsX4LTpAnGfFjHg@dread.disaster.area> <sfmrojifgnrpeilqxtixyqrdjj5uvvpbvirxmlju5yce7z72vi@ondnx7qbie4y>
In-Reply-To: <sfmrojifgnrpeilqxtixyqrdjj5uvvpbvirxmlju5yce7z72vi@ondnx7qbie4y>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 21 May 2025 11:36:31 +0200
X-Gm-Features: AX0GCFvWQ5JZ1WJhnjsofvtr8p7StwkfQswgOpTGVD-EYd-NOKxs-pNdKNcJ-sU
Message-ID: <CAOQ4uxiM+BBNODHfxu=v3XN2ezA-0k54qC5R4qdELbZW+W-xkg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr syscalls
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Dave Chinner <david@fromorbit.com>, Christian Brauner <brauner@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S . Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, selinux@vger.kernel.org, 
	ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 21, 2025 at 10:48=E2=80=AFAM Andrey Albershteyn <aalbersh@redha=
t.com> wrote:
>
> On 2025-05-19 21:37:04, Dave Chinner wrote:
> > On Thu, May 15, 2025 at 12:33:31PM +0200, Amir Goldstein wrote:
> > > On Thu, May 15, 2025 at 11:02=E2=80=AFAM Christian Brauner <brauner@k=
ernel.org> wrote:
> > > >
> > > > On Tue, May 13, 2025 at 11:53:23AM +0200, Arnd Bergmann wrote:
> > > > > On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
> > > > >
> > > > > >
> > > > > >     long syscall(SYS_file_getattr, int dirfd, const char *pathn=
ame,
> > > > > >             struct fsxattr *fsx, size_t size, unsigned int at_f=
lags);
> > > > > >     long syscall(SYS_file_setattr, int dirfd, const char *pathn=
ame,
> > > > > >             struct fsxattr *fsx, size_t size, unsigned int at_f=
lags);
> > > > >
> > > > > I don't think we can have both the "struct fsxattr" from the uapi
> > > > > headers, and a variable size as an additional argument. I would
> > > > > still prefer not having the extensible structure at all and just
> > > >
> > > > We're not going to add new interfaces that are fixed size unless fo=
r the
> > > > very basic cases. I don't care if we're doing that somewhere else i=
n the
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
> > > > @@ -868,12 +868,6 @@ static int do_vfs_ioctl(struct file *filp, uns=
igned int fd,
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
> > > > @@ -886,6 +880,20 @@ static int do_vfs_ioctl(struct file *filp, uns=
igned int fd,
> > > >                 break;
> > > >         }
> > > >
> > > > +       switch (_IOC_NR(cmd)) {
> > > > +       case _IOC_NR(FS_IOC_FSGETXATTR):
> > > > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) !=3D _IOC_TYPE(FS_I=
OC_FSGETXATTR)))
> > > > +                       return SOMETHING_SOMETHING;
> > > > +               /* Only handle original size. */
> > > > +               return ioctl_fsgetxattr(filp, argp);
> > > > +
> > > > +       case _IOC_NR(FFS_IOC_FSSETXATTR):
> > > > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) !=3D _IOC_TYPE(FFS_=
IOC_FSSETXATTR)))
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
> > > Should we will need to depart from this struct definition and we migh=
t
> > > as well do it for the initial release of the syscall rather than late=
r on, e.g.:
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
> > > +       __u32           fsx_xflags;     /* xflags field value (get/se=
t) */
> > > +       __u32           fsx_extsize;    /* extsize field value (get/s=
et)*/
> > > +       __u32           fsx_nextents;   /* nextents field value (get)=
   */
> > > +       __u32           fsx_projid;     /* project identifier (get/se=
t) */
> > > +       __u32           fsx_cowextsize; /* CoW extsize field value (g=
et/set)*/
> > > +};
> > > +
> > > +#define FSXATTR_SIZE_VER0 20
> > > +#define FSXATTR_SIZE_LATEST FSXATTR_SIZE_VER0
> >
> > If all the structures overlap the same, all that is needed in the
> > code is to define the structure size that should be copied in and
> > parsed. i.e:
> >
> >       case FSXATTR..._V1:
> >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v1));
> >       case FSXATTR..._V2:
> >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v2));
> >       case FSXATTR...:
> >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr));
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

Not sure which two solutions you are referring to.

I proposed fsx_fileattr as what I think is the path of least resistance.
There are opinions that we may be able to avoid defining
this struct, but I don't think there was any objection to adding it.

So unless I am missing an objection that I did not understand
define it and get over this hurdle?

Thanks,
Amir.

