Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2445915BED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 03:57:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QuX67Gv+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7Scn1vYJz3dGr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 11:56:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QuX67Gv+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7Sc41YB0z3bZN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 11:56:19 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-706524adf91so2701738b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 18:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719280578; x=1719885378; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYZY7E/hXC2pNdw5CSObSFWNa8KKNDbdi6VPYKf3QG8=;
        b=QuX67Gv+w4HbuIeLmLwojifULCg6lQfH7Don8gNN4XjR0XgMYKJj1ayUK7Mdt8b0jN
         zBquJVZ3V+S/UnBWSwfFzN0ml/4+9NqwmwJRIEvcDL8O/oDbDKCZN8FvG4+7a/Q8LOyg
         r/EfaOHkbSTxuoz4JcWYrDlnn4WTxYJ186wdbJZUedof9Hvnyu9T0DJVDsxrqThs3qwW
         Mi3BLVa181WN19rgwJf5FganKRdu5Jugt9lftk1sh3UpM4PdLX6hOgBj/5FHMf55Y66X
         xXNNYhtjPZT6qaqmvU5RCIsGLa6ul0aksMs2Wv3ilTr9YbEADaaXwXzi8G5WQpWPeG3o
         EdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719280578; x=1719885378;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NYZY7E/hXC2pNdw5CSObSFWNa8KKNDbdi6VPYKf3QG8=;
        b=oTsn46njEMHK/vw4dbSs6P0FDxRJwxZ+j9bo14EbIGFz94D3j7ytbGCV9+LO6I/8/y
         vFNZPTW4FWzn6fLIOZCA/25ekPRa3l67xkOVxnyyfjiWQZ5d05/MA3Ms0MiMsCJZsBV9
         yRCaIcwymDYdnuDvipwd2ujrtZRHFgTpuYN85Mf8b2LGMsRs3/N6vLNwe0ibjPc9WnCc
         nijcofYvTp9GqDf+BuVtRW3+TIRxGdboPOkrQseNwRwTV9EP1u6ghoFbvl2oR0Q8YbD6
         WSb0P/bmWNHPqIjGYGCOv0nc9O75DSGMqY1NRsC4fbegoFpe4QcXa8/nyourgpQiw4qu
         GntA==
X-Forwarded-Encrypted: i=1; AJvYcCWYSyeWv+FkVuvF78YctZhNjTagoTVmAGvsK7JCnNDJiJa9kNTCaDDTQGho4CeH3gQYZe0y+4gNNYRfBIcx1GQcqomx5SYoShxhsINAUg==
X-Gm-Message-State: AOJu0YwFFI1CU3s5aSAehmQMRbjuJIVni7rM7VH4kF2dhqU42UiQMMM2
	PclrQuqgP5cNAA/cyZbxHLba9vpSJAneOjnPeSz07psXQaEa641c
X-Google-Smtp-Source: AGHT+IE2waZlPGm4HkckDWuZTNRDoL0wrQGRaanKL/AYe6vof56/3DBV9xSAOq7mrPTVi5VkMVf2Jg==
X-Received: by 2002:a05:6a00:2d81:b0:706:6c70:e583 with SMTP id d2e1a72fcca58-70670f19356mr9194230b3a.19.1719280578440;
        Mon, 24 Jun 2024 18:56:18 -0700 (PDT)
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70651cd4ea3sm7033630b3a.99.2024.06.24.18.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 18:56:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Jun 2024 11:56:12 +1000
Message-Id: <D28Q3J98V4EC.1RXWN7UR4A3J7@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v10 08/15] powerpc: add pmu tests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240612052322.218726-1-npiggin@gmail.com>
 <20240612052322.218726-9-npiggin@gmail.com>
 <5bfe90ca-96aa-405b-a4b9-86ec4a497366@redhat.com>
In-Reply-To: <5bfe90ca-96aa-405b-a4b9-86ec4a497366@redhat.com>
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

On Wed Jun 19, 2024 at 4:39 AM AEST, Thomas Huth wrote:
> On 12/06/2024 07.23, Nicholas Piggin wrote:
> > Add some initial PMU testing.
> >=20
> > - PMC5/6 tests
> > - PMAE / PMI test
> > - BHRB basic tests
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> ...
> > diff --git a/powerpc/pmu.c b/powerpc/pmu.c
> > new file mode 100644
> > index 000000000..bdc45e167
> > --- /dev/null
> > +++ b/powerpc/pmu.c
> > @@ -0,0 +1,562 @@
> ...
> > +static void test_pmc5_with_ldat(void)
> > +{
> > +	unsigned long pmc5_1, pmc5_2;
> > +	register unsigned long r4 asm("r4");
> > +	register unsigned long r5 asm("r5");
> > +	register unsigned long r6 asm("r6");
> > +	uint64_t val;
> > +
> > +	reset_mmcr0();
> > +	mtspr(SPR_PMC5, 0);
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
> > +	asm volatile(".rep 20 ; nop ; .endr" ::: "memory");
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> > +	pmc5_1 =3D mfspr(SPR_PMC5);
> > +
> > +	val =3D 0xdeadbeef;
> > +	r4 =3D 0;
> > +	r5 =3D 0xdeadbeef;
> > +	r6 =3D 100;
> > +	reset_mmcr0();
> > +	mtspr(SPR_PMC5, 0);
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
> > +	asm volatile(".rep 10 ; nop ; .endr ; ldat %0,%3,0x10 ; .rep 10 ; nop=
 ; .endr" : "=3Dr"(r4), "+r"(r5), "+r"(r6) : "r"(&val) :"memory");
>
> Looks like older versions of Clang do not like this instruction:
>
>   /tmp/pmu-4fda98.s: Assembler messages:
>   /tmp/pmu-4fda98.s:1685: Error: unrecognized opcode: `ldat'
>   clang-13: error: assembler command failed with exit code 1 (use -v to s=
ee=20
> invocation)
>
> Could you please work-around that issue?

Ah, just catching up with this -- thanks for working it out.

I will fix.

>
> Also, please break the very long line here. Thanks!

Sure.

Thanks,
Nick

>
> > +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> > +	pmc5_2 =3D mfspr(SPR_PMC5);
> > +	assert(r4 =3D=3D 0xdeadbeef);
> > +	assert(val =3D=3D 0xdeadbeef);
> > +
> > +	/* TCG does not count instructions around syscalls correctly */
> > +	report_kfail(host_is_tcg, pmc5_1 !=3D pmc5_2 + 1,
> > +		     "PMC5 counts instructions with ldat");
> > +}
>
>   Thomas

