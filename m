Return-Path: <linuxppc-dev+bounces-7971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DE8A9BA3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 23:57:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zk8wD71Pcz3c01;
	Fri, 25 Apr 2025 07:57:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745531852;
	cv=none; b=iRDpucj75OvTyyEjwIuJPP49rMzYl+mR6IKyub1Bg2Pih1FfpGHcs0LFoW04+YixhzjD12mUD9s3+cGVy8dmdq+BZ+OP0KdZ+uV/j/Y299VkzTpip2RZ4jEAQuA74hliEEkB60Dwda179yaq9L9BtbuwlTWxo2jpIOfVZBufm1XEy4wwmWKcReXxecWUbOcHA9YKh0uoMJp9sS7GDXEhMgUyepzhie+K1VvR6cdUpQnWiFt+OANXfR+02IF5ZQr7NMNLWNk/QOqNzyqYMvSqjJS1H9eQUK3iZhgUwR3J9WEJ4TlWpxTP8k/0uaoUQLYlgyFigAezw5ewrxz1VxgeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745531852; c=relaxed/relaxed;
	bh=xpoZPfro0SHj9mPJ6mKU/fbkIbH6rl7Ujv7LCLlYPNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LH3K2ljG7qAnydAKzyvggGZMcl5yCLuuDAjnHPKjN4JKFs7DhCq6TjTuMIqtarkTgEPrjQSrDLX4jo3rRDA+uxMoYiPLkgdnKUJeUIXYUPN0ulngAKlS422D84ZXncIXGCVKoerOWzLplWMukGyMOgf9T2Cjjcql54V/F/P+1uOsrhzTvGGNRUGBQ3D3slZgn6tgFVuISbmHgO2MRiPK9OZyc/69JNuqPrnyAAywHleeZdd/UPC+m+0Z0YvB7ddEWg8ogNCSGQaukV8enn81W4gxDCzsvhzweOi1lQSAF74b/Y1XkcgIqNTUJLYn2rym04bSi4Yi4fGXZcVDdTIsyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BiTSqFBX; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OXgTCKdC; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BiTSqFBX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OXgTCKdC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zk8wB67TJz3byP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 07:57:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745531844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpoZPfro0SHj9mPJ6mKU/fbkIbH6rl7Ujv7LCLlYPNY=;
	b=BiTSqFBXPMdWmpAgJY4SL10/fsaCOKD62DCHVdGACUXGM1efrhGOXAbASr9vmzp9bETNhW
	ENM8PhZKEdcoTfxJQhKAzxoICuIPeWZlVZQusb1iIC/b9IWnAOnc/vRclbnCCEp7W0xQx7
	7BNhTrrGF/vDcfiv7cdtP1OwuQtkXCU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745531845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpoZPfro0SHj9mPJ6mKU/fbkIbH6rl7Ujv7LCLlYPNY=;
	b=OXgTCKdCEvunHOskNiz/I85S6gyXaY1Ja7WHaPQR2xOCgqv9ukPXzQZ0UKhU83teaiFFjp
	O360nYsoOczc/REcNLCo1eZzDIwou4lDKET3KTMZ9qWauscL12iQtmqKSTNotC+WT+Th1i
	AYspuuupcnclQTjg3pThOodaTWOLvLY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-MzSEusMvNmmxHj52TivP_Q-1; Thu, 24 Apr 2025 17:57:21 -0400
X-MC-Unique: MzSEusMvNmmxHj52TivP_Q-1
X-Mimecast-MFC-AGG-ID: MzSEusMvNmmxHj52TivP_Q_1745531840
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912fe32b08so642363f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 14:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745531840; x=1746136640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpoZPfro0SHj9mPJ6mKU/fbkIbH6rl7Ujv7LCLlYPNY=;
        b=eZC87iXRz/fnGrWj64HZD0UGCm1q+OOLa8KSsB3fHvVNGZ+9KmqiCl6FOajJDFuErR
         PyriDL289h2xUbqItlrZ/XlypsdX/7MhQq5+w+ODx0M2G9Id3UyazBBdLGnTppKR8Z27
         nYLql2711wrokGp8qNQkE8sLK607DQLpoD1cEUwEHfGqPhx9ZmpBsdB4AYX6vd3PRMUp
         gKRvHcZLGC4eWwdyT/iYMyM4c9btrX5T3at963snmiApDioa1BJ1nyKkj+CSZM0NXixs
         oFDPvK+8LgjLJGgfr9TmuHtfCXfiNW1S/zcDSqkTDQk2XvDaFRTFTVsMW5l4cwM6F5dl
         17rg==
X-Forwarded-Encrypted: i=1; AJvYcCXkICtlsCfiH0UxMtZ9kV9yaolbRcXg6ekAujzrl+6Kllsplm8MCAXebRhQoAPwL4/OeLxCRmu4YtUFQcw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy1iFVCKYRaXucYtTNLPCUzrT11c3DBdIisKcXhWS3k4gCmA3Wm
	YoTCsWyS3OBF4UASpcpusRGYdXxa+bTeWksN6rAQNBl1QcsHTO30/uuP4amWwbtvOOjIE/K+/y7
	9mkgE1nZ227KLjah0Kk9tnohjxt6xU9dRLaS8wk48mvFcH7kRFPq7Yq+tUUlLzmQwBBk84UIhqq
	9mT/dHqTl769zmB1ri73P+dVZwWtzeHZl1AVh43w==
X-Gm-Gg: ASbGncvzc/86x9IIcZfuS0QfbKo46EFhUZyJDq3cxoc7UXaxZ9l2bDC5U/DIyvdBF0s
	2bbW5bWDQaAzzCSKDCXUjvWCJM0BsLfBryL4h7MWHf0weocSOlgy2lA4aAbGqXbxW/5I=
X-Received: by 2002:a05:6000:420f:b0:39f:b604:4691 with SMTP id ffacd0b85a97d-3a06cfad4demr3613314f8f.58.1745531840426;
        Thu, 24 Apr 2025 14:57:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeKzKsojxPFQjf2qyPC/jLCrBU0TIGuJgSXSwemHUuTZespuYvxujkus4uQUh01e60jmTuxs45QJiRsX3qQ8A=
X-Received: by 2002:a05:6000:420f:b0:39f:b604:4691 with SMTP id
 ffacd0b85a97d-3a06cfad4demr3613274f8f.58.1745531839898; Thu, 24 Apr 2025
 14:57:19 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
 <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de> <aApGPAoctq_eoE2g@t14ultra>
 <20250424173908-ffca1ea2-e292-4df3-9391-24bfdaab33e7@linutronix.de>
In-Reply-To: <20250424173908-ffca1ea2-e292-4df3-9391-24bfdaab33e7@linutronix.de>
From: Jan Stancek <jstancek@redhat.com>
Date: Thu, 24 Apr 2025 23:57:02 +0200
X-Gm-Features: ATxdqUEI0uDThPwtIXkgDnYksB6HJCT6szRwp_ZXnbL9vPXmguxH9v8pzuTDM2Y
Message-ID: <CAASaF6xsMOWkhPrzKQWNz5SXaROSpxzFVBz+MOA-MNiEBty7gQ@mail.gmail.com>
Subject: Re: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
	Nam Cao <namcao@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gxlad-_35Hs31XDquqBPEnYn3S_aykQKBi4KPaWOtmU_1745531840
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 24, 2025 at 5:49=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Thu, Apr 24, 2025 at 04:10:04PM +0200, Jan Stancek wrote:
> > On Mon, Mar 03, 2025 at 12:11:10PM +0100, Thomas Wei=C3=9Fschuh wrote:
> > > From: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > >
> > > To support multiple PTP clocks, the VDSO data structure needs to be
> > > reworked. All clock specific data will end up in struct vdso_clock an=
d in
> > > struct vdso_time_data there will be array of it. By now, vdso_clock i=
s
> > > simply a define which maps vdso_clock to vdso_time_data.
> > >
> > > Prepare for the rework of these structures by adding struct vdso_cloc=
k
> > > pointer argument to do_hres_timens(), and replace the struct vdso_tim=
e_data
> > > pointer with the new pointer arugment whenever applicable.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > > Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de=
>
> > > ---
> > > lib/vdso/gettimeofday.c | 35 ++++++++++++++++++-----------------
> > > 1 file changed, 18 insertions(+), 17 deletions(-)
> > >
> >
> > starting with this patch, I'm seeing user-space crashes when using cloc=
k_gettime():
> >   BAD  -> 83a2a6b8cfc5 vdso/gettimeofday: Prepare do_hres_timens() for =
introduction of struct vdso_clock
> >   GOOD -> 64c3613ce31a vdso/gettimeofday: Prepare do_hres() for introdu=
ction of struct vdso_clock
> >
> > It appears to be unique to aarch64 with 64k pages, and can be reproduce=
d with
> > LTP clock_gettime03 [1]:
> >   command: clock_gettime03   tst_kconfig.c:88: TINFO: Parsing kernel co=
nfig '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+6=
4k/build/.config'
> >   tst_test.c:1903: TINFO: LTP version: 20250130-231-gd02c2aea3
> >   tst_test.c:1907: TINFO: Tested kernel: 6.15.0-0.rc3.20250423gitbc3372=
351d0c.30.eln147.aarch64+64k #1 SMP PREEMPT_DYNAMIC Wed Apr 23 23:23:54 UTC=
 2025 aarch64
> >   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0=
.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
> >   tst_test.c:1720: TINFO: Overall timeout per run is 0h 05m 24s
> >   clock_gettime03.c:121: TINFO: Testing variant: vDSO or syscall with l=
ibc spec
> >   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct 1000=
0ms
> >   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
> >   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct 10000=
ms
> >   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
> >   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct -100=
00ms
> >   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
> >   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct -1000=
0ms
> >   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
> >   tst_test.c:438: TBROK: Child (233649) killed by signal SIGSEGV
> >
> > or with:
> > --------------------- 8< ----------------------
> > #define _GNU_SOURCE
> > #include <sched.h>
> > #include <time.h>
> > #include <unistd.h>                                                    =
                                                                           =
                                                                           =
                #include <sys/wait.h>
> >
> > int main(void)
> > {
> >         struct timespec tp;
> >         pid_t child;
> >         int status;
> >
> >         unshare(CLONE_NEWTIME);
> >
> >         child =3D fork();
> >         if (child =3D=3D 0) {
> >                 clock_gettime(CLOCK_MONOTONIC_RAW, &tp);
> >         }
> >
> >         wait(&status);
> >         return status;
> > }
> >
> > # ./a.out ; echo $?
> > 139
> > --------------------- >8 ----------------------
> >
> > RPMs and configs can be found at Fedora koji, latest build is at [2] (l=
ook for kernel-64k).
>
> Hi Jan,
>
> Thanks for the great error report.
>
> Can you try the following change (on top of v6.15-rc1, should also work w=
ith current master)?
>
> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> index 93ef801a97ef..867ce53cca94 100644
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -85,14 +85,18 @@ static __always_inline
>  int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_=
clock *vcns,
>                    clockid_t clk, struct __kernel_timespec *ts)
>  {
> -       const struct vdso_time_data *vd =3D __arch_get_vdso_u_timens_data=
(vdns);
>         const struct timens_offset *offs =3D &vcns->offset[clk];
> -       const struct vdso_clock *vc =3D vd->clock_data;
> +       const struct vdso_time_data *vd;
> +       const struct vdso_clock *vc;
>         const struct vdso_timestamp *vdso_ts;
>         u64 cycles, ns;
>         u32 seq;
>         s64 sec;
>
> +       vd =3D vdns - (clk =3D=3D CLOCK_MONOTONIC_RAW ? CS_RAW : CS_HRES_=
COARSE);
> +       vd =3D __arch_get_vdso_u_timens_data(vd);
> +       vc =3D vd->clock_data;
> +
>         if (clk !=3D CLOCK_MONOTONIC_RAW)
>                 vc =3D &vc[CS_HRES_COARSE];
>         else
>
>
> I'll do some proper testing tomorrow.

That does seem to work for the 2 reproducers I have.
But why is this change needed? Isn't 'vdns' here equal to 'vdso_u_time_data=
'?

>
>
> Thomas
>
> > [1] https://github.com/linux-test-project/ltp/blob/master/testcases/ker=
nel/syscalls/clock_gettime/clock_gettime03.c
> > [2] https://koji.fedoraproject.org/koji/buildinfo?buildID=3D2704401
>


