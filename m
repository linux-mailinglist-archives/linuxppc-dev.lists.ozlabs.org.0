Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0B81557CF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 13:33:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DZTN3YvfzDqfj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 23:33:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DZQZ4TzFzDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 23:30:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=q+NDyaCW; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48DZQY5nmHz8vRR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 23:30:45 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48DZQY31kfz9sSD; Fri,  7 Feb 2020 23:30:45 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=q+NDyaCW; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48DZQX5dswz9sRK
 for <linuxppc-dev@ozlabs.org>; Fri,  7 Feb 2020 23:30:44 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id d5so868247pjz.5
 for <linuxppc-dev@ozlabs.org>; Fri, 07 Feb 2020 04:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=VzXdoXe4eRLUi/xmmH61WzNlPRTJzhzUUU/V5eO1MbY=;
 b=q+NDyaCWigf6RnQvq6dETBmSKUJ/VWdSeClcSEB+89QuNoJAnIncef1Oy1oDi96IQc
 yy7HChkYiLvpNVxXdNEuSirsoDjIWsalfaja1btglBkLgwWQZ7MgXJty8xEGr8RLX5z/
 oxf706R9DxJNWJR/642abG0kyIoFeAW0Y/NhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=VzXdoXe4eRLUi/xmmH61WzNlPRTJzhzUUU/V5eO1MbY=;
 b=S3tRFmNU/d66Su06l7IhWGf8X0rFV2tq8OsT1oBGvJylLd/GcNi0rUmtahJ3TbwPQq
 XMhtGftBdUyPezs80prS5/bdrRYrX0vCwPJ039cSDkhJ3P+gqyeLfTFcuFKwf6vK81v6
 qNRdOnsTc7vYo8e1mMSH58P3KniToP6sTAd7j/PkmvH6ZB+zvFPpex02Cq/gAe3C6D4Q
 4HITNjJkDa29EoxWZu9EMI+7kjV6dhzyJmO1NI8hSk5foXuI5yjBFlN7fhBLpcPJM6/D
 uMOf7kUWXYGmHCSYCL8Gxl4hwRYdNI6R6Aboduetx4mKyCUP5+ka/YKLk6i/3cqilZeO
 STpg==
X-Gm-Message-State: APjAAAUjAkxU90l5CPj4CpRPnS8A8NB96LtCD/8K4XpOjfseiPVZsVJU
 cke7MCvGm2aL7pvCfFHoRZEG8w==
X-Google-Smtp-Source: APXvYqz4BXj4ZEWKeC4WncaoJjsnO+L9zTYPead8lpi1UAaaT+vFUQ5tlwWHU1NX34JTwTnkEQskYg==
X-Received: by 2002:a17:902:9a8c:: with SMTP id
 w12mr9393595plp.149.1581078641349; 
 Fri, 07 Feb 2020 04:30:41 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-79c1-8a2e-ebd0-3bb8.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:79c1:8a2e:ebd0:3bb8])
 by smtp.gmail.com with ESMTPSA id t63sm3060449pfb.70.2020.02.07.04.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 04:30:40 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/futex: Fix incorrect user access blocking
In-Reply-To: <20200207122145.11928-1-mpe@ellerman.id.au>
References: <20200207122145.11928-1-mpe@ellerman.id.au>
Date: Fri, 07 Feb 2020 23:30:37 +1100
Message-ID: <87k14yh95e.fsf@dja-thinkpad.axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> The early versions of our kernel user access prevention (KUAP) were
> written by Russell and Christophe, and didn't have separate
> read/write access.
>
> At some point I picked up the series and added the read/write access,
> but I failed to update the usages in futex.h to correctly allow read
> and write.
>
> However we didn't notice because of another bug which was causing the
> low-level code to always enable read and write. That bug was fixed
> recently in commit 1d8f739b07bd ("powerpc/kuap: Fix set direction in
> allow/prevent_user_access()").
>
> futex_atomic_cmpxchg_inatomic() is passed the user address as %3 and
> does:
>
>   1:     lwarx   %1,  0, %3
>          cmpw    0,  %1, %4
>          bne-    3f
>   2:     stwcx.  %5,  0, %3
>
> Which clearly loads and stores from/to %3. The logic in
> arch_futex_atomic_op_inuser() is similar, so fix both of them to use
> allow_read_write_user().
>
> Without this fix, and with PPC_KUAP_DEBUG=y, we see eg:
>
>   Bug: Read fault blocked by AMR!
>   WARNING: CPU: 94 PID: 149215 at arch/powerpc/include/asm/book3s/64/kup-radix.h:126 __do_page_fault+0x600/0xf30
>   CPU: 94 PID: 149215 Comm: futex_requeue_p Tainted: G        W         5.5.0-rc7-gcc9x-g4c25df5640ae #1
>   ...
>   NIP [c000000000070680] __do_page_fault+0x600/0xf30
>   LR [c00000000007067c] __do_page_fault+0x5fc/0xf30
>   Call Trace:
>   [c00020138e5637e0] [c00000000007067c] __do_page_fault+0x5fc/0xf30 (unreliable)
>   [c00020138e5638c0] [c00000000000ada8] handle_page_fault+0x10/0x30
>   --- interrupt: 301 at cmpxchg_futex_value_locked+0x68/0xd0
>       LR = futex_lock_pi_atomic+0xe0/0x1f0
>   [c00020138e563bc0] [c000000000217b50] futex_lock_pi_atomic+0x80/0x1f0 (unreliable)
>   [c00020138e563c30] [c00000000021b668] futex_requeue+0x438/0xb60
>   [c00020138e563d60] [c00000000021c6cc] do_futex+0x1ec/0x2b0
>   [c00020138e563d90] [c00000000021c8b8] sys_futex+0x128/0x200
>   [c00020138e563e20] [c00000000000b7ac] system_call+0x5c/0x68
>
> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace Access Protection")
Reported-by: syzbot+e808452bad7c375cbee6@syzkaller-ppc64.appspotmail.com
> Cc: stable@vger.kernel.org # v5.2+
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
