Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4472443A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 04:58:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSSnN4xNPzDqX7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 12:58:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com
 (client-ip=209.85.166.199; helo=mail-il1-f199.google.com;
 envelope-from=3kfw1xwkbagisyzkallerappid.googleusercontent.com@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=syzkaller.appspotmail.com
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSSfx2PkczDqg4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 12:53:08 +1000 (AEST)
Received: by mail-il1-f199.google.com with SMTP id b18so5689705ilh.16
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 19:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=HxfLWIdBAiPbucnwPKF3cZxaVC8QuNU2YTSLpVJCUKw=;
 b=K/gBO50FWjzFa+LDJH6f9o23wqC+mGGXTv2PKQuRZffK1miiwcSVy5npCQIqFwbhMo
 UcVk2sObbPxWQ2w/V3hiXPBl0fvrH4KElVyAHz+ubgafxAKhEjsxX88AtPdp6OSP8Pze
 SBfBTXr2CpFfr2SlytHIJ3n9BoK2He4v88LXGNJjPFid3slzwoqaUGYLAn5Z5Rgs1r0g
 QVwvWlVzNjDCAR66i02jlPzNYk1JOve2xHKFeJXd/QfSSFT+G5/UQ4gjTv6NdJADejz7
 OvJudiTyKAaJt48wKoF/EPAiV7EoQz9gxzE7lE2Z32La9G4/wz9wH0Wx0/JH68Ly7PHz
 ZLUg==
X-Gm-Message-State: AOAM533b7WQxiRHP4xLfuuyKp8gAi1IxH9yrZwc+AQAxxNa0agimNjAc
 4Jm7BeKuPvcDMvF30bB9WY3dghr3immLV2gtkejw43M82/Bh
X-Google-Smtp-Source: ABdhPJzryMeKOZ496e+GJ+LGFENqZB41wF2qyZpZxNTovBIXHQqXhdpw9rzntoAMQSMpzfINa/YRJDaIms05Hc/ZO6OshxSkwVFv
MIME-Version: 1.0
X-Received: by 2002:a92:dd04:: with SMTP id n4mr789973ilm.70.1597373585198;
 Thu, 13 Aug 2020 19:53:05 -0700 (PDT)
Date: Thu, 13 Aug 2020 19:53:05 -0700
In-Reply-To: <000000000000735f5205a5b02279@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001e967a05accd8573@google.com>
Subject: Re: BUG: unable to handle kernel paging request in fl_dump_key
From: syzbot <syzbot+9c1be56e9317b795e874@syzkaller.appspotmail.com>
To: benh@kernel.crashing.org, dalias@libc.org, davem@davemloft.net, 
 jhogan@kernel.org, jhs@mojatatu.com, jiri@mellanox.com, jiri@resnulli.us, 
 kuba@kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
 netdev@vger.kernel.org, paul.burton@mips.com, paulus@samba.org, 
 ralf@linux-mips.org, shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
 xiyou.wangcong@gmail.com, ysato@users.sourceforge.jp
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 14 Aug 2020 12:57:13 +1000
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

commit a51486266c3ba8e035a47fa96df67f274fe0c7d0
Author: Jiri Pirko <jiri@mellanox.com>
Date:   Sat Jun 15 09:03:49 2019 +0000

    net: sched: remove NET_CLS_IND config option

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17463509900000
start commit:   1ca0fafd tcp: md5: allow changing MD5 keys in all socket s..
git tree:       net
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14c63509900000
console output: https://syzkaller.appspot.com/x/log.txt?x=10c63509900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bf3aec367b9ab569
dashboard link: https://syzkaller.appspot.com/bug?extid=9c1be56e9317b795e874
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1062a40b100000

Reported-by: syzbot+9c1be56e9317b795e874@syzkaller.appspotmail.com
Fixes: a51486266c3b ("net: sched: remove NET_CLS_IND config option")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
