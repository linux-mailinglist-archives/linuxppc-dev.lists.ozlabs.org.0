Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DBF87BDD6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 14:37:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwT2h596Fz3vb9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 00:37:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.175; helo=mail-yw1-f175.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwT2H3vZpz3cVv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 00:37:10 +1100 (AEDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-60cbcd04de8so7769117b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 06:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710423427; x=1711028227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDiARA/24cHYG8FRrouoTvUxwp5WbH/hNpGJ/9ezCCU=;
        b=rhmffZ/g1ielIG70SCdkBYej9Wvm1jPPc41G73Cgcx8XER/BUw/LPCDORN2iSllSxW
         yGX0iyNJvLWFPcN1/+mOQbMVQx7DfOvekOztj30LggaJbdnDziMXEehgQWTBZ6ZYzljz
         wXUstJ+eRXNpiJLsM+fMON/x3Az60Ww6LWN9E7lODSNF/QoFMxkVCu6B69lPjRp4+bXN
         u13xxqIHMtA02L2SO4hTAp4+0ui99ishnqXN3lCUGs7k0/FJUAfl6OE4PGMlJU04ghA0
         wKDB8CNsEmYlhvwgUZDtI3L1HigdIyJmU7pf9xr44n0sGBHZTGfQYbTyq/R+YHEUKicR
         phTA==
X-Forwarded-Encrypted: i=1; AJvYcCWbGB1II4lffdayYytdG/8Ib7R8cUS891p1ytg/saE8jmnYuZCsQjv9UGS0OCbMc2dsXcAVGulrsSAnzAkQFFpmVgJh9CDZ5CQuRsP3wA==
X-Gm-Message-State: AOJu0YwxKFKT90Ub+gwKQrKx3T+m0vHV//PjbI7du8hYXqEBnUZFo+hI
	1pnOPktmIkkokrKKC6BKEY4UW+yfYGaP+83vLNe3D+yvkbY4kAl27K4jmunG3Ek=
X-Google-Smtp-Source: AGHT+IHTRZ5KK7iD8WRn8PxioBgkT5VMKhpnfOQ6/Y6Iq/KxqIcuwLhdmzv6yAS0Orml3qh5llzxGw==
X-Received: by 2002:a0d:d88a:0:b0:60a:6a3f:9d47 with SMTP id a132-20020a0dd88a000000b0060a6a3f9d47mr1195881ywe.16.1710423426543;
        Thu, 14 Mar 2024 06:37:06 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id o1-20020a81ef01000000b0060a304ca3f4sm269229ywm.19.2024.03.14.06.37.04
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 06:37:04 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60a0a54869bso8984377b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 06:37:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGFCxgugxlaxdcehLJxHx0dPcfsDerW7j1afH9mxQuVGrEZOpmsgnz2jIz0c0eSzqRqMgzEd4ZKCyNMgKq9f+ksVbnfiuh01+DPsGj3A==
X-Received: by 2002:a0d:fe04:0:b0:60a:4930:5bb1 with SMTP id
 o4-20020a0dfe04000000b0060a49305bb1mr1000757ywf.5.1710423424398; Thu, 14 Mar
 2024 06:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240312170309.2546362-1-linux@roeck-us.net>
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 14:36:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
Message-ID: <CAMuHMdUkvagJVEfnhq=Nx2jnmdS0Ax+zy1CvyN0k7k1EwUpu+g@mail.gmail.com>
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, netdev@lists.linux.dev, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmer
 mann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi G=C3=BCnter,

On Tue, Mar 12, 2024 at 6:03=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
>
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons.
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad-hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
>
> One option to address problem would be to add messages such as "expected
> warning backtraces start / end here" to the kernel log.  However, that
> would again require filter scripts, it might result in missing real
> problematic warning backtraces triggered while the test is running, and
> the irrelevant backtrace(s) would still clog the kernel log.
>
> Solve the problem by providing a means to identify and suppress specific
> warning backtraces while executing test code. Support suppressing multipl=
e
> backtraces while at the same time limiting changes to generic code to the
> absolute minimum. Architecture specific changes are kept at minimum by
> retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
> CONFIG_KUNIT are enabled.
>
> The first patch of the series introduces the necessary infrastructure.
> The second patch introduces support for counting suppressed backtraces.
> This capability is used in patch three to implement unit tests.
> Patch four documents the new API.
> The next two patches add support for suppressing backtraces in drm_rect
> and dev_addr_lists unit tests. These patches are intended to serve as
> examples for the use of the functionality introduced with this series.
> The remaining patches implement the necessary changes for all
> architectures with GENERIC_BUG support.

Thanks for your series!

I gave it a try on m68k, just running backtrace-suppression-test,
and that seems to work fine.

> Design note:
>   Function pointers are only added to the __bug_table section if both
>   CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled to avoid image
>   size increases if CONFIG_KUNIT=3Dn. There would be some benefits to
>   adding those pointers all the time (reduced complexity, ability to
>   display function names in BUG/WARNING messages). That change, if
>   desired, can be made later.

Unfortunately this also increases kernel size in the CONFIG_KUNIT=3Dm
case (ca. 80 KiB for atari_defconfig), making it less attractive to have
kunit and all tests enabled as modules in my standard kernel.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
