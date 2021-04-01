Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D773351315
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 12:14:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9zZL3lH8z3bwN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 21:14:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=m0xaABoT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m0xaABoT; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9zYx3Lftz2xZp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 21:14:28 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id v8so769419plz.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 03:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=8EF/GMEyenok5uS/Yv0Ybl+raNvpq2SUPzPqjro+LzQ=;
 b=m0xaABoTry5jCute/N1uzG1YsoBY1sMOq0Q44lJnhpaGMUl7nPPjMHGyS5x9fnlV/X
 5JNkXV/RGo9Q0NQmqarIWOYhmyXqWUDJpYgSfwfE/MBNhd1lZoJXzEg5Fufu4t5r79H3
 T5VDd5xAiwRqE1YPNyBHAQlAMmef+/Cl0Up88NiVC6PvKvsYophKTb7MmKggdgh767t8
 VoT4wWGxoLP7JlnAEqnE6mjm2qnRV50PLBXh4pXKY3BO5XW9+BXFmc3M1/nRl5o/q5MO
 8UfQt9BVI4UuMGEvGSBjamx97VEZC5iVtzF8tbVLRKNG+rqUQR3/SxtgIQM/YnlIJ3/q
 Qu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=8EF/GMEyenok5uS/Yv0Ybl+raNvpq2SUPzPqjro+LzQ=;
 b=NGKgsxr2gOC1G/M2GQKYcSI2M4yNnaZOQlxuhpk1Z/ogJqt1bPd1kiuJnztcX7QDcQ
 gJ8tQ/wJpNsUpmGZVQpvhvYPyGfZZBDgKls4kSUpHYKvXhpMK5rnSBejY65SrPVJh3zN
 mCeKIePCl9e9bzgSe6MNCJpDqCy+Wb1PNo5NoSdz9SyKr557RkQNQpcDxhz8t/CCqjj3
 XyxQ6FJssnI2A1m5snt/2Z2HzyizBBYfMPlW8d6s5jjYx5/vU1XhbGhC1SW96hLL09bO
 hb2akil8IVwSomgv4CFlIdIdTaBRtoWJ5Ms0difylmZVE1x51GItj0PRR5k7gbMdiH4Y
 ov/Q==
X-Gm-Message-State: AOAM531Nl5lsGtcSTboz/ODreJRi76pFRqqjbIzyOGzaK9IX2ze0qm0I
 ApLBgXaZ/05CjRW+UnOMgpI=
X-Google-Smtp-Source: ABdhPJyaeWJ/xnKD7UuFJWBysx4pve2Xa3Fu5sHqWsQ54kxJfVx0e0QgcXmCQxg3wUpA2S2R7PjmYw==
X-Received: by 2002:a17:902:a513:b029:e5:d91c:2ede with SMTP id
 s19-20020a170902a513b02900e5d91c2edemr7176750plq.65.1617272065685; 
 Thu, 01 Apr 2021 03:14:25 -0700 (PDT)
Received: from localhost ([1.128.222.237])
 by smtp.gmail.com with ESMTPSA id t17sm5428599pgk.25.2021.04.01.03.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:14:25 -0700 (PDT)
Date: Thu, 01 Apr 2021 20:14:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 24/46] KVM: PPC: Book3S HV P9: Use large decrementer
 for HDEC
To: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-25-npiggin@gmail.com>
 <11ba0a43-a64a-ca06-581c-e8b7dc97b1d7@ozlabs.ru>
In-Reply-To: <11ba0a43-a64a-ca06-581c-e8b7dc97b1d7@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1617272048.6127blp34g.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Alexey Kardashevskiy's message of March 26, 2021 12:05 pm:
>=20
>=20
> On 23/03/2021 12:02, Nicholas Piggin wrote:
>> On processors that don't suppress the HDEC exceptions when LPCR[HDICE]=
=3D0,
>> this could help reduce needless guest exits due to leftover exceptions o=
n
>> entering the guest.
>>=20
>> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
>=20
> ERROR: modpost: "decrementer_max" [arch/powerpc/kvm/kvm-hv.ko] undefined!
>=20
>=20
> need this:
>=20
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -89,6 +89,7 @@ static struct clocksource clocksource_timebase =3D {
>=20
>   #define DECREMENTER_DEFAULT_MAX 0x7FFFFFFF
>   u64 decrementer_max =3D DECREMENTER_DEFAULT_MAX;
> +EXPORT_SYMBOL_GPL(decrementer_max);

Added.

Thanks,
Nick
