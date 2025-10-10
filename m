Return-Path: <linuxppc-dev+bounces-12760-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D579BCB721
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Oct 2025 04:48:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjWQp2PT4z3cYH;
	Fri, 10 Oct 2025 13:48:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b12e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760064530;
	cv=none; b=h7V+KSyYyHMxjAOBnhf8qVmPnY89ZPf+OyrT8nrQbXIxuh3oHwJ15r0Xvju3Za92np3YZtV5tXQKN3SaLJbr+mbTNb1hZVXTusgfUuruqLwWvp+m7/C24Ao6nH1KyrurJD9qwQYP0zISLO3gtY4RehRnPW/MYYzKawroaa0go1S9evfmwXiC8hoGJSrzUTtUoHrK/IBELvaJzY4Wnt8svTiULgCbiLmwiczttev+aTiFu2prKp7XR+bwZIWzaTKUcqDYox6bKqtJjyQEuu7/ad1JsyMhr0YgmcY2kMdNdzJJrAefj9puha3dz130xJoth0bPndDDv4KOBjJXbJBNSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760064530; c=relaxed/relaxed;
	bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOHXCSTvvBGiODiDXxPwCh5iEiQUMK+qPEkTxxh+jgnyA4dKlAI3s/meOm3G3aypGe8x1uQg59gSUdqwQCnoR5btYaOvyl3CVMqH10EvOfa9MyWrVOJCNaWfhRe+fXsHKXoNH5hKHbW6s2tw86tyaVj1xyMMX5av3ikOC4G6tbQDlX+ZTP8F2jxe4RjwdDG+ovqsnQUkYMIP9Dol2SfaTKIxMNP9uzFehvromJOVNZLXcUPlWm2Mq9j7dVrdbTRojHxB8C6iqhE0vkrhdtsNidE69U1SAR4LsFBAhtjFWg7NkQFa5fOT7C3N4dXIs0PC/CxtGJut5TBBI/JKBGXWgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KP+UNydO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b12e; helo=mail-yx1-xb12e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KP+UNydO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b12e; helo=mail-yx1-xb12e.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb12e.google.com (mail-yx1-xb12e.google.com [IPv6:2607:f8b0:4864:20::b12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cjWQm36jKz2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 13:48:47 +1100 (AEDT)
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-633be3be1e6so2501662d50.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Oct 2025 19:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760064523; x=1760669323; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
        b=KP+UNydOV1yZvoF/980lzblYRmMsKXaKOouUxmT2+xAClSyskK9HZ3Dxb4x+SLB0xd
         0FafgExlTadqxCrRf+MYSPiHVUbbKmXlt7c4qLVD69VXyPCyK3YnvN1K5wLhMLJJiBQ/
         w5wHzPf8np+o5siWKK8fzUUH1Ux1zzAt6fnI8wuttGwBvPWL2Og44se2dea4d8QJ3kjL
         Nq2UPI71TKMFnvjdT7KmbDAOakgT6hQrRwslZKMI6lDVxQ3mlmF3ZQWe++vur2Nm5tBY
         LRtfMfA4zQfZGnn3zedDNhZkZC4MJz+72hwNTgS1fP2wFw6sAyjLeQGviVy1Mmc2y9Ha
         tyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064523; x=1760669323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUvjTYrAKggs3w1tKlxCJydt04WX0hyij5ZVnNtO2rY=;
        b=uNkDKy1IEahfyayaWwItQvlz2EMBbX7u7IJf08R4LAdMTtQYTYdzrcfftvH0Nwfy6j
         xJgTlh4iqOisZxPsHjdGZsj1k0Ho3wPOfG8P4K3bhUA54aOF1GIGcZ2zhpqkbHkIvSCq
         Qugas8C0pWA6p4kiMcs5vIfnI5mBH+JDSFRPHyn8CaLxeByDibC1EQIjUBFsAqePbmr9
         B0FsJPsx0ucqHwMezWaBx8vNAJhfqkwXqEA2JUrRD89Ih8ELZ9zQ5viRZEyn4COPwyq2
         /bCojIOXh+QnEtM3Oqbr1BVwnZy7y8EyxyoA4ckXBIA2v2A8a50ubF0NspQbl9hj+lWS
         WkCg==
X-Forwarded-Encrypted: i=1; AJvYcCUiGK6ipfJrhxXBG6PiZuLzngwDVzjGfgjgcBSoWEj6ERK0Bibw1FZmDyFkDJlLJs5idP75Zes7bgaVA6o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyAGzpghfq4IU/4veQOSahydbS22LFivBoX1evDGwvCRv9W/Csg
	qPEeY4sw760xg86VGZcACxlLPdBKXkBaD5eo6unef+4T9VgVLTuiw+H9AFUKvWcbZMjq7k1S++5
	D+z+p2shJjFH2A4D2M9OoYY48ggPjSrA=
X-Gm-Gg: ASbGncsOZzPnCzY1G3kXLebXrXUTq5aUImQT+zeSMjdA9cRy+dGzOyFyFsOGhxvkK80
	JfrXggGpDlTC87P/9CkVqCC+SyVQ1ZWsG0SFJK2zhxys2CpNUcSTNZEBp2N6Jwb9exrb89+QlvY
	IaxfY6rEA43qaQcwPEeUxVpBsvi7XbbE3iTgnJexo8CeuW/14n0oMrGKHyb/yPe58UFX5nMuIeA
	t3EzRl9CaCKvMofBpuRF7eY2hyp8b7YuveqBY9ZkA==
X-Google-Smtp-Source: AGHT+IE/ruZR0Nl+gZjd7KSfaZ+4Yt5azf8Eoz6teA2EZ5XcCIQ6BBXF8AxOCZshaSTrV+l7WDzDAJYCcqNIJ+IMELc=
X-Received: by 2002:a53:cd0e:0:b0:635:4ed0:571e with SMTP id
 956f58d0204a3-63ccc4fd4b5mr7697871d50.22.1760064522649; Thu, 09 Oct 2025
 19:48:42 -0700 (PDT)
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
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-22-safinaskar@gmail.com>
 <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
In-Reply-To: <a079375f-38c2-4f38-b2be-57737084fde8@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 05:48:06 +0300
X-Gm-Features: AS18NWC-iakvkxLfUlO1LRxakg0fg4KV7Trw_hsIF2wxGpnmpWZvHTCQ7Z3GaoE
Message-ID: <CAPnZJGDK08eDWaMTmvVQwkAAThUvgB0XgAapqqV4_ZmWeay-iw@mail.gmail.com>
Subject: Re: [PATCH RESEND 21/62] init: remove all mentions of root=/dev/ram*
To: Krzysztof Kozlowski <krzk@kernel.org>
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

On Sun, Sep 14, 2025 at 1:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> Please wrap commit message according to Linux coding style / submission
I will do this for v2

> To me your patchset is way too big bomb, too difficult to review. You
v2 will be small.

--
Askar Safin

