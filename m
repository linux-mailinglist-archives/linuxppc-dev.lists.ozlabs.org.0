Return-Path: <linuxppc-dev+bounces-8827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB20ABF157
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:19:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2S7v5bSmz3c3W;
	Wed, 21 May 2025 20:19:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747822747;
	cv=none; b=itE+ouFAGLAK0k9LEbspj1kmoSE3SfJRAMZqvlTwt8kz1GKU5UkthX7RycPQhjgZgvDMA6kG0jq7Hsh/ucy1knLZ3JLFvc4IQp3ikJ6qT6cgdPgoCfpuuZ2DBx+gFY1WSRUKZyUB3YCmdCYiPYhy3aZ6C6qo01MlFPyOrgXnIfLvRE/OisxOgczYcU9Qu3h9rK+sJu1OONFE744g5vE9Jhm6oe89S5Ie+VCcUOumai98MRLk6q4ab/Td4q0PQlXaQXBeETOTLEP2Vm8nyBXRaIoR8DTY4tdlh4WB0MBkMtZyY1wORxdaRBDM+MifVJ+o56Mlj4b19t//vvnZ7w3M8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747822747; c=relaxed/relaxed;
	bh=V4vig+UBkOHWEC7q6eYysZp9vtHyxiu6x3tPs7w6Jt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=AKjWq5RuO/7V9M/eTq53r6QQYW/tnZNLMM3ke+JA42fkPkWmeSD4G1ocKQ0yFfw5E14kwDtuRAo+45WhTfbFquq8fb3RgDZns7xuunjlwWttdv47kGemuETpwIlce31xFZniYGrbBH9GVyesltaBIGe7B3g3ilabcYh4JicrP5dTr5eEpzyv6C60tj+vRYvAuJTvkaX7usbGugs7py5H5eTgAa5UH+L0sElDf1i65XGp61YMD5q4hteja3bE6bUCmbbvsOM/EnodbU8tRXJC69HfRoQ4PGQziH3kLgPcsTvhHk4DNwRlxVzUNnSDrX65ZMAF6rUxMv5J+KhsXbyUJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dHqay43f; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UzG1iCm0; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dHqay43f;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UzG1iCm0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2S7t2VnVz3c2F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:19:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747822741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4vig+UBkOHWEC7q6eYysZp9vtHyxiu6x3tPs7w6Jt8=;
	b=dHqay43fBS+0LXCPGrY2ZXXea1P5iXhc441aCw5jZAc4cTmylZXEcAHzepl1UMBlw3rua6
	YmSOXi8Jxxwjmi49/1h4OtkKUrRnoTKh2lryRaTIo+QU5d7+wl9uHOc3jqbI9I0Pz2CCum
	lJthqNAJUkMsGOIt/x1pSzoIxqZVVJI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747822742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V4vig+UBkOHWEC7q6eYysZp9vtHyxiu6x3tPs7w6Jt8=;
	b=UzG1iCm0LYKULORKlsGfp+PktCPDt7y5TotD8Wcp4+yVvGQiu93igaRmFsUQdjWHu/zOeN
	yDeJPWhxZ248+y4j6nZXEUrWNHBB5iLf5O5ZluOSQ6kXVJj9HFXCek+z2+cxmvg31rvi/L
	zktInOQktBVwEGXtRCBWL6vAmbwVnLc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-OhxjfkTzMVGzHYVtB34MpA-1; Wed, 21 May 2025 06:06:47 -0400
X-MC-Unique: OhxjfkTzMVGzHYVtB34MpA-1
X-Mimecast-MFC-AGG-ID: OhxjfkTzMVGzHYVtB34MpA_1747822006
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad55e9a80acso280817866b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 03:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822006; x=1748426806;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4vig+UBkOHWEC7q6eYysZp9vtHyxiu6x3tPs7w6Jt8=;
        b=xMUVfN0m+dhtGhPKDrQW832DVOXat5xFCHH/B80P6y74Ak0Taqnys99VMKmCQOuEsx
         O5+jZAzhk+3H8U3T4YMWhFYI9pqSBNQ9dTN/htr3ZU4r4IYE3FiwbfueWC1C6fVXYXm6
         GykYzAIt9QvnQeylxxheQbVm4oYAlYJgfv5m3IxCB5Vtpo51scWh48LD5pDt6p6PuJzk
         VFMVZN31McDuMMI/wMA1WMwF+yZyTJ6RsfFk8skZLKas0qXBDKy4LF+GWb5E6/Pk6pIi
         AWgag3bxCzhSJnWJTEadycJ/Z59PAsOwHXgDu9k5hFfsNMXOtRqLnnC6zwXC/aiCvpkK
         5zwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8DtaLz48gLiBynWcue2AZlc9LCDc3ZI/4O1trhFFM9Y4bgvWHUBb1p0xD3XsLJYgr0I8OVecXRexfl0M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwDWIFSXr70HHBupeDlCh22y5klyR7P8Ev6TvNmEP9qsD9FrqSf
	RAcIKQRgIbUCA4BjI10q4Kubt8QOldwS1FlJBeJnomb1sQikyYHocQRXd0gGBC6kecGGX/mD9Yn
	0kmFINKKUJ2cqqdQW8xsDPtTw2YMFisuN4KBxX35GKFAD+IsR7LawSlbYWt/HkWvNaw==
X-Gm-Gg: ASbGncs5VrWR9k89lGU5uyIeUWk3BJLHfAdLrv0cbkset99ph9+y1s/O4yh5QSegtMT
	ugqY+OdfhtwJ2Ov0NB0HfhYFiOqGDeWglcmmwJ2sdleEg17HDicAy2NOq5H/VzUCkvdVRUXYJTA
	gvoyXPDxvOusHYRo38PaW7weuKDlG32s6sZZy8YaMOjPP0cfZqWNkIVNT2zsM/ESKlkjemNLuDo
	B2xMH55P43z1PRIXDVx5F3cO7mgqWvcqE9eNSFkw28RdmtZDEzbPCMtJZJXuH94fUOSiwikM922
	HSUvQ0ykbytPepk6nVqZ2Tw=
X-Received: by 2002:a17:907:7f20:b0:ad2:1f65:8569 with SMTP id a640c23a62f3a-ad52d4cac82mr1768736466b.28.1747822005810;
        Wed, 21 May 2025 03:06:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrDhSRrFDtKo/q2kMry7jRxoxTndGDEB75ZiBniuUCDsbNGVDoC1oaveLmJXZWQWEiNaVF6A==
X-Received: by 2002:a17:907:7f20:b0:ad2:1f65:8569 with SMTP id a640c23a62f3a-ad52d4cac82mr1768728666b.28.1747822005178;
        Wed, 21 May 2025 03:06:45 -0700 (PDT)
Received: from thinky ([2a0e:fd87:a051:1:d224:1f1f:6cfc:763a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278adcsm868243066b.84.2025.05.21.03.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 03:06:44 -0700 (PDT)
Date: Wed, 21 May 2025 12:06:32 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>, pali@kernel.org
Cc: Dave Chinner <david@fromorbit.com>, 
	Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
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
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Tyler Hicks <code@tyhicks.com>, Miklos Szeredi <miklos@szeredi.hu>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, selinux@vger.kernel.org, ecryptfs@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr
 syscalls
Message-ID: <mw2d36mqwzqoveguw5vlggrnw2wirsbhdxkox33z3fg7k6huz6@hj4ntgg3oj7p>
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
 <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
 <20250515-bedarf-absagen-464773be3e72@brauner>
 <CAOQ4uxicuEkOas2UR4mqfus9Q2RAeKKYTwbE2XrkcE_zp8oScQ@mail.gmail.com>
 <aCsX4LTpAnGfFjHg@dread.disaster.area>
 <sfmrojifgnrpeilqxtixyqrdjj5uvvpbvirxmlju5yce7z72vi@ondnx7qbie4y>
 <CAOQ4uxiM+BBNODHfxu=v3XN2ezA-0k54qC5R4qdELbZW+W-xkg@mail.gmail.com>
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
In-Reply-To: <CAOQ4uxiM+BBNODHfxu=v3XN2ezA-0k54qC5R4qdELbZW+W-xkg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kJ3ZwNcY6Nf8HcrC2jNmWfLDD2poZcYt9BXCYor1Xtk_1747822006
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-05-21 11:36:31, Amir Goldstein wrote:
> On Wed, May 21, 2025 at 10:48 AM Andrey Albershteyn <aalbersh@redhat.com> wrote:
> >
> > On 2025-05-19 21:37:04, Dave Chinner wrote:
> > > On Thu, May 15, 2025 at 12:33:31PM +0200, Amir Goldstein wrote:
> > > > On Thu, May 15, 2025 at 11:02 AM Christian Brauner <brauner@kernel.org> wrote:
> > > > >
> > > > > On Tue, May 13, 2025 at 11:53:23AM +0200, Arnd Bergmann wrote:
> > > > > > On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
> > > > > >
> > > > > > >
> > > > > > >     long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> > > > > > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > > > > > >     long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> > > > > > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > > > > >
> > > > > > I don't think we can have both the "struct fsxattr" from the uapi
> > > > > > headers, and a variable size as an additional argument. I would
> > > > > > still prefer not having the extensible structure at all and just
> > > > >
> > > > > We're not going to add new interfaces that are fixed size unless for the
> > > > > very basic cases. I don't care if we're doing that somewhere else in the
> > > > > kernel but we're not doing that for vfs apis.
> > > > >
> > > > > > use fsxattr, but if you want to make it extensible in this way,
> > > > > > it should use a different structure (name). Otherwise adding
> > > > > > fields after fsx_pad[] would break the ioctl interface.
> > > > >
> > > > > Would that really be a problem? Just along the syscall simply add
> > > > > something like:
> > > > >
> > > > > diff --git a/fs/ioctl.c b/fs/ioctl.c
> > > > > index c91fd2b46a77..d3943805c4be 100644
> > > > > --- a/fs/ioctl.c
> > > > > +++ b/fs/ioctl.c
> > > > > @@ -868,12 +868,6 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
> > > > >         case FS_IOC_SETFLAGS:
> > > > >                 return ioctl_setflags(filp, argp);
> > > > >
> > > > > -       case FS_IOC_FSGETXATTR:
> > > > > -               return ioctl_fsgetxattr(filp, argp);
> > > > > -
> > > > > -       case FS_IOC_FSSETXATTR:
> > > > > -               return ioctl_fssetxattr(filp, argp);
> > > > > -
> > > > >         case FS_IOC_GETFSUUID:
> > > > >                 return ioctl_getfsuuid(filp, argp);
> > > > >
> > > > > @@ -886,6 +880,20 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
> > > > >                 break;
> > > > >         }
> > > > >
> > > > > +       switch (_IOC_NR(cmd)) {
> > > > > +       case _IOC_NR(FS_IOC_FSGETXATTR):
> > > > > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FS_IOC_FSGETXATTR)))
> > > > > +                       return SOMETHING_SOMETHING;
> > > > > +               /* Only handle original size. */
> > > > > +               return ioctl_fsgetxattr(filp, argp);
> > > > > +
> > > > > +       case _IOC_NR(FFS_IOC_FSSETXATTR):
> > > > > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FFS_IOC_FSSETXATTR)))
> > > > > +                       return SOMETHING_SOMETHING;
> > > > > +               /* Only handle original size. */
> > > > > +               return ioctl_fssetxattr(filp, argp);
> > > > > +       }
> > > > > +
> > > >
> > > > I think what Arnd means is that we will not be able to change struct
> > > > sfxattr in uapi
> > > > going forward, because we are not going to deprecate the ioctls and
> > >
> > > There's no need to deprecate anything to rev an ioctl API.  We have
> > > had to solve this "changing struct size" problem previously in XFS
> > > ioctls. See XFS_IOC_FSGEOMETRY and the older XFS_IOC_FSGEOMETRY_V4
> > > and XFS_IOC_FSGEOMETRY_V1 versions of the API/ABI.
> > >
> > > If we need to increase the structure size, we can rename the existing
> > > ioctl and struct to fix the version in the API, then use the
> > > original name for the new ioctl and structure definition.
> > >
> > > The only thing we have to make sure of is that the old and new
> > > structures have exactly the same overlapping structure. i.e.
> > > extension must always be done by appending new varibles, they can't
> > > be put in the middle of the structure.
> > >
> > > This way applications being rebuild will pick up the new definition
> > > automatically when the system asserts that it is suppored, whilst
> > > existing binaries will always still be supported by the kernel.
> > >
> > > If the application wants/needs to support all possible kernels, then
> > > if XFS_IOC_FSGEOMETRY is not supported, call XFS_IOC_FSGEOMETRY_V4,
> > > and if that fails (only on really old irix!) or you only need
> > > something in that original subset, call XFS_IOC_FSGEOMETRY_V1 which
> > > will always succeed....
> > >
> > > > Should we will need to depart from this struct definition and we might
> > > > as well do it for the initial release of the syscall rather than later on, e.g.:
> > > >
> > > > --- a/include/uapi/linux/fs.h
> > > > +++ b/include/uapi/linux/fs.h
> > > > @@ -148,6 +148,17 @@ struct fsxattr {
> > > >         unsigned char   fsx_pad[8];
> > > >  };
> > > >
> > > > +/*
> > > > + * Variable size structure for file_[sg]et_attr().
> > > > + */
> > > > +struct fsx_fileattr {
> > > > +       __u32           fsx_xflags;     /* xflags field value (get/set) */
> > > > +       __u32           fsx_extsize;    /* extsize field value (get/set)*/
> > > > +       __u32           fsx_nextents;   /* nextents field value (get)   */
> > > > +       __u32           fsx_projid;     /* project identifier (get/set) */
> > > > +       __u32           fsx_cowextsize; /* CoW extsize field value (get/set)*/
> > > > +};
> > > > +
> > > > +#define FSXATTR_SIZE_VER0 20
> > > > +#define FSXATTR_SIZE_LATEST FSXATTR_SIZE_VER0
> > >
> > > If all the structures overlap the same, all that is needed in the
> > > code is to define the structure size that should be copied in and
> > > parsed. i.e:
> > >
> > >       case FSXATTR..._V1:
> > >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v1));
> > >       case FSXATTR..._V2:
> > >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v2));
> > >       case FSXATTR...:
> > >               return ioctl_fsxattr...(args, sizeof(fsx_fileattr));
> > >
> > > -Dave.
> > > --
> > > Dave Chinner
> > > david@fromorbit.com
> > >
> >
> > So, looks like there's at least two solutions to this concern.
> > Considering also that we have a bit of space in fsxattr,
> > 'fsx_pad[8]', I think it's fine to stick with the current fsxattr
> > for now.
> 
> Not sure which two solutions you are referring to.

Suggested by Christian and Dave

> 
> I proposed fsx_fileattr as what I think is the path of least resistance.
> There are opinions that we may be able to avoid defining
> this struct, but I don't think there was any objection to adding it.
> 
> So unless I am missing an objection that I did not understand
> define it and get over this hurdle?

I see, sure, I misinterpreted the communication :) no problems, I
will create 'struct fsx_fileattr' then.

Pali, ah sorry, I forgot that you will extend fsxattr right away

-- 
- Andrey


