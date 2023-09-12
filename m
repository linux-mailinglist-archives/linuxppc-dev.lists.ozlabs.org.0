Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F70A79C1B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 03:35:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rl5k31BFfz3c9G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 11:35:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com (client-ip=209.85.215.199; helo=mail-pg1-f199.google.com; envelope-from=3k8d_zakbangmste4ff8l4jjc7.aiiaf8om8l6ihn8hn.6ig@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rl5jW58HCz3c1H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 11:34:38 +1000 (AEST)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-57787e29037so1188013a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Sep 2023 18:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694482475; x=1695087275;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=99pQarvPvV1vI/NZ6ucA6oInnil7+zjro6ya8tjs7F0=;
        b=ohrcj84C1BdnLBP/kwKwc7CIsG0PWm9yESdjW+5IDBvrhO3f3CpJBCl0NEuCAP9y/k
         KlcXqlucZHi5RJcB2KtsA+Iby4UAWnJwwe7t9CNDQAfqo5XLxV8d2AvydTqfY7AMTqdu
         rfBGdplPJcp41ZkjxAkaaXoys/z9paZA1UJn1Y/a0MlhtrNSdMKBEOKpqDbZSMXsldJ6
         0gAgxMiLjsuYCtPy05GCu4I6RfpIRII6VP5sBbLBcA4cEuMVa0/anEYtPvnBlT2DvOK6
         p11sYPQmZugF0C5ec6kWVW2keQPYkgcknkBnOC00B+YVYukgiHsxpYBv5vSqEFxJX9LA
         zPQQ==
X-Gm-Message-State: AOJu0YzjgTrPGmW8/pSmsvgecWVeUJZI+viWC/EsfpMZPXRpPSw/DxoJ
	TfID6raMemqBJaG8UVThVcvkuDMQgzopLpV7KuRgtfPJf3uz
X-Google-Smtp-Source: AGHT+IG/uk4ab+/o9mpNiJ736IHnt52ha05CAPfdJJp8V9PvPQM77+mhbrRmd2FHH0Pcu4/Cy1TV/hBfNSQjDknGsfqZNtweOeZj
MIME-Version: 1.0
X-Received: by 2002:a17:90a:e647:b0:262:ffa8:f49d with SMTP id
 ep7-20020a17090ae64700b00262ffa8f49dmr2924273pjb.9.1694482475506; Mon, 11 Sep
 2023 18:34:35 -0700 (PDT)
Date: Mon, 11 Sep 2023 18:34:35 -0700
In-Reply-To: <0000000000003afcb4060135a664@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000007e38806051f72e2@google.com>
Subject: Re: [syzbot] [kernel?] general protection fault in arch_tlbbatch_flush
From: syzbot <syzbot+5759bce381cb6f9c51fa@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, aneesh.kumar@linux.ibm.com, apopple@nvidia.com, 
	arnd@arndb.de, bgray@linux.ibm.com, bp@alien8.de, catalin.marinas@arm.com, 
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, luto@kernel.org, mingo@redhat.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, will@kernel.org, 
	x86@kernel.org
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

syzbot has bisected this issue to:

commit 75c400f82d347af1307010a3e06f3aa5d831d995
Author: Alistair Popple <apopple@nvidia.com>
Date:   Wed Jul 19 12:18:44 2023 +0000

    mmu_notifiers: call invalidate_range() when invalidating TLBs

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14bd6d0c680000
start commit:   c58c49dd8932 Add linux-next specific files for 20230720
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16bd6d0c680000
console output: https://syzkaller.appspot.com/x/log.txt?x=12bd6d0c680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=27d64413bce3a1d8
dashboard link: https://syzkaller.appspot.com/bug?extid=5759bce381cb6f9c51fa
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=177f484ea80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12e4a4e6a80000

Reported-by: syzbot+5759bce381cb6f9c51fa@syzkaller.appspotmail.com
Fixes: 75c400f82d34 ("mmu_notifiers: call invalidate_range() when invalidating TLBs")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
