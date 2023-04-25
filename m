Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039E46EDF34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 11:28:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5GsD61fpz3fDd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 19:28:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aO5/vL91;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=aO5/vL91;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5GrP2Hnmz3cLX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 19:28:03 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-51fdc1a1270so3975469a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682414880; x=1685006880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4hGU+SQ1kb2lxwxNXhJDjU9+qTWMiAfSzkFxBombrE=;
        b=aO5/vL91e9O2f2K9x8xOZ5wPdurmULnA+zwkbSG0Y9dI2OjUeI3tqKygfr7d36qFP1
         R7GV7DKuakfgH/btdKUGs30+Nnqpd/i9mZveBgevIyUrB+sMCyiZP90L7jzRkD1B5Cc1
         8Au+9ceLhKdB4tlNv8RfU4FxaF6OG10Nhi0Uq42V2rocct1BLwBcS8e1FEtfJuEAP9X5
         RUlJQA5XkkIJE3Q0IDrL6C27J6QuzFWKc+Xd0vj9UO20e/q9cMFKqL/JmxbQTgYrqXhB
         8XGeo8F+a5vAL15SUk9NVZAJGhcwjRmRHUgOCTR52OPyBIf3wOHPlmNCL7ob3dJn6sl6
         IEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682414880; x=1685006880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4hGU+SQ1kb2lxwxNXhJDjU9+qTWMiAfSzkFxBombrE=;
        b=UMA2Guz14OiHMmq5v0+MDFsnUY7A/HmJDZ9264I+Ar5DyV7qZqL17VjjaXhwERBtVH
         zfpFmiOZhZYQXirKgBnJXwBIZIfbP2ExF0YXfQAfSrhW0KofNoDujSUsCcdGNQRi+pJY
         ud+azlski7rxY/mCjJ+vLfOizFyW/KF7ZT2Jcu+JOXrbvI7XKveS9AAebDU9X8Nkl1L8
         EMsnqeYB3Wo6m3vVx77VMCTKjqH7j1Rc4zqLIz+2Fs/ai1mgnWykVZkAkoMg1als8u1D
         EZvMOQ6ujJVCZ0oeg+Ppld/LebUIKLckHCDRwsqNu/QxM9hhUvRc0aLBpJozZPSiRvF6
         UVDg==
X-Gm-Message-State: AAQBX9daT3f/Tc+nJOVHI3cc6Z4iINjIuC/EepvTnNXMS6Y9CVuwexEN
	njt6n8Ekxm4sXR1Qvt4yspDbqYnunukIIVFJh3s=
X-Google-Smtp-Source: AKy350YRyKg+MYGcUyfxJ3BNqOwS83kTuBJYkfRtMwNAlgV/QKntj2NWrX6nRsfIdF05Qa3jMmhoQD1ix9uhT4utIuI=
X-Received: by 2002:a17:90b:4a10:b0:246:bb61:4a56 with SMTP id
 kk16-20020a17090b4a1000b00246bb614a56mr16894795pjb.27.1682414879950; Tue, 25
 Apr 2023 02:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <87cz3tylwx.fsf@mail.concordia> <CAABZP2zr=jypD7w_o18o95QEj1nkFugLcNH5sbuSAY-caBQoeQ@mail.gmail.com>
In-Reply-To: <CAABZP2zr=jypD7w_o18o95QEj1nkFugLcNH5sbuSAY-caBQoeQ@mail.gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 25 Apr 2023 17:27:48 +0800
Message-ID: <CAABZP2xVCQhizytn4H9Co7OU3UCSb_qNJaOszOawUFpeo=qpWQ@mail.gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 25, 2023 at 2:01=E2=80=AFPM Zhouyi Zhou <zhouzhouyi@gmail.com> =
wrote:
>
> hi
>
> On Tue, Apr 25, 2023 at 6:07=E2=80=AFAM Michael Ellerman <mpe@ellerman.id=
.au> wrote:
> >
> > Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> > > Dear PowerPC and RCU developers:
> > > During the RCU torture test on mainline (on the VM of Opensource Lab
> > > of Oregon State University), SRCU-P failed with __stack_chk_fail:
> > ...
> > > by debugging, I see the r10 is assigned with r13 on c000000000226eb4,
> > > but if there is a context-switch before c000000000226edc, a false
> > > positive will be reported.
> > >
> > > [1] http://154.220.3.115/logs/0422/configformainline.txt
> >
> > Says:
> >
> > CONFIG_CC_VERSION_TEXT=3D"powerpc64le-linux-gnu-gcc-10 (Ubuntu 10.4.0-4=
ubuntu1~22.04) 10.4.0"
> >
> > Do you see the same issue with a newer GCC?
> On PPC vm of Oregon State University (I can grant rsa-pub key ssh
> access if you are interested), I
> build and install the gcc from git, then use the newly built gcc to
> compile the kernel, the bug disappears,
> I don't know why. Following is what is do:
>
> 1) git clone git://gcc.gnu.org/git/gcc.git
> git rev-parse --short HEAD
> f0eabc52c9a
> 2) mkdir gcc/build
> 3) cd gcc/build
> 4) ../configure --disable-bootstrap --prefix=3D/home/ubuntu/gcc-install
> 5) make -j 4 //my VM has limited memory ;-)
> 6) make install
> 7) cd  linux-dir
> git rev-parse --short HEAD
> 61d325dcbc05
> 8) export PATH=3D/home/ubuntu/gcc-install/bin:$PATH
> 9) make vmlinux -j 8
> 10) ./whilebash.sh [1]
>
> From the assembly code of srcu_gp_start_if_needed [2], I found stack prot=
ector
> is operated directly on r13:
>
> c000000000225098: 30 00 0d e9 ld      r8,48(r13)
> c00000000022509c: 08 00 3c e9 ld      r9,8(r28)
> c0000000002250a0: 14 42 29 7d add     r9,r9,r8
> c0000000002250a4: ac 04 00 7c hwsync
> c0000000002250a8: 10 00 7b 3b addi    r27,r27,16
> c0000000002250ac: 14 da 29 7d add     r9,r9,r27
> c0000000002250b0: a8 48 00 7d ldarx   r8,0,r9
> c0000000002250b4: 01 00 08 31 addic   r8,r8,1
> c0000000002250b8: ad 49 00 7d stdcx.  r8,0,r9
> c0000000002250bc: f4 ff c2 40 bne-    c0000000002250b0
> <srcu_gp_start_if_needed+0x220>
> c0000000002250c0: 28 00 01 e9 ld      r8,40(r1)
> c0000000002250c4: 78 0c 2d e9 ld      r9,3192(r13)
> c0000000002250c8: 79 4a 08 7d xor.    r8,r8,r9
> c0000000002250cc: 00 00 20 39 li      r9,0
> c0000000002250d0: 90 03 82 40 bne     c000000000225460
> <srcu_gp_start_if_needed+0x5d0>
>
> console.log is attached at [3].
>
> [1] 140.211.169.189/0425/whilebash.sh
> [2] http://140.211.169.189/0425/srcu_gp_start_if_needed.txt
> [3] http://140.211.169.189/0425/console.log
>
> I am very glad to cooperate if there is anything else I can do ;-)
>
> Cheers
> Zhouyi
> >
> > There's 12.2.0 here:
> >   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/=
12.2.0/
> >   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/ppc64le=
/12.2.0/
powerpc64le-linux-gnu-gcc-12 cross compiler on my Ubuntu 22.04 does
not seem to have that issue as gcc-10 does
[4] http://140.211.169.189/0425/srcu_gp_start_if_needed-gcc-12.txt
> >
> > Or if you can build in a Fedora 38 system or container, it has GCC 13.
> >
> > cheers
