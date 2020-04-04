Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF719E7E5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 00:29:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48vs0m3dCpzDrgQ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 08:29:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com
 (client-ip=209.85.166.72; helo=mail-io1-f72.google.com;
 envelope-from=3caajxgkbajsntuf5gg9m5kkd8.bjjbg9pn9m7jio9io.7jh@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=syzkaller.appspotmail.com
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48vrfH1H6WzDqR0
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 08:13:06 +1000 (AEST)
Received: by mail-io1-f72.google.com with SMTP id s1so1783825iow.18
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Apr 2020 15:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=bt/1x8EyTmuUIcBDvOOh7SgGrhssirnD/BYB/4tXepA=;
 b=agSnaOp0CP71HiMPIPAbSXY5T/vjfZ3ury/XCWAdjPvHxxtbJfT4Tqgn/3YdjVVNqm
 0K3S09wHF7YYjY3razurNeCZy2K/+AAdBy+r06eYiucxBNbzaGR71VxC7rv64f7/Wtid
 PFq9+nAR8Nqb2abKQ/0+14HYkSFgqRYyOl/gi0Z6TLBoKq10RhTPHn6O/BP+pg19rq1P
 a+rY5QSdqLbIzZZLhAhLikq1uWoTV+hYbzajUrq5/j81jReP57PTHmI5DpAAEz1U881x
 BB4AS19ZeJia2GeRfEpFtd5sZWMqsI9Z/DYErVLPEUcO09lGqzx7CEqKcmT/97lG7t26
 IwbA==
X-Gm-Message-State: AGi0PubK9LYNYJDIUK4ChDN+Y9Y4M46m0UkUzTf/vtyIDiRJoQMAd5Ug
 Yrb+c8KC7Q1Gqzlwhwu909RS2AUWr0fqE4iaOfeyX6POriMG
X-Google-Smtp-Source: APiQypKcRyVBeoiDWCvZb7tswqkam9aNeXGh+t+Ou4uEcCLuNQD/97y44iDElTiQg68XVts3nXfySRjVZo8xHnjk4aisV+oXHT50
MIME-Version: 1.0
X-Received: by 2002:a92:8183:: with SMTP id q3mr14989618ilk.43.1586038384055; 
 Sat, 04 Apr 2020 15:13:04 -0700 (PDT)
Date: Sat, 04 Apr 2020 15:13:04 -0700
In-Reply-To: <20200404183707.GK45598@mit.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007b5aea05a27e5637@google.com>
Subject: Re: WARNING in ext4_da_update_reserve_space
From: syzbot <syzbot+67e4f16db666b1c8253c@syzkaller.appspotmail.com>
To: a@unstable.cc, adilger.kernel@dilger.ca, 
 b.a.t.m.a.n@diktynna.open-mesh.org, benh@kernel.crashing.org, 
 davem@davemloft.net, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, mareklindner@neomailbox.ch, mpe@ellerman.id.au, 
 muriloo@linux.ibm.com, netdev@vger.kernel.org, paulus@samba.org, 
 sw@simonwunderlich.de, syzkaller-bugs@googlegroups.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 05 Apr 2020 08:28:01 +1000
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

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger crash:

Reported-and-tested-by: syzbot+67e4f16db666b1c8253c@syzkaller.appspotmail.com

Tested on:

commit:         54d3adbc ext4: save all error info in save_error_info() an..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
kernel config:  https://syzkaller.appspot.com/x/.config?x=4527d1e2fb19fd5c
dashboard link: https://syzkaller.appspot.com/bug?extid=67e4f16db666b1c8253c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Note: testing is done by a robot and is best-effort only.
