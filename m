Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D6A493408
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 05:25:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jdsxl4CYCz3bP1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 15:25:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=grq3+qHB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=grq3+qHB; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jdsx44FF8z2xtW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 15:24:38 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id x83so1425166pfc.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 20:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=AGVV8zCTM1F/gvLK0FPNhEpA+NHBaCvrq9l3vkw4x4s=;
 b=grq3+qHBGEN7qxunXQqWh5CoMi58jiemeUthcaXihJi6BAqciOTh4c/DZQKh/m25lL
 lFp2ft95h+eMbvs9xPyVBhha2SqqcJD6IncqcjjKl4SYO8qEwXjF4NqfwZDZFVpeb+Vs
 8lG9rvJvkvVpManjnKwggAdZH/uDmnQroYCFR681qhIqcLc1baTOwvtIVOl4TB1VMYux
 ObqBj1I/v9EPb/EfIH+MjT/9YrL6q3IFE1b29QxVAbOFCvJB/VI3Z4ArphFaC8J6fQFK
 rcflG+z3MogjMVPxstcOxbGpSnm89zvlHMhSIBNxOO7g7LfIXekfcHaFUPXgTjHOxGv1
 jkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=AGVV8zCTM1F/gvLK0FPNhEpA+NHBaCvrq9l3vkw4x4s=;
 b=VNEPkErRQeTVXIEWI9AKL0cWOd8gFDa8khTt5530EzxI06M5wK8ULap8LGHRZLNYiZ
 azhUwHXjtJ/OJWBSbxWzM+uG9QjRy+Q4wilHl+40ikIUH2mkGHcuxD4CltGnXNlm3Wib
 EdxF/8kQX4nq857/kODOu8Yd52qQRwA/Fh+b9wakc1HW02qaAPOO7pE8d8OkTKknlZP+
 sgVTifs7YtioNk9n6R8vzygVSgnGiShMR2jD70FEE2Y3lxxQ9SMJGM2Qfn/SBnpQJAd+
 b7UNx87zVt3EVFs/Fuu1XdUo0I7b7RQcqd8djbkEY0KpCR/mkQ6O3OYtFrESDmnCyKy7
 CfVg==
X-Gm-Message-State: AOAM531ANCDpQ+9i2ZDjWGv0GNDgXYvcAce78KyrbpRcPbcCjRaFvJBC
 R7wMBSo5bamF0QPRVm59Tek=
X-Google-Smtp-Source: ABdhPJyaCdp1/XjTpzFaqL2tCksgwmgBTf2GWDBqhcSiAmOhf2U+x73gWvSJf5KlBKJ+onNqtkGz5g==
X-Received: by 2002:aa7:888e:0:b0:4c4:3ad:9eee with SMTP id
 z14-20020aa7888e000000b004c403ad9eeemr13985878pfe.13.1642566275615; 
 Tue, 18 Jan 2022 20:24:35 -0800 (PST)
Received: from localhost (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id 23sm8713798pge.45.2022.01.18.20.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 20:24:35 -0800 (PST)
Date: Wed, 19 Jan 2022 14:24:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/perf: Fix power_pmu_disable to call
 clear_pmi_irq_pending only if PMI is pending
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <20220115072020.93524-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220115072020.93524-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1642566179.l0008zwdzw.astroid@bobo.none>
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Athira Rajeev's message of January 15, 2022 5:20 pm:
> Running selftest with CONFIG_PPC_IRQ_SOFT_MASK_DEBUG enabled in kernel
> triggered below warning:
>=20
> [  172.851380] ------------[ cut here ]------------
> [  172.851391] WARNING: CPU: 8 PID: 2901 at arch/powerpc/include/asm/hw_i=
rq.h:246 power_pmu_disable+0x270/0x280
> [  172.851402] Modules linked in: dm_mod bonding nft_ct nf_conntrack nf_d=
efrag_ipv6 nf_defrag_ipv4 ip_set nf_tables rfkill nfnetlink sunrpc xfs libc=
rc32c pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_tables=
 ext4 mbcache jbd2 sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp fus=
e
> [  172.851442] CPU: 8 PID: 2901 Comm: lost_exception_ Not tainted 5.16.0-=
rc5-03218-g798527287598 #2
> [  172.851451] NIP:  c00000000013d600 LR: c00000000013d5a4 CTR: c00000000=
013b180
> [  172.851458] REGS: c000000017687860 TRAP: 0700   Not tainted  (5.16.0-r=
c5-03218-g798527287598)
> [  172.851465] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 4800488=
4  XER: 20040000
> [  172.851482] CFAR: c00000000013d5b4 IRQMASK: 1
> [  172.851482] GPR00: c00000000013d5a4 c000000017687b00 c000000002a10600 =
0000000000000004
> [  172.851482] GPR04: 0000000082004000 c0000008ba08f0a8 0000000000000000 =
00000008b7ed0000
> [  172.851482] GPR08: 00000000446194f6 0000000000008000 c00000000013b118 =
c000000000d58e68
> [  172.851482] GPR12: c00000000013d390 c00000001ec54a80 0000000000000000 =
0000000000000000
> [  172.851482] GPR16: 0000000000000000 0000000000000000 c000000015d5c708 =
c0000000025396d0
> [  172.851482] GPR20: 0000000000000000 0000000000000000 c00000000a3bbf40 =
0000000000000003
> [  172.851482] GPR24: 0000000000000000 c0000008ba097400 c0000000161e0d00 =
c00000000a3bb600
> [  172.851482] GPR28: c000000015d5c700 0000000000000001 0000000082384090 =
c0000008ba0020d8
> [  172.851549] NIP [c00000000013d600] power_pmu_disable+0x270/0x280
> [  172.851557] LR [c00000000013d5a4] power_pmu_disable+0x214/0x280
> [  172.851565] Call Trace:
> [  172.851568] [c000000017687b00] [c00000000013d5a4] power_pmu_disable+0x=
214/0x280 (unreliable)
> [  172.851579] [c000000017687b40] [c0000000003403ac] perf_pmu_disable+0x4=
c/0x60
> [  172.851588] [c000000017687b60] [c0000000003445e4] __perf_event_task_sc=
hed_out+0x1d4/0x660
> [  172.851596] [c000000017687c50] [c000000000d1175c] __schedule+0xbcc/0x1=
2a0
> [  172.851602] [c000000017687d60] [c000000000d11ea8] schedule+0x78/0x140
> [  172.851608] [c000000017687d90] [c0000000001a8080] sys_sched_yield+0x20=
/0x40
> [  172.851615] [c000000017687db0] [c0000000000334dc] system_call_exceptio=
n+0x18c/0x380
> [  172.851622] [c000000017687e10] [c00000000000c74c] system_call_common+0=
xec/0x268
>=20
> The warning indicates that MSR_EE being set(interrupt enabled) when
> there was an overflown PMC detected. This could happen in
> power_pmu_disable since it runs under interrupt soft disable
> condition ( local_irq_save ) and not with interrupts hard disabled.
> commit 2c9ac51b850d ("powerpc/perf: Fix PMU callbacks to clear
> pending PMI before resetting an overflown PMC") intended to clear
> PMI pending bit in Paca when disabling the PMU. It could happen
> that PMC gets overflown while code is in power_pmu_disable
> callback function. Hence add a check to see if PMI pending bit
> is set in Paca before clearing it via clear_pmi_pending.
>=20
> Fixes: 2c9ac51b850d ("powerpc/perf: Fix PMU callbacks to clear pending PM=
I before resetting an overflown PMC")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> ---
> Note: Address the warning reported here:
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-December/238190.html
> Patch is on top of powerpc/merge
>=20
>  arch/powerpc/perf/core-book3s.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-boo=
k3s.c
> index a684901b6965..dfb0ea0f0df3 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1327,9 +1327,10 @@ static void power_pmu_disable(struct pmu *pmu)
>  		 * Otherwise provide a warning if there is PMI pending, but
>  		 * no counter is found overflown.
>  		 */
> -		if (any_pmc_overflown(cpuhw))
> -			clear_pmi_irq_pending();
> -		else
> +		if (any_pmc_overflown(cpuhw)) {
> +			if (pmi_irq_pending())
> +				clear_pmi_irq_pending();

And this works because MSR[EE] gets disabled by the masked interrupt=20
handler if we have a PMI irq pending, is that right?

Can I be a pain and just ask for a little comment there otherwise I'll
forget about it next time.

Thanks,
Nick

> +		} else
>  			WARN_ON(pmi_irq_pending());
> =20
>  		val =3D mmcra =3D cpuhw->mmcr.mmcra;
> --=20
> 2.33.0
>=20
>=20
