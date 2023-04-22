Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336EF6EBAF6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Apr 2023 21:20:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q3h7c1gCgz3cLF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Apr 2023 05:20:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=tsV+XRz6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=tsV+XRz6;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q3h6m6RGdz3c3W
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Apr 2023 05:19:59 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-b95af16639cso4188390276.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Apr 2023 12:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1682191195; x=1684783195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OHJY4Fkh+i9IKg2K8qTc2zv9H9+ffmQTlvrABmh8bQ=;
        b=tsV+XRz6vc6v28gtdYF8Gj99Qpo+XphroXPdLWtFBNnpBNNol6ARzQFBZAJLZYUc/9
         mVicFywL0vgU7dZHJJ8b286loaHazmcmDh1GCUuCP+U/tei92lcLvifueeydbAcr5m0C
         xE0xNy4X8A3TGTFVu+7F/jnmN9ZU+YHAPlh18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682191195; x=1684783195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OHJY4Fkh+i9IKg2K8qTc2zv9H9+ffmQTlvrABmh8bQ=;
        b=DQAl7bSvEbAUBR9gcMu2V9VJEu8JZgykZ/aryMYFB1I9ip5pBrvPcr2wDza6S9CKda
         t3w+mVvuf5V0+okagkDXrUXWE/ILbjcFobRV4sPNaeZKALqdb6JLDaEc/QcZClem32PL
         EIvWoMxhIgZobfGsqwnr3qwmEPEL3j1axr2RNMdkjNgryVsOA0h3FhVF7iLf106Lf5Fq
         zw3fgmIp4oRXuJYNlysdqkXxk1i7pkru9U3fv7ENRMyGXdfH3u1QMBRmLvDM35RU7Emu
         da8mayHefruB7GhhvTlUTojYmeMaE2LJBK5q6Xom0LdmnvtYIFC0iDnOKPIrTxHZfqmv
         +w7w==
X-Gm-Message-State: AAQBX9eb2XZ7BktZaK7OvKnBsdcQC/QE691Za8a94usDqLJToABv6SCI
	zoe75+82j6n8s8Pk57FyX6BJq5mELx8fqRFFSb1B/g==
X-Google-Smtp-Source: AKy350abbGfzNu9Ezn4OMBp5YhNGQ7AC6quo9KEVhw/AIwmIzl2/hq5vRDRnt/Z4h6Ejw/51Vx77DKi3Wrd7Zr6TarY=
X-Received: by 2002:a81:6604:0:b0:54f:5419:2fa4 with SMTP id
 a4-20020a816604000000b0054f54192fa4mr4608890ywc.50.1682191194837; Sat, 22 Apr
 2023 12:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
In-Reply-To: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Sat, 22 Apr 2023 21:19:41 +0200
Message-ID: <CAEXW_YQCugPs1bquaA4ZLdsM4S3hWv9OMNTt80tSvjCO0LwiHg@mail.gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Zhouyi,

On Sat, Apr 22, 2023 at 2:47=E2=80=AFPM Zhouyi Zhou <zhouzhouyi@gmail.com> =
wrote:
>
> Dear PowerPC and RCU developers:
> During the RCU torture test on mainline (on the VM of Opensource Lab
> of Oregon State University), SRCU-P failed with __stack_chk_fail:
> [  264.381952][   T99] [c000000006c7bab0] [c0000000010c67c0]
> dump_stack_lvl+0x94/0xd8 (unreliable)
> [  264.383786][   T99] [c000000006c7bae0] [c00000000014fc94] panic+0x19c/=
0x468
> [  264.385128][   T99] [c000000006c7bb80] [c0000000010fca24]
> __stack_chk_fail+0x24/0x30
> [  264.386610][   T99] [c000000006c7bbe0] [c0000000002293b4]
> srcu_gp_start_if_needed+0x5c4/0x5d0
> [  264.388188][   T99] [c000000006c7bc70] [c00000000022f7f4]
> srcu_torture_call+0x34/0x50
> [  264.389611][   T99] [c000000006c7bc90] [c00000000022b5e8]
> rcu_torture_fwd_prog+0x8c8/0xa60
> [  264.391439][   T99] [c000000006c7be00] [c00000000018e37c] kthread+0x15=
c/0x170
> [  264.392792][   T99] [c000000006c7be50] [c00000000000df94]
> ret_from_kernel_thread+0x5c/0x64
> The kernel config file can be found in [1].
> And I write a bash script to accelerate the bug reproducing [2].
> After a week's debugging, I found the cause of the bug is because the
> register r10 used to judge for stack overflow is not constant between
> context switches.
> The assembly code for srcu_gp_start_if_needed is located at [3]:
> c000000000226eb4:   78 6b aa 7d     mr      r10,r13
> c000000000226eb8:   14 42 29 7d     add     r9,r9,r8
> c000000000226ebc:   ac 04 00 7c     hwsync
> c000000000226ec0:   10 00 7b 3b     addi    r27,r27,16
> c000000000226ec4:   14 da 29 7d     add     r9,r9,r27
> c000000000226ec8:   a8 48 00 7d     ldarx   r8,0,r9
> c000000000226ecc:   01 00 08 31     addic   r8,r8,1
> c000000000226ed0:   ad 49 00 7d     stdcx.  r8,0,r9
> c000000000226ed4:   f4 ff c2 40     bne-    c000000000226ec8
> <srcu_gp_start_if_needed+0x1c8>
> c000000000226ed8:   28 00 21 e9     ld      r9,40(r1)
> c000000000226edc:   78 0c 4a e9     ld      r10,3192(r10)
> c000000000226ee0:   79 52 29 7d     xor.    r9,r9,r10
> c000000000226ee4:   00 00 40 39     li      r10,0
> c000000000226ee8:   b8 03 82 40     bne     c0000000002272a0
> <srcu_gp_start_if_needed+0x5a0>
> by debugging, I see the r10 is assigned with r13 on c000000000226eb4,
> but if there is a context-switch before c000000000226edc, a false
> positive will be reported.
>
> [1] http://154.220.3.115/logs/0422/configformainline.txt
> [2] 154.220.3.115/logs/0422/whilebash.sh
> [3] http://154.220.3.115/logs/0422/srcu_gp_start_if_needed.txt
>
> My analysis and debugging may not be correct, but the bug is easily
> reproducible.

Could you provide the full kernel log? It is not clear exactly from
your attachments, but I think this is a stack overflow issue as
implied by the mention of __stack_chk_fail. One trick might be to turn
on any available stack debug kernel config options, or check the
kernel logs for any messages related to shortage of remaining stack
space.

Additionally, you could also find out where the kernel crash happened
in C code following the below notes [1] I wrote (see section "Figuring
out where kernel crashes happen in C code"). The notes are
x86-specific but should be generally applicable (In the off chance
you'd like to improve the notes, feel free to share them ;-)).

Lastly, is it a specific kernel release from which you start seeing
this issue? You should try git bisect if it is easily reproducible in
a newer release, but goes away in an older one.

I will also join you in your debug efforts soon though I am currently
in between conferences.

[1] https://gist.github.com/joelagnel/ae15c404facee0eb3ebb8aff0e996a68

thanks,

 - Joel




>
> Thanks
> Zhouyi
