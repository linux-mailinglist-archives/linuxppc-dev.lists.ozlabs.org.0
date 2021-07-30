Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EF13DB96B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 15:36:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbpMk0QMYz3cPN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 23:36:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ho38LvuK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ho38LvuK; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbpMC5lvyz2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 23:36:07 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FB9460F4A
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 13:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627652164;
 bh=Kxc+WnvFkFgpyTYYCMg+FHtM463+Ta69Z65pcvFy+nw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ho38LvuKv74hab1fk9TeMpOaOP6S+B8D6La1ytammZe5husN2Sln3hk0b/jsKKSP0
 Oz9B9qEtRAk1vmf+xAbnGmmd1qGPrQ9eU9guuq08fEy1thlwKJFnvdr7w53exlPS5B
 k3IeKepk+++IJ/FD/tQwIU77xPc6BY7A8E0E/yzZnR1X6UFUVaRYVOX9RitafiYcbV
 bib44KzdYE0lqK4kU4CYw8St0cKpzFa5VucXQ9aczPK2DoLoAKfefZLGOIjmQj1Tqw
 GMjjZmvtivOvJ8j07Wxuk3EZcIC+y0tVdQ6NY50ImRhnD1JcDVSgsJHoIXs89/F/p8
 Jl4YG45FZpqUg==
Received: by mail-lj1-f178.google.com with SMTP id e5so12407957ljp.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 06:36:04 -0700 (PDT)
X-Gm-Message-State: AOAM5327GLQOPTGJSl+xxb9Hi1DjynJkFsXAWUyhoQtcPhzgiQ+bi8oJ
 hQ5qdFci7tEe70vldqbfTQli5lBopGzFZ3Y9SYk=
X-Google-Smtp-Source: ABdhPJwuftgxHedyhF9ABjFcX5ntB4hnZJtnEQD3qNPIiKJ5o00xy/u2gbz8S8h+EITSt2YoA2WUUAyPzv0cemOlwyo=
X-Received: by 2002:adf:fd90:: with SMTP id d16mr3288984wrr.105.1627652152412; 
 Fri, 30 Jul 2021 06:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210727144859.4150043-1-arnd@kernel.org>
 <YQPLG20V3dmOfq3a@osiris>
In-Reply-To: <YQPLG20V3dmOfq3a@osiris>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 30 Jul 2021 15:35:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0YV0UVsui67WE4LiGM+RmQsDBOvFMaKArT5UmNLgN5GA@mail.gmail.com>
Message-ID: <CAK8P3a0YV0UVsui67WE4LiGM+RmQsDBOvFMaKArT5UmNLgN5GA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] compat: remove compat_alloc_user_space
To: Heiko Carstens <hca@linux.ibm.com>
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
Cc: Feng Tang <feng.tang@intel.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 30, 2021 at 11:49 AM Heiko Carstens <hca@linux.ibm.com> wrote:
> On Tue, Jul 27, 2021 at 04:48:53PM +0200, Arnd Bergmann wrote:
>
> Our CI reports this with linux-next and running strace selftest in
> compat mode:

Thanks a lot for the report! I managed track it down based on your
output, it turns out that I end up copying data from the stack according
to how much the user asked for, and in this case that was much more
than the 8 byte nodemask_t, copying all of the kernel stack all the
way into the guard page with CONFIG_VMAP_STACK, where it
crashed. Without CONFIG_VMAP_STACK, or with user space that
asks for less data, it would just be an information leak, so others
probably haven't noticed the problem.

The change below should fix that, I'll double-check the other callers
as well before sending a proper fixup patch to Andrew.

        Arnd

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 4fabf2dddbc0..0d1f3be32723 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1438,6 +1438,7 @@ static int copy_nodes_to_user(unsigned long
__user *mask, unsigned long maxnode,
                if (clear_user((char __user *)mask + nbytes, copy - nbytes))
                        return -EFAULT;
                copy = nbytes;
+               maxnode = nr_node_ids;
        }

        if (compat)
