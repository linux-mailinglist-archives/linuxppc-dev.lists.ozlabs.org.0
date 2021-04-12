Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A3435C2F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 12:04:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJkq72jrCz3btG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 20:04:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJkpn2PKYz309w
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 20:04:00 +1000 (AEST)
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MqbDs-1ls2yD1yNs-00mYH0 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr
 2021 12:03:57 +0200
Received: by mail-wm1-f51.google.com with SMTP id p19so6455572wmq.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 03:03:56 -0700 (PDT)
X-Gm-Message-State: AOAM532CDlpIUzWGtnbOPAE5pZfeY88Yvl1eKGI+s4iaI+CeCVAwlOmC
 rwvqbU5dTBU4VrLBDh9fmCUsIx/Uy7P+jSXfPlY=
X-Google-Smtp-Source: ABdhPJz1GJVeZO+sIN2KpJ8Wn8donSpdvAqFqtcymRYAYBYot2xnOavBT3UwXj8nuP92Z994bQxnP3scv1qVkv9AVF0=
X-Received: by 2002:a7b:c245:: with SMTP id b5mr25489890wmj.120.1618221836576; 
 Mon, 12 Apr 2021 03:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210412085545.2595431-1-hch@lst.de>
In-Reply-To: <20210412085545.2595431-1-hch@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 12 Apr 2021 12:03:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a38qgkjkh4+fDKp4TufL+2_W-quZBFK9pJFf7wXP=84xQ@mail.gmail.com>
Message-ID: <CAK8P3a38qgkjkh4+fDKp4TufL+2_W-quZBFK9pJFf7wXP=84xQ@mail.gmail.com>
Subject: Re: consolidate the flock uapi definitions
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:LaH7q6QRgmrG4X/zcz8Nm7H8gTdtC62kAn7Ps6JbDtQ5K7FlcVk
 uOAOuwxNHbSxjgwjA6Mgv8OLCW65SBZEmF13xfsFb/suEGL8j6DcNPMBfYeGYhPn8mqVrUS
 ZnBBzNUeEQaTqWLA0l6DGif0lITmwRuxjJ310lkmDJmNOa0yYnOGxofueGxYoys2bwhkqsA
 aPTKFmijw5HcQJSK3Xcpg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:paViTrMBc7s=:cWN9qWcHTC4rZj12LYf9Sf
 KBFrU9Qk4d7RiDvKu0oI0MxVOsR4OEjt93VWw17Sb+3BM7rDLA13EwbmgVitc0pPHkS7wRpvi
 yR6pNrLNu61L2DRqU22o62xxRbhr53xu2Cwb/1ryo64JU/f34lwu1+whFhZkpoGUqtgl/4SHx
 FmiRDd2ORTGRZE5r/b9UMQliLa/skc5tkJSHSur195f09viSlFSFfIT6tlapxddzfGMurTv2L
 8ehWCe3o7352TuUoQUscjiNTz8SmufdoZzrnZ1FFE18y11Q1r14yTPKN1XjxADzSFMydVemXQ
 l45k9IabPUqQR+V1k4idc5LI6iGs29A8VBg2vjJEqilA9ZvngEL8qpyQ/5UvvVpM0PwK9Rz6q
 hKRs0Pm7jcF5tZ+FsN8wWkLaaYKIOo5u4eDtav6AX09VicqDSJ+1oMjJ/PR+XO5DAuiOBjbml
 r968ovZ/hIoSMx0C5IuHu7rrO0R2WR+XgK2GvKv8iQa02+3LlsAJFRNZeA318wUHxlfgsUJ6J
 tbOknHQdu848cIndFwPwdkOlNYT/ksfXheRPDvkSvaTdg3lZW/EQKoO1ZBt4nhtldpOIIOxFs
 XhmBVAiYKzezO7EKzybPhRNVqcPoA83G8q
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 12, 2021 at 10:55 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> currently we deal with the slight differents in the various architecture
> variants of the flock and flock64 stuctures in a very cruft way.  This
> series switches to just use small arch hooks and define the rest in
> asm-generic and linux/compat.h instead.

Nice cleanup. I can merge it through the asm-generic tree if you like,
though it's a little late just ahead of the merge window.

I would not want to change the compat_loff_t definition to compat_s64
to avoid the padding at this time, though that might be a useful cleanup
for a future cycle.

        Arnd
