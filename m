Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D807358E20
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 22:08:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGXQG1qSfz3bx9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 06:08:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tBubWWY3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tBubWWY3; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGXPq6QDVz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 06:08:15 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF43A6113A
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 20:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617912493;
 bh=lJBvFSudiDrxZs+SnGh4YtxaarzP38H043H9PsxfbKw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tBubWWY3+neAkzvUwVEoCp09FqswXCDaRx0c5tqpOKjvcYtVCmFe8JHZ54TSymAUN
 LcUpHK9kiXHWgsLiDmBkRkBjUyBdxgg10Kg/vhYMlvwhM6Td33Bu/fEAPoZH7Rwzg3
 y/02Yh1kIkod5A/25l6gmVy/uGkdg25wTAzvSArNYFnlkxuDzKdqut3U9ckR8RDs9P
 vDjyKsx0P5LjQjJsrua6oISbMFMHmtnTHx3DuSW049FdIe7WaniCJJy7rcIwUJrymm
 s/dYmx64TzuZ1Bdy4C5SW9baPR3AZmbYAPa+qWcEfy3HARHgLptgEEwfQza7x3mWiq
 CQZwA4HwhhFsA==
Received: by mail-ed1-f54.google.com with SMTP id x4so3916384edd.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 13:08:12 -0700 (PDT)
X-Gm-Message-State: AOAM530JWTbTn7EoB1UlwSvq2/HMV6102KjAZJDgiJazD6lS81m71uUa
 QMEm058bScK7JFn1zFNIy1r4kONIhdZyXI5Taw==
X-Google-Smtp-Source: ABdhPJyQM3sGNyB4lBHJyB/vMz0AuBm9hT4GnsJ9rwYhPZ4h1PIVlO3IzyI5ADQSr6ra6UOvePCEFavpVtRgMZ1GG6I=
X-Received: by 2002:a05:6402:212:: with SMTP id
 t18mr13947421edv.165.1617912491462; 
 Thu, 08 Apr 2021 13:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <34d20d1dbb88f26d418b33985557b0475374a1a5.1617556785.git.christophe.leroy@csgroup.eu>
In-Reply-To: <34d20d1dbb88f26d418b33985557b0475374a1a5.1617556785.git.christophe.leroy@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Thu, 8 Apr 2021 15:08:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ=UNfptbNHR5XAS9BQRv3C5+YonW9rwypA5gGt2N7bGQ@mail.gmail.com>
Message-ID: <CAL_JsqJ=UNfptbNHR5XAS9BQRv3C5+YonW9rwypA5gGt2N7bGQ@mail.gmail.com>
Subject: Re: [RFC PATCH v6 1/1] cmdline: Add capability to both append and
 prepend at the same time
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 Arnd Bergmann <arnd@kernel.org>, microblaze <monstr@monstr.eu>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 devicetree@vger.kernel.org, SH-Linux <linux-sh@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-xtensa@linux-xtensa.org,
 X86 ML <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Openrisc <openrisc@lists.librecores.org>,
 linux-hexagon@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Walker <danielwa@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 4, 2021 at 12:20 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> One user has expressed the need to both append and prepend some
> built-in parameters to the command line provided by the bootloader.
>
> Allthough it is a corner case, it is easy to implement so let's do it.
>
> When the user chooses to prepend the bootloader provided command line
> with the built-in command line, he is offered the possibility to enter
> an additionnal built-in command line to be appended after the
> bootloader provided command line.
>
> It is a complementary feature which has no impact on the already
> existing ones and/or the existing defconfig.
>
> Suggested-by: Daniel Walker <danielwa@cisco.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> Sending this out as an RFC, applies on top of the series
> ("Implement GENERIC_CMDLINE"). I will add it to the series next spin
> unless someone is against it.

Well, it works, but you are working around the existing kconfig and
the result is not great. You'd never design it this way.

Rob
