Return-Path: <linuxppc-dev+bounces-7360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE61FA73F9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 21:58:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNwwJ51Tkz2yr8;
	Fri, 28 Mar 2025 07:57:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743109071;
	cv=none; b=NfG6ZPRK7KUB/gx8bjB/tY17scj9AwSC88P2QxbOqmdd9pPuHtRSFDty6kvDG98mx6jGPNthOQBr/k/2mR6GMJ3Ovs1dIou8GcbYgKJUf4xZY4RuIrPnjBoWIuT6YKXtq5kgIleSIajFP2i8M+Hdc/yWy0yiKlNWpj0Qd9pTTnl1lW0u24KMkih3e7HG2gkQe6zA5cv4y1jbdWKR9pbFSo6GYHhNGhfBuoWJhJLsKuyq1ZW5WI394XXzvGT+8aOn1gqPgIvbHwhcPZ92F67o5rfGgQrSuJz9iUUAPMBoU5alYI3c34XT6Bm68n09s1uYWxuEkbtOQvhRnE4CKD8ASw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743109071; c=relaxed/relaxed;
	bh=VR7DEyijnU2Btuzsq24JxQagRdb3glRQ+pQ9YwQUpTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULM9BqsKQI8CXCHDIpA5WHy27XW2JrwnIomHJQUxJT+dX0W6ZedjfUOoxvM/eU9imje5E/vLdKu9TLRv85bUz9geB4G/8b0vQAotPliWamzrfGS4GGcp2XjL5qlpk3bemtccoLw7dHbDokLslaDCGQT5u+5VXIwXVn9xHCHB09/p1Obu7AiMs8H3Cq5zROGK4qx46b1qDWZx51AZq57PKzSryxHOn1ZoUMSkDJbRGFnphC7y/0CK6racxCz9b1ot4OSwI2awIS9lh+uHNPIHli774nx0tRZgprwUdVe9AfL2b4xjxeCj+PTnqz2fFGs+2GtNji8uPNOLIPa67hmddw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I0JDykBH; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I0JDykBH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNwwG38b1z2yfv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 07:57:50 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so2565058a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 13:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743109066; x=1743713866; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VR7DEyijnU2Btuzsq24JxQagRdb3glRQ+pQ9YwQUpTo=;
        b=I0JDykBHe4Tjbw+ZT8BvZn1CLY+GTvevcWMYsMPiSRnZsjTeBsQQwWBJcRJJAQAmFK
         MMoBoNSRdsgkaFV1sxERDZe/Gk9oVOC/yPMD5+7efL6c5AuldDHTfQte+3o1o7pxmMsD
         ITxiTGLpMYOx7PSUhwcA4zET0EUVZ4EToqPTO4S5OCkXiHEm/MpNpb/MggzoCJ1NeyaR
         7JiTaCUZ6gRhJaFhBqohv/VrMGI/HFgpi7XIJz7tpYyN5UYJffOEWT9hyy1GTePX5XQo
         CcrKGZPjKFZ6zP0bv73hONu7X2H63sDJwH6gyaxsyO4GVpcRr4GxRx1pnY8gi1FuHgq0
         zvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109066; x=1743713866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VR7DEyijnU2Btuzsq24JxQagRdb3glRQ+pQ9YwQUpTo=;
        b=o9bJ1X1NmvOYunZUkZEu8fhywM1SCtrY8Y9qyx8qMngnv41vdNHhfjB5NfN4VzZz9Y
         0f+Zd5utEALAFFzCi29qqDgdPMWOGNrYOrNlcb5J+EsiyQqCY+vVCBbf8qEJtdSE1K+a
         4IaCkO9Taw+kOYgotlBmzcCqVWqGdod/jMHbQj9Y6Omd2vKMY8Uhp/nt19AMaHDoISL9
         TxhXO167CiBRNvIJZxUf4ykrfi7umShXQp1qjO0tuFbNGS7vCapBSTU4w2vgAwM+mCYo
         BCpKjYv8gJhx3NiXBiWj/bSR8FDe4vZ+uUfFEmW+BFucvs9Ggh9DnU29HeRrp2H7DcCm
         5JnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1sJ+JPaH2R30WGNIwOi74JqXXqCulM1lfPwiGfJwbYmPIUK9/5Pbl7D/7S3JCiKmwikze61lf0AngOm0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzY3E+K4hzIv3bbR7lfmkq/h9oUS0sC7UPrn/3dopnyqxuEDkRc
	dfd6ZCWRK3ECC0IIXcDwCr17Wp5I4MTnecqnv/yuPJaiyEoq+QkAjK7OzAf/Sonn3WQqdOIV6er
	uDwRNEjF/t9FAGvVefVI+0jIEEU0=
X-Gm-Gg: ASbGncvPTimrrArSGyc2MJeHdsmztCOS1CYtatdGHeJVmZskVJJRFfgT0TEGqdAhIxB
	NLdAME6Rp/zl/LEjZyAyihmbK7vssHy/jqpj+d9wkN+C3vETUXXjuDVZ6JeW5JQaymQ61tzUr28
	cKaUTrO5bRz8CVS8Vt1vVZ/I3h2Q==
X-Google-Smtp-Source: AGHT+IGQy/9DoQYCCr9US5q6EnypmXetXiJBY3dnHtL1iSSGFXJt9gHT/MXORtXg0qR63MnGE5R7UOJG3H1b0VV82NI=
X-Received: by 2002:a05:6402:26d0:b0:5e6:23c:a242 with SMTP id
 4fb4d7f45d1cf-5ed8e59f048mr6048289a12.18.1743109065684; Thu, 27 Mar 2025
 13:57:45 -0700 (PDT)
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
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <CAOQ4uxjQDUg8HFG+mSxMkR54zen7nC2jttzOKqh13Bx-uosh3Q@mail.gmail.com>
 <20250323103234.2mwhpsbigpwtiby4@pali> <CAOQ4uxiTKhGs1H-w1Hv-+MqY284m92Pvxfem0iWO+8THdzGvuA@mail.gmail.com>
 <20250327192629.ivnarhlkfbhbzjcl@pali>
In-Reply-To: <20250327192629.ivnarhlkfbhbzjcl@pali>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 27 Mar 2025 21:57:34 +0100
X-Gm-Features: AQ5f1JpYIOUBRGbLo4K_0o1yQv002a0U-X2PtgEoVHqkLx0cP_6nsQWGxHLw9Sg
Message-ID: <CAOQ4uxhJ53h+1AjtF4B64onqvRfZsJ3n1OFikyJpXAPTyX45iQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] fs: introduce getfsxattrat and setfsxattrat syscalls
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-arch@vger.kernel.org, selinux@vger.kernel.org, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Mar 27, 2025 at 8:26=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> w=
rote:
>
> On Thursday 27 March 2025 12:47:02 Amir Goldstein wrote:
> > On Sun, Mar 23, 2025 at 11:32=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.o=
rg> wrote:
> > >
> > > On Sunday 23 March 2025 09:45:06 Amir Goldstein wrote:
> > > > On Fri, Mar 21, 2025 at 8:50=E2=80=AFPM Andrey Albershteyn <aalbers=
h@redhat.com> wrote:
> > > > >
> > > > > This patchset introduced two new syscalls getfsxattrat() and
> > > > > setfsxattrat(). These syscalls are similar to FS_IOC_FSSETXATTR i=
octl()
> > > > > except they use *at() semantics. Therefore, there's no need to op=
en the
> > > > > file to get an fd.
> > > > >
> > > > > These syscalls allow userspace to set filesystem inode attributes=
 on
> > > > > special files. One of the usage examples is XFS quota projects.
> > > > >
> > > > > XFS has project quotas which could be attached to a directory. Al=
l
> > > > > new inodes in these directories inherit project ID set on parent
> > > > > directory.
> > > > >
> > > > > The project is created from userspace by opening and calling
> > > > > FS_IOC_FSSETXATTR on each inode. This is not possible for special
> > > > > files such as FIFO, SOCK, BLK etc. Therefore, some inodes are lef=
t
> > > > > with empty project ID. Those inodes then are not shown in the quo=
ta
> > > > > accounting but still exist in the directory. This is not critical=
 but in
> > > > > the case when special files are created in the directory with alr=
eady
> > > > > existing project quota, these new inodes inherit extended attribu=
tes.
> > > > > This creates a mix of special files with and without attributes.
> > > > > Moreover, special files with attributes don't have a possibility =
to
> > > > > become clear or change the attributes. This, in turn, prevents us=
erspace
> > > > > from re-creating quota project on these existing files.
> > > > >
> > > > > Christian, if this get in some mergeable state, please don't merg=
e it
> > > > > yet. Amir suggested these syscalls better to use updated struct f=
sxattr
> > > > > with masking from Pali Roh=C3=A1r patchset, so, let's see how it =
goes.
> > > >
> > > > Andrey,
> > > >
> > > > To be honest I don't think it would be fair to delay your syscalls =
more
> > > > than needed.
> > >
> > > I agree.
> > >
> > > > If Pali can follow through and post patches on top of your syscalls=
 for
> > > > next merge window that would be great, but otherwise, I think the
> > > > minimum requirement is that the syscalls return EINVAL if fsx_pad
> > > > is not zero. we can take it from there later.
> > >
> > > IMHO SYS_getfsxattrat is fine in this form.
> > >
> > > For SYS_setfsxattrat I think there are needed some modifications
> > > otherwise we would have problem again with backward compatibility as
> > > is with ioctl if the syscall wants to be extended in future.
> > >
> > > I would suggest for following modifications for SYS_setfsxattrat:
> > >
> > > - return EINVAL if fsx_xflags contains some reserved or unsupported f=
lag
> > >
> > > - add some flag to completely ignore fsx_extsize, fsx_projid, and
> > >   fsx_cowextsize fields, so SYS_setfsxattrat could be used just to
> > >   change fsx_xflags, and so could be used without the preceding
> > >   SYS_getfsxattrat call.
> > >
> > > What do you think about it?
> >
> > I think all Andrey needs to do now is return -EINVAL if fsx_pad is not =
zero.
> >
> > You can use this later to extend for the semantics of flags/fields mask
> > and we can have a long discussion later on what this semantics should b=
e.
> >
> > Right?
> >
> > Amir.
>
> It is really enough?

I don't know. Let's see...

> All new extensions later would have to be added
> into fsx_pad fields, and currently unused bits in fsx_xflags would be
> unusable for extensions.

I am working under the assumption that the first extension would be
to support fsx_xflags_mask and from there, you could add filesystem
flags support checks and then new flags. Am I wrong?

Obviously, fsx_xflags_mask would be taken from fsx_pad space.
After that extension is implemented, calling SYS_setfsxattrat() with
a zero fsx_xflags_mask would be silly for programs that do not do
the legacy get+set.

So when we introduce  fsx_xflags_mask, we could say that a value
of zero means that the mask is not being checked at all and unknown
flags in set syscall are ignored (a.k.a legacy ioctl behavior).

Programs that actually want to try and set without get will have to set
a non zero fsx_xflags_mask to do something useful.

I don't think this is great.
I would rather that the first version of syscalls will require the mask
and will always enforce filesystems supported flags.

If you can get those patches (on top of current series) posted and
reviewed in time for the next merge window, including consensus
on the actual semantics, that would be the best IMO.

But I am just preparing a plan B in case you do not have time to
work on the patches or if consensus on the API extensions is not
reached on time.

I think that for plan B, the minimum is to verify zero pad field and
that is something that this syscall has to do anyway, because this
is the way that backward compact APIs work.

If you want the syscall to always return -EINVAL for setting xflags
that are currently undefined I agree that would be nice as well.

Thanks,
Amir.

