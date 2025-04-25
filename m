Return-Path: <linuxppc-dev+bounces-7979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDF2A9C498
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 12:03:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkT266FNDz2yrN;
	Fri, 25 Apr 2025 20:03:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745575422;
	cv=none; b=BSKAKW8gy/zPbKeT/KrRwgnEpy5RwNXrjC8a8btSBKJ5zoCfDR0R2niTUtmyYgsdvAfX6A26+KYM5iZ0Q7GEqJA1LQMZXRpEQ0a/4ZMvIYIkBuB5Bf96390rFdAKaQHZjpMGw6d1XGn0px0SsImItYKlqhvUr/LlDk9Dlas6c4K7WGAJb7V0rtYHuuQGI9nI2jj3Rrpw+kr7MHld/I4okwGDCeJLp7bb9rFZ6tR2iQUcCWgr1AReNJ2o5kp6HqGd2tLxuFaraKiOEU932fKWoDLl+S7anqGj2jEeCmXkvxr3qA6wBdKcUZk3lk4MjV5K8z8P4H2t4AGs/U/HW9A11A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745575422; c=relaxed/relaxed;
	bh=/pdAv3L1vajERKgxSPxyO88qfXI0bDg1bbg1iV/Cff8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nb6yWl+YvsrAWHCmpcLSUzVL5J1SQ2dwKI2aFdCr50oFVYfa5OSPuc3kZzBF7VWSY3giMBFJBkx/wj1HP8Sv4jzh1j6Vmvtw0e6TxPBhXaVDFwr0CUHJXGIEBqnmqE2e6ZDN3yXgz/+1nJHXckhRZvQzQzopD8fhY6InArHiBr2/3vqsQDoUii3qje5wYkDnHRe84Xymr4d9YwxEHTxJ0asTKeGptKMOUPA5HmDa+twG9dxdWo4DUqLi05ygtlOqBI5MeugS/UaM5+gKoVxw8fYhvsIOAB61BwSG+lkIplAD/JKU584Fm4g0SgNYEVcgBjNP7AmalagglAqqeiMd3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LVNdLIOD; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZmxIPsEl; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LVNdLIOD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZmxIPsEl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkT251Jgbz2yZ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 20:03:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745575415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pdAv3L1vajERKgxSPxyO88qfXI0bDg1bbg1iV/Cff8=;
	b=LVNdLIODh6TkxOGbmq8P6zbNPk86PFgzWYTV4REk4Tj7/4I6d2zxKw5ZCLjhmkcHjh0wg6
	nOozx0Ay2jiZ2zdEhmBWqUAWgrlEJDYf4QMNlMzORDke7VdV21sWl5XD/kLAfPuzvwaHEi
	mdlkAQpy2V5/oflrKkjSjqosRXzxvXg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745575416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pdAv3L1vajERKgxSPxyO88qfXI0bDg1bbg1iV/Cff8=;
	b=ZmxIPsElhO712Y1XmSVdLluA/HKMhgPgV4sOaR7g4aAi7mqplfZRX43EICh3IOieH1fQUo
	YoTP3uJhk+Wa6NgOMdaCZMsIaSyx9d0CuH6pZOTlxrBpqOOvnGBbxORkJ09L1R27NgrCAj
	Ek6S78QaVvl9Z3FHx2qOcjIiNLkHpaU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-T36qy9avMnqgARAfTeGZlw-1; Fri, 25 Apr 2025 06:03:32 -0400
X-MC-Unique: T36qy9avMnqgARAfTeGZlw-1
X-Mimecast-MFC-AGG-ID: T36qy9avMnqgARAfTeGZlw_1745575411
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so13558925e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 03:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575411; x=1746180211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pdAv3L1vajERKgxSPxyO88qfXI0bDg1bbg1iV/Cff8=;
        b=htjwzKxDbAKHdwxyQh0Denh7uhfbJJxBPG6TPE93AmR7j1FFLuyH0jYx9w7Ag4P1Rt
         Etmn8iHB4x0o+vC8HbaMXuuKgMs0U8teQEhtA9YjJ7sfo7ngYNBMC9sRvq94907C0/y5
         Tru++MWVzDtv+BpmiHQGA2nW23BARcDf/wHe/JDvttIQg1zm21J16wEHqZw0+s6ELFU0
         tdAS7B1SNouY1tb2Jg3rznN52sdXT+ALpad2lLJ/qg+PSCmMrpEQntnT+XbEHsB9Hh+G
         wq1N6V/4Ji9Pv8nEuS4H0Ho7xFwAaL5wSFhzvgYG35LOuhnmLTMkoNLGA6Ww0IcNBJoV
         2F5A==
X-Forwarded-Encrypted: i=1; AJvYcCVW9Gn6WwAlY0mhln6PytT3GFlheMBoCSweTKHzFojYNfb+tPqUVQnCnliXlCRTZCs1RdNti5dXxyKafCo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YznBBJI5uFGbthAtDsr4Id9zo/heRGlJAASp+aMnlrjZ2hQdKkB
	82MHxaztzFoI2wtb0VAKXh6IPN8GnA2Al6dcF7tOPHT0CKdX0kh3fBzbuwDInSplaoOCQYG75mm
	Q0uhfxGFYRT80bU4Jcd6QCn45scbqgeveSkjX6CzeFKUPYUhteAG3mgQbquUBJqu2Bf8vnG/g/h
	MZ7XHDWFciDPUOoYBdHkzdgWKmXWEmVdheI9ixaw==
X-Gm-Gg: ASbGnctiksQgrlRLOE6L1C8hEa6mjLdEm8stBxT4jv7IZNE9V/OaAE+dQMa4Vc3N3cL
	+z0mE0N7xJuUAV9fpp4rCiAmw7wUYqGzEkqEmPQIB/iqLz3lQQGcQkANcTU0MON/rRzw=
X-Received: by 2002:a05:6000:40cd:b0:39c:1257:cd3f with SMTP id ffacd0b85a97d-3a074fafc33mr1187361f8f.57.1745575410920;
        Fri, 25 Apr 2025 03:03:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhvPrUk8HaqVlny6U2TcGIeGC3vNg2/8Nd1SlrTxEwzCGtEum+5nJ8qw6AJbvzVU3WUz1E5bSUYJ0Yi6UnZY4=
X-Received: by 2002:a05:6000:40cd:b0:39c:1257:cd3f with SMTP id
 ffacd0b85a97d-3a074fafc33mr1187332f8f.57.1745575410491; Fri, 25 Apr 2025
 03:03:30 -0700 (PDT)
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
 <CAASaF6xsMOWkhPrzKQWNz5SXaROSpxzFVBz+MOA-MNiEBty7gQ@mail.gmail.com> <20250425104552-07539a73-8f56-44d2-97a2-e224c567a2fc@linutronix.de>
In-Reply-To: <20250425104552-07539a73-8f56-44d2-97a2-e224c567a2fc@linutronix.de>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 25 Apr 2025 12:03:14 +0200
X-Gm-Features: ATxdqUHUJyFDwXWlLrx8Ahqii0-Ktlj3kT6KX6YhOgPcoK-aAeGj4gOn-pX1-9g
Message-ID: <CAASaF6yxThX3HTHgY_AGqNr7LJ-erdG09WV5-HyfN1fYN9pStQ@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: 9-FVaidAgfRGM-jgMETlvfzOmNFmTdB1U5zL6g7T-ic_1745575411
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 25, 2025 at 10:58=E2=80=AFAM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Thu, Apr 24, 2025 at 11:57:02PM +0200, Jan Stancek wrote:
> > On Thu, Apr 24, 2025 at 5:49=E2=80=AFPM Thomas Wei=C3=9Fschuh
> > <thomas.weissschuh@linutronix.de> wrote:
> > >
> > > On Thu, Apr 24, 2025 at 04:10:04PM +0200, Jan Stancek wrote:
> > > > On Mon, Mar 03, 2025 at 12:11:10PM +0100, Thomas Wei=C3=9Fschuh wro=
te:
> > > > > From: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > > > >
> > > > > To support multiple PTP clocks, the VDSO data structure needs to =
be
> > > > > reworked. All clock specific data will end up in struct vdso_cloc=
k and in
> > > > > struct vdso_time_data there will be array of it. By now, vdso_clo=
ck is
> > > > > simply a define which maps vdso_clock to vdso_time_data.
> > > > >
> > > > > Prepare for the rework of these structures by adding struct vdso_=
clock
> > > > > pointer argument to do_hres_timens(), and replace the struct vdso=
_time_data
> > > > > pointer with the new pointer arugment whenever applicable.
> > > > >
> > > > > No functional change.
> > > > >
> > > > > Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > > > > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > > > > Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutroni=
x.de>
> > > > > ---
> > > > > lib/vdso/gettimeofday.c | 35 ++++++++++++++++++-----------------
> > > > > 1 file changed, 18 insertions(+), 17 deletions(-)
> > > > >
> > > >
> > > > starting with this patch, I'm seeing user-space crashes when using =
clock_gettime():
> > > >   BAD  -> 83a2a6b8cfc5 vdso/gettimeofday: Prepare do_hres_timens() =
for introduction of struct vdso_clock
> > > >   GOOD -> 64c3613ce31a vdso/gettimeofday: Prepare do_hres() for int=
roduction of struct vdso_clock
> > > >
> > > > It appears to be unique to aarch64 with 64k pages, and can be repro=
duced with
> > > > LTP clock_gettime03 [1]:
> > > >   command: clock_gettime03   tst_kconfig.c:88: TINFO: Parsing kerne=
l config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch=
64+64k/build/.config'
> > > >   tst_test.c:1903: TINFO: LTP version: 20250130-231-gd02c2aea3
> > > >   tst_test.c:1907: TINFO: Tested kernel: 6.15.0-0.rc3.20250423gitbc=
3372351d0c.30.eln147.aarch64+64k #1 SMP PREEMPT_DYNAMIC Wed Apr 23 23:23:54=
 UTC 2025 aarch64
> > > >   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15=
.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
> > > >   tst_test.c:1720: TINFO: Overall timeout per run is 0h 05m 24s
> > > >   clock_gettime03.c:121: TINFO: Testing variant: vDSO or syscall wi=
th libc spec
> > > >   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct =
10000ms
> > > >   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct =
0ms
> > > >   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct 1=
0000ms
> > > >   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0=
ms
> > > >   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct =
-10000ms
> > > >   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct =
0ms
> > > >   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct -=
10000ms
> > > >   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0=
ms
> > > >   tst_test.c:438: TBROK: Child (233649) killed by signal SIGSEGV
> > > >
> > > > or with:
> > > > --------------------- 8< ----------------------
> > > > #define _GNU_SOURCE
> > > > #include <sched.h>
> > > > #include <time.h>
> > > > #include <unistd.h>                                                =
                                                                           =
                                                                           =
                    #include <sys/wait.h>
> > > >
> > > > int main(void)
> > > > {
> > > >         struct timespec tp;
> > > >         pid_t child;
> > > >         int status;
> > > >
> > > >         unshare(CLONE_NEWTIME);
> > > >
> > > >         child =3D fork();
> > > >         if (child =3D=3D 0) {
> > > >                 clock_gettime(CLOCK_MONOTONIC_RAW, &tp);
> > > >         }
> > > >
> > > >         wait(&status);
> > > >         return status;
> > > > }
> > > >
> > > > # ./a.out ; echo $?
> > > > 139
> > > > --------------------- >8 ----------------------
> > > >
> > > > RPMs and configs can be found at Fedora koji, latest build is at [2=
] (look for kernel-64k).
> > >
> > > Hi Jan,
> > >
> > > Thanks for the great error report.
> > >
> > > Can you try the following change (on top of v6.15-rc1, should also wo=
rk with current master)?
> > >
> > > diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> > > index 93ef801a97ef..867ce53cca94 100644
> > > --- a/lib/vdso/gettimeofday.c
> > > +++ b/lib/vdso/gettimeofday.c
> > > @@ -85,14 +85,18 @@ static __always_inline
> > >  int do_hres_timens(const struct vdso_time_data *vdns, const struct v=
dso_clock *vcns,
> > >                    clockid_t clk, struct __kernel_timespec *ts)
> > >  {
> > > -       const struct vdso_time_data *vd =3D __arch_get_vdso_u_timens_=
data(vdns);
> > >         const struct timens_offset *offs =3D &vcns->offset[clk];
> > > -       const struct vdso_clock *vc =3D vd->clock_data;
> > > +       const struct vdso_time_data *vd;
> > > +       const struct vdso_clock *vc;
> > >         const struct vdso_timestamp *vdso_ts;
> > >         u64 cycles, ns;
> > >         u32 seq;
> > >         s64 sec;
> > >
> > > +       vd =3D vdns - (clk =3D=3D CLOCK_MONOTONIC_RAW ? CS_RAW : CS_H=
RES_COARSE);
> > > +       vd =3D __arch_get_vdso_u_timens_data(vd);
> > > +       vc =3D vd->clock_data;
> > > +
> > >         if (clk !=3D CLOCK_MONOTONIC_RAW)
> > >                 vc =3D &vc[CS_HRES_COARSE];
> > >         else
> > >
> > >
> > > I'll do some proper testing tomorrow.
> >
> > That does seem to work for the 2 reproducers I have.
>
> Thanks for testing.
>
> > But why is this change needed?
>
> So far the only thing that I can say is that this logic was there before =
the
> patch and was removed accidentally, so it should be restored.
> Why the logic was there in the first place I'll have to investigate.

I think it paired with "vd advancing" based on "clock" in original code:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib=
/vdso/gettimeofday.c?h=3Dv6.14#n264
and to get back to "base", you needed to subtract same value:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib=
/vdso/gettimeofday.c?h=3Dv6.14#n82

After this series, "vd" isn't manipulated this way, so the removal of
that subtraction seemed deliberate to me.

>
> > Isn't 'vdns' here equal to 'vdso_u_time_data'?
>
> That is true, but in a time namespace the namespaced time structure is ma=
pped
> in place of the normal structure and vice-versa.
> So __arch_get_vdso_u_timens_data() will get the "real" time datastructure=
 based
> on a namespaced one.
>
> I can't explain the special logic for CLOCK_MONOTONIC_RAW yet.
> To me it looks wrong to calculate on a 'struct vdso_time_data *' in terms=
 of
> CS_RAW/CS_HRES_COARSE.
>
>
> Another change that "fixes" the crash for me is:
>
> diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> index 93ef801a97ef..cdc3988a0ace 100644
> --- a/lib/vdso/gettimeofday.c
> +++ b/lib/vdso/gettimeofday.c
> @@ -93,6 +118,8 @@ int do_hres_timens(const struct vdso_time_data *vdns, =
const struct vdso_clock *v
>         u32 seq;
>         s64 sec;
>
> +       OPTIMIZER_HIDE_VAR(vc);
> +
>         if (clk !=3D CLOCK_MONOTONIC_RAW)
>                 vc =3D &vc[CS_HRES_COARSE];
>         else
>
>
> This is obviously not an actual fix but indicates that something weird is=
 going on.
> Could you run this second change also through LTP to see if it would pass=
?

Agreed, this does "fixes" it for me as well.

>
>
> Thomas
>
> > > > [1] https://github.com/linux-test-project/ltp/blob/master/testcases=
/kernel/syscalls/clock_gettime/clock_gettime03.c
> > > > [2] https://koji.fedoraproject.org/koji/buildinfo?buildID=3D2704401
> > >
>


