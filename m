Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 684F46EBD3F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Apr 2023 07:46:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q3y1X2L9nz3fR1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Apr 2023 15:46:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=h3K1g2Sl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=h3K1g2Sl;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q3y0h2cjsz3cBk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Apr 2023 15:45:39 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1a69f686345so28476005ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Apr 2023 22:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682228731; x=1684820731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfJCkDUStFvQlmTy2TXfR/ynfAHG7u0kjCgYu5zu+S0=;
        b=h3K1g2SlnA1hNafZsDzL73GqQ1fMN3ZSIkf+EqngNBU7zAM6wqFmSPnKPTKawt2WKW
         iaIRN0/XnDAJVZFtJoF1QHNP+JWbVd+i5p4Q02wtaCKp9b+hV7eaOGEAyK2NV9SDG7D+
         ZhqUEZJg5gbLoNJUhcxisMxtOpaB54OBwhNnIV3un4c4nnZ3Ms9zAkJAHuhN28+YmCjg
         jjxQMc2LXjzWUXmVZNso5aAvjBpQ9wVuiWwGwka1oBs2hS9nyA76a1+Y28gYgaukGDJ9
         BpdoqsQ4KqQYA/AFzykeg41Z/9YTlgbUYEofSp2w57GWCOxCdypVmL9NLDLXBFyMmz9+
         +6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682228732; x=1684820732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfJCkDUStFvQlmTy2TXfR/ynfAHG7u0kjCgYu5zu+S0=;
        b=HbHDkg8ngkcLryRIoseMvBOhzsT/ynG2+RoKWGl8O8wxPo9HHj9LgL2T2kuWrbpSOx
         g/ZLnnI8oqgymK3UYop5Sfy20IkwDDBwXnyCP63oZ0sCUEJeb5rxGWoi2xaDv3KvD1Jl
         NRJ42zNmjcxarUW9PQqU035nUhCCKQgDXwSaKrXN+KJ+u/nlwIVW2dUO8HVki52L0+wp
         wRnRZ5TDwPnViEKoZkPJ8T2ceZYJgnTmnswBOofdm8jCDGAJi7Q24WG9rBRsahPSIH0K
         p5hbJiaAzteDCeezcVjIvg6mIN5tOoXEypndjcKDtlvHvfiDyBYidu5QGo+hQnC5+i8i
         9z0A==
X-Gm-Message-State: AAQBX9d8SYN0263aRV+HPW8g6/kmkwl0uqA+VQSYT/w/JNakDTQR/PCD
	a45ryTKWjPTtWBSNbqsQ8khPmXrNCH2B47fD9OE=
X-Google-Smtp-Source: AKy350aDyCUNDsIcYQXQcqK0mni7J28pUoI0YrKxDiK2jn8R3+yZ0a/3XNftKZEdRgkkqzNpR2iLz3CPFuu1ytYHUEM=
X-Received: by 2002:a17:90b:3507:b0:247:eae:1783 with SMTP id
 ls7-20020a17090b350700b002470eae1783mr10044277pjb.45.1682228731562; Sat, 22
 Apr 2023 22:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YQCugPs1bquaA4ZLdsM4S3hWv9OMNTt80tSvjCO0LwiHg@mail.gmail.com> <CAABZP2wE8Gz9wV_YAjNsFo7V=rpymuLOqVJ0=aAmwixqPiHTiQ@mail.gmail.com>
In-Reply-To: <CAABZP2wE8Gz9wV_YAjNsFo7V=rpymuLOqVJ0=aAmwixqPiHTiQ@mail.gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Sun, 23 Apr 2023 13:45:20 +0800
Message-ID: <CAABZP2w3gGEvU1xx_8abE78RzmPX88wvcALF033U8mjC9AvwaQ@mail.gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
To: Joel Fernandes <joel@joelfernandes.org>
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

On Sun, Apr 23, 2023 at 9:37=E2=80=AFAM Zhouyi Zhou <zhouzhouyi@gmail.com> =
wrote:
>
> On Sun, Apr 23, 2023 at 3:19=E2=80=AFAM Joel Fernandes <joel@joelfernande=
s.org> wrote:
> >
> > Hi Zhouyi,
> Thank Joel for your quick response ;-)
> I will gradually provide all the necessary information to facilitate
> our chasing. Please do not hesitate email me
> if I have ignored any ;-)
> >
> > On Sat, Apr 22, 2023 at 2:47=E2=80=AFPM Zhouyi Zhou <zhouzhouyi@gmail.c=
om> wrote:
> > >
> > > Dear PowerPC and RCU developers:
> > > During the RCU torture test on mainline (on the VM of Opensource Lab
> > > of Oregon State University), SRCU-P failed with __stack_chk_fail:
> > > [  264.381952][   T99] [c000000006c7bab0] [c0000000010c67c0]
> > > dump_stack_lvl+0x94/0xd8 (unreliable)
> > > [  264.383786][   T99] [c000000006c7bae0] [c00000000014fc94] panic+0x=
19c/0x468
> > > [  264.385128][   T99] [c000000006c7bb80] [c0000000010fca24]
> > > __stack_chk_fail+0x24/0x30
> > > [  264.386610][   T99] [c000000006c7bbe0] [c0000000002293b4]
> > > srcu_gp_start_if_needed+0x5c4/0x5d0
> > > [  264.388188][   T99] [c000000006c7bc70] [c00000000022f7f4]
> > > srcu_torture_call+0x34/0x50
> > > [  264.389611][   T99] [c000000006c7bc90] [c00000000022b5e8]
> > > rcu_torture_fwd_prog+0x8c8/0xa60
> > > [  264.391439][   T99] [c000000006c7be00] [c00000000018e37c] kthread+=
0x15c/0x170
> > > [  264.392792][   T99] [c000000006c7be50] [c00000000000df94]
> > > ret_from_kernel_thread+0x5c/0x64
> > > The kernel config file can be found in [1].
> > > And I write a bash script to accelerate the bug reproducing [2].
> > > After a week's debugging, I found the cause of the bug is because the
> > > register r10 used to judge for stack overflow is not constant between
> > > context switches.
> > > The assembly code for srcu_gp_start_if_needed is located at [3]:
> > > c000000000226eb4:   78 6b aa 7d     mr      r10,r13
> > > c000000000226eb8:   14 42 29 7d     add     r9,r9,r8
> > > c000000000226ebc:   ac 04 00 7c     hwsync
> > > c000000000226ec0:   10 00 7b 3b     addi    r27,r27,16
> > > c000000000226ec4:   14 da 29 7d     add     r9,r9,r27
> > > c000000000226ec8:   a8 48 00 7d     ldarx   r8,0,r9
> > > c000000000226ecc:   01 00 08 31     addic   r8,r8,1
> > > c000000000226ed0:   ad 49 00 7d     stdcx.  r8,0,r9
> > > c000000000226ed4:   f4 ff c2 40     bne-    c000000000226ec8
> > > <srcu_gp_start_if_needed+0x1c8>
> > > c000000000226ed8:   28 00 21 e9     ld      r9,40(r1)
> > > c000000000226edc:   78 0c 4a e9     ld      r10,3192(r10)
> > > c000000000226ee0:   79 52 29 7d     xor.    r9,r9,r10
> > > c000000000226ee4:   00 00 40 39     li      r10,0
> > > c000000000226ee8:   b8 03 82 40     bne     c0000000002272a0
> > > <srcu_gp_start_if_needed+0x5a0>
> > > by debugging, I see the r10 is assigned with r13 on c000000000226eb4,
> > > but if there is a context-switch before c000000000226edc, a false
> > > positive will be reported.
> > >
> > > [1] http://154.220.3.115/logs/0422/configformainline.txt
> > > [2] 154.220.3.115/logs/0422/whilebash.sh
> > > [3] http://154.220.3.115/logs/0422/srcu_gp_start_if_needed.txt
> > >
> > > My analysis and debugging may not be correct, but the bug is easily
> > > reproducible.
> >
> > Could you provide the full kernel log? It is not clear exactly from
> > your attachments, but I think this is a stack overflow issue as
> > implied by the mention of __stack_chk_fail. One trick might be to turn
> > on any available stack debug kernel config options, or check the
> > kernel logs for any messages related to shortage of remaining stack
> > space.
> The full kernel log is [1]
> [1] http://154.220.3.115/logs/0422/console.log
> >
> > Additionally, you could also find out where the kernel crash happened
> > in C code following the below notes [1] I wrote (see section "Figuring
> > out where kernel crashes happen in C code"). The notes are
> > x86-specific but should be generally applicable (In the off chance
> > you'd like to improve the notes, feel free to share them ;-)).
> Fantastic article!!!, I benefit a lot from reading it. Because we can
> reproduce it so easily on powerpc VM,
> I can even use gdb to debug it, following is my debug process on
> 2e83b879fb91dafe995967b46a1d38a5b0889242(srcu: Create an
> srcu_read_lock_nmisafe() and srcu_read_unlock_nmisafe()).
>
> [2] http://154.220.3.115/logs/0422/gdb.txt
> >
> > Lastly, is it a specific kernel release from which you start seeing
> > this issue? You should try git bisect if it is easily reproducible in
> > a newer release, but goes away in an older one.
> I did bisect on powerpc VM, the problem begin to appear on
> 2e83b879fb91dafe995967b46a1d38a5b0889242(srcu: Create an
> srcu_read_lock_nmisafe() and srcu_read_unlock_nmisafe()).
>
> The kernel is good at 5d0f5953b60f5f7a278085b55ddc73e2932f4c33(srcu:
> Convert ->srcu_lock_count and ->srcu_unlock_count to atomic)
>
> But if I apply the following patch [3] to
> 5d0f5953b60f5f7a278085b55ddc73e2932f4c33, the bug appears again.
> [3] http://154.220.3.115/logs/0422/bug.patch
>
> Both native gcc on PPC vm (gcc version 9.4.0), and gcc cross compiler
> on my x86 laptop (gcc version 10.4.0) will reproduce the bug.
update: stress tested on x86 platform for 6 hours, no bug reported
(while we can reproduce it on X86 based cross platform powerpc gcc and
X86 based cross platform powerpc qemu in less than 3 minute).
> >
> > I will also join you in your debug efforts soon though I am currently
> > in between conferences.
> Exciting!! Thank you very much!
> I can give you ssh access (based on rsa pub key) to PPC vm on Oregon
> State University if you like.
>
> Thanks again
> Zhouyi
> >
> > [1] https://gist.github.com/joelagnel/ae15c404facee0eb3ebb8aff0e996a68
> >
> > thanks,
> >
> >  - Joel
> >
> >
> >
> >
> > >
> > > Thanks
> > > Zhouyi
