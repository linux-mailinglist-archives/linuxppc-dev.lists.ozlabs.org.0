Return-Path: <linuxppc-dev+bounces-7351-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F1EA73097
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 12:47:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNhj26vzGz2yqf;
	Thu, 27 Mar 2025 22:47:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743076038;
	cv=none; b=dYBl56MnEZO8XQLykfp6QQ6424fZ66jjETk7PAz3J85sPGhHeJkNTMvQi1d8U4HNptHWkTeUB85gjMVBu51mcuuY51hveotqkHIJ1htbXhtwvnYm/E3JkPm+X+egafhLVKlBtQdreWO9YIlOeJqB99NIOVeljT4xrGQzv3Z40JKoOpR5u57tO06kS9vLjbV+elFywaBGYKlo0sldlhmAuFA99/tF2qyBcHSLJzJD5mFcPmOLXSwVr8P2JOEAdeCQUMB/OgSjbxnlJjP5AC1p3IBlGmTAbTazXwvNMAyUgRuciFnF+tLMLTrEjugQhGN2t2BpbuZuQek+o+5cEXFvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743076038; c=relaxed/relaxed;
	bh=is9+y2X85jwUJpC2vpoBI5XsOCH7hq1X1nDpdTQ6gJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URCNbdWs9/gN8edIMJ1Rf+0zpciTrmQ/Vb0ZZh0PqGkBdItfdCdHCkOQNfMFeDZMBpPZfs9QXF/WrYH5zRXs+jDmznE9Ln+SZ4iKLv9qMRZ2vBi0p9+wdbDd4MWkKf8lHev6eRFqkONoEOgFTQK5u0qRRvgRJi5dduTfSbflRjNpHl66mDU7ayndpTHqp4eqFx3iz6ZlcJ/lzuhDCSjI7tT1HAy4WNkZWPJoxZvCv166cilUNj3OWIZBY8l70X2Mau1KCtaiRlal+7YYs6hBRLyhZ523/dFR/ZqvNGYx+4GCS0EnCYjtwavsZSzuh7Hcdi0o+fuYmlNQwmJ/sHRdZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bWzbdSFy; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bWzbdSFy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNhj16gSzz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 22:47:16 +1100 (AEDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac345bd8e13so150725766b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 04:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743076034; x=1743680834; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is9+y2X85jwUJpC2vpoBI5XsOCH7hq1X1nDpdTQ6gJo=;
        b=bWzbdSFyOFboeKj142xeGssjj2tsAk89D6H2z+bVkFn7qiiD7OwPWsBMM7vGEANNOI
         lvmm0nKi1ZiP27goreSVMQKF0z8+wt37rg0JG4Z1F5xK3rcAZ5HI0dUZFfB+Wadwkdq1
         kXSw12v6k6IrJMp1Z/ujTZ5u61/CLj9KzJw36SIXC5Vg2tlBss9swGg1+QtEi9QjQUVO
         zn5oh6c4aGfJdfMMwo1bQReZKoumxJ73u431Pg34VflWXvXw7FkRZmrUM6P8D7Zb3TQZ
         FVYk9pciolTuOj/CM481y/NWGkT/cyUkPm3uaDrKnf47SFiFLtyYrb2xwHdXu+Qr4cUP
         d/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743076034; x=1743680834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=is9+y2X85jwUJpC2vpoBI5XsOCH7hq1X1nDpdTQ6gJo=;
        b=hNcEdrxGWKhYFIyhJxgpYoYVfN4bZ7S2jv6JeTuUuuKfLegP40AxLcywsxueD2u8NL
         LM1NukQgDFEMqYohANP7rBlaD0OK+elAS7GYuQiQsi81PusNl7sNQBoa3PWcfFPsQfEf
         bj0tHO2i+OoFHHoAM/lYc6sf34oBYKbvx4JrexlcnsKaoW/tqSTG+Bo7D4JHru2JAfQv
         7v93xJCFRZGgkqJGEjA4PMFqxq3bxXV+hBQJqgueWRvO/MkHNn4u3jHC6QBGK0RYWgPH
         pn4rCvijsTbAcGZFXT/nyDQ6fcj8X6YfXeBwpzPqG81rk+LaMZzN6RZ90WB9oJKs+wej
         uYLA==
X-Forwarded-Encrypted: i=1; AJvYcCUtNWdYe7VAapQGLLvwcZ66hbRjlsBJt+UTlZbuCJcdSI18k/nX/4hSHdi0eLNj3lRhs5+fziZRLPHt47U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyX/omn15beL85QFY8q5yLWuRzKK6ZqkEwMd2Y7cYx8OqfDjgQv
	CwMIgm9fCOxAO5FCyQ6PPT244vaqjSbk7gvp6oHJ3pvNJw+qU3JgkWtLvCyWOR3QzSqNfYMIRne
	kMyZVgtezXffmKXfvnjUd+knOdPM=
X-Gm-Gg: ASbGncttvAxTXbZ7PN42fn5tV/cidVVGuYahP1aKg/kscxvM1RpsDZqkNh5IOxH/jCH
	bHv7v/m7PbzcFzwV+UrykPXNhPq541f4WaiD+na42ljr/Q8dJ0+FyAQMhkW40usJPhM/m5mK+yA
	bkBeXXs8HPO/ahPEMEv/3s7t2asQ==
X-Google-Smtp-Source: AGHT+IFDMEzXsY+VZjpd0kG58wjWGn9FeNWYrZGZgOC4akNvRiDgmmjaMJcSLaslSRq0Qq/XBA95rVTpeV7+0zkMjwY=
X-Received: by 2002:a17:907:7292:b0:ac2:9683:ad25 with SMTP id
 a640c23a62f3a-ac6faf46d6dmr291188966b.34.1743076033463; Thu, 27 Mar 2025
 04:47:13 -0700 (PDT)
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
 <CAOQ4uxjQDUg8HFG+mSxMkR54zen7nC2jttzOKqh13Bx-uosh3Q@mail.gmail.com> <20250323103234.2mwhpsbigpwtiby4@pali>
In-Reply-To: <20250323103234.2mwhpsbigpwtiby4@pali>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 27 Mar 2025 12:47:02 +0100
X-Gm-Features: AQ5f1Jpi0M5N9RWSGdapIu4-VZrbOc2LlwCzBFz2QmmwPCZLH_QgJtaO5jSCIs8
Message-ID: <CAOQ4uxiTKhGs1H-w1Hv-+MqY284m92Pvxfem0iWO+8THdzGvuA@mail.gmail.com>
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

On Sun, Mar 23, 2025 at 11:32=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> =
wrote:
>
> On Sunday 23 March 2025 09:45:06 Amir Goldstein wrote:
> > On Fri, Mar 21, 2025 at 8:50=E2=80=AFPM Andrey Albershteyn <aalbersh@re=
dhat.com> wrote:
> > >
> > > This patchset introduced two new syscalls getfsxattrat() and
> > > setfsxattrat(). These syscalls are similar to FS_IOC_FSSETXATTR ioctl=
()
> > > except they use *at() semantics. Therefore, there's no need to open t=
he
> > > file to get an fd.
> > >
> > > These syscalls allow userspace to set filesystem inode attributes on
> > > special files. One of the usage examples is XFS quota projects.
> > >
> > > XFS has project quotas which could be attached to a directory. All
> > > new inodes in these directories inherit project ID set on parent
> > > directory.
> > >
> > > The project is created from userspace by opening and calling
> > > FS_IOC_FSSETXATTR on each inode. This is not possible for special
> > > files such as FIFO, SOCK, BLK etc. Therefore, some inodes are left
> > > with empty project ID. Those inodes then are not shown in the quota
> > > accounting but still exist in the directory. This is not critical but=
 in
> > > the case when special files are created in the directory with already
> > > existing project quota, these new inodes inherit extended attributes.
> > > This creates a mix of special files with and without attributes.
> > > Moreover, special files with attributes don't have a possibility to
> > > become clear or change the attributes. This, in turn, prevents usersp=
ace
> > > from re-creating quota project on these existing files.
> > >
> > > Christian, if this get in some mergeable state, please don't merge it
> > > yet. Amir suggested these syscalls better to use updated struct fsxat=
tr
> > > with masking from Pali Roh=C3=A1r patchset, so, let's see how it goes=
.
> >
> > Andrey,
> >
> > To be honest I don't think it would be fair to delay your syscalls more
> > than needed.
>
> I agree.
>
> > If Pali can follow through and post patches on top of your syscalls for
> > next merge window that would be great, but otherwise, I think the
> > minimum requirement is that the syscalls return EINVAL if fsx_pad
> > is not zero. we can take it from there later.
>
> IMHO SYS_getfsxattrat is fine in this form.
>
> For SYS_setfsxattrat I think there are needed some modifications
> otherwise we would have problem again with backward compatibility as
> is with ioctl if the syscall wants to be extended in future.
>
> I would suggest for following modifications for SYS_setfsxattrat:
>
> - return EINVAL if fsx_xflags contains some reserved or unsupported flag
>
> - add some flag to completely ignore fsx_extsize, fsx_projid, and
>   fsx_cowextsize fields, so SYS_setfsxattrat could be used just to
>   change fsx_xflags, and so could be used without the preceding
>   SYS_getfsxattrat call.
>
> What do you think about it?

I think all Andrey needs to do now is return -EINVAL if fsx_pad is not zero=
.

You can use this later to extend for the semantics of flags/fields mask
and we can have a long discussion later on what this semantics should be.

Right?

Amir.

