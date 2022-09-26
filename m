Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F615EB4B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 00:42:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbyS03jGtz3cB6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 08:42:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=5WMM3Qo+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=5WMM3Qo+;
	dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbyRM5wqsz2xsD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 08:41:35 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id n124so10018699oih.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tz2cEwqQBI5KOid9Ym3jdh1CtIss2mqT+yeVpI5D5SM=;
        b=5WMM3Qo+EagYcdk/4XzPR7M1Nkp26RLOWPb1x61inBt4ynUprqDGH/n2uKScMC+AV0
         EcFTOsJ5mdWcraZ1soCsfLi7zx5w0vD/VBx5UsNCU5hsv98jWYpXFxAnSq162zbHwfMx
         iqLiAf99fvx4Bmp4Z2Bt3Tz4f+c4u0SJditYcS0saNoVVvvEDIiw4VAuTOXVoOpURqDs
         l5S/Xz9djK88fduZ+aQgRsHpuZF3xxnJwOqhpcVPGQ3n7OUFOqtY0lcurwbzfVsrLbco
         vxExn+Zqc/jBXo9VBrKMIPYnRCffnj/oBxm1X3GS0LIglmabtIgcE8YOTyR+w1dDwro1
         YTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tz2cEwqQBI5KOid9Ym3jdh1CtIss2mqT+yeVpI5D5SM=;
        b=s7zTUWlqB4oQkv9c3Ap6G5YRJsBw/MO9v1aAZN9mgtHmp32xf82sacF3zrKjjv7a8D
         C+/HzaWwI/CgfujqmT2yWhjeOMjE8UEDQ1ALGea0qGQV41ktIDpJaswEiLURpMgIrcQ3
         TFnNyEB+4QpRPmw5WDpWnTN+eFvuC3ubOa1Yil7axUcR4VFNSc415/dPqjTgNCDh8t3V
         9j36jyAF2eluETA6mg+IPMVChplanXf1+FxFfQp7F4hC8j10P1RJ+kUvHGLnI1wDPir1
         WQ5Sqlth0cOanZK4NqrIe5+sP2lSoQYhUzc+FJKRhK212g+RYaXmblY5HE501Muw18Il
         cfzw==
X-Gm-Message-State: ACrzQf07n9LGSmGvCAo/fyojpd+uU8y5ckuWqrSiR+n9RVV4r4F45G/E
	GS8KC87SY6r/aCNZ2XnpVQ/C1Y33yjaJt7p8zkRS
X-Google-Smtp-Source: AMsMyM4w8nRvJwif6MuQV1Y60DIJ5t08oIJfRG7hIO1WM7+Mw7vUvSGUBu9AGMzwflSnF4bjdKW2wOh01hwIbLeR7Ws=
X-Received: by 2002:a05:6808:144b:b0:350:a06a:f8cb with SMTP id
 x11-20020a056808144b00b00350a06af8cbmr488080oiv.51.1664232092411; Mon, 26 Sep
 2022 15:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220926131643.146502-1-nathanl@linux.ibm.com> <20220926131643.146502-3-nathanl@linux.ibm.com>
In-Reply-To: <20220926131643.146502-3-nathanl@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 26 Sep 2022 18:41:21 -0400
Message-ID: <CAHC9VhS9kJ4aEp_Y_imcsj_0JOn523Au=ct6uQEPjNDVVjYxVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/rtas: block error injection when locked down
To: Nathan Lynch <nathanl@linux.ibm.com>
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
Cc: ajd@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, jmorris@namei.org, linux-security-module@vger.kernel.org, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, serge@hallyn.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 26, 2022 at 9:18 AM Nathan Lynch <nathanl@linux.ibm.com> wrote:
>
> The error injection facility on pseries VMs allows corruption of
> arbitrary guest memory, potentially enabling a sufficiently privileged
> user to disable lockdown or perform other modifications of the running
> kernel via the rtas syscall.
>
> Block the PAPR error injection facility from being opened or called
> when locked down.
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 25 ++++++++++++++++++++++++-
>  include/linux/security.h   |  1 +
>  security/security.c        |  1 +
>  3 files changed, 26 insertions(+), 1 deletion(-)

The lockdown changes are trivial, but they look fine to me.

Acked-by: Paul Moore <paul@paul-moore.com> (LSM)

-- 
paul-moore.com
