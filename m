Return-Path: <linuxppc-dev+bounces-12764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C17F3BCB9C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Oct 2025 06:09:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjYD63g27z2xgQ;
	Fri, 10 Oct 2025 15:09:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760069382;
	cv=none; b=Mw7AEkVmuc+DW8gv0FVe/wJ0xcNYi9ei8o00xO0HOWQbvxovQ+1A95mGHj7js8fzFcLuoVVW/x/Bty4EH1fpCJP9+8aUDTWjJjo5lW+4XbWozMfMDa27EOa2qzSwatX5Tq7P1m7KFfpOJ9a/JLfu6GXlJv32uY/xzWnzk2DBDe2XdTCFj56yYJSt8AztODlx0um6B6V+S0qO0sD0OMvqNvjY28rkamBCzFprqnhKTznovwNh5/FuT6qGwrqxfWERSEAcDO/av1q1bJNl9u3qG4voVEi2Qz68D5iVsY2ns0HhQGbj8kUNckTTZNTvtMU5H/py/maAO9lO/qRg7AmjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760069382; c=relaxed/relaxed;
	bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNMQL9DL312ZL84icmX4iULNqjJPkVu/I+EuNZ842F5Y4MetUjAvrxRihGtOHG1nSLqv/O4BuOqvTao8ZWd6t6vq5NzIRI3gLVZuvG++GlbWYCQwMr/DnUg7y/R8cAb6Om0lRlhKJ1G//7bL6tz5xGcG5i7/5FC3CpKKld9yMwDTe4VkPz/m92gJA08NVSs2762s4UBoSr0/21f/iVWQ00excVqkjTPo/kuWTp8+EiCcE3PdCXkaeFbj6ByXhQNjIhAkqhHnG2BWvh71zvTcyZJa2cHoU//c6aejw79NQQKH7SCFuA53OWCrB4mia3ntlsmfWxJsVLx7qWSH28VuYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UMwiZk3x; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UMwiZk3x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cjYD54qSbz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 15:09:41 +1100 (AEDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-77f947312a5so15835897b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Oct 2025 21:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069379; x=1760674179; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=UMwiZk3xOg3HzP6uCh8TGjx1Ju5yOO2OixtZWw2HY6Oplrx4kWR0iQ2+pj8VpBY2bx
         Y1sRcEdg3SS3bG/SMWSKZmGET8zCAjGwH8besrxepYBggO5+6qTD4ST/gT6FXZx3vRxo
         NIJ3HyTwaurgLK5jfJw9JaH1zELeZ5zqTw8jcPnW/gThkBhzv4QE0Q2TPhpbl79aW5Nh
         zcNHgtrt2l1jt3IMQyMDra0Iwvgq8s0tu5CezoMFP+/Rh1Yk4jUh4tHXWHUt9aj5lL8s
         tBa4d20Lou07CPnaEb7o5LLYfP79lgRtSPuqw1eAPabMsyN52OvkVtCdvTOe2/oZuCyo
         FxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069379; x=1760674179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=Z3hOuXil4SnGMCJSfegYCtJCNL4RpUOM1oUUOUgNJbY0KlGwZiGlA4JdbRbO7UD8cx
         xZqikKLWnU7mpKLOO6EWqhqIMKJWllSH5sMlMYZWufqymj4qo4j+XTHA2PtVBXRH9lgM
         P1nea3NvX+cZVE7VNjuVVOVcCgugxlyUQ9yOPiePM8hY78ugoK2lG1Kg4ac09bUFPdYA
         eECNImd/Uc6burLoGnJDdmDGSwNutjI6KPjeU44GLKJO4YhJ+f6o0l8HWWG4fV2fiVYj
         u6uJCP9sqnLdsWqd2vLYDhhqOnY2DslgikRc705MNqwrif7SVYLK2gjwCehn/eS47cqd
         nH/w==
X-Forwarded-Encrypted: i=1; AJvYcCXj7PNJzWk+Vh9YXqooR2uwIp/q59C7fE5S9kMqBCEHcv/sMtQEMPFQn6NHFuI9w6lHUg3m/njD4V8mbaI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzbsIXDilyTXUu4KKTOJg5WN0owrrHJpR9H7YqbFFiJuU+UwUUm
	L0dx8Jhw6g8qoLYlEQ7fQlue8hG/G+j6nO7Tt6OFhbJCPKgAghbcHKoqGVF6QM9gy42oVVpH+x5
	cWgWca77hOxSLhbm53Adwmi7f1qsiF9w=
X-Gm-Gg: ASbGncv7fvG7OF360ALfLf6fKf6TdEN3ct75AYs0FhA79eGTplT6+fmtAohezpx3A2o
	8Hn40Oo/c4SV7mw4xwFQtZA4ruhfie5LeY8N7gS4KZbkIt33cD+1fY2ub4sgfbhrp59b/e46QqJ
	zZtymrXA+vbQh9z55EJ7d3TMkpHpeUexkkb/6bh9lQWsNPROuwvnTgo0JHHcLs8U2fvip3wat3z
	wRbVylWyR2fLyjJ89K2TXPE7q1pg8x3d+S4
X-Google-Smtp-Source: AGHT+IEKzDZJ3mg1FFWOqowFJqWLj/+dmJPdM199pmmtVcavFH/YLuoH0hEdsvn7dHSOiTNw/3Aomiv0DcOjJivXzrY=
X-Received: by 2002:a53:e946:0:b0:636:17d6:a30 with SMTP id
 956f58d0204a3-63ccb82410bmr7618496d50.15.1760069378763; Thu, 09 Oct 2025
 21:09:38 -0700 (PDT)
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
References: <20250913003842.41944-1-safinaskar@gmail.com> <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
In-Reply-To: <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:09:02 +0300
X-Gm-Features: AS18NWDxe32nrD4BfQQFhIe3tEEfxrwgJsYQo_BWhSUPsy5CceSv7QOcZ20roI0
Message-ID: <CAPnZJGAKmgySY_RK0kmGTgwUh9hw4FSrVR+LoJCbD_RmJZe6RA@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Jessica Clarke <jrtc27@jrtc27.com>
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

On Tue, Sep 16, 2025 at 8:08=E2=80=AFPM Jessica Clarke <jrtc27@jrtc27.com> =
wrote:
> I strongly suggest picking different names given __builtin_foo is the
> naming scheme used for GNU C builtins/intrinsics. I leave you and
> others to bikeshed that one.

Thank you! I will fix this.

--=20
Askar Safin

