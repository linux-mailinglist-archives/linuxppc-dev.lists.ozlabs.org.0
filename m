Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5AF133D75
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 09:44:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47t2qp5pbyzDqQj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 19:44:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t2nz6Dj3zDq8B
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 19:43:17 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id k14so2841428otn.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 00:43:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7cWBGOss6IZmXIImkX09JkN+lqirutcjNONiaHMIXk4=;
 b=asYl2TELkz7vL3MfQ2PY9fOhl7zPPdDWTR1xQVEIJMWfxHC8vlv5STnIL/t3XpfPZl
 LcosLqVYGkcWODX4YbK2rVG4u2zw6OhSytz2oJUqLHAlo/gFT3jKh0YeTNiK43CC7zzn
 TzotXH0wEHb1KZqtE6UH72eFvLTdhBGCS41XN9rWbx+P+RBwevYXmVK8KJPHO3zT4eDi
 6IkHIN5w+7yTeqBtP/TVMPt0jUoYfSAmy0DKFMVio1FYbhXOXqr9YvKiqcbAZ5Q1/4Uo
 7yHdDArrxtW5MIegXDP2cyWEbwhW5TZaYkKMORIVMhc2c/cq11NUNjZVG22S2S5pEB9I
 wSpg==
X-Gm-Message-State: APjAAAXhnqLRFJiFkN+/l6Mz/mqPYIOnpTlasmB1+tHyK/WdxQxKENP/
 gvcgi610rq63oK7yaWbz/sKdmMvB7cHtMx8xfeM=
X-Google-Smtp-Source: APXvYqyLwchytFfBRcGzmYLq5q4p5hvwH1AjnwV9nNk5cX7+q/Njb59ahRoMRaX1Y0RAyipVtDWx7V8ZzLixl6z6dho=
X-Received: by 2002:a9d:6a84:: with SMTP id l4mr3302303otq.145.1578472995351; 
 Wed, 08 Jan 2020 00:43:15 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
In-Reply-To: <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2020 09:43:04 +0100
Message-ID: <CAMuHMdV=-m-eN4rOa=XQhk2oBDZZwgXXMU6RMVQRVsc6ALyeoA@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Jon Mason <jdmason@kudzu.us>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, alpha <linux-alpha@vger.kernel.org>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Wed, Jan 8, 2020 at 9:35 AM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
> Le 08/01/2020 =C3=A0 09:18, Krzysztof Kozlowski a =C3=A9crit :
> > On Wed, 8 Jan 2020 at 09:13, Geert Uytterhoeven <geert@linux-m68k.org> =
wrote:
> >> On Wed, Jan 8, 2020 at 9:07 AM Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
> >>> On Tue, Jan 7, 2020 at 5:53 PM Krzysztof Kozlowski <krzk@kernel.org> =
wrote:
> >>>> The ioread8/16/32() and others have inconsistent interface among the
> >>>> architectures: some taking address as const, some not.
> >>>>
> >>>> It seems there is nothing really stopping all of them to take
> >>>> pointer to const.
> >>>
> >>> Shouldn't all of them take const volatile __iomem pointers?
> >>> It seems the "volatile" is missing from all but the implementations i=
n
> >>> include/asm-generic/io.h.
> >>
> >> As my "volatile" comment applies to iowrite*(), too, probably that sho=
uld be
> >> done in a separate patch.
> >>
> >> Hence with patches 1-5 squashed, and for patches 11-13:
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > I'll add to this one also changes to ioreadX_rep() and add another
> > patch for volatile for reads and writes. I guess your review will be
> > appreciated once more because of ioreadX_rep()
>
> volatile should really only be used where deemed necessary:
>
> https://www.kernel.org/doc/html/latest/process/volatile-considered-harmfu=
l.html
>
> It is said: " ...  accessor functions might use volatile on
> architectures where direct I/O memory access does work. Essentially,
> each accessor call becomes a little critical section on its own and
> ensures that the access happens as expected by the programmer."

That is exactly the use case here: all above are accessor functions.

Why would ioreadX() not need volatile, while readY() does?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
