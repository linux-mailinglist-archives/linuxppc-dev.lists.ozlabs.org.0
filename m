Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38134BF20E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 13:47:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fCpx2wYfzDqpB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 21:47:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.196; helo=mail-oi1-f196.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fCn03wjXzDqkX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 21:46:08 +1000 (AEST)
Received: by mail-oi1-f196.google.com with SMTP id i185so1768078oif.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 04:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tLHR9Uzl4F2LlED7RayZ8GAF5ZPEPIZryaF57i4OLXI=;
 b=hUGdGKUz0vdUQVbhTWy+OiYg8vqj7b5XuSOSJwC6ikUbC3FsTxZrYcscH8bjCRo0OW
 /muVY8laQtIDXRFEi/qRVYIBP5p/wdK/OrGWx9UMB3k9AWMWKP0GInhK5yBfxyZsw/9t
 fNWSKqgaV1unamWZC0WW6+I3+7GtTbI7DRLu0hKVpd6FVvK6cpyXS4zz5zY3lWRM6dFz
 GlniIIxSSY5ll6gety9lSdPARUXxrbHDOVthRh4SLaAhNb3HC3QR+Ry3zIhLk2GIr1Q8
 Bi3gCmVDBcYY1Si+NSqM/8LbgKC1FjqRse2my1ysDxi8zdgcPcFp/TD8LSCpoquHMIYV
 RjOQ==
X-Gm-Message-State: APjAAAUgV2DXnSJF9W1Gg+E18eNW7jwv2cKLGiYs5ERMiEa2el9KhFu6
 qvHHMaPaE/KuZOEsEin9w0MTB6b1Kyn9juxkxr8=
X-Google-Smtp-Source: APXvYqyYkcWdXaYT2TKf8PpAyeMG4IMl80DMGSW9/4Yu/aIloKfMJRq08yVSuXrdrFqW4oG+5S2Rn1FqFklCYwm9zxE=
X-Received: by 2002:aca:b654:: with SMTP id g81mr2137450oif.153.1569498365259; 
 Thu, 26 Sep 2019 04:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190924105622.GH23050@dhcp22.suse.cz>
 <20190924112349.GJ2332@hirez.programming.kicks-ass.net>
 <20190924115401.GM23050@dhcp22.suse.cz>
 <20190924120943.GP2349@hirez.programming.kicks-ass.net>
 <20190924122500.GP23050@dhcp22.suse.cz>
 <20190924124325.GQ2349@hirez.programming.kicks-ass.net>
 <20190924125936.GR2349@hirez.programming.kicks-ass.net>
 <20190924131939.GS23050@dhcp22.suse.cz>
 <20190925104040.GD4553@hirez.programming.kicks-ass.net>
 <20190925132544.GL23050@dhcp22.suse.cz>
 <20190925163154.GF4553@hirez.programming.kicks-ass.net>
In-Reply-To: <20190925163154.GF4553@hirez.programming.kicks-ass.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2019 13:45:53 +0200
Message-ID: <CAMuHMdVJ6RbEbKc8s_rhJaUBNnA8sOByq9cJ3KH-qmcqQrm_UQ@mail.gmail.com>
Subject: Re: [PATCH v6] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To: Peter Zijlstra <peterz@infradead.org>
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
Cc: Rich Felker <dalias@libc.org>, Linux-sh list <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, jiaxun.yang@flygoat.com,
 Michal Hocko <mhocko@kernel.org>, Michael Bringmann <mwb@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux <sparclinux@vger.kernel.org>, Huacai Chen <chenhc@lemote.com>,
 Will Deacon <will@kernel.org>, Qian Cai <cai@lca.pw>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 the arch/x86 maintainers <x86@kernel.org>,
 Yunsheng Lin <linyunsheng@huawei.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Doug Ledford <dledford@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>, James Hogan <jhogan@kernel.org>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 Len Brown <len.brown@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 naveen.n.rao@linux.vnet.ibm.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Jens Axboe <axboe@kernel.dk>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 Thomas Bogendoerfer <tbogendoerfer@suse.de>,
 Paul Burton <paul.burton@mips.com>, alpha <linux-alpha@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Peter,

On Thu, Sep 26, 2019 at 11:42 AM Peter Zijlstra <peterz@infradead.org> wrote:
> On Wed, Sep 25, 2019 at 03:25:44PM +0200, Michal Hocko wrote:
> > I am sorry but I still do not understand why you consider this whack a
> > mole better then simply live with the fact that NUMA_NO_NODE is a
> > reality and that using the full cpu mask is a reasonable answer to that.
>
> Because it doesn't make physical sense. A device _cannot_ be local to
> all CPUs in a NUMA system.

While it cannot be local to all CPUs, it can be at a uniform (equal) distance
to each CPU node, can't it?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
