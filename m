Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B76A04A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 10:19:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMnY71rJ5z3cKb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 20:19:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VTUwGjwx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VTUwGjwx;
	dkim-atps=neutral
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMnX80C9Lz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 20:19:02 +1100 (AEDT)
Received: by mail-vs1-xe2b.google.com with SMTP id f23so13830532vsa.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 01:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677143940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJG07+p6MKBGS+KUMirk1JxFZsTo6RYQStGyBrR/Eec=;
        b=VTUwGjwxIdIk+8DQo1F08zqK342XkE0IyISiKy445xlO4gn5BcvtIN8ObhUibjnPdh
         +8QCDzAGRnNMibyH/sRteQ9ut7OJkOEsJ8kPkEGYc9OBnih7SfNQpowLXMcwoFUvs1K0
         6ELBLUgwh0HmEnFhlM7FrYYPj3mzKwUNEEOe1h31zEj9FFkZtgtvcDAl/ADLU4zCLTaC
         CZOb1xxY9uT50WPXBxvhwk3EuLggirXkkdcMLU8rlZo6fi998cB25h17CFWSnwQ6kgUi
         scHNy8oFEGRxc67FjqT0UL/HkF89zud1sd74gtEScsUHorUBPQzjefZ88i8TDYmSUg2T
         qgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677143940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJG07+p6MKBGS+KUMirk1JxFZsTo6RYQStGyBrR/Eec=;
        b=VWpreoW2m6Z6J1fM6GhLgmHtBKw7XQ6jfhxAbXaHDGR/PAKWzHE/HuJRyvMR58gpqD
         5SVT7z1hcO684GkY5KQpiFEwl13HaWnC1jRB9EBRby1atIx5l2XTnY5QbvhSIzKVIAMK
         995rRoVJeOQEeoMrH2nH4xIUmk928oQ2qY8Jjycc7wRvET3cMmLuppxxyS8qUPx3/T66
         Vw2phihu3uApIqxdYNKeDc6W0HwEUieIiEkN+eND3tXyenBRTitPHWGNaPDpCEKc/a6z
         VV9Uhj3ExIS0jAfAqpOktw1afY11ZLKskO48iPWstXgmE6bmoltySTj4XeTIHd+s5LAy
         P2dA==
X-Gm-Message-State: AO0yUKU+9XaIdQSuf135nozDAbcRnij/1JJbPyV7qGm1N2g1iMCzAqmb
	LLR3q6CUvfANFdSMGdTDlfR09lsValXp7dG8j9YqsQBqLijTo3oS
X-Google-Smtp-Source: AK7set+fL9K7BQue1MVWJ997o1Uw4HQUESRxfTJt3q61lF9gsBJ2K4+iBi+Hrae4wfMfj+Ek0HWi8Lg5PF2Mvbw7Sx4=
X-Received: by 2002:a1f:aa41:0:b0:412:948:73ff with SMTP id
 t62-20020a1faa41000000b00412094873ffmr251161vke.13.1677143940266; Thu, 23 Feb
 2023 01:19:00 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-4-yuzhao@google.com>
 <CAOUHufYSx-edDVCZSauOzwOJG6Av0++0TFT4ko8qWq7vLi_mjw@mail.gmail.com>
 <86lekwy8d7.wl-maz@kernel.org> <CAOUHufbbs2gG+DPvSOw_N_Kx7FWdZvpdJUvLzko-BDQ8vfd6Xg@mail.gmail.com>
 <86a614ycs3.wl-maz@kernel.org>
In-Reply-To: <86a614ycs3.wl-maz@kernel.org>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 23 Feb 2023 02:18:24 -0700
Message-ID: <CAOUHufYLmu7oowXZ5YmVJqgx5dHWdz-1eaqPiVzUq3RAY4e_6A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 3/5] kvm/arm64: add kvm_arch_test_clear_young()
To: Marc Zyngier <maz@kernel.org>
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023 at 2:03=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Thu, 23 Feb 2023 03:58:47 +0000,
> Yu Zhao <yuzhao@google.com> wrote:
> >
> > On Fri, Feb 17, 2023 at 2:00=E2=80=AFAM Marc Zyngier <maz@kernel.org> w=
rote:
> > >
> > > On Fri, 17 Feb 2023 04:21:28 +0000,
> > > Yu Zhao <yuzhao@google.com> wrote:
> > > >
> > > > On Thu, Feb 16, 2023 at 9:12 PM Yu Zhao <yuzhao@google.com> wrote:
> > > > >
> > > > > This patch adds kvm_arch_test_clear_young() for the vast majority=
 of
> > > > > VMs that are not pKVM and run on hardware that sets the accessed =
bit
> > > > > in KVM page tables.
> > >
> > > I'm really interested in how you can back this statement. 90% of the
> > > HW I have access to is not FEAT_HWAFDB capable, either because it
> > > predates the feature or because the feature is too buggy to be useful=
.
> >
> > This is my expericen too -- most devices are pre v8.2.
>
> And yet you have no issue writing the above. Puzzling.

That's best to my knowledge. Mind enlightening me?

> > > Do you have numbers?
> >
> > Let's do a quick market survey by segment. The following only applies
> > to ARM CPUs:
> >
> > 1. Phones: none of the major Android phone vendors sell phones running
> > VMs; no other major Linux phone vendors.
>
> Maybe you should have a reality check and look at what your own
> employer is shipping.

Which model? I'll look it up and see how/how I missed it.

> > 2. Laptops: only a very limited number of Chromebooks run VMs, namely
> > ACRVM. No other major Linux laptop vendors.
>
> Again, your employer disagree.

What do you mean? Sorry, I'm a little surprised here... I do know *a
lot* about Chromebooks.

> > 3. Desktops: no major Linux desktop vendors.
>
> My desktop disagree (I send this from my arm64 desktop VM ).

A model number please?

> > 4. Embedded/IoT/Router: no major Linux vendors run VMs (Android Auto
> > can be a VM guest on QNX host).
>
> This email is brought to you via a router VM on an arm64 box.

More details?

> > 5. Cloud: this is where the vast majority VMs come from. Among the
> > vendors available to the general public, Ampere is the biggest player.
> > Here [1] is a list of its customers. The A-bit works well even on its
> > EVT products (Neoverse cores).
>
> Just the phone stuff dwarfs the number of cloud hosts.

Please point me to something that I can work on so that I wouldn't
sound so ignorant next time.
