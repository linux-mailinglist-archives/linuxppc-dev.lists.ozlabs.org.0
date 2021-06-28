Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDFB3B57F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 05:52:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCtws3H39z3bYk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 13:52:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=J230cK7P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J230cK7P; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCtwM51hqz2ysq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 13:52:17 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id s137so5376506pfc.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jun 2021 20:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=gYNivo5OTIKZLkN+JJLDm3OpbastedsS2IoApOjq5cI=;
 b=J230cK7PBd1weXTQ+PHLUpHGguUVqC5aJLBM6AqRjMnSajTHCanUJR4Idn4CwI2t9a
 +TZAMSReaTEAXrvByuAcpflHbWIddKyYPomyDGMC20P46jzJ0FHoLBUo8zX+95kL77y2
 iagdIXtmNhGjeBv9a3NFLdF+4tUdgPt/GS5ntRrE5ylOqrpZEnvbs0yd59m/zwH2BTCQ
 u4dSisvHS6b5kkv2VmcJbCAOyWYuPTEANY1ZWbrKmAfEc/+XKa7rgJStspoY27CJ3WQF
 f4EsoEQ5TfQk63tckXDCdiSrO9SYlfZ2JCrhINclBfzmh66nO4cW7njzw8cBI1Qy26h7
 Ltjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gYNivo5OTIKZLkN+JJLDm3OpbastedsS2IoApOjq5cI=;
 b=XGmkf4ny18dLRlJRwJLVK4F9K+Sq6iWKMOh1em6nKou7qGUhDnqNsxCa7XoWZ1sIcv
 hfQ2Lexcq/9iEzObUg5iQfZe/DVY/EXyqKT9t7KK/M5F8iV9NBoLCXMeuw1ptJ35UwHA
 vPNnHsZ4YioRlps0WSTSH2mpBKShz8c9jsrwLDTz+m7X4nh+BhmiTsT0Ar6gKkj48gvS
 luZQoiSdoRWzumlKoE8pa02J9sZO6t/SgB8xtMgTddbZs1ttMWOS3o9GwdiZyU88OLQm
 WFFZYIyqtYR1BM9uVmnUlR1MsrGoNGzIifzDTM0hNZPxtoCQjJxZLI/CqrcGxsZqx0XF
 7qbw==
X-Gm-Message-State: AOAM530FZybag+60Uu7jwMQA1H5Kg3wSXlR5oEMiINcYpoX58lHndduO
 XQr4P3d/aNDQLazEKJ3lsfg=
X-Google-Smtp-Source: ABdhPJz4DihxvRnXAoPYFnKmrTqXk1mwta6/3uutfeUb0/blt+XuCqPEwhfhy4FyGbztbJSbGG5PeQ==
X-Received: by 2002:a62:768c:0:b029:2ff:2002:d3d0 with SMTP id
 r134-20020a62768c0000b02902ff2002d3d0mr22596990pfc.70.1624852326571; 
 Sun, 27 Jun 2021 20:52:06 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id o14sm12683246pjj.6.2021.06.27.20.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jun 2021 20:52:06 -0700 (PDT)
Date: Mon, 28 Jun 2021 13:52:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [powerpc][next-20210625] Kernel
 warning(arch/powerpc/kernel/interrupt.c:518) during boot
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
References: <478A3DE4-159E-4FF8-92B4-6550F72951E6@linux.vnet.ibm.com>
 <1624733491.pxug6c02ws.astroid@bobo.none>
 <1624788248.0kxmv878xd.astroid@bobo.none>
 <0C513B10-78DE-48F3-AD50-3A89225E20AF@linux.vnet.ibm.com>
In-Reply-To: <0C513B10-78DE-48F3-AD50-3A89225E20AF@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1624851796.z5shw7nhxf.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Sachin Sant's message of June 27, 2021 9:23 pm:
>=20
>> On 27-Jun-2021, at 3:36 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>>=20
>>> So there's definitely IRQMASK=3D0 and no MSR[EE]=3D0 in this frame, whi=
ch is=20
>>> what the warning was.
>>>=20
>>> I'd say either something hasn't set PACA_IRQ_HARD_DIS properly, so EE=20
>>> doesn't get enabled when irqs are restored, or maybe the  change to
>>> arch_local_irq_restore(). Less likely that the stack got messed up.
>>>=20
>>> Can you try run with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=3Dy ?
>>=20
>> Nevermind, I think I've found the problem. Some code runs in the
>> implicit soft-mask region without expecting to be masked. Working
>> on a fix=E2=80=A6
>=20
> :-) . I was able to recreate this after few attempts. It seem the warning=
 isn=E2=80=99t
> always triggered during boot. I had to run a kernel compile operation aft=
er
> boot to trigger this warning again.
>=20
> In case its helpful here is the additional trace with PPC_IRQ_SOFT_MASK_D=
EBUG.

Thanks. I ended up being able to reproduce as well, quite frequently=20
with some extra debug checks that specifically catch more cases.

I've got a few patches under test right now, very stable so far. I'll=20
post them out if they survive a nother hour or two stress testing.

The problem is some code (e.g., ret_from_fork) now gets implicitly=20
soft-masked where that was not expecting to be. A masked interrupt might=20
hit, and then when it moves out of the implicit soft-mask region it
does not re-enable interrupts. Some types of pending interrupts will=20
clear MSR[EE], and that ends up causing this bug on the next interrupt
that happens.

Not a wonderful escape :\  thanks for finding it. The fixes aren't too
bad, fortunately.

Thanks,
Nick

>=20
> [   92.106731] ------------[ cut here ]------------
> [   92.106738] WARNING: CPU: 45 PID: 12757 at arch/powerpc/kernel/irq.c:2=
55 arch_local_irq_restore+0x1d0/0x200
> [   92.106753] Modules linked in: dm_mod bonding nft_ct nf_conntrack nf_d=
efrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables libcrc32c nfnetlink sunrp=
c pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables ext=
4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp fuse
> [   92.106828] CPU: 45 PID: 12757 Comm: sh Kdump: loaded Tainted: G      =
  W         5.13.0-rc7-next-20210625 #1
> [   92.106841] NIP:  c0000000000164d0 LR: c000000000cedaa8 CTR: 000000000=
0000000
> [   92.106849] REGS: c00000008dfeb7e0 TRAP: 0700   Tainted: G        W   =
       (5.13.0-rc7-next-20210625)
> [   92.106859] MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR:=
 28004222  XER: 00000000
> [   92.106892] CFAR: c00000000001632c IRQMASK: 0=20
>                GPR00: c000000000ceda98 c00000008dfeba80 c000000002921e00 =
0000000000000000=20
>                GPR04: 0000000000000000 0000000000000000 0000000000000000 =
00000000000000ff=20
>                GPR08: 0000000000000001 0000000000000000 0000000000000001 =
0000000000000017=20
>                GPR12: 0000000024004822 c000000007fb9200 000000012efd81d4 =
000000012ee50000=20
>                GPR16: 0000000000000001 00000100268a0e00 000001002687ec10 =
0000000114200c40=20
>                GPR20: 00003fffa93f8000 0000000000000000 00003fffa93f9300 =
000000012efb1988=20
>                GPR24: 000000012ee7fe7c 000000012efccba0 000000012ee50000 =
c00000008d5d7600=20
>                GPR28: c0000000314c0bc0 c000000040d9f100 c0000008beb5861c =
4b72201a3063fe13=20
> [   92.107024] NIP [c0000000000164d0] arch_local_irq_restore+0x1d0/0x200
> [   92.107035] LR [c000000000cedaa8] _raw_spin_unlock_irqrestore+0x88/0xb=
0
> [   92.107047] Call Trace:
> [   92.107052] [c00000008dfeba80] [c00000008dfebb50] 0xc00000008dfebb50 (=
unreliable)
> [   92.107065] [c00000008dfebab0] [238c5bf052df0858] 0x238c5bf052df0858
> [   92.107076] [c00000008dfebae0] [c0000000008178e8] get_random_u64+0x88/=
0x100
> [   92.107090] [c00000008dfebb20] [c000000000020134] arch_randomize_brk+0=
xb4/0xd8
> [   92.107105] [c00000008dfebb50] [c0000000005430b0] load_elf_binary+0xe7=
0/0x1220
> [   92.107119] [c00000008dfebc40] [c00000000047ded0] bprm_execve+0x410/0x=
800
> [   92.107132] [c00000008dfebd10] [c00000000047e8ec] do_execveat_common.i=
sra.44+0x21c/0x240
> [   92.107145] [c00000008dfebd80] [c00000000047e964] sys_execve+0x54/0x70
> [   92.107157] [c00000008dfebdb0] [c000000000032334] system_call_exceptio=
n+0x164/0x2e0
> [   92.107169] [c00000008dfebe10] [c00000000000c464] system_call_common+0=
xf4/0x258
> [   92.107185] --- interrupt: c00 at 0x3fff9bb6b8a8
> [   92.107193] NIP:  00003fff9bb6b8a8 LR: 00003fff9bb6c240 CTR: 000000000=
0000000
> [   92.107202] REGS: c00000008dfebe80 TRAP: 0c00   Tainted: G        W   =
       (5.13.0-rc7-next-20210625)
> [   92.107213] MSR:  800000000000f033 <SF,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 2=
8004224  XER: 00000000
> [   92.107243] IRQMASK: 0=20
>                GPR00: 000000000000000b 00003fffc36a1440 00003fff9bc87300 =
00000100268a67d0=20
>                GPR04: 0000010026887e50 0000010026882c50 fefefefefefefeff =
7f7f7f7f7f7f7f7f=20
>                GPR08: 00000100268a67d0 0000000000000000 0000000000000000 =
0000000000000000=20
>                GPR12: 0000000000000000 00003fff9bce3780 0000000114200db4 =
0000000000000000=20
>                GPR16: 0000000000000001 00000100268a0e00 000001002687ec10 =
0000000114200c40=20
>                GPR20: 00000001141dd820 0000000000000000 00000001141dd740 =
0000000114204358=20
>                GPR24: 0000000114203948 0000010026876454 0000000000000001 =
0000010026882c50=20
>                GPR28: 0000010026887e50 0000010026882c50 00000100268a67d0 =
00003fffc36a1440=20
> [   92.107369] NIP [00003fff9bb6b8a8] 0x3fff9bb6b8a8
> [   92.107378] LR [00003fff9bb6c240] 0x3fff9bb6c240
> [   92.107386] --- interrupt: c00
> [   92.107393] Instruction dump:
> [   92.107400] 7d2000a6 71298000 40820048 39200000 992d0152 39400000 992d=
0153 614a8002=20
> [   92.107427] 7d410164 4bfffe6c 60000000 60000000 <0fe00000> 4bfffe5c 60=
000000 60000000=20
> [   92.107451] ---[ end trace 5f1d49fb99f3613d ]=E2=80=94
>=20
> Complete dmesg log attached.
>=20
> Thanks
> -Sachin
>=20
>=20
