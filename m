Return-Path: <linuxppc-dev+bounces-7371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EEAA74C12
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Mar 2025 15:09:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPMpX50htz2yrb;
	Sat, 29 Mar 2025 01:09:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743170964;
	cv=none; b=PGH05JpW5+LR1lizHWRO0BVaRlqCYaaqtG4kZPteXTU9DeT7fG5W9irMdzT0ChViM79CTBC37Gj0hBJlp/PpfoDT2Wfh6hMIO93mRfMI0w6WxtdV3N0275VwdPI2XhlVzZlG+J/aORfO0FLdG87UHUThhf18GE3PWHPj9Rg9i0AT0s0BKn9j5UHfLfBXQZt/pBK+WV5H7BNpi/XI4fj6CbuHhRxONoeJCYVqw27rjppgAPmc7BPGBsajYRT25b60Ssnd8JjxoKIeH1nz++pyApTmgjm9Ju8rsg5kkzd1blmTAi6qG4sTr0I08NeD46BEXRsbu/PQ+wtJiG+WiyJ3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743170964; c=relaxed/relaxed;
	bh=2ZsOuifdSx5C6zG54VnSZPZcGikHAgTXK/kBvDrJLmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMhJI/XqyfK0AR0Czokw2dWzpivmtGodj5nrXqNr+rPaJn9lhSp2/MmCDonTVzhkRsrcYfDLJf9CqG9tqY02QpQBVR+buf/EsVs8rl8J4PS7k1h+vHGN2aKTKjCsUgesPaXpK+sggI/oim96cOxZ7fQWBiEcY2xNKogCe/fHbXPuZdhnhklhy4wwHs98xY4jCrLt5GyurW12VYaVLqKU+AwbT55z4yNo7aPFSDHIEMnMFzL3rn36F3tFMBBOnG7Y4bCpMl8zCuLkVU5k3dLUZeGUfDcHxjTgYs7JYcZk8vl9N8QL5NWwWm6Nw6hXXeS43nOu35K9iG15yIhZQixBVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=miqHsxQk; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=miqHsxQk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPMpV52B4z2yqq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Mar 2025 01:09:22 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-abf3d64849dso339792766b.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Mar 2025 07:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743170958; x=1743775758; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZsOuifdSx5C6zG54VnSZPZcGikHAgTXK/kBvDrJLmc=;
        b=miqHsxQkN0IfkCdnay+QhSNW+dmKBVrisWxdiaXZfewVUCn7llitUS6rqgQR5PFcYM
         J8wRxHVif9GDv4MJ+bK39/WV2BGJNyPUbKRyuWXs8ZXDAp5iYawcL1cPrfw95VD8dJtY
         q6eC0K9W8GHStvTWo8MAu8Al/HW9BigqNZqZ71v2Y3Ba179dJ4gvtwwp/tMPHUAGn/vb
         PnidZBMRj8EETwJy8pylSEAqRMH861ffzLtLB7lfb4NWqCPQiReJRvUWxbkxFMuYa8Kp
         z+2U9nK4ZjNOoE/vc4rWcBr9NhF08sHjm8nPY09vDKLslqhQRgxmwxwoNGoaM6WsEBvs
         W0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743170958; x=1743775758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZsOuifdSx5C6zG54VnSZPZcGikHAgTXK/kBvDrJLmc=;
        b=dwuyuQBHXg/S98jHEZ+4IbKmzGP1YVY0ENT//rW0rv9WrtLvie21vBMqAFIdyvAwVp
         wPz/jCOGNZAz9AU77wgx/HnVaFotwyUA31MEkyYnBaIqkiktCiZb5dQlyu0xgVxMFuXt
         siMm6XBhNEMZA3kwKJx9zzP7kFEnl7gOpFNB5qYISU1IVXYKqOIyRcRRJ3rvJrNp7Jnv
         K4uWHNWP+Rgcr8SlMKA2Zyx6fbIaLN09CDCsekIpXh4IlnclIm7tY5qfcGikrV/jS7HZ
         GsYAqY9h21YONfR7/+MxRCA5x+3Buswg5fQPfySYDp6x2uGWoxQ2I/L8qX9qk9gkbMx6
         GTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuFbEiLYZoUdvONundq3CiXS3VdDzAzsaWK+uFBCoUd8NUqIJ25jLYfhi25cbUNqthu6v/QuxEPGDx+MI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy960IDaZxvS3Vv7Bnu7cNESdBupuCAx7DQoRCLPdA0TmAEaqwu
	2OhUZz1YiRwQqvQ21imkcHf6dqmNrzHA43k+MC+rlXkz3oJezW50zxwzQCTDI/qAzQYf+cNIuXt
	9pzxwXmp4wudd1vZHCHlMQGMbjwQ=
X-Gm-Gg: ASbGncvZ2THCMDKDAzl3WVRFK8Zekw6DFmL4PmiB8IDly/N44L97k0Oj2pB5HPLdmov
	ZD2yZuk9I9nug4GM9JaMgMpRlMhtbguilYAdEHNtCMTU40R9jLIJCaFI6jGm8xvVUGcFXEumI5K
	jqyNiApOE1OUihSDA/OuArhykOaw==
X-Google-Smtp-Source: AGHT+IHR2ixT+t94BjkZr/w2qrKr8vCyOHZOQeJuHGHNo/LQshrJ8a3gU3C5jc0FaYRkpYxsuH9rvd/3gEooPk/WaTY=
X-Received: by 2002:a17:906:f587:b0:ac6:f6f4:adad with SMTP id
 a640c23a62f3a-ac6fb145b61mr858589366b.45.1743170957819; Fri, 28 Mar 2025
 07:09:17 -0700 (PDT)
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
 <20250327192629.ivnarhlkfbhbzjcl@pali> <CAOQ4uxhJ53h+1AjtF4B64onqvRfZsJ3n1OFikyJpXAPTyX45iQ@mail.gmail.com>
 <20250327211301.kdsohqou3s242coa@pali>
In-Reply-To: <20250327211301.kdsohqou3s242coa@pali>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 28 Mar 2025 15:09:06 +0100
X-Gm-Features: AQ5f1JpNweOw-d_V1vidFC1VFgAIx6VvCKUFr5FxsVRcprjnxwDwW9vgqTHuYto
Message-ID: <CAOQ4uxiBh42oGyqtc3ekO+jCqtQz85ZWrwFZ9eS0=C8Zq+hPPg@mail.gmail.com>
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
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Mar 27, 2025 at 10:13=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.org> =
wrote:
>
> On Thursday 27 March 2025 21:57:34 Amir Goldstein wrote:
> > On Thu, Mar 27, 2025 at 8:26=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.or=
g> wrote:
> > >
> > > On Thursday 27 March 2025 12:47:02 Amir Goldstein wrote:
> > > > On Sun, Mar 23, 2025 at 11:32=E2=80=AFAM Pali Roh=C3=A1r <pali@kern=
el.org> wrote:
> > > > >
> > > > > On Sunday 23 March 2025 09:45:06 Amir Goldstein wrote:
> > > > > > On Fri, Mar 21, 2025 at 8:50=E2=80=AFPM Andrey Albershteyn <aal=
bersh@redhat.com> wrote:
> > > > > > >
> > > > > > > This patchset introduced two new syscalls getfsxattrat() and
> > > > > > > setfsxattrat(). These syscalls are similar to FS_IOC_FSSETXAT=
TR ioctl()
> > > > > > > except they use *at() semantics. Therefore, there's no need t=
o open the
> > > > > > > file to get an fd.
> > > > > > >
> > > > > > > These syscalls allow userspace to set filesystem inode attrib=
utes on
> > > > > > > special files. One of the usage examples is XFS quota project=
s.
> > > > > > >
> > > > > > > XFS has project quotas which could be attached to a directory=
. All
> > > > > > > new inodes in these directories inherit project ID set on par=
ent
> > > > > > > directory.
> > > > > > >
> > > > > > > The project is created from userspace by opening and calling
> > > > > > > FS_IOC_FSSETXATTR on each inode. This is not possible for spe=
cial
> > > > > > > files such as FIFO, SOCK, BLK etc. Therefore, some inodes are=
 left
> > > > > > > with empty project ID. Those inodes then are not shown in the=
 quota
> > > > > > > accounting but still exist in the directory. This is not crit=
ical but in
> > > > > > > the case when special files are created in the directory with=
 already
> > > > > > > existing project quota, these new inodes inherit extended att=
ributes.
> > > > > > > This creates a mix of special files with and without attribut=
es.
> > > > > > > Moreover, special files with attributes don't have a possibil=
ity to
> > > > > > > become clear or change the attributes. This, in turn, prevent=
s userspace
> > > > > > > from re-creating quota project on these existing files.
> > > > > > >
> > > > > > > Christian, if this get in some mergeable state, please don't =
merge it
> > > > > > > yet. Amir suggested these syscalls better to use updated stru=
ct fsxattr
> > > > > > > with masking from Pali Roh=C3=A1r patchset, so, let's see how=
 it goes.
> > > > > >
> > > > > > Andrey,
> > > > > >
> > > > > > To be honest I don't think it would be fair to delay your sysca=
lls more
> > > > > > than needed.
> > > > >
> > > > > I agree.
> > > > >
> > > > > > If Pali can follow through and post patches on top of your sysc=
alls for
> > > > > > next merge window that would be great, but otherwise, I think t=
he
> > > > > > minimum requirement is that the syscalls return EINVAL if fsx_p=
ad
> > > > > > is not zero. we can take it from there later.
> > > > >
> > > > > IMHO SYS_getfsxattrat is fine in this form.
> > > > >
> > > > > For SYS_setfsxattrat I think there are needed some modifications
> > > > > otherwise we would have problem again with backward compatibility=
 as
> > > > > is with ioctl if the syscall wants to be extended in future.
> > > > >
> > > > > I would suggest for following modifications for SYS_setfsxattrat:
> > > > >
> > > > > - return EINVAL if fsx_xflags contains some reserved or unsupport=
ed flag
> > > > >
> > > > > - add some flag to completely ignore fsx_extsize, fsx_projid, and
> > > > >   fsx_cowextsize fields, so SYS_setfsxattrat could be used just t=
o
> > > > >   change fsx_xflags, and so could be used without the preceding
> > > > >   SYS_getfsxattrat call.
> > > > >
> > > > > What do you think about it?
> > > >
> > > > I think all Andrey needs to do now is return -EINVAL if fsx_pad is =
not zero.
> > > >
> > > > You can use this later to extend for the semantics of flags/fields =
mask
> > > > and we can have a long discussion later on what this semantics shou=
ld be.
> > > >
> > > > Right?
> > > >
> > > > Amir.
> > >
> > > It is really enough?
> >
> > I don't know. Let's see...
> >
> > > All new extensions later would have to be added
> > > into fsx_pad fields, and currently unused bits in fsx_xflags would be
> > > unusable for extensions.
> >
> > I am working under the assumption that the first extension would be
> > to support fsx_xflags_mask and from there, you could add filesystem
> > flags support checks and then new flags. Am I wrong?
> >
> > Obviously, fsx_xflags_mask would be taken from fsx_pad space.
> > After that extension is implemented, calling SYS_setfsxattrat() with
> > a zero fsx_xflags_mask would be silly for programs that do not do
> > the legacy get+set.
> >
> > So when we introduce  fsx_xflags_mask, we could say that a value
> > of zero means that the mask is not being checked at all and unknown
> > flags in set syscall are ignored (a.k.a legacy ioctl behavior).
> >
> > Programs that actually want to try and set without get will have to set
> > a non zero fsx_xflags_mask to do something useful.
>
> Here we need to also solve the problem that without GET call we do not
> have valid values for fsx_extsize, fsx_projid, and fsx_cowextsize. So
> maybe we would need some flag in fsx_pad that fsx_extsize, fsx_projid,
> or fsx_cowextsize are ignored/masked.
>
> > I don't think this is great.
> > I would rather that the first version of syscalls will require the mask
> > and will always enforce filesystems supported flags.
>
> It is not great... But what about this? In a first step (part of this
> syscall patch series) would be just a check that fsx_pad is zero.
> Non-zero will return -EINVAL.
>
> In next changes would added fsx_filter bit field, which for each
> fsx_xflags and also for fsx_extsize, fsx_projid, and fsx_cowextsize
> fields would add a new bit flag which would say (when SET) that the
> particular thing has to be ignored.

1. I don't like the inverse mask. statx already has the stx_mask
    and stx_attributes_mask, so I rather stick to same semantics
    because some of those attributes are exposed via statx as well
2. fsx_*extsize already have a bit that says if that the particular
    attribute is valid or not, so setting a zero fsx_cowextsize with the
    flag FS_XFLAG_COWEXTSIZE has no effect in xfs:

        /*
         * Only set the extent size hint if we've already determined that t=
he
         * extent size hint should be set on the inode. If no extent size f=
lags
         * are set on the inode then unconditionally clear the extent size =
hint.
         */
        if (ip->i_diflags & (XFS_DIFLAG_EXTSIZE | XFS_DIFLAG_EXTSZINHERIT))
                ip->i_extsize =3D XFS_B_TO_FSB(mp, fa->fsx_extsize);
        else
                ip->i_extsize =3D 0;

        if (xfs_has_v3inodes(mp)) {
                if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
                        ip->i_cowextsize =3D XFS_B_TO_FSB(mp, fa->fsx_cowex=
tsize);
                else
                        ip->i_cowextsize =3D 0;
        }

I think we need to enforce this logic in fileattr_set_prepare()
and I think we need to add a flag FS_XFLAG_PROJID
that will be set in GET when fsx_projid !=3D 0 and similarly
required when setting fsx_projid !=3D 0.

Probably will need to add some backward compat glue for this
flag in GET ioctl to avoid breaking out of tree fs and fuse.

>
> So when fsx_pad is all-zeros then fsx_filter (first field in fsx_pad)
> would say that nothing in fsx_xflags, fsx_extsize, fsx_projid, and
> fsx_cowextsize is ignored, and hence behave like before.
>
> And when something in fsx_pad/fsx_filter is set then it says which
> fields are ignored/filtered-out.
>
> > If you can get those patches (on top of current series) posted and
> > reviewed in time for the next merge window, including consensus
> > on the actual semantics, that would be the best IMO.
>
> I think that this starting to be more complicated to rebase my patches
> in a way that they do not affect IOCTL path but implement it properly
> for new syscall path. It does not sounds like a trivial thing which I
> would finish in merge window time and having proper review and consensus
> on this.
>

Yes, it is better to separate the two efforts.

wrt erroring on unsupported SET flags, all fs other than xfs already
have some variant of fileattr_has_fsx(), so xfs is the only filesystem
that requires special care with the new syscalls.
It's easier to write a patch than it is to explain what I mean, so
I'll try to write a patch.

Thanks,
Amir.

