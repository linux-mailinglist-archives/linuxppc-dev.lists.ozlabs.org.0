Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E868FC11C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 03:12:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HbMhSzwN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv8b24hRRz3fn4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 11:12:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HbMhSzwN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv8ZJ3bPhz3d8n
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 11:12:07 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-702442afa7dso4144036b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 18:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717549926; x=1718154726; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mg9icTJf7q/C8B/s7FJ+6DOQWCc9dvuYjx2poaH9V4=;
        b=HbMhSzwNRqOf2G+H1CeTGhLGH/4VIM3tDPPT0wM1A6ZwvHHg/zeJTMoCvcUtHHw45m
         V9x8cxM9nWC0IZM5QqIixf6nBBOHApygqemTI5LTZ3+xvP0TkeYSmznqKNpuAclxDpIi
         RW2XF352wjxyw4vlLaCsjcMCn9TqMpvQEO7ZK7n+dm8K/x83HLkLlaTW+BMAXxozHe+e
         PbxNLoR/Buy014B+YUGuiBbMLrAh+bLq8pE9yQv72PS8WzISl7kD3Kvw6qos1DKm7cTW
         LMpW+ixXjqlys+PQjgMNtUsgkG+zOBlTpjsoGcuUdDAKq7X75Thn8+EIezwT6aWRVLTr
         Yb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717549926; x=1718154726;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7mg9icTJf7q/C8B/s7FJ+6DOQWCc9dvuYjx2poaH9V4=;
        b=Wxs1bmaGkm8YbzA40YYDpIalluKxbJIfIHUl4LxEC6HIIHbt+0oHUp/IS7CI67sG2O
         SHvPXL4Czwh30WHAcj81ItkLiVE69EgiTN6TXgO2wcn64yEbDVNi1Az9lVQWxqBVcjA+
         2wrlJxFYAD+hbv6EO2JW92m3t+nEtSeo8OrRcpQ4teauL2Xx/BVAHPSa06Wj/wj066RP
         F3P0HLGuxltoPT06l/jERq+OH+qAXGZpeCV61/eMky5odcuNgF14HSTmAm+DtKgg0rFd
         Zvzo1ckuevdMIEriHVUpHLJoMPae3yVOcoqhkKkA/LytOkNRShsERmTz3gAUBzR6Gc00
         XVrw==
X-Forwarded-Encrypted: i=1; AJvYcCWptqu2y267tE74zoE7HT10wKhbcArvY6YnZ7/ak8pG1Mg8CiIo2tvVMcsftDaeuECRZWld66buIbLwZhbrvp5NSRJAorA9XGJDiOo95Q==
X-Gm-Message-State: AOJu0YylXalhQi8r34y6J092exV0MFw/hrURMMO6k1RWHkEqqASEiV3r
	KiOVGGpJQDJIrSCZQAmtCoFCiuTTvP+w5hm9MGYWBPQNa5WmDJSB
X-Google-Smtp-Source: AGHT+IHAN8yuwT5TYXqQlYO60/AC7Kw3lncIq7ij3rZhP8Jr5X8DuKTGYwfpJ/nIQtI0IrBMNP7RLQ==
X-Received: by 2002:a05:6a20:9708:b0:1af:f64c:b795 with SMTP id adf61e73a8af0-1b2b6fe2645mr1195842637.30.1717549925524;
        Tue, 04 Jun 2024 18:12:05 -0700 (PDT)
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f646456fb7sm76143705ad.146.2024.06.04.18.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 18:12:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Jun 2024 11:12:00 +1000
Message-Id: <D1ROMSW6KNIP.147TMWG5219NK@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v9 27/31] powerpc: add pmu tests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-28-npiggin@gmail.com>
 <c497801d-f043-46f5-bfa2-74eff672ae47@redhat.com>
In-Reply-To: <c497801d-f043-46f5-bfa2-74eff672ae47@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Jun 4, 2024 at 8:38 PM AEST, Thomas Huth wrote:
> On 04/05/2024 14.28, Nicholas Piggin wrote:
> > Add some initial PMU testing.
> >=20
> > - PMC5/6 tests
> > - PMAE / PMI test
> > - BHRB basic tests
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> ...
> > diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
> > index a4ff678ce..8ff4939e2 100644
> > --- a/lib/powerpc/setup.c
> > +++ b/lib/powerpc/setup.c
> > @@ -33,6 +33,7 @@ u32 initrd_size;
> >   u32 cpu_to_hwid[NR_CPUS] =3D { [0 ... NR_CPUS-1] =3D (~0U) };
> >   int nr_cpus_present;
> >   uint64_t tb_hz;
> > +uint64_t cpu_hz;
> >  =20
> >   struct mem_region mem_regions[NR_MEM_REGIONS];
> >   phys_addr_t __physical_start, __physical_end;
> > @@ -42,6 +43,7 @@ struct cpu_set_params {
> >   	unsigned icache_bytes;
> >   	unsigned dcache_bytes;
> >   	uint64_t tb_hz;
> > +	uint64_t cpu_hz;
> >   };
> >  =20
> >   static void cpu_set(int fdtnode, u64 regval, void *info)
> > @@ -95,6 +97,22 @@ static void cpu_set(int fdtnode, u64 regval, void *i=
nfo)
> >   		data =3D (u32 *)prop->data;
> >   		params->tb_hz =3D fdt32_to_cpu(*data);
> >  =20
> > +		prop =3D fdt_get_property(dt_fdt(), fdtnode,
> > +					"ibm,extended-clock-frequency", NULL);
> > +		if (prop) {
> > +			data =3D (u32 *)prop->data;
> > +			params->cpu_hz =3D fdt32_to_cpu(*data);
> > +			params->cpu_hz <<=3D 32;
> > +			data =3D (u32 *)prop->data + 1;
> > +			params->cpu_hz |=3D fdt32_to_cpu(*data);
>
> Why don't you simply cast to (u64 *) and use fdt64_to_cpu() here instead?

Hmm... probably because I copied from somewhere. Good idea though.

>
> ...
> > diff --git a/powerpc/pmu.c b/powerpc/pmu.c
> > new file mode 100644
> > index 000000000..8b13ee4cd
> > --- /dev/null
> > +++ b/powerpc/pmu.c
> > @@ -0,0 +1,403 @@
> ...
> > +static void test_pmc5_with_fault(void)
> > +{
> > +	unsigned long pmc5_1, pmc5_2;
> > +
> > +	handle_exception(0x700, &illegal_handler, NULL);
> > +	handle_exception(0xe40, &illegal_handler, NULL);
> > +
> > +	reset_mmcr0();
> > +	mtspr(SPR_PMC5, 0);
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
> > +	asm volatile(".long 0x0" ::: "memory");
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> > +	assert(got_interrupt);
> > +	got_interrupt =3D false;
> > +	pmc5_1 =3D mfspr(SPR_PMC5);
> > +
> > +	reset_mmcr0();
> > +	mtspr(SPR_PMC5, 0);
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
> > +	asm volatile(".rep 20 ; nop ; .endr ; .long 0x0" ::: "memory");
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> > +	assert(got_interrupt);
> > +	got_interrupt =3D false;
> > +	pmc5_2 =3D mfspr(SPR_PMC5);
> > +
> > +	/* TCG and POWER9 do not count instructions around faults correctly *=
/
> > +	report_kfail(true, pmc5_1 + 20 =3D=3D pmc5_2, "PMC5 counts instructio=
ns with fault");
>
> It would be nice to have the TCG detection patch before this patch, so yo=
u=20
> could use the right condition here right from the start.

Yeah, it turned out to be a bit annoying to rebase. We already have
some kfail(true in the tree but I will remove those at least toward
the end of the series.

I might take another look at reordering it after I rebase what you
have merged.

>
> > +	handle_exception(0x700, NULL, NULL);
> > +	handle_exception(0xe40, NULL, NULL);
> > +}
> > +
> > +static void test_pmc5_with_sc(void)
> > +{
> > +	unsigned long pmc5_1, pmc5_2;
> > +
> > +	handle_exception(0xc00, &sc_handler, NULL);
> > +
> > +	reset_mmcr0();
> > +	mtspr(SPR_PMC5, 0);
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
> > +	asm volatile("sc 0" ::: "memory");
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> > +	assert(got_interrupt);
> > +	got_interrupt =3D false;
> > +	pmc5_1 =3D mfspr(SPR_PMC5);
> > +
> > +	reset_mmcr0();
> > +	mtspr(SPR_PMC5, 0);
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
> > +	asm volatile(".rep 20 ; nop ; .endr ; sc 0" ::: "memory");
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> > +	assert(got_interrupt);
> > +	got_interrupt =3D false;
> > +	pmc5_2 =3D mfspr(SPR_PMC5);
> > +
> > +	/* TCG does not count instructions around syscalls correctly */
> > +	report_kfail(true, pmc5_1 + 20 =3D=3D pmc5_2, "PMC5 counts instructio=
ns with syscall");
>
> dito
>
> > +	handle_exception(0xc00, NULL, NULL);
> > +}
> > +
> > +static void test_pmc56(void)
> > +{
> > +	unsigned long tmp;
> > +
> > +	report_prefix_push("pmc56");
> > +
> > +	reset_mmcr0();
> > +	mtspr(SPR_PMC5, 0);
> > +	mtspr(SPR_PMC6, 0);
> > +	report(mfspr(SPR_PMC5) =3D=3D 0, "PMC5 zeroed");
> > +	report(mfspr(SPR_PMC6) =3D=3D 0, "PMC6 zeroed");
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~MMCR0_FC);
> > +	msleep(100);
> > +	report(mfspr(SPR_PMC5) =3D=3D 0, "PMC5 frozen");
> > +	report(mfspr(SPR_PMC6) =3D=3D 0, "PMC6 frozen");
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~MMCR0_FC56);
> > +	mdelay(100);
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> > +	report(mfspr(SPR_PMC5) !=3D 0, "PMC5 counting");
> > +	report(mfspr(SPR_PMC6) !=3D 0, "PMC6 counting");
> > +
> > +	/* Dynamic frequency scaling could cause to be out, so don't fail. */
> > +	tmp =3D mfspr(SPR_PMC6);
> > +	report(true, "PMC6 ratio to reported clock frequency is %ld%%", tmp *=
 1000 / cpu_hz);
>
> report(true, ...) looks weird. Use report_info() instead?

Ah yes that's better. I was going to do a pass/fail threshold but that
gets pretty arbitrary depending on DVFS.. I guess for TCG we could report
a pass/fail.

Thanks,
Nick
