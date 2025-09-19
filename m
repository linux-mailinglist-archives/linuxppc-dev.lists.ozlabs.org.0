Return-Path: <linuxppc-dev+bounces-12425-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B63A3B8A423
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 17:25:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSxC64ctmz3cZH;
	Sat, 20 Sep 2025 01:25:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758295506;
	cv=none; b=Kqx5Bmz9ZUHp9ciouiIbmx2yaBGmxB/wfnbHQfg2svAkypQNhSNISTB1j6xnBMjAI+6YLk86TnYapTloIJVqFkIN9uYtiwgZ6lunVUBusUKbw4q9ZITODhMeiEBioMMeYGrkAdyAseYDz3uGFwF16nSxAsAfkAF660XHQwXtfeM+e8z6mJjNIamCYdpQtDxlzTQnJpTq5ySs+JBil7e3r+W/TzoXMX8PBsmf3enPljgRIZ29mF00mc5ABqXfyFXljd08y7/JXs+6aswwfkQ9bzbBJwe76IID0rdBsMip4931715CfcHOr4976lyExnlJM7AZIQZ+1CAffznzc0mruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758295506; c=relaxed/relaxed;
	bh=EztjVQ+y07YMfegmHOd0VyK62XkODMWu0LdNE29WAS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQMFnAR8otXXKv/jJLQIvzlMVcmlMD0cQrQa4X6aCdZ2WSkF5pXzZtMdr1XPDTMlzb2BMuEe3vMAVUnOc68gAE68yu+7g8oj+YCmaMzIDfq/DfYCrrNzGKlw5h7RVXL1SeGKrvyCWDcSEsNLXTRZYC+5Vwf5BXfaqMuonCJZUQkIDUy/gKrWe5X3iXvnYsBId3o5oSlrwMehe531JdLH9K8/0BBBhV9NSmjKKQVV+QbSxXrrsYKr6boaby8dDwFyh78HP5j6cdJosax06QTxEMMxE5nhpmxC7xflzWNvWAh2oSA3RDhj8CCBmoFkIzcnJYyarKHt/C/9ydBVxmFQSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=freebox.fr; dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=T6/Qw5ae; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=nschichan@freebox.fr; receiver=lists.ozlabs.org) smtp.mailfrom=freebox.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=T6/Qw5ae;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=freebox.fr (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=nschichan@freebox.fr; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSxC42PTkz3cYR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 01:25:03 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55f7ab2a84eso2641337e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 08:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1758295500; x=1758900300; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EztjVQ+y07YMfegmHOd0VyK62XkODMWu0LdNE29WAS0=;
        b=T6/Qw5aebizCk8J1e/Olt8S+3IrHcxj0/kC7dbSs50E1AhlLbF8LLxw9loMnuf/4E8
         a1tequZ4xoPeX166tJvLrC0clH6gfhi4cXBcTUH/0QHDSISP3rWW5k9MoNZfhmteP+E3
         U7n9TpUASCHZ+uguChbWtdSqLOo3Ehf3jT7xPUv++SlfmO20tmCAiRD3fHFg1A4nEbOv
         MxjYSh9LNzsV1hUoZa2SNZ3EfjDr33phbufltO09ljauYfTp2L/hVRbSnUyBS1bXhJ21
         IxcIy8FTrkk/S2P7gVwZlFL6GvUPKcpNIx+x4EVVc1CI6lwcaHSRS9uGbfwo/IJfQ2wk
         pHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758295500; x=1758900300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EztjVQ+y07YMfegmHOd0VyK62XkODMWu0LdNE29WAS0=;
        b=U697UwhKqS59IUbFWB32zOm1k04YkZoISjZpFiNPy5tqJtIFzzKTS+nh3O8S8ktCgZ
         kIH6Rb6oXu0g2me0kkYMCgiT+/Mq63lrnAr4ofKOjTgMowdgJZey1HfpgxKch/sNbHvO
         AZZxHFM3s1Sm5YKfN1asMs9xExBIOy/eE4FUhPbRWPnFxf4JijhSQYbx5HuNxqa7ERAR
         S/pFAYEq/6/vghUiZxr25119oGriJtFAGLq8Kky1loIeSODC5A/+YFWEwju9RlfZ/XVU
         k7iTImbY3oexzItv94D9ZP9ZxrMwnw/Ek7GnIXXCRRtTPTk3HFVtz1a4xqM8vQ3XaZQn
         Vb2A==
X-Forwarded-Encrypted: i=1; AJvYcCX/fnUR15ktotRdCF/O40km+a4yOpETir3Utwg7BmhllwDmREbr+Qpn/kt62clKrO6337dt17u7TstAhTk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyd47DP0daiiuSFejsRIUuhbXQUB9Yv7AT0X7Zo3b5Vrs1NeBnC
	AgU3NYoMlITQKhL1LVzSowg++kvIJ1IShqZ+iGouPWrKbxQbFWPDsOQ/oc6Dj/w/AFNb9flVh8O
	C5DEWaofArpc6nWhU4YcrrzmU2HpvclU/3rIMB+oqMA==
X-Gm-Gg: ASbGnctoQYCzzmMN+/T7vMoA25f1d1F0nqm8O5qGpInq54DL6XJHBWJ5ST90BHpcgJc
	vwbFQ1E27wRaR9tzMfbaajafH1mGREJHIWzDH9nS3KxteTcGeGKBSHqgMg1/CAAdwbKLzgM+HcN
	7g9FUZ7fnqcb9TTZTx/X5tsDEOTU7gTrYW8YMuomIQhJg3LyukfnNqx4b9CwFLfpiSOMW0HyEPz
	/I4dJ/ZdtaZzBg=
X-Google-Smtp-Source: AGHT+IHin4gQus9SrkFEog2pTedfunr2Ers950l0f82oxrEtfjemfexmsAorW/Dsqdjvay/GpFMt6pfW/hwC+qBHF14=
X-Received: by 2002:a05:6512:2c0b:b0:571:b70b:7dbf with SMTP id
 2adb3069b0e04-579e2507c81mr1455897e87.17.1758295499599; Fri, 19 Sep 2025
 08:24:59 -0700 (PDT)
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
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
In-Reply-To: <20250918195806.6337-1-safinaskar@gmail.com>
From: Nicolas Schichan <nschichan@freebox.fr>
Date: Fri, 19 Sep 2025 17:24:48 +0200
X-Gm-Features: AS18NWBwMqIXE_dMXDlT0ngUIReSbekPPTszWv5gIfg03bAEg3Id33JL3Yqjedw
Message-ID: <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Askar Safin <safinaskar@gmail.com>
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

> > When booting with root=/dev/ram0 in the kernel commandline,
> > handle_initrd() where the deprecation message resides is never called,
> > which is rather unfortunate (init/do_mounts_initrd.c):

> Yes, this is unfortunate.
>
> I personally still think that initrd should be removed.

Considering that the deprecation message didn't get displayed in some
configurations, maybe it's a bit early at the very least.

> I suggest using workaround I described in cover letter.

I'm not too keen on having an initramfs just to loop-mount
/sys/firmware/initrd, after all current kernels are able to handle the
use case just fine.

It looks like there is a lot of code calling into specific filesystems
so that the initrd code can guess the size of the file system before
copying into /dev/ram0, and I believe this is what causes the main
gripe against initrd today. What is wrong with just copying
/initrd.image using its actual size into /dev/ram0 instead of guessing
it with the help of filesystem specific code ?

> Also, for unknown reasons I didn't get your letter in my inbox.
> (Not even in spam folder.) I ocasionally found it on lore.kernel.org .

Sorry about that, When I used git-send-email yesterday to reply, the
SMTP server I used wasn't authenticated to google, so all gmail
recipients were dropped. Hopefully this work better today.

Regards,

-- 
Nicolas Schichan

