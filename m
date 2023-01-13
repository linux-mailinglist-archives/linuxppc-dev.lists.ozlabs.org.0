Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A94668FB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:56:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtYfD3vv8z3cD9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 18:56:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f61ARbFw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f61ARbFw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtYdD1250z3c61
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 18:56:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5015B621EF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 07:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31206C43398
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673596555;
	bh=k+JG6cQhINTeraKycNX3AkA5hLXrGXirTSDubaW7RNA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f61ARbFwfAK87XLX3bLLADXyMKwh/q9KK7NSFMIdjboOltYG7sbrBsrHM8gsQcq8d
	 LuU8CeF7rfmQjvQQRK8g+CHrznSyDxa4gL2K0JJHzlWBX/N/IXeQFaIizRFty9e60O
	 dRCMsXyj6AVGFD+t2S7qofJYHOIXryBp95fB2eXYtnyUpfrtvy+kY5k3yvk+yRTU/r
	 +hpyg0V5p38xu4kBs0ccBCsu7ZNAT/wJoY1bpKy/Op89Vm9RIOda20LGNkIgO5NAx4
	 hRFg2xUWCL+NKqgf0ZUrZWp63Evo4RxeDzuJEMKbl6+g4WubbvNuP8iFaO1Z0TbLZc
	 QDuXydqasubaA==
Received: by mail-lj1-f175.google.com with SMTP id y19so394838ljq.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 23:55:55 -0800 (PST)
X-Gm-Message-State: AFqh2krlelhPCsCfiPcUFA8IIEdZWrsFv64o82EpPBZq2XvfLFzMoOLo
	P6I8xxtUVVHgeHTkVf755BZ5A+ucQck2Ty6bdYU=
X-Google-Smtp-Source: AMrXdXvPBDKnkGS46Fnum+sBY6tUC4r2g2BIXBTSIujXdCK7arMiBySaB6Urx5uBQUaWUUyEymbKDknr+1U3RdEBQGg=
X-Received: by 2002:a2e:a901:0:b0:27f:ef88:3ecb with SMTP id
 j1-20020a2ea901000000b0027fef883ecbmr1881053ljq.189.1673596553124; Thu, 12
 Jan 2023 23:55:53 -0800 (PST)
MIME-Version: 1.0
References: <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com>
 <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com> <SJ1PR11MB6083368BCA43E5B0D2822FD3FCC29@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083368BCA43E5B0D2822FD3FCC29@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 13 Jan 2023 08:55:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEqbMEcrKYzz2-huLPMnotPoxFY8adyH=Xb4Ex8o98x-w@mail.gmail.com>
Message-ID: <CAMj1kXEqbMEcrKYzz2-huLPMnotPoxFY8adyH=Xb4Ex8o98x-w@mail.gmail.com>
Subject: ia64 removal (was: Re: lockref scalability on x86-64 vs cpu_relax)
To: "Luck, Tony" <tony.luck@intel.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Jan Glauber <jan.glauber@gmail.com>, "Torvalds, Linus" <torvalds@linux-foundation.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 13 Jan 2023 at 01:31, Luck, Tony <tony.luck@intel.com> wrote:
>
> > Yeah, if it was ia64-only, it's a non-issue these days. It's dead and
> > in pure maintenance mode from a kernel perspective (if even that).
>
> There's not much "simultaneous" in the SMT on ia64. One thread in a
> spin loop will hog the core until the h/w switches to the other thread some
> number of cycles (hundreds, thousands? I really can remember). So I
> was pretty generous with dropping cpu_relax() into any kind of spin loop.
>
> Is it time yet for:
>
> $ git rm -r arch/ia64
>

Hi Tony,

Can I take that as an ack on [0]? The EFI subsystem has evolved
substantially over the years, and there is really no way to do any
IA64 testing beyond build testing, so from that perspective, dropping
it entirely would be welcomed.

Thanks,
Ard.



[0] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?h=remove-ia64
