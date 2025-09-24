Return-Path: <linuxppc-dev+bounces-12561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC38B9B184
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Sep 2025 19:41:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cX40h2Rhfz2yxN;
	Thu, 25 Sep 2025 03:41:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::835"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758730692;
	cv=none; b=Me+NaJzQKREtL+tmhkVAt7qpbMEgZlOBjOAzXm9Aj+nL8sx/OknGheT2vzXlnkE4afp6mkY+n5r7roBFfhVKY7PfC5vO86fu9uMl6u5jDLvULGCF1iPIEw6poh5VA+QqnW++dnqm2qRlnYmS+VdCxTy/WZzCJYZ7UdKLgg0YreZRcvwuvTzb5Z607yWLuWrrXi8BzQUS1Gd+96A9HOr06/bqORB+wCbqS/VN/Q2zeyM4GKBRx/XG4MnH9Kin8JG5z9xGVFJ56jTD6XL3E5WWfjvH8HmzLmNBBFD0mCBi+AKCUfoYP4C7SjZLIk0BGyWsyKuQqVkS3ec0JkEm2yCXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758730692; c=relaxed/relaxed;
	bh=+elp/mgEwQHUPO2/veHl6cFeD7QMzkxV3mT27B/vMe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFHIMjKY1KnnILEJEza5rSSRcpQ2FVDIdu5+Vyt5BSxZDJhMm+fu8N3IKNUZxOVTIYW28AvMKupxF0/kCJox1U8c+UTOeglyebkoPRjuuSHFDoXQ/Y1NOmNyC0EIYPkVPBDvwPvILSGGuK8Mv4YyuCwXrW4zQDJzachy8CruwgpIBBcDq6ZiN5ItKhISbTCZv52BNO9h9OMxwLKheSeC/VT4GyMkae5Rq28OdYNXKTfJGVF3RpxZBNzDAMv0YqOjcXeY6YJ5QQMi01dFGRkRpqox5IzAUkbOjeGn6rSsYgIJyEKxIKFVcQ7uUjL2M0wI3G0eH4CDTmh80dBjrxlVxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mTilfjwn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=patrakov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mTilfjwn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=patrakov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cX2830nlBz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 02:18:09 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4d41154079aso213231cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 09:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758730686; x=1759335486; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+elp/mgEwQHUPO2/veHl6cFeD7QMzkxV3mT27B/vMe0=;
        b=mTilfjwnXHeZnK5S4pTz2uA8jWX22YR5zQpBCiTaJz25GvORRT7+mO1ZwEouDT8nrU
         018Fb8+jOFFkB5GiA00QmXwprWu1IedMX/pwtfe69JWYoTrQLTF9rfUgJI6tRI2LpYbd
         bcmIU1doIOVN12nZ6idrsLx7s9TBq7u11txvvNpFYd/5PqopgYYxXlHKUZuIqPyQ7tU2
         mM0H6SMia7M6abeEb6rkGWmztDQFALhSby6yMmscluISvfOYlNsElSPlKD6K1tRm9Yp4
         Exxe9b3kroiqMOOSKKoKkvPri+SWPwRWrfjXHDuMpCxit9Hwoe8qaavpZgr8ORCFPuur
         JaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758730686; x=1759335486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+elp/mgEwQHUPO2/veHl6cFeD7QMzkxV3mT27B/vMe0=;
        b=lVF3IMfqkvRLfg5ZIKI7+KOI4bMd3CMD56FLquNdxA2gYUhoHnS8TWuED7VlsH4lDV
         OrP5WyvVu2DpC4iSWrrA/vNn5WifUI5tvvvAY4FBdOF/VscCR/t15JHZlyBkVu7Hvr7v
         TVIA56m2+VmcuDdwZe98Z/8aZWicc/RtzUMyQgKAtEZmepZp6n5+wusImr7JB06jWZg7
         24/zQh/41N/bEMp+04rdOJJwBiIIwkY0/QBjToUJTORP85fbKJ3OryG8LDhxrQIAF5LM
         IEdM079zmsPwiDsxlMPrDGpvvr9UUed19NAZ1rHV+iV8uVXeecX5EqnrmEHpansWklBP
         DoNw==
X-Forwarded-Encrypted: i=1; AJvYcCVZdFIXY3JY3gQQVkPXrezofrOQ+9pyBIl+raO9id1vJHw/Z/pHGfuUDb/IUdb03YBTpe4+jOBMYHjQNA4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6THApH3UGMnOj5UFtPe2/je2YUaL6ysBrqXdjKf6ePzaMh2XA
	4uMPcZJ6Pc5xw9V43Qo2qUBWb9crkbXwjhofHNuxvSLUbvVi+xCT6wx3im/DGweWVMGdwP8G4tR
	uOqyGqgafkEroCrAH6PhFKcqsNbTnWX8=
X-Gm-Gg: ASbGncvkUWwJciPELAXRLL0+zy9Hjt4LSPYzfsTG1Llmg7uSxYyMLQ9EpDk/6eYNh4N
	0sZvJ6nt6PTnVZeW5dN1O4Kk8M9Ta4uLtHAVkRzUBhrfArcry/vEu0+d7re2LSIzuTNTqWwkJCD
	2kRyFZf3bdW45rZeyHOdhvajA8/ptufWHExhIIVrYh61eQpRSg75kt5IVLuTVVloEKItSBFRHa2
	TO39JzPuRQdBgoZ+IxD8JHDyZVfJrtJzw/fXEBl
X-Google-Smtp-Source: AGHT+IHrjx0XfB3NQHdqBt66Ox1dwY4oj3I0wMxztSwqqFAAkQnhEkK0QBLdnresO+RuCvDJitimjmBRn2YZHsgZxpk=
X-Received: by 2002:a05:622a:3d2:b0:4d9:ea03:74f8 with SMTP id
 d75a77b69052e-4da473535b8mr6186491cf.16.1758730685377; Wed, 24 Sep 2025
 09:18:05 -0700 (PDT)
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
References: <20250913003842.41944-1-safinaskar@gmail.com> <ffbf1a04-047d-4787-ac1e-f5362e1ca600@csgroup.eu>
In-Reply-To: <ffbf1a04-047d-4787-ac1e-f5362e1ca600@csgroup.eu>
From: Alexander Patrakov <patrakov@gmail.com>
Date: Thu, 25 Sep 2025 00:17:39 +0800
X-Gm-Features: AS18NWB-xeGoRDKYPj3kUYXUnKXLhFMFvvc0QyoLpOeKcP1DsD-enKeBhlulfsI
Message-ID: <CAN_LGv3Opj9RW0atfXODy-Epn++5mt_DLEi-ewxR9Me5x46Bkg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Askar Safin <safinaskar@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 23, 2025 at 8:22=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 13/09/2025 =C3=A0 02:37, Askar Safin a =C3=A9crit :
> > [Vous ne recevez pas souvent de courriers de safinaskar@gmail.com. D=C3=
=A9couvrez pourquoi ceci est important =C3=A0 https://aka.ms/LearnAboutSend=
erIdentification ]
> >
> > Intro
> > =3D=3D=3D=3D
> > This patchset removes classic initrd (initial RAM disk) support,
> > which was deprecated in 2020.
> > Initramfs still stays, and RAM disk itself (brd) still stays, too.
> > init/do_mounts* and init/*initramfs* are listed in VFS entry in
> > MAINTAINERS, so I think this patchset should go through VFS tree.
> > This patchset touchs every subdirectory in arch/, so I tested it
> > on 8 (!!!) archs in Qemu (see details below).
> > Warning: this patchset renames CONFIG_BLK_DEV_INITRD (!!!) to CONFIG_IN=
ITRAMFS
> > and CONFIG_RD_* to CONFIG_INITRAMFS_DECOMPRESS_* (for example,
> > CONFIG_RD_GZIP to CONFIG_INITRAMFS_DECOMPRESS_GZIP).
> > If you still use initrd, see below for workaround.
>
> Apologise if my question looks stupid, but I'm using QEMU for various
> tests, and the way QEMU is started is something like:
>
> qemu-system-ppc -kernel ./vmlinux -cpu g4 -M mac99 -initrd
> ./qemu/rootfs.cpio.gz
>
> I was therefore expecting (and fearing) it to fail with your series
> applied, but surprisingly it still works.
>
> Therefore is it really initrd you are removing or just some corner case
> ? If it is really initrd, then how does QEMU still work with that
> -initrd parameter ?

The QEMU -initrd parameter is a misnomer. It can be used to pass an
initrd or an initramfs, and the kernel automatically figures out what
it is. What you are passing is an initramfs (a gzipped cpio archive
with all the files), which is a modern and supported use case.

--=20
Alexander Patrakov

