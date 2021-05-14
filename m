Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 448E23810F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 21:33:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhdxK23PYz3bnl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 05:33:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YWd0pM7Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YWd0pM7Q; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhdws4gGpz2xyG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 05:33:17 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C64EA61462
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 19:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621020793;
 bh=sx6RnRTXG/HkUYbZ66bme4Ihr6YCIRDKjve7uvyFxHE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YWd0pM7Qd2nlsjaPkIRTJ5udrslEU7xXsi06oSIcsLnD1V5WI8/TfAXneH0KcFY8T
 nBogmfBN+h/aFpslo+cnHvQ8Rwy08zH6Al87wLwvEeafd8WdEh0bV2oU8Cs9HWFjrK
 +IFBO7yhwQcamBDl971iDFD98TuuMvZkClT3fAc1DSUUu1vK944smhZ5eh7CfPcWBO
 Rp0VR0a5L/yQ7yiyoruUe+GAynieMsFb0kVsGIexodXAUvw1AZ088wq671w1OAOunx
 B58Vfuz8+MbbnSDHy1vpfgrsnEOb+y4bbkL2rk3FazqvsV6EVs434a0RQz0uHRaA/x
 mhTO/Nwft9bdw==
Received: by mail-wr1-f47.google.com with SMTP id h4so275713wrt.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 12:33:13 -0700 (PDT)
X-Gm-Message-State: AOAM532DWmDaBbgfSROyszlwmEEHH4yTU7a4YT4bkUx+QM3S8SznI/Rf
 anshyVoXUClIWzZjZbz0OuDjbYraXTCvgyi4Veg=
X-Google-Smtp-Source: ABdhPJwCQ1F0CBUPxIsNYOfoW01L5a5C+nTIh8ZsdXu8MlaXBtReQ+mP8NigDxBA9czvxj+u/ONPbc8umn+Z9hfl/zY=
X-Received: by 2002:a5d:6dc4:: with SMTP id d4mr62128225wrz.105.1621020781452; 
 Fri, 14 May 2021 12:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210514100106.3404011-1-arnd@kernel.org>
 <CAHk-=whGObOKruA_bU3aPGZfoDqZM1_9wBkwREp0H0FgR-90uQ@mail.gmail.com>
In-Reply-To: <CAHk-=whGObOKruA_bU3aPGZfoDqZM1_9wBkwREp0H0FgR-90uQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 14 May 2021 21:31:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2q8zEy+eQ1RJHT7UbD9E+KofKNjKxMHJ6hreHN0J_mEQ@mail.gmail.com>
Message-ID: <CAK8P3a2q8zEy+eQ1RJHT7UbD9E+KofKNjKxMHJ6hreHN0J_mEQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] Unify asm/unaligned.h around struct helper
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 "Richard Russon \(FlatCap\)" <ldm@flatcap.org>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-sparc <sparclinux@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arch <linux-arch@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 the arch/x86 maintainers <x86@kernel.org>, James Morris <jmorris@namei.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jakub Kicinski <kuba@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Jonas Bonn <jonas@southpole.se>, Ganapathi Bhat <ganapathi017@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-block <linux-block@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Borislav Petkov <bp@alien8.de>,
 Stafford Horne <shorne@gmail.com>, Kalle Valo <kvalo@codeaurora.org>,
 Jens Axboe <axboe@kernel.dk>, John Johansen <john.johansen@canonical.com>,
 Xinming Hu <huxinming820@gmail.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-ntfs-dev@lists.sourceforge.net,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 14, 2021 at 7:32 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, May 14, 2021 at 3:02 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > I've included this version in the asm-generic tree for 5.14 already,
> > addressing the few issues that were pointed out in the RFC. If there
> > are any remaining problems, I hope those can be addressed as follow-up
> > patches.
>
> This continues to look great to me, and now has the even simpler
> remaining implementation.
>
> I'd be tempted to just pull it in for 5.13, but I guess we don't
> actually have any _outstanding_ bug in this area (the bug was in our
> zlib code, required -O3 to trigger, has been fixed now, and the biggy
> case didn't even use "get_unaligned()").
>
> So I guess your 5.14 timing is the right thing to do.

Yes, I think that's best, just in case something does come up. While all the
object code I looked at does appear better, this is one of those areas that
can be hard to pinpoint if we hit a regression in a particular combination of
architecture+compiler+source file.

I have pushed a signed tag to
https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
asm-generic-unaligned-5.14

and plan to send that in the 5.14 merge window unless you decide to
take it now after all.

        Arnd
