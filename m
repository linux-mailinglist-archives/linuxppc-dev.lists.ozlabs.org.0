Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C1C545B2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 06:37:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LK7Vf2Nbjz3c1d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 14:37:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ScyMJdbq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ScyMJdbq;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LK7V16gVWz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 14:37:12 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id c21so1804976wrb.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jun 2022 21:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rI30E8KhaGbK7VA0Gqe6IZwSFhEFZvKjvya7u50m/Qw=;
        b=ScyMJdbqkd/JYHatq4bpH/E3ogRYCBw5pwSvdbFCzq7GeeBdCJ8d95AwPZ+2wKDIn7
         jxxdFgu1yw5aqOs7hCdjqbl9iSaT/yVIET1Nev8vSOpWcxYCzTrs0aC+Oop573junJjL
         gjCoqv4yVZUIeALSh05Hb9RnsScd/7vBrt1sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rI30E8KhaGbK7VA0Gqe6IZwSFhEFZvKjvya7u50m/Qw=;
        b=vUuXkkIayV07hckCwtPpb6ajEsisFDS8sT0FAc4WYVgm4TjsGU49XNKem1wky13qRY
         i7YKiiagl8edNGg6tc2PyXveESfGskfaenJhktDkycKa0Nh5eIV9//SfnRHXNUgqGblV
         thJu7m1zTDcOLIzVcNPuv6Vmr411z06jtTQ/uiBMF/5dOO05vORGfmy/cnqoNG7q4Xvd
         6cqGNgNOq9XNbYxnHxlN3fNNUYE+fHvymPUAQAp6KFKjBVEB8uDZU7UqQe3oN2H0Ic1V
         tWEMraCXbJfvYbrghk1ijzTeifToOxBMrXI8PnuDFrTZ3W2XhkDXmJYr/zmj7I7sAXFr
         YK9A==
X-Gm-Message-State: AOAM530Etj3jAlwk39vyNDmkXfKC2zqdXQZoBAjxTE+6Iv27V6arvqEs
	0UlFvuCZv6PWF/ZIZ6zofPD6jq8L2HduZAMfU3U=
X-Google-Smtp-Source: ABdhPJwjY+/6BJPZACSmWfX4NFQUfPGJJ53v/pfOLH4dkBJOOGaOfbWWanDehi9h+1LCBySQWN2O2oQnlz6PG90T+ac=
X-Received: by 2002:a5d:428f:0:b0:210:30cd:3753 with SMTP id
 k15-20020a5d428f000000b0021030cd3753mr41508372wrq.549.1654835825542; Thu, 09
 Jun 2022 21:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220526063723.51471-1-joel@jms.id.au> <407cd655-748e-a276-4c2b-d214a33f8981@linux.ibm.com>
In-Reply-To: <407cd655-748e-a276-4c2b-d214a33f8981@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Jun 2022 04:36:53 +0000
Message-ID: <CACPK8XezJHOcZxwnM+k1R1VkY+Cz1P=TyK0L0EVqqJU6WRhJrA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/perf: Give generic PMU a nice name
To: Madhavan Srinivasan <maddy@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 31 May 2022 at 08:53, Madhavan Srinivasan <maddy@linux.ibm.com> wrote:
>
>
> On 5/26/22 12:07 PM, Joel Stanley wrote:
> > When booting on a machine that uses the compat pmu driver we see this:
> >
> >   [    0.071192] GENERIC_COMPAT performance monitor hardware support registered
> Sorry that was my mistake.
> I agree having it as ISAv3 is better.

Okay. The downside of this is it's not as clear that you're using a
fallback driver.

I'll send a v2 with ISAv3

>
> Maddy
>
> >
> > Which is a bit shouty. Give it a nicer name.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >
> > Other options:
> >
> >   - ISAv3 (because it is relevant for PowerISA 3.0B and beyond, see the
> >     comment in init_generic_compat_pmu)
> >
> >   - Generic Compat (same, but less shouty)
> >
> >   arch/powerpc/perf/generic-compat-pmu.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
> > index f3db88aee4dd..5be5a5ebaf42 100644
> > --- a/arch/powerpc/perf/generic-compat-pmu.c
> > +++ b/arch/powerpc/perf/generic-compat-pmu.c
> > @@ -292,7 +292,7 @@ static int generic_compute_mmcr(u64 event[], int n_ev,
> >   }
> >
> >   static struct power_pmu generic_compat_pmu = {
> > -     .name                   = "GENERIC_COMPAT",
> > +     .name                   = "Architected",
> >       .n_counter              = MAX_PMU_COUNTERS,
> >       .add_fields             = ISA207_ADD_FIELDS,
> >       .test_adder             = ISA207_TEST_ADDER,
