Return-Path: <linuxppc-dev+bounces-12354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0403EB8145C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 20:00:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRmlm5Ksdz2ymg;
	Thu, 18 Sep 2025 04:00:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758132052;
	cv=none; b=A8/mgv1JnSPbr2DaHUrFfdE9AENozL/rrhyj4+YyBiAHvV3NhRCYobPoarYRlx9UJyjJsWF9ZHZh0LCZM/L3tQvqFJOPI4WN8zk98C1bd3i8wfGlsEKu9Mt6vV0oPJfJFW5RCzay8pbqRBCuo8Cz7Tz0aCj5oFDOFdZZZ/pBdVHkKigeI+vlamleZk4MT6+6nurfGjB35XdszGiMZrp4mGSSli8rsBoBv0Gtr1/u3Xfn1KQimwohnvAVnaye4AXDspvDVRtTTguJ35dDn7oB2px6hFXlbZ4EvavZ2dOAcCrxyHjoKH3AcrE3BaXfoYd6EkoB8OwOuLtQB586logsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758132052; c=relaxed/relaxed;
	bh=0Pv4dFUExNQfPloEDat7jfEF9BkjeLOy7zrinjdnc80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tjm1CKnNHMA5+WDkf2xw1AkLgP8t3WiHMz2HPeNnUmWwWWCWG5P/e1dXMsKetuN3q1mMo2aoTwXbVt/sTSFJHpfrc2FmvHBIBsbXREC6CAdZONDe5SHek1g5YDR/i3Dsw1+iXpZZvChtsZ7z2SChxKA5UtygTt2+EanYmDVnsy+jLL2N2p5epHF70EWzWc91Zp7f+5tW+UT/xAnkhISZwfnEN2HY0sO0n0QNJmj12lcaOFXKMOZB3ROdru6IXsSkGp5LaLf1BZJKyk18czRxZxBL5Y0uoA49LzJz/gPEXoTnm9qmchJCHxjMulWQY1whuwWNzkbVuuOwaKyHNQka1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amacapital.net; dkim=pass (2048-bit key; unprotected) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=iGBC5C0K; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=luto@amacapital.net; receiver=lists.ozlabs.org) smtp.mailfrom=amacapital.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=iGBC5C0K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amacapital.net (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=luto@amacapital.net; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRmlk4J4Dz2yMh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 04:00:49 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-578a8bd4bd2so83241e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 11:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1758132044; x=1758736844; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Pv4dFUExNQfPloEDat7jfEF9BkjeLOy7zrinjdnc80=;
        b=iGBC5C0K3CvC7ZQdsG0QjsdbrZYhsOQf+o0kG9hU8hO9Q0ilWVmVaCgsqauDWbX13y
         MAoDkGk3hpwwnggouoXdA2QGFGLIMYVtfYevmgKlhKkS5DVtlgS80B9sKYBSCSiQkBnn
         /SL9U75uPqhg+ZoYqwhWJu9dT90D6Unm3asTZxEiNvUZdGGHE1rMPxD3i3m21OwVOTYe
         tn3SqitNgwLcOhLyzo8facmmgDrHGqMp2bIM8v1xzpDuzXWTW2ZP50J8FVtpahNXLx3U
         TI2A+FC49MDo/hH6qzqapInOvbysQncUN8RtD2B8UR8DcTKk4E8SnAE3LXg3cWreozl8
         gyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758132044; x=1758736844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Pv4dFUExNQfPloEDat7jfEF9BkjeLOy7zrinjdnc80=;
        b=ARyrD4N5IKj7qKKH/RubRV9VFTf720a8IKrBjrhZ1cs4cBNs6S0f107ORA8HOI2hbj
         zM6oaRSHLmuNQOm/HOEeZw6tFvpyI/e8axBMix/AN5vGqH1ItaRzXxfs0rbs9KEKL+Bq
         thOT0ZqOjUXv0/0TTw5dW1OiwpuJc2lLVuDR1rUiYvEKyvCy+YMQQISNxLagpF/xaMcq
         GgqRks/oSMAJeK4kWMUoiKhhwiXmeSLl2cVNhnfB6GoTwOJ1C3EvMiTEVBGrq0DlHbF9
         4xjxVB2JdCV+me+WpuD1+51/EKXadVNzVBm8qkemGZEtWQJgwxcsfyJ4MIbBYYybL26n
         ULog==
X-Forwarded-Encrypted: i=1; AJvYcCVUCC5+Vxqv4BubFrQe7srRxijREqb9MOGHREXl/q6060/Q3ZdTGATpWWhrZQ1GhFcJH07jMWjOgC+1wEY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxwsIcfSp4t0ymphvYNAaljkcsqNGeREzEymA0/0Ezu6uW05zDZ
	chsR1Ybcd1pyKkzIIWQQnQz+kDn1ZPWhEAx3GXOuUzU0tlwCCjDuAU7UrHg/TEckga2UE6E8Zm6
	vJHpytESzGGzINy68o94ZtwkJPTcrjxrRJFWZLyAe
X-Gm-Gg: ASbGncvY5z25WgsMdHDrfWiHsL943nX2wo5WXjox66GO2FI3ksGFcO7V0nc9byCUuCM
	U2CXYUHppPad4oYNHyyLFX6Wc930GK8hQOIbB58CLjacEILyBJz9ASTguDjn1/zdyTRye2PxOSg
	cTIJbofDvikpR716WGoOBVnKW4E7GxHhORSCMGJ5sHVs4+0r6lqFcGXMgJGiCHrAQs72AWO1cfW
	sWtoQ==
X-Google-Smtp-Source: AGHT+IGI+xF2OSgRbI6+fabXiqu9Xwuf5bxWYwnja/rNGOUuSmNzhH42MNUAKuR34Ox7ov8nmiujA9clDhMS84oRbmU=
X-Received: by 2002:ac2:4e09:0:b0:576:d217:3f2f with SMTP id
 2adb3069b0e04-57796b5e819mr1028160e87.3.1758132043747; Wed, 17 Sep 2025
 11:00:43 -0700 (PDT)
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
References: <20250912223937.3735076-1-safinaskar@zohomail.com> <0342fbda-9901-4293-afa7-ba6085eb1688@landley.net>
In-Reply-To: <0342fbda-9901-4293-afa7-ba6085eb1688@landley.net>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 17 Sep 2025 11:00:32 -0700
X-Gm-Features: AS18NWAGwakGZ9zjxjq7MnfN8O7ZgOJb6fmKIJ0JIML7P3j0NnlDZ27eNb5S7Es
Message-ID: <CALCETrXHxOkHoS+0zhvc4cfpZqJ0wpfQUDnXW-A-qyQkqur-DQ@mail.gmail.com>
Subject: Re: [PATCH 00/62] initrd: remove classic initrd support
To: Rob Landley <rob@landley.net>
Cc: Askar Safin <safinaskar@zohomail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
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
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 15, 2025 at 10:09=E2=80=AFAM Rob Landley <rob@landley.net> wrot=
e:

> While you're at it, could you fix static/builtin initramfs so PID 1 has
> a valid stdin/stdout/stderr?
>
> A static initramfs won't create /dev/console if the embedded initramfs
> image doesn't contain it, which a non-root build can't mknod, so the
> kernel plumbing won't see it dev in the directory we point it at unless
> we build with root access.

I have no current insight as to whether there's a kernel issue here,
but why are you trying to put actual device nodes in an actual
filesystem as part of a build process?  It's extremely straightforward
to emit devices nodes in cpio format, and IMO it's far *more*
straightforward to do that than to make a whole directory, try to get
all the modes right, and cpio it up.

I wrote an absolutely trivial tool for this several years ago:

https://github.com/amluto/virtme/blob/master/virtme/cpiowriter.py

it would be barely more complicated to strip the trailer off an cpio
file from some other source, add some device nodes, and stick the
trailer back on.  But it's also really, really, really easy to emit an
entire, functioning cpio-formatted initramfs from plain user code with
no filesystem manipulation at all.  This also makes that portion of
the build reproducible, which is worth quite a bit IMO.

--Andy

