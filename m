Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B12D191ABA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 21:16:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48n2ZZ3KlwzDqnW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 07:16:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=CMxrEsAy; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48n2Wf0pkbzDqng
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 07:13:50 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id 10so165728qtp.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 13:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=C9b2EFih07Bol0OhuOp+naFJ2QOu8CjYU0vdzwBlssE=;
 b=CMxrEsAyp8SoMtphK9LTHXEQNe0gvYg1kG4es2vY/Cbot4/a9hWYn5blklz6400FbL
 fjtCKnMWVFyIValqMYpQBcctE+nIM3FCSmEJE9KpwkGnDfyqpU95ejovPi8CN4uN3ujw
 JcZZEOcfqRgyR5sasNtVg6iu0Ng4YM+cAoCXu6ofZTKJqlpxKBCx/7ErtIrZC48JQKeE
 g6OEhLyoSiFv52Hz2QJCkO9Id2bwJbgHfgO+t3X163n3GPhu10dppbSKUaF/6c3JLipw
 2encQyfW+aPLKWmgHK80Cz0zjSUUD2w/lNtHix4PZ/vJyNA/bIlnYB59B2G8cGTUXrbp
 6NmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=C9b2EFih07Bol0OhuOp+naFJ2QOu8CjYU0vdzwBlssE=;
 b=axiyhNK80vdZkHKXCOZZfAmNvGMzcA9N46p3MY2RpsRB3Mxkw4/jtyclSefI0MiBvn
 Td1PscBjlMWvPpVe8ZIonHrVYLcvld8txiLloct3jdcRRL9Dd/DyF6V8mnDmaRsWebuF
 vgEgdpvzm24TP5rkcjYHANQqcHkoMX127L4SY0sqBDfvJrH/yIy/SYkz5iAV7Bn0Xvj8
 I9GVgyeFJg0Glnc1VjC41OjqXShVhvP55ViXyG1xPbbTic7Hep2zKk/y1gw6Lfw44i+Y
 8CGuS7NmaTUe1f6EpehfHOB41lyglnPveuz/SYdF0Lbl5uKec3ttn+UrdFYP/bXeIKDC
 K7mQ==
X-Gm-Message-State: ANhLgQ2/XAD+Ip9Ajlhw6jB+diAaNuHSWj3CZHzvpeIAen+AQtcI4iF/
 IRECtujYca833To2ywK7fn/bhg==
X-Google-Smtp-Source: ADFU+vvUb5EPEwWM830GWFC8xZrHZgfn11CiVhdGj190JilNUxrE/jVs5R/tSSA6ED7rCnFbo78KcA==
X-Received: by 2002:ac8:1968:: with SMTP id g37mr28036704qtk.322.1585080824046; 
 Tue, 24 Mar 2020 13:13:44 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id y127sm13540702qkb.76.2020.03.24.13.13.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Mar 2020 13:13:43 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Argh, can't find dcache properties !
From: Qian Cai <cai@lca.pw>
In-Reply-To: <876a5938fbad9d9e176e5f22f12e6b472d0dc4f7.camel@alliedtelesis.co.nz>
Date: Tue, 24 Mar 2020 16:13:42 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <48F1D8CF-13A1-4348-8973-81503782A451@lca.pw>
References: <be8c123a90f6d1664a902b6ad6c754b9f3d9e567.camel@alliedtelesis.co.nz>
 <87tv2exst1.fsf@mpe.ellerman.id.au>
 <876a5938fbad9d9e176e5f22f12e6b472d0dc4f7.camel@alliedtelesis.co.nz>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
Cc: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Mar 24, 2020, at 4:06 PM, Chris Packham =
<Chris.Packham@alliedtelesis.co.nz> wrote:
>=20
> On Tue, 2020-03-24 at 15:47 +1100, Michael Ellerman wrote:
>> Chris Packham <Chris.Packham@alliedtelesis.co.nz> writes:
>>> Hi All,
>>>=20
>>> Just booting up v5.5.11 on a Freescale T2080RDB and I'm seeing the
>>> following mesage.
>>>=20
>>> kern.warning linuxbox kernel: Argh, can't find dcache properties !
>>> kern.warning linuxbox kernel: Argh, can't find icache properties !
>>>=20
>>> This was changed from DBG() to pr_warn() in commit 3b9176e9a874
>>> ("powerpc/setup_64: fix -Wempty-body warnings") but the message
>>> seems
>>> to be much older than that. So it's probably been an issue on the
>>> T2080
>>> (and other QorIQ SoCs) for a while.
>>=20
>> That's an e6500 I think? So 64-bit Book3E.
>>=20
>=20
> Yes that's correct.
>=20
>> You'll be getting the default values, which is 64 bytes so I guess
>> that
>> works in practice.
>>=20
>>> Looking at the code the t208x doesn't specifiy any of the d-cache-
>>> size/i-cache-size properties. Should I add them to silence the
>>> warning
>>> or switch it to pr_debug()/pr_info()?
>>=20
>> Yeah ideally you'd add them to the device tree(s) for those boards.
>>=20
>=20
> I think the info I need is in the block diagram[0]. I'll whip up
> a patch.
>=20
> --
> [1] - =
https://www.nxp.com/products/processors-and-microcontrollers/power-archite=
cture/qoriq-communication-processors/t-series/qoriq-t2080-and-t2081-multic=
ore-communications-processors:T2080

BTW, POWER9 PowerNV would have the same thing.=20

[    0.000000][    T0] Setting debug_guardpage_minorder to 1
[    0.000000][    T0] Reserving 512MB of memory at 128MB for =
crashkernel (System RAM: 262144MB)
[    0.000000][    T0] radix-mmu: Page sizes from device-tree:
[    0.000000][    T0] radix-mmu: Page size shift =3D 12 AP=3D0x0
[    0.000000][    T0] radix-mmu: Page size shift =3D 16 AP=3D0x5
[    0.000000][    T0] radix-mmu: Page size shift =3D 21 AP=3D0x1
[    0.000000][    T0] radix-mmu: Page size shift =3D 30 AP=3D0x2
[    0.000000][    T0] radix-mmu: Activating Kernel Userspace Execution =
Prevention
[    0.000000][    T0] radix-mmu: Activating Kernel Userspace Access =
Prevention
[    0.000000][    T0] radix-mmu: Mapped =
0x0000000000000000-0x0000000001600000 with 2.00 MiB pages (exec)
[    0.000000][    T0] radix-mmu: Mapped =
0x0000000001600000-0x0000000040000000 with 2.00 MiB pages
[    0.000000][    T0] radix-mmu: Mapped =
0x0000000040000000-0x0000002000000000 with 1.00 GiB pages
[    0.000000][    T0] radix-mmu: Mapped =
0x0000200000000000-0x0000202000000000 with 1.00 GiB pages
[    0.000000][    T0] radix-mmu: Initializing Radix MMU
[    0.000000][    T0] Linux version 5.6.0-rc7-next-20200324+ =
(root@ibm-p9wr) (gcc version 8.3.1 20191121 (Red Hat 8.3.1-5) (GCC)) #2 =
SMP Tue Mar 24 15:52:36 EDT 2020
[    0.000000][    T0] Argh, can't find dcache properties !
[    0.000000][    T0] Argh, can't find icache properties !
[    0.000000][    T0] Found initrd at =
0xc000000007850000:0xc00000000ad26142
[    0.000000][    T0] OPAL: Found memory mapped LPC bus on chip 0
[    0.000000][    T0] Using PowerNV machine description
[    0.000000][    T0] printk: bootconsole [udbg0] enabled
[    0.000000][    T0] CPU maps initialized for 4 threads per core
[    0.000000][    T0] =
-----------------------------------------------------
[    0.000000][    T0] phys_mem_size     =3D 0x4000000000
[    0.000000][    T0] dcache_bsize      =3D 0x80
[    0.000000][    T0] icache_bsize      =3D 0x80
[    0.000000][    T0] cpu_features      =3D 0x0001f86f8f5fb1a7
[    0.000000][    T0]   possible        =3D 0x0003fbffcf5fb1a7
[    0.000000][    T0]   always          =3D 0x0000006f8b5c91a1
[    0.000000][    T0] cpu_user_features =3D 0xdc0065c2 0xaee00000
[    0.000000][    T0] mmu_features      =3D 0xbc006041
[    0.000000][    T0] firmware_features =3D 0x0000000010000000
[    0.000000][    T0] vmalloc start     =3D 0xc008000000000000
[    0.000000][    T0] IO start          =3D 0xc00a000000000000
[    0.000000][    T0] vmemmap start     =3D 0xc00c000000000000
[    0.000000][    T0] =
-----------------------------------------------------=
