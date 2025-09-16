Return-Path: <linuxppc-dev+bounces-12295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BADAFB59EDC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 19:08:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cR7dy14z6z30NF;
	Wed, 17 Sep 2025 03:08:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758042517;
	cv=none; b=SFRvWXXa54EjHQGlPYTf1uUy4ENYfTusZAJPzVTLqm5kBjvlIeVhd+mdww4EKK8NcFBLioj7TIDBnNuL83m/Qjs/JQ1bIqVoZc5zUpGTS1TNslsNeHzKubtrLp0kI/xulL8HflBzw3RcrXI0qMidHO8SXkiCM8t5KlrC5RpCeVaDmQCpw++ljNDy4abJwPyzTyStgRZ5uKBhAY8XbxGwfV8QYOhmbPp2eTlQEhGuRW4XCWSmElOI1+0tB6dpgdLulMSt5qxJ4AzIDkWZkUw9i1+NYNSu+wSBOivz5bLMfT3gpStT9c9zlWI6qfibuisAoeMude8PmuK4C8h+wpZUcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758042517; c=relaxed/relaxed;
	bh=AIXyc3Fa0oN4a5i/p3ClDZo8xo9GAZJtSKI5SCU0zd8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ABRr1g6g1tsQ5rZCGfrzE5lVPdllIoA4pl/pOyojZo+W6pq6BttWlkVvaE4uYVjSpLaSOc+E0DDVzS5J0FgmtwKYR0ntbYAxPhg5Zjy7gme5+FlRqdSrzGAKgYj7gCP2CwrwgXyaJpOyHNrOS3gWTouXIzozjAzQXSDeFVysOQ4sZem/TeFTfoQpxOFDB5igof4VnDJyG+nFTeioO0by0tFLfL1tVx4OgC3192zItBev/xEZ1hYB+2celyuixW4LfbW0pr9xmQImDnAFd01TLbygdsR4Zy+tpaKwqluPmBKQD1zBFn7sLSZytYIVtNS07pYcvx6IUikX4aX7ydl/kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; dkim=pass (2048-bit key; unprotected) header.d=jrtc27.com header.i=@jrtc27.com header.a=rsa-sha256 header.s=gmail.jrtc27.user header.b=SJSDEnn8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=jrtc27@jrtc27.com; receiver=lists.ozlabs.org) smtp.mailfrom=jrtc27.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=jrtc27.com header.i=@jrtc27.com header.a=rsa-sha256 header.s=gmail.jrtc27.user header.b=SJSDEnn8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=jrtc27.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=jrtc27@jrtc27.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cR7dv6sjMz2ygH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 03:08:35 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3eb0a50a4c3so1644918f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 10:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1758042511; x=1758647311; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIXyc3Fa0oN4a5i/p3ClDZo8xo9GAZJtSKI5SCU0zd8=;
        b=SJSDEnn83FP9Ci+SWBDRPDM6Ieuv+VJ6QQhqS1+ZkeBWKZq4V466yM+MBC6tG8HvYQ
         auB+bSixuroq6nXq61xIeiT+oihFy11LBVWy/60T8dvvLkcWqp/i7+hWJka8KRqZ70Gi
         RC6hjizBoT8uClxC+wjzBB2Hh4KxzryWYYicPX0/VJCzJCRTLCHv150ZMWQ7O31sr7aJ
         AyVHQEnd4Gm8nwxjdyfrHvoMtj5f9gWhKA3ajtSbAm/kw0Hf0CpxmFBAAO7tvyuSFK7D
         LRE1LxusIHGuDb8NQGHu6oxqIX06ngV4Xcp/xVYZjDevYW1+iilxVgb12L7E3pbgWDv7
         r4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758042511; x=1758647311;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIXyc3Fa0oN4a5i/p3ClDZo8xo9GAZJtSKI5SCU0zd8=;
        b=kMdy8wXukOqpx8HdtOiWVEAEQ9PKB2vAwfMhvLqV+/t0z2SJHUOk1OY9mQ3IMJ76zn
         MU4xGHVP2TeCXMQafcgHQDdUeL/6VTqSDb4nGCJOIuzIdbnntXgqXFPI7ZmcIEiGeoWT
         cGPJCR/MHu05NiC6AsyfsvS59nm1QB9fa7b29nUnHITg8N6Oqajyfccj5CmVE0kU0Lov
         EJQSKJ3EtDvkRe8tDnJ70ufE7/gkdfV7ieQZlaqRPWTB+mF28hnBBwmd5xE7RLuBLvTS
         xDSa6RmG/7Vrh629Zt8dRsLDF59N3bo8KThAst1SFgZ8m0BF7jFgYQJvU8KEzM15CHBj
         5vfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdpjDgAjI0W0cJTvtwtn5LhayQw1zV0EADcB2SxUAaHyUEm6EQMtA5ocZZTn5k2y6D7r6Gz3pZwmxGQ2w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzENvjcETo25NXf5OxUVI8CnR5D0lwVNX7AuED4WoBde3Ht6h7Q
	a4Dtj3Thad4qHx1BXgXwXQNASubLo5AnvoFlMiEH17hXEtqcOKsrGjaB0iA1jZZtfgo=
X-Gm-Gg: ASbGnctb9GUZY/US7pCkDIQItWCypslwAdiz/31LeZZKL2cdj1qqXaYc2qaPG34LnrI
	/OiWfTjYsd5+dvLiw6fL6sqFRW2Muv4I/Ew3kq4vipxTLye49VT4TmE9A/b8trj+V5rKO8+L9xs
	ODxp2auCGg+iwENHnsnHkaJ3kKhR1qaeLb1SlEmKU1oI/lqRGEcUe17UuD6xquknBNZx6PRxL41
	Ge/kC9nQ0DC9vfoI8oXBDkZ/6WWCpFD3dje1Q1LTYwLNjQgeQWQGZQ3PO9jJuW1VqVqNnATS5pr
	wHeb/Jv9sd0QQN53hlg7FUmelS06xYEuk6pmlCEqnQXokdmESyTgNOwUW4Lf8YE+igczfkW3v3q
	45tDnYLBMuGsW8grtVQINYEkmlxa/poscAaMwpzacREHdumvg3CKj++Y7CQ==
X-Google-Smtp-Source: AGHT+IGdFovreVsG0VTuKKVTgWJJEqEKFnO21Mo+tI9uoQq7jJrFi/9vVCfXuUmfB6QhCbWUaAaAkg==
X-Received: by 2002:a05:6000:2dca:b0:3eb:2437:97c5 with SMTP id ffacd0b85a97d-3eb24379a13mr7083124f8f.22.1758042510664;
        Tue, 16 Sep 2025 10:08:30 -0700 (PDT)
Received: from smtpclient.apple (nat-184-7.net.cam.ac.uk. [131.111.184.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd0a7sm22520843f8f.39.2025.09.16.10.08.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Sep 2025 10:08:30 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
Date: Tue, 16 Sep 2025 18:08:18 +0100
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>,
 Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Aleksa Sarai <cyphar@cyphar.com>,
 =?utf-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Gao Xiang <hsiangkao@linux.alibaba.com>,
 Art Nikpal <email2tema@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Eric Curtin <ecurtin@redhat.com>,
 Alexander Graf <graf@amazon.com>,
 Rob Landley <rob@landley.net>,
 Lennart Poettering <mzxreary@0pointer.de>,
 linux-arch@vger.kernel.org,
 linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org,
 x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 linux-block@vger.kernel.org,
 initramfs@vger.kernel.org,
 linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org,
 linux-ext4@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-acpi@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>,
 devicetree@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <kees@kernel.org>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Heiko Carstens <hca@linux.ibm.com>,
 patches@lists.linux.dev
Content-Transfer-Encoding: 7bit
Message-Id: <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
To: Askar Safin <safinaskar@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 13 Sep 2025, at 01:37, Askar Safin <safinaskar@gmail.com> wrote:
> [...]
> For example, I renamed the following global variables:
> 
> __initramfs_start
> __initramfs_size
> [...]
> 
> to:
> 
> __builtin_initramfs_start
> __builtin_initramfs_size

I strongly suggest picking different names given __builtin_foo is the
naming scheme used for GNU C builtins/intrinsics. I leave you and
others to bikeshed that one.

Jessica


