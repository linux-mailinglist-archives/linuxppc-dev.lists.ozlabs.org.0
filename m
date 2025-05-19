Return-Path: <linuxppc-dev+bounces-8666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF398ABBC93
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 13:37:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1Fyy2Ypsz2ySm;
	Mon, 19 May 2025 21:37:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747654634;
	cv=none; b=kLRyFa5P4fn267jUpvu82PTeFqCIMwzGXjetJk7SfZkIv/Nv0KkttrqK8kO4NqyKDIsGGx+lxrsn75NOaB7xNN5ZR1jmY75qiw0mTcXyxV7x8WeEHO9lk8FIfKAr8nMCZjioQvS9KnRVp/P1Fd3kRUU7d0F6pdTmEA5UfJqKKxT1iFjBiELTM7WJaOW7+Zn5MRzqxNKb4RNULJexQ0SxJPrdYfdHOAXdkU2/M8KtHj7bqUgNg2awV3zGhTbOsIZF6Pzmcq9Y32Bf8iLtZcsjt2TJ96xiacomykUP2/2Z+PJPJWm3m2hSRPseYL16+ZdN+9TjQ06u9P5Em584SMvutA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747654634; c=relaxed/relaxed;
	bh=DkYbc28ZqmxwTCsqpy3spmOraOHqionupf/htIjrysQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6Y3JzBjcF+LiD1tPZSmCls2CyjeOSGjgWxv7bJc6Q85LBlETEIPtB3nAyvemQjoRnP5A07MgAwLulVupsZDFnimuerzN7vur0ZwSvE3lwDiGOS3w69FtmSaTHzwe4hWT6XYGEECdMk9nhQg76uTBirstdNlL7+PP9+5ZfBSzTXl+qwGW9p3iQa58Ut4BG9GRD3ukF5AfYmSJ+FPDxCRtKiBZY2feLykVDKU29h+k+3We5Uj0ROxJuyB99L53Hv8UfHmP4k/Mr2+hv76rfRLlq0kQcLZB3ab+jIvfSEdy4/WZtbdrNtB4GxtPjcaVkj2WZaI9NMi/+UngfLJiD6BNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; dkim=pass (2048-bit key; unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1HyWZ2tj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=david@fromorbit.com; receiver=lists.ozlabs.org) smtp.mailfrom=fromorbit.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1HyWZ2tj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fromorbit.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=david@fromorbit.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1Fyw33MXz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 21:37:11 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-742af84818cso2037897b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 04:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1747654629; x=1748259429; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DkYbc28ZqmxwTCsqpy3spmOraOHqionupf/htIjrysQ=;
        b=1HyWZ2tjjeLb2UJMJLtQhmIpeSKn/kB+bPMjwOaq+Yn/y7L+NCNhdbWB6MGIAHcsMe
         EbBOAj5d/IDPipatxAQV7H59nKTSDBweM6l48s+V+l9q5Ac0Bd2cZI+o/KUQX9rgeNmz
         Yq/0tWejROv/Jbii5RG3TODlfZt+amauKLHVCcqlMnwfTbzQq7I/ExzZddSn+oaRH6ed
         JnqJAhGVN4cLbJ9Ylsb+Ccu1FtX2gjtrW1UhzZWvHzCOcTr53WgAKw4ksc0OT42nWNem
         6xVL6M3YH2kM7Uzlq9zkO4/6NJHlg9SO0RuXJQMhO6Y1DQEKcDffC5ZuO+M14mEkc4cI
         VVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654629; x=1748259429;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkYbc28ZqmxwTCsqpy3spmOraOHqionupf/htIjrysQ=;
        b=N9fhQrN+9uwuC8VlYpmdZsmMRuLXvengn4L84D57XwG1dCloimlomkReCj+/ggx4X6
         sO97v+p+aZYCuJYgTH2oETzbYe2AoUzjeRyzftMxla5WF4oiWbdFL0Z4iIbL3Zi0InUE
         rs16nkYHcruCJd5+r1E7R5JAb/vrvDTG1U8a/GfdHc2VekjZfN8MPEhkUqf5Klk4eZ32
         d2TYhjpQpwjZpI9kALhWrhsx6z+CB3VdmCqPXZ9w6+L9Edb/eqMWlVrkg146ITbbEwd+
         nKyjBcy8xFOTlv8xTf1ANFk2ulcqhWyp/95V9einMIPJ46/pvAPgyxvSS3QWHiGCEHKq
         /BBg==
X-Forwarded-Encrypted: i=1; AJvYcCXa6LndJUbYVWDo/uffh6/4vQKJ2tylQ88ZBJcFaF/ezpNp1dUtkaZU2C9k9wPGhAyFd0UKkdZqkfQkdzw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJFHMCvi4MNf7ZS4VzNgAEcPjUjkNsWCgCDfXm4RyNr7Y6C491
	lYljJ5xoCFVU2FklYmEKqG7MkuowHrE1JDqTfLSv0dPhl1Skp+vfSuZPqB5ttL+gVQQ=
X-Gm-Gg: ASbGncsTno4i4URdx0h8KMg+ujHyZKFdWHoMLWs5xBBlAHQrkl7u5X/m4nm6HnhlrfA
	aLt+zyHqJD+J7Jip/pjReajas0iT19K2cHwNMJXX4JRG+SPiMWciMF0gib6zMvNTqSEoReAzfw2
	bMUfCgHhGdSO1CnPQed2jLM01IVxt7ndPfCyoOy6vsvHpEbMUKotbKNrtDwHU0ueJYBNb5VFlyA
	wj/1cViwdm0QnlSm8eQfvUA9KE/u6A8m2MSARYnS4Xjr1xNZNSrbKqGf1c4OSYn0tqwtq2ZegR+
	MkgjVFErkvuX+/VdFiSPNIRQQ/NvWmjglPSeQhjJHWYQPXg97PAY932mIIsesUMPFgB124w37Jo
	rnIjJrnNpbRohF5sc39gnmnncBCU=
X-Google-Smtp-Source: AGHT+IEUy25uZy6yhylI082QEDzxGQ+0mJz25NQX6XuPMH4jpAhK+MU3tNtraGB6TKng6SdbDnt0Eg==
X-Received: by 2002:a05:6a00:3a20:b0:736:a6e0:e66d with SMTP id d2e1a72fcca58-742a97a6df2mr15123631b3a.6.1747654628667;
        Mon, 19 May 2025 04:37:08 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au. [49.180.184.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a973a2f8sm5957134b3a.81.2025.05.19.04.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:37:08 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1uGyno-00000005Si8-44qA;
	Mon, 19 May 2025 21:37:04 +1000
Date: Mon, 19 May 2025 21:37:04 +1000
From: Dave Chinner <david@fromorbit.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Andrey Albershteyn <aalbersh@redhat.com>,
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
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
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
Message-ID: <aCsX4LTpAnGfFjHg@dread.disaster.area>
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
 <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
 <20250515-bedarf-absagen-464773be3e72@brauner>
 <CAOQ4uxicuEkOas2UR4mqfus9Q2RAeKKYTwbE2XrkcE_zp8oScQ@mail.gmail.com>
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
In-Reply-To: <CAOQ4uxicuEkOas2UR4mqfus9Q2RAeKKYTwbE2XrkcE_zp8oScQ@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 15, 2025 at 12:33:31PM +0200, Amir Goldstein wrote:
> On Thu, May 15, 2025 at 11:02 AM Christian Brauner <brauner@kernel.org> wrote:
> >
> > On Tue, May 13, 2025 at 11:53:23AM +0200, Arnd Bergmann wrote:
> > > On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
> > >
> > > >
> > > >     long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> > > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > > >     long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> > > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > >
> > > I don't think we can have both the "struct fsxattr" from the uapi
> > > headers, and a variable size as an additional argument. I would
> > > still prefer not having the extensible structure at all and just
> >
> > We're not going to add new interfaces that are fixed size unless for the
> > very basic cases. I don't care if we're doing that somewhere else in the
> > kernel but we're not doing that for vfs apis.
> >
> > > use fsxattr, but if you want to make it extensible in this way,
> > > it should use a different structure (name). Otherwise adding
> > > fields after fsx_pad[] would break the ioctl interface.
> >
> > Would that really be a problem? Just along the syscall simply add
> > something like:
> >
> > diff --git a/fs/ioctl.c b/fs/ioctl.c
> > index c91fd2b46a77..d3943805c4be 100644
> > --- a/fs/ioctl.c
> > +++ b/fs/ioctl.c
> > @@ -868,12 +868,6 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
> >         case FS_IOC_SETFLAGS:
> >                 return ioctl_setflags(filp, argp);
> >
> > -       case FS_IOC_FSGETXATTR:
> > -               return ioctl_fsgetxattr(filp, argp);
> > -
> > -       case FS_IOC_FSSETXATTR:
> > -               return ioctl_fssetxattr(filp, argp);
> > -
> >         case FS_IOC_GETFSUUID:
> >                 return ioctl_getfsuuid(filp, argp);
> >
> > @@ -886,6 +880,20 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
> >                 break;
> >         }
> >
> > +       switch (_IOC_NR(cmd)) {
> > +       case _IOC_NR(FS_IOC_FSGETXATTR):
> > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FS_IOC_FSGETXATTR)))
> > +                       return SOMETHING_SOMETHING;
> > +               /* Only handle original size. */
> > +               return ioctl_fsgetxattr(filp, argp);
> > +
> > +       case _IOC_NR(FFS_IOC_FSSETXATTR):
> > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FFS_IOC_FSSETXATTR)))
> > +                       return SOMETHING_SOMETHING;
> > +               /* Only handle original size. */
> > +               return ioctl_fssetxattr(filp, argp);
> > +       }
> > +
> 
> I think what Arnd means is that we will not be able to change struct
> sfxattr in uapi
> going forward, because we are not going to deprecate the ioctls and

There's no need to deprecate anything to rev an ioctl API.  We have
had to solve this "changing struct size" problem previously in XFS
ioctls. See XFS_IOC_FSGEOMETRY and the older XFS_IOC_FSGEOMETRY_V4
and XFS_IOC_FSGEOMETRY_V1 versions of the API/ABI.

If we need to increase the structure size, we can rename the existing
ioctl and struct to fix the version in the API, then use the
original name for the new ioctl and structure definition.

The only thing we have to make sure of is that the old and new
structures have exactly the same overlapping structure. i.e.
extension must always be done by appending new varibles, they can't
be put in the middle of the structure.

This way applications being rebuild will pick up the new definition
automatically when the system asserts that it is suppored, whilst
existing binaries will always still be supported by the kernel.

If the application wants/needs to support all possible kernels, then
if XFS_IOC_FSGEOMETRY is not supported, call XFS_IOC_FSGEOMETRY_V4,
and if that fails (only on really old irix!) or you only need
something in that original subset, call XFS_IOC_FSGEOMETRY_V1 which
will always succeed....

> Should we will need to depart from this struct definition and we might
> as well do it for the initial release of the syscall rather than later on, e.g.:
> 
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -148,6 +148,17 @@ struct fsxattr {
>         unsigned char   fsx_pad[8];
>  };
> 
> +/*
> + * Variable size structure for file_[sg]et_attr().
> + */
> +struct fsx_fileattr {
> +       __u32           fsx_xflags;     /* xflags field value (get/set) */
> +       __u32           fsx_extsize;    /* extsize field value (get/set)*/
> +       __u32           fsx_nextents;   /* nextents field value (get)   */
> +       __u32           fsx_projid;     /* project identifier (get/set) */
> +       __u32           fsx_cowextsize; /* CoW extsize field value (get/set)*/
> +};
> +
> +#define FSXATTR_SIZE_VER0 20
> +#define FSXATTR_SIZE_LATEST FSXATTR_SIZE_VER0

If all the structures overlap the same, all that is needed in the
code is to define the structure size that should be copied in and
parsed. i.e:

	case FSXATTR..._V1:
		return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v1));
	case FSXATTR..._V2:
		return ioctl_fsxattr...(args, sizeof(fsx_fileattr_v2));
	case FSXATTR...:
		return ioctl_fsxattr...(args, sizeof(fsx_fileattr));

-Dave.
-- 
Dave Chinner
david@fromorbit.com

