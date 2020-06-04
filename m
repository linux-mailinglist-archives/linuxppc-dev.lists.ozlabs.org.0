Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B27D81EE04B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 10:57:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d06G0HCLzDqnk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 18:57:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=naresh.kamboju@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dnFzQRrb; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d03W27xhzDqV6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 18:55:18 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id u16so3092443lfl.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jun 2020 01:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wX/HMY1MRP8U/gjc3VbRQHcLWsJVELT9dkOTjKxMtVY=;
 b=dnFzQRrbfXxSpYDcYeOBjWm1ZuPcoD6NU73Rn0+PwaRw6755xtm/+yOZcIflRwncuV
 BaBtWr8t+jEsn4YTdhr0KxQOeqIWcxIHaeZVS8Xoc7P/0xdaCxHN+/Bz1fYikyy8XfDd
 u6RYfyzcDnN672UN0j/5mq74CzwrVmXAB53V3HyjsXVK1iQrhCSxMTVnxOS34ivIAJqa
 aQhMnvdRdXsQhAtQ3oKd0B7WGtvpk2l8Xcwt1SInOh8uy+nPsL8DE/BWzPMCZBWJeZOH
 ENERiodaMRIzGWPdxAKHxlgNVMBaz3yGRycaR05/cvaDVzIfJYMDO6p0zoHAWNr5PxwB
 JnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wX/HMY1MRP8U/gjc3VbRQHcLWsJVELT9dkOTjKxMtVY=;
 b=ELlnmcw/qARkhWX6q6Ryhj3WKxYU29zndIioEqWsu8+CRwgkYlJX/mv0kDYtPj2kbF
 LYVszxGdWWUBkel6hjHSEwVV5pTxiOSrNXkmPkpQTzZ0vnb6oOLd5yqE3sUT4sS96AF0
 7ehzKEe8+IOy/8jNXude3uhDwKFhp96XZDP0/fXYx9KteYjhwgkAgs8rg4yll/a2awQw
 QMuGsClq9axBQbxtqOekBuz4Dy8i30TjdVD2WEJVDSybjC9ch921XH9dB8Yu5zn8rSbQ
 0jIatkjPHCVYDjnDOqKwR02z0Lumo9eVE9NQOVaQNRN8Y+BsQhiPuTKw9PCFJI2sJdZB
 s0HA==
X-Gm-Message-State: AOAM531hC0r/4GZomvaLKTtMaIPZPkNEcc65h19ErI6e+Hb4wDXYOKR5
 m5s9LqmWkFVcmQQFjLzCukvyIhTRVww2cVpHJxi0CQ==
X-Google-Smtp-Source: ABdhPJz0o1EJ6dFFghkS8xup1wk1Y0lP19vT/WOEvgMVQo42NPE3njAeNbTwIyu0Yg9XGPmSgubrKg0JstC1Q1jZn5o=
X-Received: by 2002:a19:5013:: with SMTP id e19mr1920798lfb.95.1591260914773; 
 Thu, 04 Jun 2020 01:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <1591181457.9020.13.camel@abdul> <20200603133257.GL6857@suse.de>
In-Reply-To: <20200603133257.GL6857@suse.de>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 4 Jun 2020 14:25:03 +0530
Message-ID: <CA+G9fYu+NWDzg4ZiZQBqqViDhgMBTd=2vjYW-HG4i4phqNUDbQ@mail.gmail.com>
Subject: Re: [mainline][Oops][bisected 2ba3e6 ] 5.7.0 boot fails with kernel
 panic on powerpc
To: Joerg Roedel <jroedel@suse.de>
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 manvanth <manvanth@linux.vnet.ibm.com>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-next <linux-next@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>, lkft-triage@lists.linaro.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hch <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 3 Jun 2020 at 19:03, Joerg Roedel <jroedel@suse.de> wrote:
>
> On Wed, Jun 03, 2020 at 04:20:57PM +0530, Abdul Haleem wrote:
> > @Joerg, Could you please have a look?
>
> Can you please try the attached patch?

@Joerg, Linaro test farm noticed this kernel crash on nxp ls2088
Machine model: Freescale Layerscape 2088A RDB Board
while booting Linux mainline 5.7.0 version kernel.

After applying your proposed patch fixed boot problem.

Tested-by: Naresh Kamboju <nareshj.kamboju@linaro.org>

Test ref:
https://lavalab.nxp.com/scheduler/job/23787#L426

Here is the kernel crash log before patch applied,

[    0.000000] Linux version 5.7.0-03887-gf6aee505c71b
(TuxBuild@ecb9ef34f06f) (gcc version 9.3.0 (Debian 9.3.0-8), GNU ld
(GNU Binutils for Debian) 2.34) #1 SMP PREEMPT Wed Jun 3 18:21:26 UTC
2020
[    0.000000] Machine model: Freescale Layerscape 2088A RDB Board
<>
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Unable to handle kernel paging request at virtual
address fffeffff80000000
[    0.000000] Mem abort info:
[    0.000000]   ESR = 0x96000004
[    0.000000]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.000000]   SET = 0, FnV = 0
[    0.000000]   EA = 0, S1PTW = 0
[    0.000000] Data abort info:
[    0.000000]   ISV = 0, ISS = 0x00000004
[    0.000000]   CM = 0, WnR = 0
[    0.000000] [fffeffff80000000] address between user and kernel address ranges
[    0.000000] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
5.7.0-03887-gf6aee505c71b #1
[    0.000000] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
[    0.000000] pstate: 80000085 (Nzcv daIf -PAN -UAO BTYPE=--)
[    0.000000] pc : map_kernel_range_noflush+0xc0/0x280
[    0.000000] lr : __vmalloc_node_range+0x154/0x2a0
[    0.000000] sp : ffffb3b1dcbc3e20
[    0.000000] x29: ffffb3b1dcbc3e20 x28: fffeffff80000000
[    0.000000] x27: ffff800010004000 x26: ffff800010000000
[    0.000000] x25: 0000000000402dc2 x24: ffffb3b1dc53c000
[    0.000000] x23: 0068000000000f13 x22: 0000000000000004
[    0.000000] x21: ffffb3b1dc53cf48 x20: 0000000000000000
[    0.000000] x19: ffffb3b1dc627800 x18: 00000000000000c0
[    0.000000] x17: 0000000000000000 x16: 0000000000000007
[    0.000000] x15: dead000000000100 x14: fffffe020b990600
[    0.000000] x13: dead000000000122 x12: 0000000000000001
[    0.000000] x11: 0000000000000000 x10: ffff0082fe3fdec0
[    0.000000] x9 : ffff0082fe342d58 x8 : ffff4cd121ba5000
[    0.000000] x7 : ffff808010000000 x6 : 0000000000000004
[    0.000000] x5 : 000000000000fffd x4 : 0000000000004000
[    0.000000] x3 : ffff800050000000 x2 : 0001000080000000
[    0.000000] x1 : 0000000000000000 x0 : ffff800010003fff
[    0.000000] Call trace:
[    0.000000]  map_kernel_range_noflush+0xc0/0x280
[    0.000000]  __vmalloc_node_range+0x154/0x2a0
[    0.000000]  __vmalloc_node+0x5c/0x70
[    0.000000]  init_IRQ+0xac/0xf8
[    0.000000]  start_kernel+0x2d0/0x4dc
[    0.000000] Code: f90047e0 d503201f d2a80003 8b030343 (f9400380)
[    0.000000] random: get_random_bytes called from
print_oops_end_marker+0x2c/0x58 with crng_init=0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!

ref:
https://lavalab.nxp.com/scheduler/job/23596#L603

-- 
Linaro LKFT
https://lkft.linaro.org
