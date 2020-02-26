Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 931CF16F86D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 08:18:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S6Zw13fgzDqKs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 18:18:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=AdvfF+DV; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S6YH562nzDqGW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 18:16:33 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id r67so888056pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 23:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=bUll3MF+KOORxkWKae6CeWZqF5RK093f70VhPi5nTaA=;
 b=AdvfF+DViD2Iihe2gGoCejFW6L9CR4CRCuvhd702kHXMW9aLKiXKfmFyTpucUBXYvN
 cEZRvzdUlmSDzOLcdBFaPWO/Gqx8canJLTZTZUnf4NBrmhRAHnjLBh4VPtK3yWqwsia0
 ED/nVdqp1ZBaUikJEfLHTuQiqHyge9lN9SdrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=bUll3MF+KOORxkWKae6CeWZqF5RK093f70VhPi5nTaA=;
 b=k2F/Px5/0eMuNr0TfC+vnrjFHA6e5tLWK9uodkV8hNwVx6XwaGQFHVUrz1mapMFicu
 P2AkhUcgfQVIUQkQGDKvgHm0FSdVx9cKcr4vb3H0iZOPPUyJPw7gxQwuhkWiP2XC0KRT
 no8mwmzfHoRGuenXZDqJoG34UmvAYBn90oGJOiXGnSp/biarWD7Xmzx+AbZ+ZnNWyso1
 R5cllZ88BA2V/yl0w8AMxkB3ZecApFcfbEGOiWSmKzD+r0zdLUiiWXkPSbx4rdj4jB4N
 QW7rPS4hOQBMMEuYxH8UmB7UnI6gxY9pm4hrhPq414eCz7VE5Wog06osB+tXlm59CL6B
 b9fw==
X-Gm-Message-State: APjAAAXQLyND/Xn5sk10Ml0NTEiTRWTqtAdPOuhB3JwTUCBKTY0QJG5x
 ymzPOSLqUKBPMj9UvQDuq/RoJg==
X-Google-Smtp-Source: APXvYqyTVYEdw3GG568w+1dNFzY9ZMbswpQ8Fc19s42h9JN/v4uscW8ujuBJbXp4NXq4DVrPra5Yow==
X-Received: by 2002:a17:902:bf49:: with SMTP id
 u9mr2644385pls.199.1582701390378; 
 Tue, 25 Feb 2020 23:16:30 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-5952-947b-051c-ea5f.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:5952:947b:51c:ea5f])
 by smtp.gmail.com with ESMTPSA id p23sm1364024pgn.92.2020.02.25.23.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 23:16:29 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com, christophe.leroy@c-s.fr,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com, oss@buserror.net
Subject: Re: [PATCH v3 0/6] implement KASLR for powerpc/fsl_booke/64
In-Reply-To: <20200206025825.22934-1-yanaijie@huawei.com>
References: <20200206025825.22934-1-yanaijie@huawei.com>
Date: Wed, 26 Feb 2020 18:16:26 +1100
Message-ID: <87tv3drf79.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jason Yan <yanaijie@huawei.com>, linux-kernel@vger.kernel.org,
 zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jason,

> This is a try to implement KASLR for Freescale BookE64 which is based on
> my earlier implementation for Freescale BookE32:
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=131718
>
> The implementation for Freescale BookE64 is similar as BookE32. One
> difference is that Freescale BookE64 set up a TLB mapping of 1G during
> booting. Another difference is that ppc64 needs the kernel to be
> 64K-aligned. So we can randomize the kernel in this 1G mapping and make
> it 64K-aligned. This can save some code to creat another TLB map at
> early boot. The disadvantage is that we only have about 1G/64K = 16384
> slots to put the kernel in.
>
>     KERNELBASE
>
>           64K                     |--> kernel <--|
>            |                      |              |
>         +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
>         |  |  |  |....|  |  |  |  |  |  |  |  |  |....|  |  |
>         +--+--+--+    +--+--+--+--+--+--+--+--+--+    +--+--+
>         |                         |                        1G
>         |----->   offset    <-----|
>
>                               kernstart_virt_addr
>
> I'm not sure if the slot numbers is enough or the design has any
> defects. If you have some better ideas, I would be happy to hear that.
>
> Thank you all.
>

Are you making any attempt to hide kernel address leaks in this series?
I've just been looking at the stackdump code just now, and it directly
prints link registers and stack pointers, which is probably enough to
determine the kernel base address:

                  SPs:               LRs:             %pS pointer
[    0.424506] [c0000000de403970] [c000000001fc0458] dump_stack+0xfc/0x154 (unreliable)
[    0.424593] [c0000000de4039c0] [c000000000267eec] panic+0x258/0x5ac
[    0.424659] [c0000000de403a60] [c0000000024d7a00] mount_block_root+0x634/0x7c0
[    0.424734] [c0000000de403be0] [c0000000024d8100] prepare_namespace+0x1ec/0x23c
[    0.424811] [c0000000de403c60] [c0000000024d7010] kernel_init_freeable+0x804/0x880

git grep \\\"REG\\\" arch/powerpc shows a few other uses like this, all
in process.c or in xmon.

Maybe replacing the REG format string in KASLR mode would be sufficient?

Regards,
Daniel


> v2->v3:
>   Fix build error when KASLR is disabled.
> v1->v2:
>   Add __kaslr_offset for the secondary cpu boot up.
>
> Jason Yan (6):
>   powerpc/fsl_booke/kaslr: refactor kaslr_legal_offset() and
>     kaslr_early_init()
>   powerpc/fsl_booke/64: introduce reloc_kernel_entry() helper
>   powerpc/fsl_booke/64: implement KASLR for fsl_booke64
>   powerpc/fsl_booke/64: do not clear the BSS for the second pass
>   powerpc/fsl_booke/64: clear the original kernel if randomized
>   powerpc/fsl_booke/kaslr: rename kaslr-booke32.rst to kaslr-booke.rst
>     and add 64bit part
>
>  .../{kaslr-booke32.rst => kaslr-booke.rst}    | 35 +++++++--
>  arch/powerpc/Kconfig                          |  2 +-
>  arch/powerpc/kernel/exceptions-64e.S          | 23 ++++++
>  arch/powerpc/kernel/head_64.S                 | 14 ++++
>  arch/powerpc/kernel/setup_64.c                |  4 +-
>  arch/powerpc/mm/mmu_decl.h                    | 19 ++---
>  arch/powerpc/mm/nohash/kaslr_booke.c          | 71 +++++++++++++------
>  7 files changed, 132 insertions(+), 36 deletions(-)
>  rename Documentation/powerpc/{kaslr-booke32.rst => kaslr-booke.rst} (59%)
>
> -- 
> 2.17.2
