Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE59252D50B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 15:49:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3rnr6QCxz3blS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 23:49:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HiZDP/WI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HiZDP/WI; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3rn76GXqz2y7V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 23:49:14 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id m1so4731277qkn.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 06:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W8MbGFRNbe96lGFVMX7wSKQfvTzv7PtCyYQ4f5kYm+k=;
 b=HiZDP/WIS4fDtO/U3UYUP4YZkIoBiZWzkLOwaS8e+2Ym6BQgEWVLFkTTOLnZUYrkOa
 9KXJ/WshJxXA/trZqIwZne/k+T6u5R7TLGBk864nuxs8vXI3eykTdKKdtYaZ0hcSWzMR
 cBe97u37O7vkKetIdHQGtuwvafvbr5kU+CRb7rgZ3ABddKCLMZNRSeN/Os8Scp4556Dn
 YdNgpDN9bnsecnNMl23qfXHWPTlaQmCeX+Oi73nocfAok0RpWnhqYYV02uQg+cNDE4XY
 tLeMy0H0yff9pPwOR+AYQX95RoR7OYLDYdDjYd+AX8ccpri7TvWjUj3fkwEvgVFr5MLn
 UymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W8MbGFRNbe96lGFVMX7wSKQfvTzv7PtCyYQ4f5kYm+k=;
 b=hg9Ud6vbw6mpHxupOwAWCgDbVWGFMWvuPqjkzVHrRx9ITIijx0v6xv6Tq3MEkJzZc0
 vUuL4EwUNZa+JnPOTeN9yMEWyv9c/UpLszcAe+b+7bkSqNafSCRD3rCZIQv5hLVJs8og
 PdNXyARV5VrNR4CUP9k0DExcgKoa1zxNgeR5v8Pi8IbDMHcSwVbFR9KuwZ7OiXoJPqCA
 EbaV9gDI/U+wxe4PuBmT4Sc8bZWrgHbROjn5swYo8nE5KRkCb3w8fpCXji/3oAgSTAc+
 Rp6QsZ+Je2NblgUXvtymUfTZKnyk7hlT/A6cFhY2HrLSLi+8KWm7NjTsLOQgfRwHkvC+
 yXmA==
X-Gm-Message-State: AOAM531GfCg3lyVS4sioZG5/eHv3tBFJHyQqFJTsKFadSiLb7HXWTUet
 LvUdAu1/6dkQJqX6h/npJ0+LcLaDDpUIsKSdnYA=
X-Google-Smtp-Source: ABdhPJx1XIulWswUonjgYqNjS2K3jifCHlmdYJBrxNd5RtoDFfLU9Z8yCXIXjNUzI7Hv7AwhDhsELlKnJF3gvkWxWQ0=
X-Received: by 2002:a05:620a:1903:b0:67d:243b:a8ae with SMTP id
 bj3-20020a05620a190300b0067d243ba8aemr3052110qkb.142.1652968150544; Thu, 19
 May 2022 06:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200902035159.1762596-1-oohall@gmail.com>
 <23fd8d03-965b-a252-020e-4185c2ef5681@csgroup.eu>
 <871qwpofxr.fsf@mpe.ellerman.id.au>
In-Reply-To: <871qwpofxr.fsf@mpe.ellerman.id.au>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 19 May 2022 23:49:01 +1000
Message-ID: <CAOSf1CEwbpryhv3q4ab9zQVRhu2_GrBe1e8ECELvKYHAxuc97g@mail.gmail.com>
Subject: Re: [PATCH] powerpc/powernv/pci: Drop VF MPS fixup
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 19, 2022 at 10:38 PM Michael Ellerman <mpe@ellerman.id.au> wrot=
e:
>
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > Le 02/09/2020 =C3=A0 05:51, Oliver O'Halloran a =C3=A9crit :
> >> The MPS field in the VF config space is marked as reserved in current
> >> versions of the SR-IOV spec. In other words, this fixup doesn't do
> >> anything.
> >>
> >> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> >
> > A lot of cleanup patches from Oliver were merged in Septembre 2020 but
> > not this one.
> >
> > Any reason ?
>
> It wasn't clear to me that it's safe to remove. The commit that added it
> seemed to think it was important.
>
> The fact that it's out-of-spec doesn't mean we don't have some hardware
> somewhere that relies on that.

There is no hardware that depends on it. It was added in response to a
bug report on the IBM internal bugzilla about virtual functions not
reporting the same MPS as the physical function in the output of
lspci. This is by design since MPS is a property that is only relevant
to the PF. There was a corresponding patch to skiboot to intercept
writes to the MPS field of VFs which was used to fake a writable MPS
field in firmware. I removed that hack in 2019
(https://github.com/open-power/skiboot/commit/22057f868f3b2b1fd02647a738f6d=
a0858b5eb6c)
since it was pointless and was causing other problems. There's no real
reason to keep this code around IMO.
