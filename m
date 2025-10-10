Return-Path: <linuxppc-dev+bounces-12763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 027EABCB986
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Oct 2025 06:07:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjY9s4nfJz2xQ0;
	Fri, 10 Oct 2025 15:07:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760069265;
	cv=none; b=Kya/J14cmTaYvNB9LP8xM8TdhIKQHhef9n+su+nK8rtE2RLFIZvFz/QEuLVRm43H8rYUNHwnJTeV8tA3PH5nRDQo9KHV+PV0YVSkg5VD8hK+YjToJyBSQU1cFj/naFw45+f3P+E3ABjt18c3PHSxrcpJL8fi4DqPecjtppv4HISLQfSgfwOsJ3uE/8F0LJIQabTodYk6hYFRVipJEDOFoq7BkluF+yKfnOVvbuzEwLkVrIackpR1gGxk+XB7ZqwqPSYsWKaEfLARlMjGSoyAZBevYUdm/rK6wsoO9EOZvNTUeSCkwSxfccC1gu5dt04oZ7m37jyBQRsb/b0E2DMG1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760069265; c=relaxed/relaxed;
	bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5eyi12bFXl+QtIDs+tO1rpGfcH3JE2AGXuC7Ec4FITypH0pTLs264M7HnJlxVOd6YgBJAD2OaawnlpjQFmtwgL2Rt3Ap7+gkcimaCowa2ukfJiwPaJTGAN26Ea0yxa9OEZPWjjMxMIoG05TQ1x06wsBFXW+zXhJZSFbL8iBCdFWl171mnJxS7jy/yyBU4xEqACK902k3CVHehq/tz4KXI8QWmDactt82DtUz+6Yd2p4isoAQ0KaiVJ4bazcXdSZXL/XPPP/nqHM2eZJ7h1UXdldE9IpbmjddgSqMuhCrzNq81N6YQ78yN6Cc05ttQnHjki44B46xhbxJyuOJmSr0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LI0m8z3A; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LI0m8z3A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cjY9q6dhdz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 15:07:42 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-780fe73cb41so9417817b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Oct 2025 21:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069260; x=1760674060; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
        b=LI0m8z3ADfaVHaErlWddi4NRCpanK1N5NRXlVX2ujI1OQNjD4t3BZcusrvOucqq6TX
         aJIsTDbNBHIwv2RazdMvHFVyb5rjZSZtaoM4ZPSK6g/FAo2mab6+3DLzLg53WOnEserj
         AOL8PhNLxI9Fod5eUBSR8U7K5gjVeeX1Fmk0Rnsb4C0ze2j9qtQWjmpYyPF43cDUfNXs
         lDCZPgrSQc9RcDIHFmh6W4XcxH1HCpSQDeoNlCSNnvO3mVPRyWHAKdx7tYc63iQqpUlS
         zRceIdoEaGR1FEj6hD7hSSoySL4/KgNIDUN8FemtVEvreqQKsn0giwNfYFdylE3+K499
         2y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069260; x=1760674060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
        b=YktlEbj+wPVyCMlfQXbQ54+sf+6FJ1Djf2H+qP8NKQnSkhBtVMN6XEGXX0N/B8OqTF
         jD7sO9o4xWJFyk+BRoLqoI23TGvIpOa6VqD34r3BapPuJJEUvat120uARwzDrgd4VV9K
         QfE7U2UGPaoU3flYlhc8IpDx4F/kkLuZS5fsWmdm5ba52dXpxphwlSUH8E4fzeAYcfsA
         efweU/V4IpZM5RfC6yfDPAoFJ8brS1smGVXe+HCj8QkWiI6uwO6KHxd3m+EPrSb/qqKw
         qEESlo2+e+oIWrcMaYVCFT0clwkrdzXXge7XVJGw2kdURNAKdtEZE4Dtl0ttT3/Tz0AY
         Nk7w==
X-Forwarded-Encrypted: i=1; AJvYcCW6glA+iCmlbIGHB4BH2ueeXXLpymM9XdOW1wlQnOnPsrLzIYetY8qi8pO/vdplP+vwA48DUeYQk0fSfqE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyU9soYwEAN+GZuI2ZtUbfXbCpPVc8wH5qgE2AIx88DgRZ9Hdm3
	GNFg38PwlD7y8kGLTdNB9llq5tmtJuSsH+7HXY4IryxCakZso2NXdV8PlbLZ9a3Vtu1lFUoDczC
	HJE1wfK9/4AqGnZQ/Vi6G4Hl5UBh/t9I=
X-Gm-Gg: ASbGncu1RkHP9oZjINCJyCztAYgjJqvtcvuIs0DntVY2kYHlqR8rBvFG0AkBiF0Z7gl
	IowqPvVIyZTihfg+yk448UGPOrGI4Wn+Dn41YXBl9Pb15EA8UoFCGO6Hc6m/9DG2h11qazVUEq6
	xAolPs88LL5uCEwXHLTZu+XV8zwJn79LcTFPCUyFLT7x6YbqmIakjZRmqrwXFkvYJo6qi2bUAEZ
	mflRJu593EsHbuBq8XsD8m9jQ==
X-Google-Smtp-Source: AGHT+IFQERg8mTh7nax6OaWavJ8DgllCOHm5p0zLQR54uFFNlwqM0wGCA+Q/Rj/bdvDMe/rRbnhyAA7hAcefbtq0UHo=
X-Received: by 2002:a53:ca49:0:b0:633:a883:3d1b with SMTP id
 956f58d0204a3-63ccb87491emr6995599d50.6.1760069259733; Thu, 09 Oct 2025
 21:07:39 -0700 (PDT)
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
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-29-safinaskar@gmail.com>
 <20250916030903.GA3598798-robh@kernel.org>
In-Reply-To: <20250916030903.GA3598798-robh@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:07:02 +0300
X-Gm-Features: AS18NWBct1j-7S8OHD6pljCYd2aEZxR7vcCRPjZz3T1pRcQcUgdDoCBWxEfbyM8
Message-ID: <CAPnZJGAvQirGTJTiTxumn8sAJ5KYDv8+MUTBmEW2fYX+r2RE3Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um, x86,
 xtensa: rename initrd_{start,end} to virt_external_initramfs_{start,end}
To: Rob Herring <robh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 16, 2025 at 6:09=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
> There's not really any point in listing every arch in the subject.

Ok, I will fix this.


--=20
Askar Safin

