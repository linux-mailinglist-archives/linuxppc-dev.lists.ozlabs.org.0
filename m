Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610CE798C2D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 20:05:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rj3t71wBNz3cSn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 04:05:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com (client-ip=209.85.210.197; helo=mail-pf1-f197.google.com; envelope-from=3lml7zakbaa87dezp00t6p44xs.v33v0t97t6r328t28.r31@m3kw2wvrgufz5godrsrytgd7.apphosting.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rj3sb3fycz3c4g
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 04:04:33 +1000 (AEST)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-68a2d9a6b5fso3321447b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Sep 2023 11:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694196270; x=1694801070;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0lAvPiHpQzYJH2/Evbqeae0jEIobBXd5mkIT/JR5mjU=;
        b=ryFwWIS82Mvfx6xcPMHFb96thXkjQFFmicnYW/M60hP61dTRnP+a7WqvlI3xsg8y9P
         FhWeNCguqbw07rH465MLD4fQfsSKd0zNmtKLvUdDqqKXjrd5kKbZVVZRDY5yf7jXfXzR
         L1eon8jHpJEDDKmxBc3aRiohj76hNrhmB0OZcocPdn8c2BC0s3oKYsV6zPK8/9Ym/3W3
         55oseke9R+95Oqtx5VpCPi22hWH3gAJEVWhC4uswFmaPioGYY08WxLA4pa0tgsswypdp
         IRRe+rH6W+iRiD410z96iE6y768Jy6qVL0oFzhVoHQ+Ay4pgmmDe8Y0IKodB3zx8lqF5
         Nznw==
X-Gm-Message-State: AOJu0YykeoTIrwJ07M/k3B3/KMDmXc3qCzTdtstYljRHnttLxSQcSN0U
	3u72U0+VxQniw8UeWD9SN74HRvyWIH8hm9I/OdlBr4cFUNSX
X-Google-Smtp-Source: AGHT+IFG6oZqBOayFovKE0NVKEQ0Xnwtd+Nskzg2qKPXIoko6vfMv+elInHkBKWJh6QlQckbllDdPD2ESA+Mlnx+N1cgB86kBYBd
MIME-Version: 1.0
X-Received: by 2002:a05:6a00:80c:b0:68a:3c7a:128c with SMTP id
 m12-20020a056a00080c00b0068a3c7a128cmr1357477pfk.2.1694196270440; Fri, 08 Sep
 2023 11:04:30 -0700 (PDT)
Date: Fri, 08 Sep 2023 11:04:30 -0700
In-Reply-To: <000000000000f392a60604a65085@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e127ec0604dcce27@google.com>
Subject: Re: [syzbot] [mm?] kernel BUG in vma_replace_policy
From: syzbot <syzbot+b591856e0f0139f83023@syzkaller.appspotmail.com>
To: 42.hyeyoo@gmail.com, Liam.Howlett@Oracle.com, agordeev@linux.ibm.com, 
	akpm@linux-foundation.org, alexghiti@rivosinc.com, aou@eecs.berkeley.edu, 
	borntraeger@linux.ibm.com, cgroups@vger.kernel.org, 
	christophe.leroy@csgroup.eu, damon@lists.linux.dev, david@redhat.com, 
	eadavis@sina.com, frankja@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	gor@linux.ibm.com, hannes@cmpxchg.org, hca@linux.ibm.com, 
	imbrenda@linux.ibm.com, jeeheng.sia@starfivetech.com, jglisse@redhat.com, 
	kvm@vger.kernel.org, leyfoon.tan@starfivetech.com, linmiaohe@huawei.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	mason.huo@starfivetech.com, mhocko@kernel.org, mpe@ellerman.id.au, 
	muchun.song@linux.dev, naoya.horiguchi@nec.com, npiggin@gmail.com, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, roman.gushchin@linux.dev, 
	sebastian.reichel@collabora.com, shakeelb@google.com, sj@kernel.org, 
	surenb@google.com, svens@linux.ibm.com, syzkaller-bugs@googlegroups.com, 
	willy@infradead.org
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

commit 49b0638502da097c15d46cd4e871dbaa022caf7c
Author: Suren Baghdasaryan <surenb@google.com>
Date:   Fri Aug 4 15:27:19 2023 +0000

    mm: enable page walking API to lock vmas during the walk

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11fd2348680000
start commit:   7733171926cc Merge tag 'mailbox-v6.6' of git://git.linaro...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13fd2348680000
console output: https://syzkaller.appspot.com/x/log.txt?x=15fd2348680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b273cdfbc13e9a4b
dashboard link: https://syzkaller.appspot.com/bug?extid=b591856e0f0139f83023
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15d4ecd0680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1055c284680000

Reported-by: syzbot+b591856e0f0139f83023@syzkaller.appspotmail.com
Fixes: 49b0638502da ("mm: enable page walking API to lock vmas during the walk")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
