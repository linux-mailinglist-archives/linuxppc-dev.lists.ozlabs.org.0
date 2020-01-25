Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9F1493C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 07:18:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 484QnR69jqzDqgd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jan 2020 17:18:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=tony.luck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iY+grmAP; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 484Qll3GFwzDqgC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2020 17:17:20 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id 21so4418645qky.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 22:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tsg/r/0YkW+EwvqQByRlznkOGOX8nMWqFwoWlOGNvn8=;
 b=iY+grmAPc30j6s7U+lRPizYmH7hV2PAWEKR71dLE2dmN6yU1rFMyesbZUFSMOauaVf
 AQ9cpT68ECqVY+efd5oKkLJvdlIt9sZXp1sT7hhWx7cKC3Z0kVr+qI6rJzJHuS7+OAYT
 9tP8OzS97Jt32QTS1CFNMlc2IzGOFYPry2npjIJ+lyjXTv+Qg1tlLW3anAB8VyEs0WHd
 b1Q+rh7P8cnrvzw0V6HrjKy4O80PZNQnYnI1jN1Xd2QA1VsboWQ9oZ6Bv8rfkVJAhaIK
 22EQOoPEm6OaRMU3O4rOgxpn0I1J4f5p8qRuDarvNU+gH14FZqOSSJ0iow23txsL6/SX
 NIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tsg/r/0YkW+EwvqQByRlznkOGOX8nMWqFwoWlOGNvn8=;
 b=kvgvzq5DJa7U48vdzuQLrm/8R2ilrg3tQTGLmI5wCT24ftcL55W2rofnzmV2vAu5Em
 KoweY2ZOjuYW66Yf9DH/FN2GZ9El2JKy40BzwlQ7XkPNpNAYM4Q9zRip6iDWF3k+ydtg
 hB5h3WuyxeZeP10yDKN7sTSquMUh2t9EsfHwFOPXUJxxnQrWbw6jc6V6h1RDkHC0uYbs
 n2M6ftzG2rVfs/kBouLtBIr85IOTdispkfi9x/Yx/eEXvzhmHsBJicIo4TRQ73N8AeYY
 JWoCgaIJzY6kfyODIm6wPaUTWvUw3OKuIPDMEntWbtq0BTAKXcleK1E2tB4OPSmZ3He4
 KP1Q==
X-Gm-Message-State: APjAAAV+tuGOWkgeio4MCvMepHw7zxNIMeSXJuQSOFhH0nplLI2tevJ2
 cNx47SdaFZXiZMM9PnfsCGm3JM3BggZWpBgwNCc=
X-Google-Smtp-Source: APXvYqzXMH2ecc4WrNRTSRqMoJiY5NdwoAvLhz3IqzcpCpum0aGfk2zEnLWmJG13dZn/DF6tLcJ+3/2VAi47wkEYVVY=
X-Received: by 2002:a05:620a:15e9:: with SMTP id
 p9mr6924393qkm.490.1579933034407; 
 Fri, 24 Jan 2020 22:17:14 -0800 (PST)
MIME-Version: 1.0
References: <fed4f49349913cb6739dac647ba6a61d56b989d2.1579783936.git.christophe.leroy@c-s.fr>
 <e11a8f0670251267f87e3114e0bdbacb1eb72980.1579783936.git.christophe.leroy@c-s.fr>
 <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
In-Reply-To: <CAHk-=wg4HEABOZdjxMzbembNmxs1zYfrNAEc2L+JS9FBSnM8JA@mail.gmail.com>
From: Tony Luck <tony.luck@gmail.com>
Date: Fri, 24 Jan 2020 22:17:03 -0800
Message-ID: <CA+8MBb++x2onyy0obGKc=3exTCekWRJ98xhQZuvHMQbFvV7zCw@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] uaccess: Tell user_access_begin() if it's for a
 write or not
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Linux-MM <linux-mm@kvack.org>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 23, 2020 at 10:03 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> We used to have a read/write argument to the old "verify_area()" and
> "access_ok()" model, and it was a mistake. It was due to odd i386 user
> access issues. We got rid of it. I'm not convinced this is any better
> - it looks very similar and for odd ppc access issues.

If the mode (read or write) were made visible to the trap handler, I'd
find that useful for machine check recovery.  If I'm in the middle of a
copy_from_user() and I get a machine check reading poison from a
user address ... then I could try to recover in the same way as for the
user accessing the poison (offline the page, SIGBUS the task). But if
the poison is in kernel memory and we are doing a copy_to_user(), then
we are hosed (or would need some more complex recovery plan).

[Note that we only get recoverable machine checks on loads... writes
are posted, so if something goes wrong it isn't synchronous with the store
instruction that initiated it]

-Tony
