Return-Path: <linuxppc-dev+bounces-12766-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CFDBCBAA5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Oct 2025 06:58:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjZHt64mkz2xQD;
	Fri, 10 Oct 2025 15:58:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b12d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760072282;
	cv=none; b=RqTKeXWnUjfqk6dVPi/VDvcM9TBXQcvRV5F/rkTCvw6Ae2A2jgn67UuYzcXNtxmujjJ8PJ76PNbAJxf/rAaXv4PPHhfAyG+H0YyCGib2/Q0Y0MBIc/9go5Itt9AuBTRTOso55xsVMrclRDqJaQKz4lCGzeLAhC1Up5r95R7mV6qkf6GyL0i3FW4Mayctgv+OkuFAG6kyNhCrQNBL3s4QtBrCdB/RfqHFjay3FfNNlTc9gCFRq2gnsypv6aGdNDmpb2Z1kt32vYGttq5X7BpOJduQDv+YiTds4rb21MZhxjXVe9+AHJXTiJG+I0lEetsp6aRzHpZ4m8GT3YDtN62ngw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760072282; c=relaxed/relaxed;
	bh=j7qS0AM3lX7OGhXSFEYS6mkC3EKNzPxshbg7hLZcah0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAkKJMg3u1Vte5zO15i1M+IFjaLp7TMNfjccxGi9lwT6V9YhsMyREDL8uno2rzAhQa3xyF4mx/Xb3tRD6Ixo+lZSq6Kts5CY+eIJG1sfZ+Sf1k7ocVfn5hAhZk6mBeEyKwX80kktPTS7j5f6eaGMvvNN8GUTeEQRAquhx3kTwvcUTMCcJiud73/hFPvlj7njEUtjaIxoSJ6vs4qP6jR+xCl/qktKHVUDKgZPdPYNh7xjzl0G6l6pIzi1kP7dHLxIzEnVEt2AW2gZXnvpjO++brtFQ+VVEHodLj2b38Su6zZrCGsaosF1EZwmwFa2osEtFu4KYshFPmcXOnVPl1j9Pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=esibKQq8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b12d; helo=mail-yx1-xb12d.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=esibKQq8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b12d; helo=mail-yx1-xb12d.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-xb12d.google.com (mail-yx1-xb12d.google.com [IPv6:2607:f8b0:4864:20::b12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cjZHs44Rqz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 15:58:00 +1100 (AEDT)
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-63bc1aeb427so1693682d50.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Oct 2025 21:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760072278; x=1760677078; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7qS0AM3lX7OGhXSFEYS6mkC3EKNzPxshbg7hLZcah0=;
        b=esibKQq8qJ3LZlSxYh1v8ZqE1LIPJdYbfDraWgRQsVvB5NnAs37QNCvx1G+BaDdgrw
         dMQFE/LNBZxfxPkoJdU3r19oaF1/VZOZ2kGj/KjYv/zH5bcX3OPDZeQaPgy9swxYdy8j
         leF42N9QkXJVln6K9NYkSLbeqam/FNOr0vwKWLaBlZ4Tg5goX7YJ4zZnR68uGaaNI/Cj
         XiFqjdu63/pIOeBJjdvQTFTH+TtV6fb0Vc1Bhnl9INVInmf9V9eHX1YVCKr5NH8SYQ/z
         VAnP4WnAFJDF3VOLRuvFsy6e/OSsPh2rhSttuBUJOu50KaQrhVLgqJJuQXZSEaOVbP+c
         p8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760072278; x=1760677078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7qS0AM3lX7OGhXSFEYS6mkC3EKNzPxshbg7hLZcah0=;
        b=esskGphoZo6toTYICIpmfRaMrmomUV+hjCtbntjP9tRAs1nYb2f1uwi8USKqJoc//K
         Vk4/dkQJ3mrrX7xyFYc5Bs32rxkR0owXVI//xl/noV6suQUkBNnwRir9v/KSIg0qlx0S
         cKz4x4gv+tx7kZnpk3o9SOHdgIcN6GGQsHstonEjuGk3CI10PmQ+/RlOm4IWlasAz2pF
         6bVcS/djMmmxRE1rrQ0PzHelOY7Kciv7xZY7uUPKbLaPDPDFv11lmBpHYOnH5t9Zdkbh
         ALGXCR+axXOQuAfFd4p0owAG/GEel0I6Q0TjaVhcUlARiAc8G6Ze7pdoF6EqUrwsqL7r
         B3iA==
X-Forwarded-Encrypted: i=1; AJvYcCX9aXVT66WxBIYSH55dYTGn39r9+V+dypPq5zrabTx1nUmOmeqmO3p5WOgKBPl8fID5wjQ9GJbBo60tNs0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw+LQk2L6cZvzP3SGUjvXPydH5D3PatNqhvAo5ljj3gl+L9ff0m
	JkA0mM9AXZokU6xmWPh/nKBDPxyw1a82FSEpSHeY9P42chKsX0axQK9yhJRH4ZtDU4W/tvWP4Iv
	FTd0mEuhWAA3oFUU0syfbDMqK9i+sKhw=
X-Gm-Gg: ASbGncsvOMZmMybKWPBkzl/bWlsp9NjrcWyTpHFNfWAt+sOctgcOP8luEsMxAUmn64Y
	xGTBDR/IjDHC65vcKNRseLwKpartut379k0sYMkrPVFdWloaxnDQiAzljqQPQ06DevJP0sS/Z8o
	uZGzlb0rG/XmDtaGu31PSBQNg2HE29Z6z1CwTp3hP71zVggt0zb+jHn+KCx3BmrdsHjWkpo7nBc
	ehxPCCJoHvbFQchiDWZwU982w==
X-Google-Smtp-Source: AGHT+IHqDciv7GAPYfMGdKr9Fwuo5GT168N8GcrpsJ5KozP5HqYqg/LDALxuogvzJXgNCm6zrA+DoCqu7lr8uhQrVc0=
X-Received: by 2002:a53:5009:0:b0:636:2420:d3ce with SMTP id
 956f58d0204a3-63ccb93456dmr7466309d50.51.1760072277565; Thu, 09 Oct 2025
 21:57:57 -0700 (PDT)
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
References: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
 <20250925131055.3933381-1-nschichan@freebox.fr>
In-Reply-To: <20250925131055.3933381-1-nschichan@freebox.fr>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:57:21 +0300
X-Gm-Features: AS18NWAQwCKadWHXCZjVUBNaD3TaKIilJiJAQzSbvGFaYuFuE8UDpW1_H3riB-k
Message-ID: <CAPnZJGBPyONjJoM6cskxysDnN4pxWuWJCK5A6TgikR2xHsrN5Q@mail.gmail.com>
Subject: Re: [PATCH-RFC] init: simplify initrd code (was Re: [PATCH RESEND
 00/62] initrd: remove classic initrd support).
To: nschichan@freebox.fr
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 25, 2025 at 4:12=E2=80=AFPM <nschichan@freebox.fr> wrote:
> - drop prompt_ramdisk and ramdisk_start kernel parameters
> - drop compression support
> - drop image autodetection, the whole /initrd.image content is now
>   copied into /dev/ram0
> - remove rd_load_disk() which doesn't seem to be used anywhere.

I welcome any initrd simplification!

> Hopefully my email config is now better and reaches gmail users
> correctly.

Yes, I got this email.

--
Askar Safin

