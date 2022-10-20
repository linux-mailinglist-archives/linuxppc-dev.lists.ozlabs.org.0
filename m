Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3BD605821
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 09:14:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtJkR50Xtz3f07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 18:14:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I8I2Ph36;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I8I2Ph36;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtJjX5HgTz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 18:13:36 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id j12so829468plj.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 00:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/xwlT/dTzs02pruabUZt0nGucT/fqY5pvDK3Ypp5ss=;
        b=I8I2Ph36fDAuA6xwIPja5jCKUexsGRxG5ZbhfSjXXn4FN6z0kgoXq1AvHXAgorvQ2V
         SZTOBDznz+MgO2WxMW3SbzfN+2rPqggpXzamw+1bAEAFOdb4OwkN3wCGkVet8jUleFfa
         kay+GOYXoth2RaYB/bR4smcvyTZqdGB/jVmAWZslX4OzXLzGHhMxsxtZi5RfsoJcCO/O
         2nB1536+TG+ZiKtTBx+VRPYg60+wUe3qAb3MRVBzLNKsDrmiGKdXbedpHB3uExoO3tyv
         X4k8P3VK/tHMpGE6SIQWC02AOcl6NGD8VNooxlCFYnkPK1KgGXAHY3Sqeg7tD4WpogQd
         E4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f/xwlT/dTzs02pruabUZt0nGucT/fqY5pvDK3Ypp5ss=;
        b=bOFk7kZbHHjjDaxRabdmviIprTabQ5uUw3rUnRWNd0KyBG8PdjOkS70bGb8/Pce5cm
         hML+DszRDhXFk8uaj9IND5ehPoS3+0ZvSw7g+a5wY+CVPJs2ZmipWEPr8GGjM2AM2DkB
         7LG1GifYD7GUeFlnLADvJUPoQ0f3UM8G/+aH73TURcrq4XK8CZ8SgfuH6AwQgCL6jr4w
         CGhI+gUWkfjITV6Hcw414wsD+webTakfY7/IMwKNdR4gIYDbB1/xa6Dy8aXCkpk5RStF
         mjDoAJAVTt2zf0ILEC/nRPd+AubuSfAPctNePHbDqI7l+aAqBPsFAIJ0Tuyb9UfSpAzZ
         okPA==
X-Gm-Message-State: ACrzQf3rJ5P/Gq2rxz0oaMYfXefNhwFXotMpVGgnncVqU1OHwOMY4veX
	I427uQx4l2mO8EjOPWL4kn2UCrDZd54=
X-Google-Smtp-Source: AMsMyM4DjvchPxPCq/3aVLhJYx/JPu2mOkeJ0ec+Y6/gb1BRM1LWKeDtdl2IsG4yZqrb4XMXp+jP1Q==
X-Received: by 2002:a17:90a:7d13:b0:211:b993:8319 with SMTP id g19-20020a17090a7d1300b00211b9938319mr2722600pjl.139.1666250013674;
        Thu, 20 Oct 2022 00:13:33 -0700 (PDT)
Received: from localhost ([203.220.177.94])
        by smtp.gmail.com with ESMTPSA id x21-20020aa79575000000b005672daedc8fsm5968229pfq.81.2022.10.20.00.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 00:13:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Oct 2022 17:13:29 +1000
Message-Id: <CNQKBYY5YR5S.36UWWW00MUDO1@bobo>
Subject: Re: [6.1-rc1] Warning arch/powerpc/kernel/irq_64.c:285
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Sachin Sant" <sachinp@linux.ibm.com>, "linuxppc-dev"
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <CE857624-4CCA-480F-9FB9-FAD09285D14D@linux.ibm.com>
In-Reply-To: <CE857624-4CCA-480F-9FB9-FAD09285D14D@linux.ibm.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Oct 20, 2022 at 2:55 PM AEST, Sachin Sant wrote:
> While running powerpc kselftests (mm/stress_code_patching.sh)
> on a PowerVM LPAR following warning is seen. The test passes.
> I can reliably recreate it on a Power9 server, not so easily on
> Power10.
>
> # ./stress_code_patching.sh=20
> Testing for spurious faults when mapping kernel memory...
> [  175.289418] ------------[ cut here ]------------
> [  175.289434] WARNING: CPU: 11 PID: 5436 at arch/powerpc/kernel/irq_64.c=
:285 arch_local_irq_restore+0x230/0x260
> [  175.289450] Modules linked in: dm_mod(E) nft_fib_inet(E) nft_fib_ipv4(=
E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) nf_rejec=
t_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(E=
) nf_defrag_ipv6(E) nf_defrag_ipv4(E) bonding(E) tls(E) ip_set(E) rfkill(E)=
 nf_tables(E) libcrc32c(E) nfnetlink(E) sunrpc(E) pseries_rng(E) vmx_crypto=
(E) ext4(E) mbcache(E) jbd2(E) sd_mod(E) t10_pi(E) crc64_rocksoft(E) crc64(=
E) sg(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) ipmi_devintf(E) ipmi_=
msghandler(E) fuse(E)
> [  175.289582] CPU: 11 PID: 5436 Comm: stress_code_pat Tainted: G        =
    E      6.1.0-rc1-00025-gaae703b02f92 #1
> [  175.289591] Hardware name: IBM,8375-42A POWER9 (raw) 0x4e0202 0xf00000=
5 of:IBM,FW950.50 (VL950_105) hv:phyp pSeries
> [  175.289599] NIP:  c00000000003e9a0 LR: c0000000000b16dc CTR: 000000000=
000a6a4
> [  175.289607] REGS: c0000000297b35f0 TRAP: 0700   Tainted: G            =
E       (6.1.0-rc1-00025-gaae703b02f92)
> [  175.289616] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  =
CR: 48222224  XER: 00000000
> [  175.289654] CFAR: c00000000003e7f4 IRQMASK: 1=20
> [  175.289654] GPR00: c0000000000b179c c0000000297b3890 c00000000135e900 =
0000000000000000=20
> [  175.289654] GPR04: 0000000000000000 0000201760241794 0000000000000000 =
4009287a77000005=20
> [  175.289654] GPR08: 0000000000000000 0000000000008000 c00000000ac27d80 =
0000000000000040=20
> [  175.289654] GPR12: 0000000000002000 c00000001ec52700 0000000040000000 =
0000000101239798=20
> [  175.289654] GPR16: 0000000101239724 00000001011d8128 0000000101170370 =
000000010123d568=20
> [  175.289654] GPR20: 000001002f8f5490 0000000000000001 00000001011eaf18 =
00007fffc1696ab4=20
> [  175.289654] GPR24: 00007fffc1696ab0 0000000000000000 c008000000180000 =
000000004be3bca9=20
> [  175.289654] GPR28: c000000002a590a0 0000000000000000 0000000000000000 =
c0000000035010c0=20
> [  175.289787] NIP [c00000000003e9a0] arch_local_irq_restore+0x230/0x260
> [  175.289796] LR [c0000000000b16dc] patch_instruction+0x26c/0x340
> [  175.289805] Call Trace:
> [  175.289810] [c0000000297b3890] [c000000002a590a0] init_mm+0x0/0x5c0 (u=
nreliable)
> [  175.289824] [c0000000297b38c0] [c0000000000b179c] patch_instruction+0x=
32c/0x340
> [  175.289835] [c0000000297b3910] [c00000000007ef40] ftrace_make_call+0x2=
20/0x4b0
> [  175.289846] [c0000000297b39a0] [c0000000002e00a8] __ftrace_replace_cod=
e+0x138/0x140
> [  175.289858] [c0000000297b39f0] [c0000000002e0678] ftrace_replace_code+=
0xa8/0x140
> [  175.289869] [c0000000297b3a40] [c0000000002e095c] ftrace_modify_all_co=
de+0x11c/0x240
> [  175.289880] [c0000000297b3a70] [c00000000007f918] arch_ftrace_update_c=
ode+0x18/0x30
> [  175.289891] [c0000000297b3a90] [c0000000002e0bc8] ftrace_startup_enabl=
e+0x68/0xa0
> [  175.289902] [c0000000297b3ac0] [c0000000002e6618] ftrace_startup+0xf8/=
0x1c0
> [  175.289913] [c0000000297b3b00] [c0000000002e672c] register_ftrace_func=
tion+0x4c/0xc0
> [  175.289924] [c0000000297b3b30] [c00000000030c908] function_trace_init+=
0x88/0x100
> [  175.289936] [c0000000297b3b60] [c00000000030079c] tracing_set_tracer+0=
x2ac/0x540
> [  175.289946] [c0000000297b3c00] [c000000000300ad4] tracing_set_trace_wr=
ite+0xa4/0x110
> [  175.289957] [c0000000297b3cc0] [c000000000553a00] vfs_write+0x100/0x46=
0
> [  175.289968] [c0000000297b3d80] [c000000000553f3c] ksys_write+0x7c/0x14=
0
> [  175.289979] [c0000000297b3dd0] [c000000000035160] system_call_exceptio=
n+0x140/0x350
> [  175.289990] [c0000000297b3e10] [c00000000000c654] system_call_common+0=
xf4/0x278
> [  175.290002] --- interrupt: c00 at 0x7fff83c50c34
> [  175.290009] NIP:  00007fff83c50c34 LR: 00007fff83bc7c74 CTR: 000000000=
0000000
> [  175.290016] REGS: c0000000297b3e80 TRAP: 0c00   Tainted: G            =
E       (6.1.0-rc1-00025-gaae703b02f92)
> [  175.290025] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE=
>  CR: 28222222  XER: 00000000
> [  175.290065] IRQMASK: 0=20
> [  175.290065] GPR00: 0000000000000004 00007fffc1696890 00007fff83d37300 =
0000000000000001=20
> [  175.290065] GPR04: 000001002f8f2bb0 0000000000000009 0000000000000010 =
000000006e6f6974=20
> [  175.290065] GPR08: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
> [  175.290065] GPR12: 0000000000000000 00007fff83e6ae60 0000000040000000 =
0000000101239798=20
> [  175.290065] GPR16: 0000000101239724 00000001011d8128 0000000101170370 =
000000010123d568=20
> [  175.290065] GPR20: 000001002f8f5490 0000000000000001 00000001011eaf18 =
00007fffc1696ab4=20
> [  175.290065] GPR24: 00007fffc1696ab0 000000010123af94 0000000000000009 =
000001002f8f2bb0=20
> [  175.290065] GPR28: 0000000000000009 00007fff83d31798 000001002f8f2bb0 =
0000000000000009=20
> [  175.290194] NIP [00007fff83c50c34] 0x7fff83c50c34
> [  175.290201] LR [00007fff83bc7c74] 0x7fff83bc7c74
> [  175.290208] --- interrupt: c00
> [  175.290213] Instruction dump:
> [  175.290220] 0fe00000 4bfffff0 60000000 60000000 ebe10028 4bfffa95 4bff=
fed4 60000000=20
> [  175.290248] 0fe00000 4bffffd0 60000000 60000000 <0fe00000> 4bffffc0 60=
000000 60000000=20
> [  175.290275] ---[ end trace 0000000000000000 ]---
> OK: Mapping kernel memory does not cause spurious faults
>
> 6.0.0 was good. Git bisect points to following
>
> commit a4cb3651a174366cc85a677da9e3681fbe97fdae
> Date:   Thu Oct 13 16:44:18 2022 +1000
>     powerpc/64s/interrupt: Fix lost interrupts when returning to soft-mas=
ked context

Hm, I think I see the problem indeed with that patch. Just have to try
recreate and verify the fix.

Thanks,
Nick
