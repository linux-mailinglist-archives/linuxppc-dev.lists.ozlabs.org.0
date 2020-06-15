Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3D11F9AFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 16:54:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lvW73xLdzDqcL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 00:54:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 4483 seconds by postgrey-1.36 at bilbo;
 Tue, 16 Jun 2020 00:46:44 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lvKw0P1jzDqXb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 00:46:42 +1000 (AEST)
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N3Kc8-1ikfHs3Spm-010IRt for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun
 2020 16:46:35 +0200
Received: by mail-qt1-f169.google.com with SMTP id u17so12791121qtq.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 07:46:33 -0700 (PDT)
X-Gm-Message-State: AOAM532r3K2YF2JpZVRedc+dSJLmcFOQdcgqauesFi2hw+jc8sQj2wSP
 eF54n9Qrfc749+K8g7aMrOExB9B/uHiF8W1zpso=
X-Google-Smtp-Source: ABdhPJywD9av6KIiK4BI4ianRw+UdaKCe4ceSIvGZHSPqP74ZiYjfjKkHc+mtmam7/Oo3s0OJJLXSxfo9wqCgBHLYos=
X-Received: by 2002:ac8:1844:: with SMTP id n4mr15871691qtk.142.1592232392794; 
 Mon, 15 Jun 2020 07:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200615130032.931285-1-hch@lst.de>
 <20200615130032.931285-3-hch@lst.de>
 <CAK8P3a0bRD3RzE_X6Tjzu9Tj+OhHhP+S=k6+VYODBGko8oQhew@mail.gmail.com>
 <20200615141239.GA12951@lst.de>
 <CAK8P3a2MeZhayZWkPbd4Ckq3n410p_n808NJTwN=JjzqHRiAXg@mail.gmail.com>
 <20200615144310.GA15101@lst.de>
In-Reply-To: <20200615144310.GA15101@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Jun 2020 16:46:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a17h782gO65qJ9Mmz0EuiTSKQPEyr_=nvqOtnmQZuh9Kw@mail.gmail.com>
Message-ID: <CAK8P3a17h782gO65qJ9Mmz0EuiTSKQPEyr_=nvqOtnmQZuh9Kw@mail.gmail.com>
Subject: Re: [PATCH 2/6] exec: simplify the compat syscall handling
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4ssqj1dCKPRp5dlcj2eCGA85Fvzk9s1pGIIyM7Y6VH8ObZXe/n8
 UE76loj6DItval8EB2TwVp4uK4EV4+4xKviBGn7mOF4CrK9L+5s4vDI/Lzmkc5W68F3zpFj
 M+Uohh9DN7k2kIubAKYJhhuXP4k6Gndp/KfkmC0HJ26Ji4Hp3k4sAvHwTfmhzwozQa7fVh7
 l8EGmR4n6QNoUWBn0EQkA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:653cxxw9aDs=:+RpQB4z5blsVrTh6DUjL07
 WL+zjhf7ZrXwT8PvGa+FVW/fwoURbL4Jp7rwfIT2sLWrlAGhoLlozsAWVF+IGLYIzvikGAIAy
 rLzlIFPRXpaghd+qWgdyktygvMAUnAYg57yGwwzEvX/184CaR54nH5n0OE5TGym9UhQWpSanu
 bk+vztRTWYluynxVRb0Sc5fELuDHYTbPlpT/p1MjfiDdjFWtcEOwA2KAl/yvOXzaUsD+flGr/
 wYB2K5CaP1JZV1J4+/Jbb3B01hct3vwpiBiTkz55oNHJFx/jZvbSTJWZ2bOcK/YAzeZ9rcyDJ
 OhkVWJRlP3W1XDOYP7a38jpXlFLIDykYWL486fXHInBBw+efbawKhjTtJzLEnDAPPRaj2nY4a
 S1nliGrOgmYm8vcoteWsXAlukhAEd4TdaSRWklVywRtdVn3r/tpJt4wz3XVz3BBAwDE2svVbi
 aBZ4dj3Fp9kl4C/NCbKi5SlDQQIh94CoBIm3X9df5CgHOQMJt6Qzba5/qhLx7mTscVTObbMOH
 WVofjyfUNMUDfelKB1BjTj04uRV7IryQm+01Z4beHxcRbDbLhBJ06/FhqGz9zdWY6y8oYvbu4
 4qHhC1B04fDNJ4IMBdo/Mz9Vuf0nRTQ6O27bTVx7YEbecvV2ZPoJT9GQyYNkCUXz0dRXNRHJ0
 Pn1IUBqMGA3nScTiwdKWYlo2BXQYLY9vZzDrlsNCjnXrp7OQvAJ68DAc00pm8t5g7jxDINt7N
 wHk4H7crWcRMr8NwuTMCsbNuvVUzyclkKxry3KV3xpGvCDOynxr43Gq2WRQZviWlyQzjpeg1b
 cKtpltmZxCYCRvsMnqfcGKYOd2nX7e2PWViVPVEueNtT2Q8sH8=
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
 Parisc List <linux-parisc@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 4:43 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jun 15, 2020 at 04:40:28PM +0200, Arnd Bergmann wrote:
> > > ld: arch/x86/entry/syscall_x32.o:(.rodata+0x1040): undefined reference to
> > > `__x32_sys_execve'
> > > ld: arch/x86/entry/syscall_x32.o:(.rodata+0x1108): undefined reference to
> > > `__x32_sys_execveat'
> > > make: *** [Makefile:1139: vmlinux] Error 1
> >
> > Ah, I see: it's marked x32-only, so arch/x86/entry/syscall_x32.c
> > uses the __x32 prefix instead of the __x64 one. Marking it 'common'
> > instead would make it work, but also create an extra entry point
> > for native processes, something that commit
> > 6365b842aae4 ("x86/syscalls: Split the x32 syscalls into their own table")
> > was trying to avoid.
>
> Marking it common also doesn't compile at all because __NR_execve
> and __NR_execveat get redefined in unistd_64.h.  I then tried to rename
> the x32 versions, which failed in yet another way.  At that point I gave
> up instead of digging myself into a deeper hole..

How about this one:

diff --git a/arch/x86/entry/syscall_x32.c b/arch/x86/entry/syscall_x32.c
index 3d8d70d3896c..0ce15807cf54 100644
--- a/arch/x86/entry/syscall_x32.c
+++ b/arch/x86/entry/syscall_x32.c
@@ -16,6 +16,9 @@
 #undef __SYSCALL_X32
 #undef __SYSCALL_COMMON

+#define __x32_sys_execve __x64_sys_execve
+#define __x32_sys_execveat __x64_sys_execveat
+
 #define __SYSCALL_X32(nr, sym) [nr] = __x32_##sym,
 #define __SYSCALL_COMMON(nr, sym) [nr] = __x64_##sym,

Still ugly, but much simpler and more localized (if it works).

        Arnd
