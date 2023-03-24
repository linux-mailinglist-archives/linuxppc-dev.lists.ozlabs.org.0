Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AD66C81AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 16:44:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pjmjh2Kvpz3fSn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 02:44:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K53LV2Ko;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K53LV2Ko;
	dkim-atps=neutral
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pjmhk2T7zz3fBB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 02:43:48 +1100 (AEDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5416b0ab0ecso39967037b3.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 08:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679672623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQ68igRUsnQg6wVXldKGuyS+4F6MYvbK1+eEkynFAsY=;
        b=K53LV2Ko7xTlcNS5SUEdTEPHSAx9VMu3KndgmdfNMx+UIms9g0RyB7VJUhxrU24QnI
         cQDhfbolVWi2kplhpvxOrqu+G2TNMB31B1alqPIag3L9My7jwcxa0nzuK0FzEsAQXANT
         CuoYXCRV7QkE5rCDrHbdvkoGK9/6Nw5J3z4nUFuwANGrXUw5+QGVdzSDcN1kNiJnyBLg
         8ckJxCZjD5I6IeWuw5SlTI4F1OLUxA+83oM9s6+Y14yUpMn+LHgms2YPXRSG3MyExdUC
         3ajx0Xnh/NIFmAoQlAZEFK0nrM7l1qSkTn9vF4HxnS8qyXkaF1PAVl1JfMaMDSwyDAX6
         ZKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679672623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQ68igRUsnQg6wVXldKGuyS+4F6MYvbK1+eEkynFAsY=;
        b=bn6zLfWbh4A2Il2/TCbJFld3OnH5kEYlmmuiMHPU+wb2mNX5rCWWrkGRTG38l6kvfA
         0YXU6akFqTMGrf2cziumtGlwStRdN1VeD2mZMZrReiRHm0ZtD4FD8q/eSe6DwTp6Qz4R
         ugvvhGnrvhdb954iv678dEDKNYQ9mlusPN2gHaxJU88lLnme/hcIjNsBtLo7Ci4JoHEw
         0uZeBrvjsD3X93qSx3Sjg0ospkmxxU0rVZNKJFcIo5C6njaF92Rs68zegDZwvpnGkLUd
         Lp3FUh3fZRQDCKPhtK93omemcJ7VrM4DaO5t3zptnF6pmQGsRAY895Z2jmxQ/Zje4JHV
         9w7w==
X-Gm-Message-State: AAQBX9d13QoUDM8W27V2/C74OpIlWAXg46E96mPPXYeUiJv+lZUkL5+b
	fOy1xX6uRKTYgaxUfsO1RCLEtQGmGYdwPOqKcEU=
X-Google-Smtp-Source: AKy350bNHA5192Yp0xtsBy+BnFapAy006gmelWsyIvqLWKFQXqJqxH4nWrB7/16FYuoooXDwmaHGuPjIe8uT4/9/A+Q=
X-Received: by 2002:a81:b721:0:b0:545:3f42:2d97 with SMTP id
 v33-20020a81b721000000b005453f422d97mr216474ywh.3.1679672623440; Fri, 24 Mar
 2023 08:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230305205628.27385-1-ubizjak@gmail.com> <20230305205628.27385-2-ubizjak@gmail.com>
 <ZB2v+avNt52ac/+w@FVFF77S0Q05N>
In-Reply-To: <ZB2v+avNt52ac/+w@FVFF77S0Q05N>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 24 Mar 2023 16:43:32 +0100
Message-ID: <CAFULd4ZCgxDYnyy--qdgKoAo_y7MbNSaQdbdBFefnFuMoM2OYw@mail.gmail.com>
Subject: Re: [PATCH 01/10] locking/atomic: Add missing cast to try_cmpxchg() fallbacks
To: Mark Rutland <mark.rutland@arm.com>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 24, 2023 at 3:13=E2=80=AFPM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Sun, Mar 05, 2023 at 09:56:19PM +0100, Uros Bizjak wrote:
> > Cast _oldp to the type of _ptr to avoid incompatible-pointer-types warn=
ing.
>
> Can you give an example of where we are passing an incompatible pointer?

An example is patch 10/10 from the series, which will fail without
this fix when fallback code is used. We have:

-       } while (local_cmpxchg(&rb->head, offset, head) !=3D offset);
+       } while (!local_try_cmpxchg(&rb->head, &offset, head));

where rb->head is defined as:

typedef struct {
   atomic_long_t a;
} local_t;

while offset is defined as 'unsigned long'.

The assignment in existing try_cmpxchg template:

typeof(*(_ptr)) *___op =3D (_oldp)

will trigger an initialization from an incompatible pointer type error.

Please note that x86 avoids this issue by a cast in its
target-dependent definition:

#define __raw_try_cmpxchg(_ptr, _pold, _new, size, lock)                \
({                                                                      \
       bool success;                                                   \
       __typeof__(_ptr) _old =3D (__typeof__(_ptr))(_pold);              \
       __typeof__(*(_ptr)) __old =3D *_old;                              \
       __typeof__(*(_ptr)) __new =3D (_new);                             \

so, the warning/error will trigger only in the fallback code.

> That sounds indicative of a bug in the caller, but maybe I'm missing some
> reason this is necessary due to some indirection.
>
> > Fixes: 29f006fdefe6 ("asm-generic/atomic: Add try_cmpxchg() fallbacks")
>
> I'm not sure that this needs a fixes tag. Does anything go wrong today, o=
r only
> later in this series?

The patch at [1] triggered a build error in posix_acl.c/__get.acl due
to the same problem. The compilation for x86 target was OK, because
x86 defines target-specific arch_try_cmpxchg, but the compilation
broke for targets that revert to generic support. Please note that
this specific problem was recently fixed in a different way [2], but
the issue with the fallback remains.

[1] https://lore.kernel.org/lkml/20220714173819.13312-1-ubizjak@gmail.com/
[2] https://lore.kernel.org/lkml/20221201160103.76012-1-ubizjak@gmail.com/

Uros.
