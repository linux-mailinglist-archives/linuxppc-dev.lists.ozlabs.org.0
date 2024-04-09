Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2D289E116
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 19:08:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NBgg4PJf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDXV40qZJz3vYb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 03:08:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NBgg4PJf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=jstultz@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDXTH29zhz30gK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 03:07:46 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-41687826509so3045e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Apr 2024 10:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712682463; x=1713287263; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsBq0cy8GlGyTLsFzDWh0JUEGzZ8zL8Mw/WsALeBfxM=;
        b=NBgg4PJfV1QaaQA9H/ZhCEryI7g/NVTaAhHzGx3BzivP8ZFLZzu9DPOw19bBwaNHRo
         eg5tGQb+CbNLFvGHqmFdCmmRsB3mRRi7fTR8b3numcb6RAWanuh6Z2eDJKO3iY4OYPVb
         59hs5bYZoRI6JhrYG+NhhOQpQpvSerwS0ze55aZszlTgzzFVpEmLiaDQ2UnXecBXxufB
         rmDpQh/KjoQeLC9psiIMBuZzynU9GXTEFQLw+QSY3vrGF19x1pNaU8+qL2V6QDcDtemS
         bw1GojuOfm6uGKIxgQ25M4pwOLd0uesOur0KnYz0N9vHllY3Ecx9OwGf9RaTmAac8BFo
         n+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712682463; x=1713287263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsBq0cy8GlGyTLsFzDWh0JUEGzZ8zL8Mw/WsALeBfxM=;
        b=VHx2oj+jw0zNjsnfG3ZNtxpAzTAq34IcCdYMSnLcsqnJ8Wv+IZlce3ykIchPsxsTim
         +/VERatRvTkRdE9oALg72nso3NUSEwbIVrHbAWJFtacGpO4pwGSHNMaqh6QWWaPqsYgI
         nXcMNxeQJFAeVcBfVVvpLDzaVOZnio65vNzHEyC6CcrJx+3b2Hz2KqoLqpjLQCOd6Sdx
         FFFiL7wyjm44q/9LpnJQq73fB6VlbVxMha/F8jk+q0jSCeLrR8x1CDEFlmWZUuKTTsJV
         qhtZIKZtH9OawTJ1Xvcsg1N/v2WohZpgcZRx3zg1RRThczmj6oz/0cPrKnoAlC26Bwcp
         Kbzw==
X-Forwarded-Encrypted: i=1; AJvYcCUlTKIR0U8UOMDUk+CSnnyGn65GFyVn3k25mpEaStNxjyvnVk4+LYJjslqOZaJCIgquEViyOhmkV4OeXe7BnRIFo75W1/D+kxdpx6xlfA==
X-Gm-Message-State: AOJu0YzY6Dfxzx4WUyXnexGkaCJ5Jel6lzP4EPZaglmgrKJvW5ifLr79
	7AqU4YUvN7cQBA/aEHQngrP82fySLUTL6Ek9zEmNEN/g6yfbklHNFmh+n87pe4qj6+4uDzQgMkj
	cXUmu32s79fm7nTKJkNwmrTwNsyqPHxrPF0A=
X-Google-Smtp-Source: AGHT+IEEpJwqd6S7g8HTA9AUAVkouCdLTgaK8Qrafsc/GrNIeR6yWteoZFEb2wHAnEnwAyAcW7FiUqeH8KOEXFfmP5c=
X-Received: by 2002:a05:600c:1987:b0:416:57f5:b426 with SMTP id
 t7-20020a05600c198700b0041657f5b426mr184824wmq.1.1712682462632; Tue, 09 Apr
 2024 10:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240409062639.3393-1-adrian.hunter@intel.com>
In-Reply-To: <20240409062639.3393-1-adrian.hunter@intel.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 9 Apr 2024 10:07:30 -0700
Message-ID: <CANDhNCqx14CU9TwwkWqgUY9ucgaQZ8DwNmG+m==XrOziSfOS0Q@mail.gmail.com>
Subject: Re: [PATCH] vdso: Fix powerpc build U64_MAX undeclared error
To: Adrian Hunter <adrian.hunter@intel.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 8, 2024 at 11:27=E2=80=AFPM Adrian Hunter <adrian.hunter@intel.=
com> wrote:
>
> U64_MAX is not in include/vdso/limits.h, although that isn't noticed on x=
86
> because x86 includes include/linux/limits.h indirectly. However powerpc
> is more selective, resulting in the following build error:
>
>   In file included from <command-line>:
>   lib/vdso/gettimeofday.c: In function 'vdso_calc_ns':
>   lib/vdso/gettimeofday.c:11:33: error: 'U64_MAX' undeclared
>      11 | # define VDSO_DELTA_MASK(vd)    U64_MAX
>         |                                 ^~~~~~~
>
> Use ULLONG_MAX instead which will work just as well and is in
> include/vdso/limits.h.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20240409124905.6816db37@canb.auug.org=
.au/
> Fixes: c8e3a8b6f2e6 ("vdso: Consolidate vdso_calc_delta()")
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>

Acked-by: John Stultz <jstultz@google.com>
