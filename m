Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 040872D0B33
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 08:39:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqFYy53VRzDqWx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 18:39:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqFV53JK9zDqX8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 18:35:56 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id q25so6344001oij.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Dec 2020 23:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=81A1/EI2V5mNEQhjEQLpvlKbCZRpRrCc/XWWtaeN53s=;
 b=CPZDnQdGalPeNiAjlF2AJvcPHeaaE/DUC+1CAOgRa4ny4epDvtSzQqtnK6qy87mjJF
 kZUf4s9lJZNE7Tq4o1m2T4d3e+wBbLqT3InNXPpidcJtsfAmSo8okBozoflTwo3h/Kdh
 gFVnuA6wb1grsNXFKKq86DcfHWp3TqubRFS9ptZeXQinaJZJ8eEoEQNTks3FMdVvxKbM
 3b8dEVinpRGojBfdLvIMzGMmEAFlDx4jYayjc2RPGZOl+ygz7r9OovI2sSRCcE0DgVt7
 TnBa1n7Woaspgt/+3ga36Qsoij49FgA1ncizWssuxNMENDhow+JhomHHzJ36cYAwdAaN
 KTAw==
X-Gm-Message-State: AOAM531L5p74as6Eup/TDgwM3DC3eDVm7vNI+F4EXS6ltslwM9U2W131
 FMfUAlGRIO0GLiV3NT38rfE8Z4fyy1hv9bI2h4A=
X-Google-Smtp-Source: ABdhPJy/JEX754OpU/TA3+t9ubAjETJ+JgblXzUnQ4UMH8YPy4PUYm8OthzBU9+DM64zMQkgJyrBU5FFU4KbRsoCaak=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr9941990oib.54.1607326553857;
 Sun, 06 Dec 2020 23:35:53 -0800 (PST)
MIME-Version: 1.0
References: <fbac2cd8632bb719f48cd1368910abd310548a0e.1607139987.git.fthain@telegraphics.com.au>
In-Reply-To: <fbac2cd8632bb719f48cd1368910abd310548a0e.1607139987.git.fthain@telegraphics.com.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Dec 2020 08:35:42 +0100
Message-ID: <CAMuHMdWVS1nQM1vP5kyz9Dz3TmzYSDeZxCPXGpG-pGN93Zdxcw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update 68k Mac entry
To: Finn Thain <fthain@telegraphics.com.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Finn,

On Sat, Dec 5, 2020 at 4:49 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> Two files under drivers/macintosh are actually m68k-only. I think that
> patches for these files should be reviewed in the appropriate forum and
> merged via the appropriate tree, rather than falling to the powerpc
> maintainers to deal with. Update the "M68K ON APPLE MACINTOSH" section
> accordingly.
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Joshua Thompson <funaho@jurai.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-m68k@lists.linux-m68k.org
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k for-v5.11 branch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
