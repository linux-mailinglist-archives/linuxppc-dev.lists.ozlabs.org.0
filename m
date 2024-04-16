Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F16A38A619E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 05:23:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CV/RH9as;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJTrS5zRBz3fQR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 13:23:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CV/RH9as;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJTqh5XkCz3d2c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 13:22:23 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ecec796323so4114575b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 20:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713237741; x=1713842541; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcJnQ5RsvalqfgaHq+X5NHOJAW/7cMGQBQEcGjm6AK4=;
        b=CV/RH9asK/aDH/9/zK+j9gZjzSdLwjZ0aWDQ1+zWKUsTm6moKfpI40YJW+19hKTGCK
         Yd2GlbBBzyXhjJeO1SDKoidi52661jFqkatBT945ksXKikYsoRJwRJjm7jHKwqNm4qRk
         O3VWM9UByBUIdQLSrMniLoAdMZXqNqsndBm/CBWbc0NA0QyjrU58iZY7qj5tNyD7xSsk
         +l1rntVgqwLCOQ/AXof9sVsTPplKiKUuGdfeCWqJhnge0Ee9q7EEiB7w1pAT/3xaGOQ6
         n7s6qi8UvLgHO6diHoCLTH4Hi+V7563OFak7Z3CjWWMzEyeXNNg9rRpf9Jj2tjdqc8vX
         Umrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713237741; x=1713842541;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CcJnQ5RsvalqfgaHq+X5NHOJAW/7cMGQBQEcGjm6AK4=;
        b=NH+G71ngh/YBQdK7nUCWJCxCQ1aN28Mg3JsbvB5o5jnCWkoghhEy+J1WVRPIJQR7+s
         fBGiTfG3y7rTmbUAtvF7mVGvC9OYq9FBxGblj+rbHUpAkwYOfW1OFv0u5sdYcHNwm8oc
         0SiOeIqoup/3Mp6gzHqgLLH96mvj6G4pO2JAZwYBSRcWg8A7lJ2mO27DtZA6bhn/nlD9
         yyi01wEoDv8sVp1N04jvgH6DhwtBLmgtsbBKusLSquIsA0hsRsH+uDjUXfmymb+A05a0
         xLMxPszSgi/5xZH2iJvOk3BpR2fJq3/QnUW0yUYrEfmpwtsYoVS9XSsht9H96b/D3Qrx
         Mswg==
X-Forwarded-Encrypted: i=1; AJvYcCVOjy1ba63TGqeNLKPZAFrZFd1jf8s44kbREaerjAYev06NfelqbCUY7egG3lsIJxQE+jfbFjnc0uj435TaXZJ0JRvH1LU2PwEJaJTa+A==
X-Gm-Message-State: AOJu0YzQjp5BF692rjQLCS6EjqakihKUSFEtmIfJE5jKYCWGSEmkoC92
	L2rZ3nbGVTc5Z2F9LvEPBDMeD3nbC+mtUjHR6Q4fC9MKBaHYem3B
X-Google-Smtp-Source: AGHT+IFYO16i2vd9ZZV1B0gCYxpWsSZN8AFwZWkx60Y7+LZAzVdjZLxv7JOOvdX6TqkjTvTzzX2sAw==
X-Received: by 2002:a05:6a00:1312:b0:6ea:dfbf:13d4 with SMTP id j18-20020a056a00131200b006eadfbf13d4mr15542362pfu.18.1713237740753;
        Mon, 15 Apr 2024 20:22:20 -0700 (PDT)
Received: from localhost ([1.146.57.129])
        by smtp.gmail.com with ESMTPSA id fv4-20020a056a00618400b006e685994cdesm7903637pfb.63.2024.04.15.20.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 20:22:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Apr 2024 13:22:15 +1000
Message-Id: <D0L83A745KF8.1KXG6GEDFXSZD@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v8 03/35] migration: Add a migrate_skip
 command
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nico Boehr" <nrb@linux.ibm.com>, "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240405083539.374995-1-npiggin@gmail.com>
 <20240405083539.374995-4-npiggin@gmail.com>
 <171259197029.48513.5232971921641010684@t14-nrb>
In-Reply-To: <171259197029.48513.5232971921641010684@t14-nrb>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Apr 9, 2024 at 1:59 AM AEST, Nico Boehr wrote:
> Quoting Nicholas Piggin (2024-04-05 10:35:04)
> [...]
> > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > index 39419d4e2..4a1aab48d 100644
> > --- a/scripts/arch-run.bash
> > +++ b/scripts/arch-run.bash
> [...]
> > @@ -179,8 +189,11 @@ run_migration ()
> >                 # Wait for test exit or further migration messages.
> >                 if ! seen_migrate_msg ${src_out} ;  then
> >                         sleep 0.1
> > -               else
> > +               elif grep -q "Now migrate the VM" < ${src_out} ; then
> >                         do_migration || return $?
> > +               elif [ $skip_migration -eq 0 ] && grep -q "Skipped VM m=
igration" < ${src_out} ; then
> > +                       echo > ${src_infifo} # Resume src and carry on.
> > +                       break;
>
> If I understand the code correctly, this simply makes the test PASS when
> migration is skipped, am I wrong?

This just gets the harness past the wait-for-migration phase, it
otherwise should not change behaviour.

> If so, can we set ret=3D77 here so we get a nice SKIP?

The harness _should_ still scan the status value printed by the
test case when it exits. Is it not working as expected? We
certainly should be able to make it SKIP.

Thanks,
Nick
