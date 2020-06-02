Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB91EB340
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 04:12:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bbC618hSzDqLH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 12:12:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=noloader@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bTg4ds9H; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bb953hD2zDq72
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 12:10:12 +1000 (AEST)
Received: by mail-il1-x144.google.com with SMTP id d1so11364190ila.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jun 2020 19:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=+7m6vrFlYxJlg+VKjlZxTMCRkWjisBQ38Em1XzbwCBI=;
 b=bTg4ds9Hoch/ZaoyyR+UH8c7QzufliQk3sa91NlT7dJJMDuVbSfLFRbDRSNtsL144z
 fffZMsDNHrrC8Lo1WR8iyWiaiFcZBtvrHXK0BUDylCqLO43j4yg5CexNBT8HeZsm7jMZ
 tIR6cFV/Nx9KnIkaioIZ5IZz4vBbIQvx9TCB0hGONLQT90H0AKw/htjMFQ/haTOZfd+5
 SRjP4+jIIcKKfyONOEBXxjghg3WenDuaQKQGTnq2w9X/5uyOUYht1iBPGIXoAlAbJRWX
 SC6lEdDRr8nF/v8No23/69xidaNX86zwrM07UbGC4az8gOYUN7uLitIeTp2fPAy4HBAC
 8kwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=+7m6vrFlYxJlg+VKjlZxTMCRkWjisBQ38Em1XzbwCBI=;
 b=DJrYH7hccMLAyFNsMHY2b8M8idprMf0vyJGi743Lu+jdiDekYtMihA+sT5SgfPowqR
 OrAXT7WbItJu0CPYjIfM0bd2Y+8zwDO20Y5QeuLd7pmE+pOzFwW6NSwQmXKKjcV+nT+M
 X+A9iuDe479SxE1g9H2weEBSK0LMsrNOXQ8y8vhc2bkEn6HRkIIVGOH+efiPf4bzv9Wq
 ej7kV5PdQOCmsjS7utcAIeAe5Xboo27EIqOfHpOmHTz0MiwfKhCHcUNMBnmhAOY2RV+u
 W20Kh0zfHnv3wbpnBdZZk/w/chKCs9/aUJjhAToYc+gTfnKSROiSeyDHwRoNW98i88qv
 3JPg==
X-Gm-Message-State: AOAM531Oz9ca5ACe2Jl42zwWZpD8aH6cbgMAasqDHlr4BgsbqAxZ8I3e
 uJHjBsEPOfcELAFRbeVWYrWanNMLSuLqtkb0CTM=
X-Google-Smtp-Source: ABdhPJz2q2NeDb6mBVASQ+sOSgcExL0gg9O+y2MOV6FfgW/UIZ4Kxh1SuiyMBQzAUeMrdHk9z5Apr0DbjQRFvq4xKcA=
X-Received: by 2002:a92:c103:: with SMTP id p3mr5537275ile.166.1591063809287; 
 Mon, 01 Jun 2020 19:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <20200602015802.GN31009@gate.crashing.org>
In-Reply-To: <20200602015802.GN31009@gate.crashing.org>
From: Jeffrey Walton <noloader@gmail.com>
Date: Mon, 1 Jun 2020 22:09:38 -0400
Message-ID: <CAH8yC8nqbLd6WvPKeMDvGNwRPD7j47Mr66n7ajcYi_XxGe6bKQ@mail.gmail.com>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
To: musl@lists.openwall.com
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
Reply-To: noloader@gmail.com
Cc: libc-alpha@sourceware.org, eery@paperfox.es,
 Daniel Kolesa <daniel@octaforge.org>,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org,
 Joseph Myers <joseph@codesourcery.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 1, 2020 at 9:58 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Tue, Jun 02, 2020 at 01:26:37AM +0200, Daniel Kolesa wrote:
> > On Mon, Jun 1, 2020, at 23:28, Joseph Myers wrote:
> > Are you sure this would be a new port? Glibc already works in this combination, as it seems to me it'd be best if it was just a variant of the existing 32-bit PowerPC port, sharing most conventions besides endianness with the BE port.
>
> That's right.  Except it isn't an "official" existing port, never has
> been "officially" supported.
>
> > 128-bit IEEE long double would not work, since that relies on VSX being present (gcc will explicitly complain if it's not). I'd be all for using 64-bit long double, though (musl already does, on all ppc ports).
>
> The current IEEE QP float support requires VSX for its emulation, yes
> (possibly even Power8?) ...

I believe Steven Munroe has an implementation that includes emulation
for lesser POWER architectures at
https://github.com/munroesj52/pveclib. If I am not mistaken, Munroe 's
library supports back to POWER7.

Modern GCC is fine. Clang has problems because it lacks support for
ISO/IEC TS 18661 or N2341
(http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2341.pdf).

Jeff
