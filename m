Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 414BE29E37F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 06:58:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMF9v0NvdzDqYd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 16:58:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aPkcftQ3; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMF8L27SmzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 16:57:19 +1100 (AEDT)
Received: by mail-io1-xd42.google.com with SMTP id r9so2130186ioo.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 22:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kjvwfAoMwV46SiGdX0h1AO+7TbryedwzCJ/wh+tBt0M=;
 b=aPkcftQ3lRkHIbQDO4N6n0rLkdiaehY7sG1dpc2iVbE6569nfkWwKFt1fa25vc+Sl+
 EuUBHlhE37LOPjHhk6gR3GgFeaEHUnBG4P/duvykO5o5dXMsFrc1qaSsdPv5R1gWUeSg
 Unsjz1AbCkgTQFuo1amwsHxXX4PMwgGf/p1BbQe+AAh8U0BE8Mrv+BmmxV3QxLNSx6FP
 Mz3b5ggFycWiCNHAHpA0UpvS9XtXozbMzmKjUcGXfdfKm+HDktujggb92/dr+exnkSHa
 fz8Nbn/fDYDMyRaoohVV0kOErVEvoApYFroNWGK73+tSUYnt/ap30NW2QPyxUo7tI4Cb
 VyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kjvwfAoMwV46SiGdX0h1AO+7TbryedwzCJ/wh+tBt0M=;
 b=GTADEXCza738NAop9GvF0urrLX0vo8VqwKJMMMcI2IQxgE4elA+DvkZEtQETPy0kEA
 ORpenjjW6X+50GaDkTnzi0PIEUhPyMaUTVbf7x4yT4ksea2YCZj6HNleQ84e43ttvUct
 XH/Jc5mvpuDUNEFCLFCwl80Imp/Us7RADPSI8XFWp9769WTa5i//i56p5zpDCVfHASMj
 3HJfNgR7E+o0Qgpxp2w+SewJCkxGK680rjZUFbEUKYnHHsLSyrGrpj3aKE66gVE+lS0/
 EvmY8Xms4N/LQGEwVRU3VbNItD2ZMc8+7Zd6Au08DmmFD0a9++hOFoiVhHF4XQ7T7BBX
 N7KQ==
X-Gm-Message-State: AOAM532VJe5swEWy2BmQ7O6Y0QU9T+eIoO62G52kJMLqj/N0GEMqyDlj
 N5MYNRFq7ttgJ3zkHdDLZxbV8aQJyH5+Ddt141w=
X-Google-Smtp-Source: ABdhPJzJIANFtM8B5/G178o4UAKcy+iHEyBDA4j01j4qnaAvw+UdNi0dNV/87j+XLAfa7KZigF+L8VNKE9tAysBx1NE=
X-Received: by 2002:a02:a798:: with SMTP id e24mr2281570jaj.105.1603951035631; 
 Wed, 28 Oct 2020 22:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201028152717.8967-1-cai@redhat.com>
In-Reply-To: <20201028152717.8967-1-cai@redhat.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 29 Oct 2020 16:57:04 +1100
Message-ID: <CAOSf1CGQALrEA9wHK8usbqfeRSOKYXRK3d=D7Qh=YOM8ifHwGA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/eeh_cache: Fix a possible debugfs deadlock
To: Qian Cai <cai@redhat.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 29, 2020 at 2:27 AM Qian Cai <cai@redhat.com> wrote:
>
> Lockdep complains that a possible deadlock below in
> eeh_addr_cache_show() because it is acquiring a lock with IRQ enabled,
> but eeh_addr_cache_insert_dev() needs to acquire the same lock with IRQ
> disabled. Let's just make eeh_addr_cache_show() acquire the lock with
> IRQ disabled as well.
>
>         CPU0                    CPU1
>         ----                    ----
>    lock(&pci_io_addr_cache_root.piar_lock);
>                                 local_irq_disable();
>                                 lock(&tp->lock);
>                                 lock(&pci_io_addr_cache_root.piar_lock);
>    <Interrupt>
>      lock(&tp->lock);
>
>   *** DEADLOCK ***
>
>   lock_acquire+0x140/0x5f0
>   _raw_spin_lock_irqsave+0x64/0xb0
>   eeh_addr_cache_insert_dev+0x48/0x390
>   eeh_probe_device+0xb8/0x1a0
>   pnv_pcibios_bus_add_device+0x3c/0x80
>   pcibios_bus_add_device+0x118/0x290
>   pci_bus_add_device+0x28/0xe0
>   pci_bus_add_devices+0x54/0xb0
>   pcibios_init+0xc4/0x124
>   do_one_initcall+0xac/0x528
>   kernel_init_freeable+0x35c/0x3fc
>   kernel_init+0x24/0x148
>   ret_from_kernel_thread+0x5c/0x80
>
>   lock_acquire+0x140/0x5f0
>   _raw_spin_lock+0x4c/0x70
>   eeh_addr_cache_show+0x38/0x110
>   seq_read+0x1a0/0x660
>   vfs_read+0xc8/0x1f0
>   ksys_read+0x74/0x130
>   system_call_exception+0xf8/0x1d0
>   system_call_common+0xe8/0x218
>
> Fixes: 5ca85ae6318d ("powerpc/eeh_cache: Add a way to dump the EEH address cache")
> Signed-off-by: Qian Cai <cai@redhat.com>

Good catch,

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
