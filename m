Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEDD24340C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 08:38:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRxjF0tLjzDqb0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 16:38:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com
 (client-ip=209.85.166.198; helo=mail-il1-f198.google.com;
 envelope-from=3elo0xwkbafchno9zaa3gzee72.5dd5a3jh3g1dci3ci.1db@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=syzkaller.appspotmail.com
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRt7D1nYtzDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 13:57:07 +1000 (AEST)
Received: by mail-il1-f198.google.com with SMTP id l71so3416206ild.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 20:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=818BGdNc1wvnUSaZirTtzYWcZvgSsVpOYq9GYar7pzo=;
 b=ubf+mY1RnI/TWqtFiJLjExqzSoA225vtQH7IC0+hUAqwW2sfCRKkGduQ13zMt8H/hO
 aqLLNtqykx4VNH3y050l+6SXJ5yllDnOG7237LW8yFYtpNyH6MPaaPNQUCDtfPJFnKYY
 iJcVCAMjD/We35RlGCgGwWMSVwYj2g9zQj3Q5rFHcIZQQTfdFmvG9953mH6MNDJFElqF
 Z0RL1YzQOnBk+3j1m9lCWkF5kSXE9y7acwXfi786Fg8iIU8i6ap9aucbC5BxwLv2L+Ur
 SNXsA8x6JpssDiqRW2qW6em3dlWTx0ireiI9lMYi9uIE5sg3xc5HYPZUMt8x1xTn7fJ+
 sr5w==
X-Gm-Message-State: AOAM532BMe8achQ+JaqPU6sUQgc/V2c7b4Bjz3NIGScQKln7oO3yxq/4
 tNKmSTZogaQaGIq2s6mF+6xHHtEjFgidtemaWY+rncoIIU91
X-Google-Smtp-Source: ABdhPJxyW2a+ykA+fUEC8D6mFHSlTwIHpmNmLpjhnj+1O5R02Uizom5WTc4bNxK6AVfdyCvjg+GBZ9zseGC71qHLHgVFHLNbJAN8
MIME-Version: 1.0
X-Received: by 2002:a92:874a:: with SMTP id d10mr2849478ilm.273.1597291024427; 
 Wed, 12 Aug 2020 20:57:04 -0700 (PDT)
Date: Wed, 12 Aug 2020 20:57:04 -0700
In-Reply-To: <00000000000084b59f05abe928ee@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001d3cbb05acba4cc2@google.com>
Subject: Re: INFO: task hung in pipe_release (2)
From: syzbot <syzbot+61acc40a49a3e46e25ea@syzkaller.appspotmail.com>
To: James.Bottomley@HansenPartnership.com, amanieu@gmail.com, arnd@arndb.de, 
 benh@kernel.crashing.org, bfields@fieldses.org, borntraeger@de.ibm.com, 
 bp@alien8.de, catalin.marinas@arm.com, chris@zankel.net, christian@brauner.io, 
 corbet@lwn.net, cyphar@cyphar.com, dalias@libc.org, davem@davemloft.net, 
 deller@gmx.de, dvyukov@google.com, fenghua.yu@intel.com, geert@linux-m68k.org, 
 gor@linux.ibm.com, heiko.carstens@de.ibm.com, hpa@zytor.com, 
 ink@jurassic.park.msu.ru, jcmvbkbc@gmail.com, jhogan@kernel.org, 
 jlayton@kernel.org, kvalo@codeaurora.org, linux-alpha@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
 linux@armlinux.org.uk, linux@dominikbrodowski.net, 
 linuxppc-dev@lists.ozlabs.org, luis.f.correia@gmail.com, luto@kernel.org, 
 martink@posteo.de, mattst88@gmail.com, ming.lei@canonical.com, 
 ming.lei@redhat.com, mingo@redhat.com, monstr@monstr.eu
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 13 Aug 2020 16:35:37 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

syzbot has bisected this issue to:

commit fddb5d430ad9fa91b49b1d34d0202ffe2fa0e179
Author: Aleksa Sarai <cyphar@cyphar.com>
Date:   Sat Jan 18 12:07:59 2020 +0000

    open: introduce openat2(2) syscall

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=164e716a900000
start commit:   6ba1b005 Merge tag 'asm-generic-fixes-5.8' of git://git.ke..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=154e716a900000
console output: https://syzkaller.appspot.com/x/log.txt?x=114e716a900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=84f076779e989e69
dashboard link: https://syzkaller.appspot.com/bug?extid=61acc40a49a3e46e25ea
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=142ae224900000

Reported-by: syzbot+61acc40a49a3e46e25ea@syzkaller.appspotmail.com
Fixes: fddb5d430ad9 ("open: introduce openat2(2) syscall")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
