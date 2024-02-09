Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D1484EF72
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 04:38:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QACYe0o1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWKMX3J7Nz3dBs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 14:38:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QACYe0o1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWKLq2ywNz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 14:38:11 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso298342a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 19:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707449888; x=1708054688; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+exzC8FxxlmEGoFzeebvnQTCtDzJ36K77Ic0tPa6NG0=;
        b=QACYe0o1kK/icEoib5uuczMt7CerYWKBMTUwaoMDsHX6HO3i67lQ8tQX3r6RyFrC/Q
         n8o1pf9vas/8Xv4OLfUnivVOnmpGZmBafjDdU2C8+U1GXR5trp63spQLqjC6p55OepMy
         5fa1uIZn7c6WMOVoEmPzc58wm9k+hmTiuCipvVdNaOWltwsDoxhrLzMPkhCq4FgAVs78
         4+m7+l88NIWpRuO4XsA7AVz72qs0nDNYxrGrrY/veqFVGf9o8LUF2BACdA6hD6dpHYPg
         6tFwF40tWIHkwBCZXEmgA4QdwMBiNU02GJ4tzBV3E66RNkpv0/FY0qVZ7tRSkHiqciO+
         EDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707449888; x=1708054688;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+exzC8FxxlmEGoFzeebvnQTCtDzJ36K77Ic0tPa6NG0=;
        b=PhMXkpswNMgzyxW96dOypudpOi12/cPiXKYYX8xRQlPXDyXSOruaWdUvdz4MabsSGH
         /jOGXF3q3oEv1A7vuy6nrQalm0rvqdaAaEfJi5an31jvfPfe/W1kEo41weohFJXmYI3b
         6HgKwR82oeFhLdgyGoWDYACdajP/KcNgi7B4Yw2FxCnBAkoEIhcbh+3xrtBlDxNner7L
         LyRXNTRQi9BPMP+uw2GoZZL7OrSURj27hC0Jg3njXT9gqbKzAMzOFsbQg413d+CLoOKL
         8pSs+Qo5dRiQNzXVPLmUPIlEBVmBMOHc1DzokYWjTEMKR2Gr7APrujcDHno9ZH/Y6FXG
         1m4Q==
X-Gm-Message-State: AOJu0YygbcAkCOiaXCz7YA6SsTJNFtBgou1EGnkrV1KqTPlmdXQRG/4z
	WK+8zJ9sNQ3xq0LyXzjtFnzDYOYmw1qAlnAR8q6ouSjLugUW4svx
X-Google-Smtp-Source: AGHT+IFAXbnV5TW0cUkYpJih4U9cPn4/SX1EN+1r22I5ui38caXGIrOO980EM5KCUY0cOnmcHCqIYg==
X-Received: by 2002:a05:6a20:9f47:b0:19e:957c:f7e6 with SMTP id ml7-20020a056a209f4700b0019e957cf7e6mr769555pzb.13.1707449888531;
        Thu, 08 Feb 2024 19:38:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlQOyVqCqmarM7+4FjzI9xeTntxER/MhKs1jzkz2Roi6HZlVgAnQZCo1A5wff+8lwTuNHkyujvc8AaISsuE9MPD7055vkS6rCsDQ3OaVtbISCNko3BLSi8X1Xd8nRvH4AqITbVhuRzwPFPO4+sG0y3HIBX99cprFvnhPIA8M/Jg00tMN/EL45C/udbxAfm3xDZYtSCzaqR7+fOAX0HZevclJRs9e4SArP5NBxCw70YcLMSLG6d6vC3NYlIQoSoCp5QQrxjh/X3CXFA
Received: from localhost ([1.146.65.44])
        by smtp.gmail.com with ESMTPSA id z8-20020a1709028f8800b001d911dd145esm505119plo.219.2024.02.08.19.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 19:38:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Feb 2024 13:38:01 +1000
Message-Id: <CZ08GUY1Y35T.2U33WWSJN7JVH@wheely>
Subject: Re: [PATCH v2 5/5] sched/vtime: do not include <asm/vtime.h> header
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Frederic Weisbecker"
 <frederic@kernel.org>, "Ingo Molnar" <mingo@kernel.org>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik"
 <gor@linux.ibm.com>
X-Mailer: aerc 0.15.2
References: <cover.1707422448.git.agordeev@linux.ibm.com>
 <e0827ac2f96d87f623575098f9d55e77351b63c6.1707422448.git.agordeev@linux.ibm.com>
In-Reply-To: <e0827ac2f96d87f623575098f9d55e77351b63c6.1707422448.git.agordeev@linux.ibm.com>
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Feb 9, 2024 at 6:15 AM AEST, Alexander Gordeev wrote:
> There is no architecture-specific code or data left
> that generic <linux/vtime.h> needs to know about.
> Thus, avoid the inclusion of <asm/vtime.h> header.

Nice cleanup!

Acked-by: Nicholas Piggin <npiggin@gmail.com>

>
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/Kbuild | 1 -
>  include/asm-generic/vtime.h     | 1 -
>  include/linux/vtime.h           | 4 ----
>  3 files changed, 6 deletions(-)
>  delete mode 100644 include/asm-generic/vtime.h
>
> diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/K=
build
> index 61a8d5555cd7..e5fdc336c9b2 100644
> --- a/arch/powerpc/include/asm/Kbuild
> +++ b/arch/powerpc/include/asm/Kbuild
> @@ -6,5 +6,4 @@ generic-y +=3D agp.h
>  generic-y +=3D kvm_types.h
>  generic-y +=3D mcs_spinlock.h
>  generic-y +=3D qrwlock.h
> -generic-y +=3D vtime.h
>  generic-y +=3D early_ioremap.h
> diff --git a/include/asm-generic/vtime.h b/include/asm-generic/vtime.h
> deleted file mode 100644
> index b1a49677fe25..000000000000
> --- a/include/asm-generic/vtime.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -/* no content, but patch(1) dislikes empty files */
> diff --git a/include/linux/vtime.h b/include/linux/vtime.h
> index 593466ceebed..29dd5b91dd7d 100644
> --- a/include/linux/vtime.h
> +++ b/include/linux/vtime.h
> @@ -5,10 +5,6 @@
>  #include <linux/context_tracking_state.h>
>  #include <linux/sched.h>
> =20
> -#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
> -#include <asm/vtime.h>
> -#endif
> -
>  /*
>   * Common vtime APIs
>   */

