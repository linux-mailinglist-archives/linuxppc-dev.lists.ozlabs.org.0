Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1371CD2D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 09:40:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LCX334lpzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 17:40:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LCV70gFlzDqBv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 17:38:38 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id c3so6764471otp.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 00:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aNoZEZ57CrI9/0G/8w94E+hwvPuAlWx38MUKzKDQBhc=;
 b=iTvGdufCEz91H3oEW4vFCCrZedblqsr7PAuk1ppkuMsAX8GXizCdMtRxJG5bEDJTuI
 +PFSp3bAViyBZR2HCyCdGySycX91WTo1gr9eeH/IvU8TgcQy5PqPtx+c7VN7Fx2ZJqGy
 I8VrTv4r286vAqd7IhsPq8KozcJ+JQTbKEXgxoqIH2EJWMO7aSnl7x+0tqR2LxUhxy/r
 RlCGpfOTY1v0mNvYmZ3G77eFBgwiU+pClYKFejE4ezZgCsD2xmdwjqbx9QF36iCIzaEt
 fcrwTOX/c6N3LEzyeNaYymL2e0isvAXU0XgkSV4YwSKobBFgLj89GWSBPTPJz1VLq3ML
 6osA==
X-Gm-Message-State: AGi0PuayVb/3PuSps6gA/n3D7FzX/cPkodGr6kQYDpgAeJtm4VPrx/8P
 51tbHMNXfG6mfX7TPoVlqQOI+sHXjZejUodJMcg=
X-Google-Smtp-Source: APiQypLoBt4t5N0l098m7w2IDSx4KyTJchn19q3bmw0+va1jJpmuNmPwj2oo62ETWA1hKW2oSkbgdMOlQ069s61RJoI=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr10874719otl.107.1589182716617; 
 Mon, 11 May 2020 00:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200510075510.987823-1-hch@lst.de>
 <20200510075510.987823-27-hch@lst.de>
In-Reply-To: <20200510075510.987823-27-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2020 09:38:25 +0200
Message-ID: <CAMuHMdUTAA_mkS-KY70ykr-n-UJxfqM09EYcVQVKA4+FSkC1Og@mail.gmail.com>
Subject: Re: [PATCH 26/31] m68k: implement flush_icache_user_range
To: Christoph Hellwig <hch@lst.de>
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 10, 2020 at 9:57 AM Christoph Hellwig <hch@lst.de> wrote:
> Rename the current flush_icache_range to flush_icache_user_range as
> per commit ae92ef8a4424 ("PATCH] flush icache in correct context") there
> seems to be an assumption that it operates on user addresses.  Add a
> flush_icache_range around it that for now is a no-op.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
