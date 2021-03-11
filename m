Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7157337449
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 14:47:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dx9Gy6SN7z3dD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 00:47:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LqPgtXO3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LqPgtXO3; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dx9GZ1Gtzz30Gs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 00:46:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dx9GR2Cmcz9sWW;
 Fri, 12 Mar 2021 00:46:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615470399;
 bh=iZZn561Pa2Y3vO+gJp8nHF4i8Co1/FqjhNLC6ZpDGho=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LqPgtXO3e6V4LubRzK/fX4PXhI+W0hYK9LIksz+qJsNJ96M5akc9+swSpQEUI5QdB
 IkwUG2aqYmylB34Nc09+dtxBsJW7Cms819k7JxYqdObB3LJ2jkDjhbAxjjHQf+3v3q
 j3XNpGXmrKQ+AD0lSMtPrf7yAuiTYBzEE8wnWnbye0lT1BAlswMcMp3SVPXOX5Dse+
 aqg0g/ETJsYJIzRTYIQNcOVV8ZyH4j77XfocRtVRXEnW3HeAKcPG9yl6frCWLlAt+J
 j79DFutgCunfzaWUIf01Zwm1NqdEBlHiZWxH/6GBt3Gq9Lb8A4HGXWZpL62BWebsSv
 tIjCGKp27rHNA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
 npiggin@gmail.com
Subject: Re: [PATCH v2 25/43] powerpc/32: Replace ASM exception exit by C
 exception exit from ppc64
In-Reply-To: <a9a50f475db97fc53795dd778bc14f58029fdd55.1615291473.git.christophe.leroy@csgroup.eu>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
 <a9a50f475db97fc53795dd778bc14f58029fdd55.1615291473.git.christophe.leroy@csgroup.eu>
Date: Fri, 12 Mar 2021 00:46:36 +1100
Message-ID: <87tuphkdkz.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> This patch replaces the PPC32 ASM exception exit by C exception exit.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/entry_32.S  | 481 +++++++++-----------------------
>  arch/powerpc/kernel/interrupt.c |   4 +
>  2 files changed, 132 insertions(+), 353 deletions(-)

Bisect points to this breaking qemu mac99 for me, with pmac32_defconfig.

I haven't had time to dig any deeper sorry.

cheers


Freeing unused kernel memory: 1132K
This architecture does not have kernel memory protection.
Run /init as init process
init[1]: User access of kernel address (fffffd20) - exploit attempt? (uid: 0)
init[1]: segfault (11) at fffffd20 nip b7e78638 lr b7e845e4 code 1 in ld-2.27.so[b7e6b000+22000]
init[1]: code: 92010080 92210084 92410088 92810090 92a10094 92c10098 930100a0 932100a4
init[1]: code: 934100a8 936100ac 93a100b4 91810074 <7d41496e> 39400000 3b810017 579c0036
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00ERROR: Error: saw oops/warning etc. while expecting
00000b
CPU: 0 PID: 1 Comm: init Not tainted 5.12.0-rc2+ #1
Call Trace:
[f1019d80] [c004f1ec] panic+0x138/0x328 (unreliable)
[f1019de0] [c0051c8c] do_exit+0x880/0x8f4
[f1019e30] [c0052bdc] do_group_exit+0x40/0xa4
[f1019e50] [c0060d04] get_signal+0x1e8/0x834
[f1019eb0] [c000b624] do_notify_resume+0xc8/0x314
[f1019f10] [c0010da8] interrupt_exit_user_prepare+0xa4/0xdc
[f1019f30] [c0018228] interrupt_return+0x14/0x14c
--- interrupt: 300 at 0xb7e78638
NIP:  b7e78638 LR: b7e845e4 CTR: c01ea2d8
REGS: f1019f40 TRAP: 0300   Not tainted  (5.12.0-rc2+)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 28004422  XER: 20000000
DAR: fffffd20 DSISR: 42000000
GPR00: b7e845e4 bf951440 00000000 bf951460 00000000 bf951718 fefefeff 7f7f7f7f
GPR08: bf9516b0 406ae8e0 b7eac1d4 00000000 0a12247b 00000000 b7e8a0d0 b7e78554
GPR16: bf951730 bf9516f0 b7eaaf40 bf9516f0 00000001 b7eaa688 10002178 bf951460
GPR24: 00000000 00000000 b7eac200 100cff38 bf9516f0 10002179 b7e845e4 bf951440
NIP [b7e78638] 0xb7e78638
LR [b7e845e4] 0xb7e845e4
--- interrupt: 300
Rebooting in 180 seconds..
