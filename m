Return-Path: <linuxppc-dev+bounces-8830-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599BABF1EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:44:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2SjZ2Cqbz3c3y;
	Wed, 21 May 2025 20:44:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747824290;
	cv=none; b=G/ZlzpPzDTE9AAMchRFHNay+DvkO75Xv5pjiTqNUQTOzexvdU0sgfOXRu11AiketafFU2tezoxuZn9VitQVlG/+bd1IpmYkvJUgYjB5sqV4UZgLDij6po2xXznTJ0JTu0NbVhrjOoFBCG7pcJT+WLTpsUAEL0vpxpFlygQ48Szkg4Q6xS5PbMYfpz4CeAJRaV0rYWtt8daZuiUBOwzQgNKxsBut0ryWuVTheWqeFt3HqHw5gyLG+iZp2sSOTOQ1yfjdq/iV3y8y+ZI9Zny65hb3+PF/JUPJko9MOnzvS5QLwYqE+pgQ+JzmLzl6HSGKDwJzdcSd3SL1gZTziP4lH2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747824290; c=relaxed/relaxed;
	bh=U7s86C99en4rKIGw3tj+5ymWyZfNfw27U2XEo8biwfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maji/cFslReq+gySaj8P/33CIbM+MqPXgdxfPu85fhD+EQuDEaGfnXbKhI5otKN6LfruDHI+323rayEq8H4MpzSrJHoV8CCty0lT7YEkJ/ccAj2XghAKwMzCwXCtiyDt6WMhNim8mGHIsl/xOHIrjaUfHxHhmI57vsa4gOhzz4eC7UgYJdBtUIahpx3eKOqK1uFMyn5GiVIwDxshOibjKE8QJzPp+8rk1ffgzwJip3zVnE9B6ynoWDk6XZNHNwa1gGs5X7reckFicGZ3cDe6nbT9Wroeeu49J8huDN0InkKGyagO1uaRs/DWR+7WusKv3FZi6xpfsaWPoE/d/rkhGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ajtLOK2s; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ajtLOK2s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2SjX2P71z3c2R
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:44:47 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad5a11c2942so219380066b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 03:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747824284; x=1748429084; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7s86C99en4rKIGw3tj+5ymWyZfNfw27U2XEo8biwfc=;
        b=ajtLOK2shVeNpGQO8Qf04PdBNzN+RauGenJFTibZWB8LCb3Y5/kmuMAzxExzkkwTZ8
         jt18zraXe3/Njw1ufJlzdDleYqnCM9SB4smTeyQFX1+YxQgAoeARrJ6PkJN+Jsn1vp6B
         jqL+rLP1ycj99icUMHTYZ4yK/iof2M658LECwX1N91D6UC5iwnIzfauvmZj4yZRoUaD8
         cd+BIoK6lsBnWt33uLf3ArzujxQ4OVnX/TF+/KTlnSeVKFK52aH2qsDE7KjXCJOFhm3R
         AGqkiQxsR9KPKuDI4UBCwidya9Ks/6FhBvZ0RYSyVOwZS+E4gwOpXjGyFYe7ceyO8Nih
         /2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747824284; x=1748429084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7s86C99en4rKIGw3tj+5ymWyZfNfw27U2XEo8biwfc=;
        b=AUU61Lm1C6YAwfJZBJQB5/YaD9vOlMG9PI27QyBUuY+wNsM2Mo9SyQIkFvGAbcW+aA
         DKRqVaPynily1i7xP1hKURIywuMLGJny2gNOxSGn/ur8iJpW+r7nqgIwgcNQV+ezEMX3
         l58d38271Tc0KRXvIC370tWrB5HA5nWkRSpIUBwAS8C7zj2NC9UwJUo5szWxJiP/484O
         1ZhJzLPFiWyVjFDGiy6AmcqxRU/KzQOu8ExxqXeI0waW3L6lc4930f5X6UKCzzJMblJR
         XNGhN4zN1PDE9oR1la/QAOaErZVa1KRFxJOy4yHQaE+jXG4uW9SJZ+Bp88q746u6c8W+
         Zy9g==
X-Forwarded-Encrypted: i=1; AJvYcCUkSN6s9HbdBAMTvggtK3EMQGkJQ9wHb0zpA+JBJRgwkAcBOALY65dtX3KfTxYvJaXTDptW9cP9KMHWmP4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxKhwzOjdbew/KxWNCa6h9MdDzJhP6EVpzDJGmGJ2hwfTw38pcv
	qHkfpfnDeuAP0SmOlVXKvOCm0hnRiDHwDehKsoq0CB34MeL7+mF4bNoOmDflmR4lCeKa04nxAuv
	QX+kT+GQwWi2IPT/eHEWxmDuXCuI40k4=
X-Gm-Gg: ASbGncv+yCv4g2YEUjVDv7pJhY5Zu8YxFxjScdifqmbTge5cLTbMlQUdeiroQU7Dfa6
	DbPSj8nX2T4rdIiG6ZorIjT1YohvLHhPF6pu8C0nsK0mfPM6shVfaYHO3c3mhRNDdMkadUgPV8h
	v88rD37UfDgXZuJregYp5K4AblgjEKeXx9
X-Google-Smtp-Source: AGHT+IHjdKaldjnagUYeAkZaxVv0PKTrOg3dvgceCo3K5CfAqPJX4ttSEQJcVm5rFWRa63l5bGpXFWyRh6DbM0BJP0M=
X-Received: by 2002:a17:906:8f8a:b0:ad2:1a66:a1ad with SMTP id
 a640c23a62f3a-ad536b7de17mr1674734766b.6.1747824283278; Wed, 21 May 2025
 03:44:43 -0700 (PDT)
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
 <CAOQ4uxiM+BBNODHfxu=v3XN2ezA-0k54qC5R4qdELbZW+W-xkg@mail.gmail.com> <mw2d36mqwzqoveguw5vlggrnw2wirsbhdxkox33z3fg7k6huz6@hj4ntgg3oj7p>
In-Reply-To: <mw2d36mqwzqoveguw5vlggrnw2wirsbhdxkox33z3fg7k6huz6@hj4ntgg3oj7p>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 21 May 2025 12:44:30 +0200
X-Gm-Features: AX0GCFtzhzw8HQOfKpcxXaUXYfRoIUIi0dE2W9yfpQHIc06WbddDr0-sckzPkGU
Message-ID: <CAOQ4uxiOaYusURMrjozD_s24Swih2g0x5_nTTYXO=+=EPCYtjw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr syscalls
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: pali@kernel.org, Dave Chinner <david@fromorbit.com>, 
	Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
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

On Wed, May 21, 2025 at 12:06=E2=80=AFPM Andrey Albershteyn <aalbersh@redha=
t.com> wrote:
>
> On 2025-05-21 11:36:31, Amir Goldstein wrote:
> > On Wed, May 21, 2025 at 10:48=E2=80=AFAM Andrey Albershteyn <aalbersh@r=
edhat.com> wrote:
> > >
> > > On 2025-05-19 21:37:04, Dave Chinner wrote:
> > > > On Thu, May 15, 2025 at 12:33:31PM +0200, Amir Goldstein wrote:
> > > > > On Thu, May 15, 2025 at 11:02=E2=80=AFAM Christian Brauner <braun=
er@kernel.org> wrote:
> > > > > >
> > > > > > On Tue, May 13, 2025 at 11:53:23AM +0200, Arnd Bergmann wrote:
> > > > > > > On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
> > > > > > >
> > > > > > > >
> > > > > > > >     long syscall(SYS_file_getattr, int dirfd, const char *p=
athname,
> > > > > > > >             struct fsxattr *fsx, size_t size, unsigned int =
at_flags);
> > > > > > > >     long syscall(SYS_file_setattr, int dirfd, const char *p=
athname,
> > > > > > > >             struct fsxattr *fsx, size_t size, unsigned int =
at_flags);
> > > > > > >
> > > > > > > I don't think we can have both the "struct fsxattr" from the =
uapi
> > > > > > > headers, and a variable size as an additional argument. I wou=
ld
> > > > > > > still prefer not having the extensible structure at all and j=
ust
> > > > > >
> > > > > > We're not going to add new interfaces that are fixed size unles=
s for the
> > > > > > very basic cases. I don't care if we're doing that somewhere el=
se in the
> > > > > > kernel but we're not doing that for vfs apis.
> > > > > >
> > > > > > > use fsxattr, but if you want to make it extensible in this wa=
y,
> > > > > > > it should use a different structure (name). Otherwise adding
> > > > > > > fields after fsx_pad[] would break the ioctl interface.
> > > > > >
> > > > > > Would that really be a problem? Just along the syscall simply a=
dd
> > > > > > something like:
> > > > > >
> > > > > > diff --git a/fs/ioctl.c b/fs/ioctl.c
> > > > > > index c91fd2b46a77..d3943805c4be 100644
> > > > > > --- a/fs/ioctl.c
> > > > > > +++ b/fs/ioctl.c
> > > > > > @@ -868,12 +868,6 @@ static int do_vfs_ioctl(struct file *filp,=
 unsigned int fd,
> > > > > >         case FS_IOC_SETFLAGS:
> > > > > >                 return ioctl_setflags(filp, argp);
> > > > > >
> > > > > > -       case FS_IOC_FSGETXATTR:
> > > > > > -               return ioctl_fsgetxattr(filp, argp);
> > > > > > -
> > > > > > -       case FS_IOC_FSSETXATTR:
> > > > > > -               return ioctl_fssetxattr(filp, argp);
> > > > > > -
> > > > > >         case FS_IOC_GETFSUUID:
> > > > > >                 return ioctl_getfsuuid(filp, argp);
> > > > > >
> > > > > > @@ -886,6 +880,20 @@ static int do_vfs_ioctl(struct file *filp,=
 unsigned int fd,
> > > > > >                 break;
> > > > > >         }
> > > > > >
> > > > > > +       switch (_IOC_NR(cmd)) {
> > > > > > +       case _IOC_NR(FS_IOC_FSGETXATTR):
> > > > > > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) !=3D _IOC_TYPE(=
FS_IOC_FSGETXATTR)))
> > > > > > +                       return SOMETHING_SOMETHING;
> > > > > > +               /* Only handle original size. */
> > > > > > +               return ioctl_fsgetxattr(filp, argp);
> > > > > > +
> > > > > > +       case _IOC_NR(FFS_IOC_FSSETXATTR):
> > > > > > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) !=3D _IOC_TYPE(=
FFS_IOC_FSSETXATTR)))
> > > > > > +                       return SOMETHING_SOMETHING;
> > > > > > +               /* Only handle original size. */
> > > > > > +               return ioctl_fssetxattr(filp, argp);
> > > > > > +       }
> > > > > > +
> > > > >
> > > > > I think what Arnd means is that we will not be able to change str=
uct
> > > > > sfxattr in uapi
> > > > > going forward, because we are not going to deprecate the ioctls a=
nd
> > > >
> > > > There's no need to deprecate anything to rev an ioctl API.  We have
> > > > had to solve this "changing struct size" problem previously in XFS
> > > > ioctls. See XFS_IOC_FSGEOMETRY and the older XFS_IOC_FSGEOMETRY_V4
> > > > and XFS_IOC_FSGEOMETRY_V1 versions of the API/ABI.
> > > >
> > > > If we need to increase the structure size, we can rename the existi=
ng
> > > > ioctl and struct to fix the version in the API, then use the
> > > > original name for the new ioctl and structure definition.
> > > >
> > > > The only thing we have to make sure of is that the old and new
> > > > structures have exactly the same overlapping structure. i.e.
> > > > extension must always be done by appending new varibles, they can't
> > > > be put in the middle of the structure.
> > > >
> > > > This way applications being rebuild will pick up the new definition
> > > > automatically when the system asserts that it is suppored, whilst
> > > > existing binaries will always still be supported by the kernel.
> > > >
> > > > If the application wants/needs to support all possible kernels, the=
n
> > > > if XFS_IOC_FSGEOMETRY is not supported, call XFS_IOC_FSGEOMETRY_V4,
> > > > and if that fails (only on really old irix!) or you only need
> > > > something in that original subset, call XFS_IOC_FSGEOMETRY_V1 which
> > > > will always succeed....
> > > >
> > > > > Should we will need to depart from this struct definition and we =
might
> > > > > as well do it for the initial release of the syscall rather than =
later on, e.g.:
> > > > >
> > > > > --- a/include/uapi/linux/fs.h
> > > > > +++ b/include/uapi/linux/fs.h
> > > > > @@ -148,6 +148,17 @@ struct fsxattr {
> > > > >         unsigned char   fsx_pad[8];
> > > > >  };
> > > > >
> > > > > +/*
> > > > > + * Variable size structure for file_[sg]et_attr().
> > > > > + */
> > > > > +struct fsx_fileattr {
> > > > > +       __u32           fsx_xflags;     /* xflags field value (ge=
t/set) */
> > > > > +       __u32           fsx_extsize;    /* extsize field value (g=
et/set)*/
> > > > > +       __u32           fsx_nextents;   /* nextents field value (=
get)   */
> > > > > +       __u32           fsx_projid;     /* project identifier (ge=
t/set) */
> > > > > +       __u32           fsx_cowextsize; /* CoW extsize field valu=
e (get/set)*/
> > > > > +};
> > > > > +
> > > > > +#define FSXATTR_SIZE_VER0 20
> > > > > +#define FSXATTR_SIZE_LATEST FSXATTR_SIZE_VER0
> > > >
> > > > If all the structures overlap the same, all that is needed in the
> > > > code is to define the structure size that should be copied in and
> > > > parsed. i.e:
> > > >
> > > >       case FSXATTR..._V1:
> > > >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v1)=
);
> > > >       case FSXATTR..._V2:
> > > >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v2)=
);
> > > >       case FSXATTR...:
> > > >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr));
> > > >
> > > > -Dave.
> > > > --
> > > > Dave Chinner
> > > > david@fromorbit.com
> > > >
> > >
> > > So, looks like there's at least two solutions to this concern.
> > > Considering also that we have a bit of space in fsxattr,
> > > 'fsx_pad[8]', I think it's fine to stick with the current fsxattr
> > > for now.
> >
> > Not sure which two solutions you are referring to.
>
> Suggested by Christian and Dave
>

IIUC, those are suggestions of how we could cope with changing
struct fsxattr in the future, but it is easier not to have to do that.

> >
> > I proposed fsx_fileattr as what I think is the path of least resistance=
.
> > There are opinions that we may be able to avoid defining
> > this struct, but I don't think there was any objection to adding it.
> >
> > So unless I am missing an objection that I did not understand
> > define it and get over this hurdle?
>
> I see, sure, I misinterpreted the communication :) no problems, I
> will create 'struct fsx_fileattr' then.
>
> Pali, ah sorry, I forgot that you will extend fsxattr right away
>

Much less problems could be caused if fsxattr remain frozen in
time along with the ioctls as we continue to extend the syscalls.

Thanks,
Amir.

P.S. your CC list is a bit much.
I wouldn't trust get_maintainer.pl output when it provides such a huge list
it has some emails that bounce - not nice.

When you are at v5 you should be able to have figured out who is
participating in the review and for the rest, the public lists
linux-fsdevel, linux-api and linux-xfs should be enough.

