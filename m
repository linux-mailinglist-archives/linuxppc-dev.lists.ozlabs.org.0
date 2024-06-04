Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 557488FB153
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 13:45:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QPxo2Gpz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtpg93pVzz30Wj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 21:45:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QPxo2Gpz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=alexghiti@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtpfS1t4mz2yvx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 21:44:30 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a62ef52e837so100536866b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 04:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717501466; x=1718106266; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BXu54JL29te3bk0JIakNdnue3MoNyfA1fQ0KpkafnY=;
        b=QPxo2GpztZr0szwAngBHslAo8X9PoDtebED+BouyNWJD3ogB+fkG8IGRFPZxlYoI04
         vrtokMNqWiNHFfvsmS89g//B12LQdf3Ep5R/5DF1TLniJxk3y/DYkuEp0yxDLVhra1qQ
         79FaFLRUddzNPdNvru6j4p/0qZnVAa3vKZQZyv150XU3pV+4HwfQobCIP7ixtPN7eheI
         BvI410v5ACfIUsy6yT8wu/7Oq8TnY6XUY0Zf+rX22hhbe0cp7m9yjI3uitTjpCX95TGh
         yysXNx0uywOJezrAceTR+cLxTqVqIphqQbzABcCDaLJf4aoY5A1ZTteYKz53foJvxwE4
         PqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717501466; x=1718106266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BXu54JL29te3bk0JIakNdnue3MoNyfA1fQ0KpkafnY=;
        b=iT0GCivtWNtPaVpHwTehGeSOlxu0oairbd39gpua4r4K3kCX8CRIkW+TvqaSPHm2gR
         8IsFNBZo30HTyHSWMngeW30NN20celjsVnvvnyigJuURgTzcn1T62iAXwRf6BafMe+3U
         fybB1FOptJbCHEhmnp8iHJOBxn6ykOy9uTGupc+NXsdMbWVxIPxwH79SRqmc+dPmY9l3
         8qwt+eJEFi+Sm+tVXhn/+nURVhUzpn2NriUFBKIlFcZ+7wIO9KSOfiaPgsnxOcs0VQyx
         q1ul2/Ni9lRilNGAS3Uor0rxFxxk6HrSkN5uqhu9MehpINgkpMal2cxtjpRhs4SIweAC
         5OpA==
X-Forwarded-Encrypted: i=1; AJvYcCX7QNu6lkbd57OXkf3JexjYTysYpoCfVLGIRMy/yLWR5XuDbzixt1XG0aNbzH5NJCamHe2buxwAMekakfyB0TuJHC0E5pxYMHqsJg0lpQ==
X-Gm-Message-State: AOJu0YyA28ntft8nrELt82vMIzrT4wqAabtvmzE3T89BeTWkmnv/Z4BX
	p3ONcs19vji/54RY64+sJF9gBFEYSGcQPZ+9JvFwHnE9lDkMx5hhk/RRu6xqJ6HfJ8b1mGFciua
	cIF0A1O0qS91dLqP+c6o5Z5GmonQSBUMgqxH1QQ==
X-Google-Smtp-Source: AGHT+IF5j0HlHcUwqZev1qhJa4XLMrGdrhzyscNN/jd+ZNq5k0ymbm8yvqEpsVyAB4LEq75CK9UuVo8NGyvZXeKaCp4=
X-Received: by 2002:a17:907:7ea1:b0:a68:e9dc:b07 with SMTP id
 a640c23a62f3a-a68e9dc0feemr501609066b.60.1717501465846; Tue, 04 Jun 2024
 04:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-4-alexghiti@rivosinc.com> <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
 <CAHVXubiKAY_L04ZwYSp-MpPPT5sPzxm4wB6HVFPzsMcB-3zq9w@mail.gmail.com>
 <CAEEQ3wkkNyrjVCDxprNP5Z=NzO=EYeKeWf3CDvVNJHY1uovmMQ@mail.gmail.com>
 <CAHVXubi+s2Q0y_xLbHpQJpz+yXvKWJ8e96wwAHP6A9C7U-He7g@mail.gmail.com>
 <CAHVXubg4vtfjSJ-w8-7suzZ9L5ZmTo8udUMaYjJ5veKBmikNjA@mail.gmail.com> <20240604-dazzling-envy-1dcf111eb2c5@spud>
In-Reply-To: <20240604-dazzling-envy-1dcf111eb2c5@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 4 Jun 2024 13:44:15 +0200
Message-ID: <CAHVXubhy1yEKOx91gc9S++yKOoQa+sJ5EDSiMFwR6qepwzRMew@mail.gmail.com>
Subject: Re: [External] [PATCH RFC/RFT v2 3/4] riscv: Stop emitting preventive
 sfence.vma for new vmalloc mappings
To: Conor Dooley <conor@kernel.org>
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
Cc: linux-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Matt Evans <mev@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, yunhui cui <cuiyunhui@bytedance.com>, Ved Shanbhogue <ved@rivosinc.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Dylan Jhong <dylan@andestech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 4, 2024 at 10:52=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Jun 04, 2024 at 09:17:26AM +0200, Alexandre Ghiti wrote:
> > On Tue, Jun 4, 2024 at 9:15=E2=80=AFAM Alexandre Ghiti <alexghiti@rivos=
inc.com> wrote:
> > > On Tue, Jun 4, 2024 at 8:21=E2=80=AFAM yunhui cui <cuiyunhui@bytedanc=
e.com> wrote:
> > > >
> > > > As for the current status of the patch, there are two points that c=
an
> > > > be optimized:
> > > > 1. Some chip hardware implementations may not cache TLB invalid
> > > > entries, so it doesn't matter whether svvptc is available or not. C=
an
> > > > we consider adding a CONFIG_RISCV_SVVPTC to control it?
> >
> > That would produce a non-portable kernel. But I'm not opposed to that
> > at all, let me check how we handle other extensions. Maybe @Conor
> > Dooley has some feedback here?
>
> To be honest, not really sure what to give feedback on. Could you
> elaborate on exactly what the option is going to do? Given the
> portability concern, I guess you were proposing that the option would
> remove the preventative fences, rather than your current patch that
> removes them via an alternative?

No no, I won't do that, we need a generic kernel for distros so that's
not even a question. What Yunhui was asking about (to me) is: can we
introduce a Kconfig option to always remove the preventive fences,
bypassing the use of alternatives altogether?

To me, it won't make a difference in terms of performance. But if we
already offer such a possibility for other extensions, well I'll do
it. Otherwise, the question is: should we start doing that?

> I don't think we have any extension
> related options that work like that at the moment, and making that an
> option will just mean that distros that look to cater for multiple
> platforms won't be able to turn it on.
>
> Thanks,
> Conor.
