Return-Path: <linuxppc-dev+bounces-8599-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2F3AB83EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 May 2025 12:33:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zymlk0p7wz2yhY;
	Thu, 15 May 2025 20:33:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747305234;
	cv=none; b=dNK7bsqJE+da7Q/fRuq4HGYb/iIUL1Zv3IvPTrirn97np3xSXiYqpD6kptGxKU9hjh3iFsVtN6hglMOo2zL5VRROsAxKUn/qKyeTBEIEsKKCIbDUqjcpLX8r/8zgd9J41CWvhp8I/8KV+1gmK8dmBCNtEVv9yPqixOJoWaYJz6XNEBgGX1afwGFBSSx/XI8ol+OdmX/qSPrlRcGxMUb0I0xLw9szp9V4k4WAniQ3JSQvTP8anqIoD8Yw01Bk4wVT1UVn9QX34a5KJF76epf6O6NuNRDEoS+4Xm/K7OBUlKQj8vhRVjwgKnWYbYUZzb/SxT/c5ShLNGo5NWfeoIUdqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747305234; c=relaxed/relaxed;
	bh=ix0mN7yylNXsLKVIXpa3RC7XyXUMorhAJgZhoj08KZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QmR+RP838mCRp1cKa/1wSjc/3QNaH05JskD3GJrm5wjDWiKd3s3QLUmMyFKtbKkVqJo7KZcwIKSRVl/jqvPaakL0RATTXDI6VKQ1stIv/vS8VICzpLlBzbmCHGWp3zhbJ5+gRXkJwc6BgNDVQAYLCzgc9JJCZh5GGZMq/JfGE3ekbssQXcv58bu5uJXmzr3NBK9uE2nComwnLufq92UbP5XofQmKqjZTn5fXy5jpl1i18Uwpne4KNiNWxApmt+/kb60/vKSIp34pR6PFTGL7g9yHdfGS+FV5461ufN/Xdn4sATnsVFQy7NXYwFp38kljZkzEMYC1s0RUravfxDjhLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FEfBhoFR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FEfBhoFR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zymlh0nYwz2ygn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 20:33:51 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad228552355so145728666b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 03:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747305224; x=1747910024; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ix0mN7yylNXsLKVIXpa3RC7XyXUMorhAJgZhoj08KZI=;
        b=FEfBhoFRu0kmIqw8sApDMiC4i7fy3on8WKb5S4Zd2S65N6n1MhTkEaO7juIAmlxGyv
         HGCLaffxFKvta9YNrdOZpLyfQ9fV0NDpY7xanuUbbfXig1XK9D4/IOcZa2pfJFjCvaVX
         IO3Q6Y0P/AkNhgF+x7nTnGz1ey9BKzLRhPM8i37rRyEFzYXLq34pUwm8nU5/T/Vjlu7N
         Mmx+M7V9BSmMyhCFE44jrWKjaoMGd/TM9w1cm2nLCS/KOp5/H/JWhiQlAw0k3Lgdf3c2
         sZzvYXIwLACyNge1nYzAeZl/VsM4pRcRFypmbXNoiFnfRv6TUyAWdR4uMew/xci5AiIe
         VOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747305224; x=1747910024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ix0mN7yylNXsLKVIXpa3RC7XyXUMorhAJgZhoj08KZI=;
        b=Yvivo6e30NkqRqTRpuAZuzpfpX5BDVrJ290sEvXOFtIGckdx/WlIBLcL88H7iG3sBa
         7TjvfPV0arTi4oUQhZ9tgP8zGliCS5C9d9AvoGQ28M9rVz7dd2GX1/nHOcEW2e0TRaBP
         7sFzqQQHP2wKD3gKrB/6NAOpLj1zDxEBR+6G0Joh2KdIOdE1zZo7s+K5s6PSvM8KXoVF
         j1P+a7ErgKKjC8ANBKN2kBPlvZ4VWoT0JaRKvD/XA450VpiVJ/auAzve6oxHm3u1qZfE
         +6MgCpWmrUYmxea8ad5B81Q28ePbGDs7M1CMHIAeJhasZ7YBVFI8T2Urk9+jYsyJZ+af
         YGxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYTAFZG4AbNXSeyv7mrbSvjP2OU8oBAnRn6Eb29jJp6srxkCOn4kfLSR99BZd1c6UJ1z8oq6WmK79Z6eI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzp4vlhj3JJvj/p1MRtRl+FiiN436zAKtX6voOz6FRWT/aI+wEM
	VuaAxeh5NQB6dLkclBEeJnJYXn1bgcHO9oTN6QAT0aAoOL+sC5KoMx6ZgDAh2XwjpLvIeInAB/g
	j2PwPhCoV/sJb7oWZtS+kyQu9VXU=
X-Gm-Gg: ASbGncvDy4Jtrd3ezo8j6IYQnB7sdn8eRc7EY5EDyv3hbdpBJFRu4tXazQhB7UmXf7s
	XwxvE+d8l8w9Lu3kUObYmlABuCdsTbeC5T0o16NygT9DK3FJSXiO2cdBZGSkR3+5esz709tk9gk
	OMqE74tTEA4MhUhxH3UYZvXDXmy8k3cNV7
X-Google-Smtp-Source: AGHT+IH/YFjWiUa7Oe6APhoaMiAXM+TxOKXzzX9IOWrtv4bcH+n6gSWZSohhovEJvJss7Wr0el1TN6Dn7PUuhUUlRKw=
X-Received: by 2002:a17:907:72c1:b0:ad2:e683:a76c with SMTP id
 a640c23a62f3a-ad515d79f17mr198604066b.7.1747305223832; Thu, 15 May 2025
 03:33:43 -0700 (PDT)
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
In-Reply-To: <20250515-bedarf-absagen-464773be3e72@brauner>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 15 May 2025 12:33:31 +0200
X-Gm-Features: AX0GCFv6VzJTt0PbxjVfcfLF_B5PjKPMcuhdvqJqoMNLfQeCg9Kk1MZMyM5NBko
Message-ID: <CAOQ4uxicuEkOas2UR4mqfus9Q2RAeKKYTwbE2XrkcE_zp8oScQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr syscalls
To: Christian Brauner <brauner@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrey Albershteyn <aalbersh@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
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

On Thu, May 15, 2025 at 11:02=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
>
> On Tue, May 13, 2025 at 11:53:23AM +0200, Arnd Bergmann wrote:
> > On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
> >
> > >
> > >     long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > >     long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> >
> > I don't think we can have both the "struct fsxattr" from the uapi
> > headers, and a variable size as an additional argument. I would
> > still prefer not having the extensible structure at all and just
>
> We're not going to add new interfaces that are fixed size unless for the
> very basic cases. I don't care if we're doing that somewhere else in the
> kernel but we're not doing that for vfs apis.
>
> > use fsxattr, but if you want to make it extensible in this way,
> > it should use a different structure (name). Otherwise adding
> > fields after fsx_pad[] would break the ioctl interface.
>
> Would that really be a problem? Just along the syscall simply add
> something like:
>
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index c91fd2b46a77..d3943805c4be 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -868,12 +868,6 @@ static int do_vfs_ioctl(struct file *filp, unsigned =
int fd,
>         case FS_IOC_SETFLAGS:
>                 return ioctl_setflags(filp, argp);
>
> -       case FS_IOC_FSGETXATTR:
> -               return ioctl_fsgetxattr(filp, argp);
> -
> -       case FS_IOC_FSSETXATTR:
> -               return ioctl_fssetxattr(filp, argp);
> -
>         case FS_IOC_GETFSUUID:
>                 return ioctl_getfsuuid(filp, argp);
>
> @@ -886,6 +880,20 @@ static int do_vfs_ioctl(struct file *filp, unsigned =
int fd,
>                 break;
>         }
>
> +       switch (_IOC_NR(cmd)) {
> +       case _IOC_NR(FS_IOC_FSGETXATTR):
> +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) !=3D _IOC_TYPE(FS_IOC_FSG=
ETXATTR)))
> +                       return SOMETHING_SOMETHING;
> +               /* Only handle original size. */
> +               return ioctl_fsgetxattr(filp, argp);
> +
> +       case _IOC_NR(FFS_IOC_FSSETXATTR):
> +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) !=3D _IOC_TYPE(FFS_IOC_FS=
SETXATTR)))
> +                       return SOMETHING_SOMETHING;
> +               /* Only handle original size. */
> +               return ioctl_fssetxattr(filp, argp);
> +       }
> +

I think what Arnd means is that we will not be able to change struct
sfxattr in uapi
going forward, because we are not going to deprecate the ioctls and
certainly not
the XFS specific ioctl XFS_IOC_FSGETXATTRA.

This struct is part of XFS uapi:
https://man7.org/linux/man-pages/man2/ioctl_xfs_fsgetxattr.2.html

Should we will need to depart from this struct definition and we might
as well do it for the initial release of the syscall rather than later on, =
e.g.:

--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -148,6 +148,17 @@ struct fsxattr {
        unsigned char   fsx_pad[8];
 };

+/*
+ * Variable size structure for file_[sg]et_attr().
+ */
+struct fsx_fileattr {
+       __u32           fsx_xflags;     /* xflags field value (get/set) */
+       __u32           fsx_extsize;    /* extsize field value (get/set)*/
+       __u32           fsx_nextents;   /* nextents field value (get)   */
+       __u32           fsx_projid;     /* project identifier (get/set) */
+       __u32           fsx_cowextsize; /* CoW extsize field value (get/set=
)*/
+};
+
+#define FSXATTR_SIZE_VER0 20
+#define FSXATTR_SIZE_LATEST FSXATTR_SIZE_VER0
+

Right?

Thanks,
Amir.

