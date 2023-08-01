Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC876AD4A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 11:27:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFVBz1nWbz301R
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 19:27:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com (client-ip=209.85.210.69; helo=mail-ot1-f69.google.com; envelope-from=3-s_izakbaokdjkvlwwpclaato.rzzrwpfdpcnzyepye.nzx@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFVBR6D4rz2yDd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 19:27:25 +1000 (AEST)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6b9c744df27so8035271a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 02:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690882042; x=1691486842;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C27ET6loiS4a597fDoDvp82lhEfceWexZEaZmg7rns4=;
        b=XZBZIX3MTahXXsTVHYNQNZJZhzSniA8zgKKyRU/x1vjYu0qaV4rj/loU7S2L9A6TtS
         xLN0n7bxTUKK0YfFJzyf8xuZCtoi4MtNh4L1hOplr6zBJqKevPdf8qszQIYyB0AbwYpS
         xEMFsETRxIlLXOjMEmvoIA+tShjLuI80uphQtGNpD3R6Cc0d9ysBOdyDx2KvT5e6nTjC
         7zL+TfXtkc9sPx+Z0WptoE4jyBHZq8DhUVxJWrtiHI/lRx8XD4qAFSXIxnFdI5+lG9UQ
         Ix+KdjcTdiiJJr9KTBPPAigTyNT4Kj/Jnndsq4cmgLsDF5gcIrS7eyqY4Rem7Ab0Sml4
         O2jA==
X-Gm-Message-State: ABy/qLb6bo8pj+BgVxLiMDRP8Hh5Q6cIoyHh0V/cSncj3v9foP8YtBSZ
	x6TE/Vy/gSIHp5pTEdFCYEqAtR+DwFKxnVQt4kqz7gU2CDcR
X-Google-Smtp-Source: APBJJlF+q8vTSApLRQ0DsriyRIAi3yXyfIxfMoDXTZLqGmWRh5yGZx5GzEG93qqQR4NAAm6evBr0m5ieLt5iW0rGmHW5H8t1P6Mn
MIME-Version: 1.0
X-Received: by 2002:a9d:6c8d:0:b0:6b7:1e75:18e with SMTP id
 c13-20020a9d6c8d000000b006b71e75018emr14153717otr.2.1690882042749; Tue, 01
 Aug 2023 02:27:22 -0700 (PDT)
Date: Tue, 01 Aug 2023 02:27:22 -0700
In-Reply-To: <000000000000fac82605ee97fb72@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000083e9d60601d927a0@google.com>
Subject: Re: [syzbot] [btrfs?] WARNING in btrfs_free_reserved_data_space_noquota
From: syzbot <syzbot+adec8406ad17413d4c06@syzkaller.appspotmail.com>
To: axboe@kernel.dk, christophe.leroy@csgroup.eu, clm@fb.com, dsterba@suse.com, 
	josef@toxicpanda.com, linux-btrfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	mpe@ellerman.id.au, npiggin@gmail.com, shuah@kernel.org, 
	syzkaller-bugs@googlegroups.com, torvalds@linux-foundation.org, 
	ye.xingchen@zte.com.cn
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

syzbot suspects this issue was fixed by commit:

commit 487c20b016dc48230367a7be017f40313e53e3bd
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Mar 30 21:53:51 2023 +0000

    iov: improve copy_iovec_from_user() code generation

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17cfdf19a80000
start commit:   4bdec23f971b Merge tag 'hwmon-for-v6.3-rc4' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=acdb62bf488a8fe5
dashboard link: https://syzkaller.appspot.com/bug?extid=adec8406ad17413d4c06
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11bf8bcec80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=153d4f75c80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: iov: improve copy_iovec_from_user() code generation

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
