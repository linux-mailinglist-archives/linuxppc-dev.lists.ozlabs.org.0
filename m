Return-Path: <linuxppc-dev+bounces-12267-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD13B58CBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 06:19:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQpZz1H52z2yrF;
	Tue, 16 Sep 2025 14:19:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757984728;
	cv=none; b=otxe1ILQrbsPUHobZtkXdZ64twi/6hU+AuY5wqC8mutHJaE7xAdeyqYbzw+NqrkH3Muzj63wqxw+PrN6Sckb/WYOXzjltDRYxvQ9WjMJyUveLxsxCeb1qoNaagomPE7ijbHr+48KQXghp0NpiTZ4jCU/nCPjpcdikbMqXwLRYYLLzUiH9C+vNyGD7qHftxPlqtlSg/kiHzmR3FQFx98TH+VenX7tRKMkzZJKwMJYVsPPFXZH/yIlOPMse4xTTIjX1rzKwGWSKdwbADQEQB0EphyDpJvmhs9D3uSpVUuuujNJ/Rx9Ez/B0mjmT7jF5yWnYPQqlvuPK1pltMxSCxPkTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757984728; c=relaxed/relaxed;
	bh=d4rwn8y0vRJNvu8C079VdIgUQlj+kBjL5HuZ7smgp/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZVCHHFHCEvhGnyLHuOxpIDGciNQ/SZzenVn66yHp9Ax4ly/S7Y62UxYRWzM+om7KfAexN563QuO68pPSjJftwKaPkNWtMQMvEH3b0OLBiPjz3XSGI6uSLzJzafcSxu9u+4nKyq/HwdeD0OlujpAF/H1A/vEjEx2qKfSDdE5ZL3lpsttqCeu9ZLvOA0fSILZpYr5fTIPTg5d2lxotrGAmriWuP7vKj9TNb24BhnG0WWX1fCoNDDsqk1jj4FijpCwysbtZAXGhsJS6q4/R2Uw3a3QIKCwDURIy9Rv4h92GNksxrkn4qFEiH8MlrvUxHk1mPqqnr60O1I/bt33+SVMpvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dgrKxgG7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dgrKxgG7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQkGb1Q4dz2ySV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 11:05:26 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-ea3f9e9f782so2366172276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 18:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757984724; x=1758589524; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4rwn8y0vRJNvu8C079VdIgUQlj+kBjL5HuZ7smgp/E=;
        b=dgrKxgG7+G+yy8cyjXhvzOeamrW2y3qGhbwLZ8neLRZvkP1lE8kTRYmnIWCWz9HNhs
         JQlo5aAhooVOpL3pOVLcGb7iscS+9PN4gcCj9X7EGv9MGl8wN6wpKhuLWV6JnGz3lpPf
         xjoGL+zYl2O1v6d/ktgG6+2O2B40Pt464lAsGQ1+4XwfLZXLSblyNYyPsvmAciHJsg/p
         Ik9drp9jdaSxmLS0qIAn+PrXfiYS30LDMoq2u981GhTTBrBuppLw+83Bi4yzWzoRRjl+
         zFS0VOZKyUg2V+gJIUlkKfdoDR+hdvYdn2oE9In5vn9blqXCesvyAdXUCSwrXkxvy/uC
         WwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757984724; x=1758589524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4rwn8y0vRJNvu8C079VdIgUQlj+kBjL5HuZ7smgp/E=;
        b=oObXZhBMe/tO61avRdPb13mBfa1bGaYVBDEYVhdTM+AkAZuRy0b9tPeYQkHiMQ09eC
         BvxJi4xd3U67V6yqWydul5qiFfe09Nr0FfKla0eWSPUes1NjuKyHBJvAwxSbJ7UWgaOd
         4shZQSVDOoD/LE6Svi6VEp/fYaaTbD76HcD1Q7uHs4xu9Yk+Msqxl1sEowFbuKafeedw
         UMkiFVOT8nOJdvxcjbNnxgTtxIcve2YmtZZsisHCEM3Yt7+083sKO7xEKC4fmREtS4gg
         yPU5hkfVH3/7FIrjrWLyn6L4zA2nj54tffTabsFRBnFfG9ESi80J+PGv+kTiDZCEfaJb
         O8hA==
X-Forwarded-Encrypted: i=1; AJvYcCXQqDfSZBSR2al73gDSCiHk3ZpviV4u9KedFo7JHRk5D9xruyW1RNTB7mnoDjX8aQ9/2ohtPEgVmkqwGus=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1u8EFNtnim/4gbMxDCS8uMXcziO+RPZdhJiP89q0UFms8Ev36
	F5WPzDbnCbl6bZL4BaOmRjvvx/ph7C58GLTtwfliYavpxyaNfQ71HssXq3KHUzFszhC+zpWmd5u
	sz+ZF5f9B+opHmUMHb+L3Kl5P78ehb90=
X-Gm-Gg: ASbGncv++9QfVRuNc9M+K7svSX7vsAMX9GY2J9S9J0Ta/u5Y+92aRzbTlE5SifAezcQ
	sv5XTc+HBlgnDu2sxMDOy6R64Qi0rosf68RzlSvgZkJARFLq5LGsq5aK4fXo1G4lGI2PFefP/IH
	inagcskC8CcstfmQOnPUoYblv1VdZISdm4R3PTHlxioeQ+eva+vjLHx68a1G/CUUzYMV4GLXnpS
	wLlMMNIFvUqLhk1/Q==
X-Google-Smtp-Source: AGHT+IFaJEo1gVHkPCEaCD3vWYjtreYFiQ2WOrRU9CIpbMyg97OVJtr/v3uxdpG+fiXE68E0IfjXLuECnr1bsw09sPQ=
X-Received: by 2002:a05:6902:2b02:b0:e98:9926:e5ca with SMTP id
 3f1490d57ef6-ea3d9a6c911mr10729577276.36.1757984723469; Mon, 15 Sep 2025
 18:05:23 -0700 (PDT)
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
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250915-modebranche-marken-fc832a25e05d@brauner>
In-Reply-To: <20250915-modebranche-marken-fc832a25e05d@brauner>
From: Askar Safin <safinaskar@gmail.com>
Date: Tue, 16 Sep 2025 04:04:47 +0300
X-Gm-Features: Ac12FXwuxsP2xoupllcCoDiRw8q2uuerrvP566PgC2Qr6qfMP36Zqdrto9P8zEU
Message-ID: <CAPnZJGAjfpHZn_VzU3ry9ZV6OUS0RN2iWos153_oM_PhVbMgVg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Aleksa Sarai <cyphar@cyphar.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Rob Landley <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
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

On Mon, Sep 15, 2025 at 4:34=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
> Split it up into multiple patch series. Send a first series that
> focusses only on removing the generic infrastructure keeping it as
> contained as possible. Only do non-generic cleanups that are absolutely
> essential for the removal. Then the cleanups can go in separate series
> later.

Ok, I will do this.
I will send a minimal patchset with arch/ changes kept to absolute minimum
or even absent. Nearly all of the changes will be in init/ and docs.
Hopefully it will pass via the VFS tree.

If it gets to kernel release, I will consider sending more patchsets.


--=20
Askar Safin

