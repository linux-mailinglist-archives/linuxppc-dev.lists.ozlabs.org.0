Return-Path: <linuxppc-dev+bounces-12680-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B262BBF2C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 06 Oct 2025 22:19:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgVx51VR6z2ygH;
	Tue,  7 Oct 2025 07:19:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.166.46
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759781977;
	cv=none; b=hZFJcHYb2vxHi0eQamXIMj3fFZqGhDPe/5dxu8t4EkjoaH1kaWLvhRiqpB85AcHXv9AASKD2c8L6dSSQ5LhvpnkEUb7uKAjBFmnMawh1Ze/N4VdBJpUzgiAq1GSP8otEwHGp2/3wTxScPnEiEZGBbRz1v286c50U3weS5Oy1taJvhpV8rq91OIb0UJfb6RPh1aUDoUlNQwi0tPKv3lQYN8bRpuCQ7u+H9j+GUsEXhD99CqJ8tPwDcOylbdr7trNjClwzgYaHkznvuROM+kyq5JV0VfdjPObO4VErb815OakzhAVLeMrtlB5omoNkErGpwsqLAwIoMy+waTEJDMNAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759781977; c=relaxed/relaxed;
	bh=WMQ7AMWhdctXnD7KUrakUOl3r47iwY0bunSrG+xUVBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrDiOe2MPUtEMw+80uYpuuNZWYiJ06JG8cWTtdXY7ulfquKIh9v7iFOeymNwPOKpVAN5OKqAjkfi+ZQ8vKTM7x/GCIrWI7YqqYfhgeLbIB/n220AwW6u6atSIDhhUm+cn9YychepifjOG5FKFbR8+LpoeU+eCdtbS/8S+VEg/JJizoJp7WLJMjMvLo5Hueig4sQ9DPJeF7jFmlg+P131+/Rw5T4YI6uXQzCmr91kjiFVHx7JwfCJLAfBKNpH2/HE96T9678yW2B3T1laeqWSNi4q3uGrRfe8OQh7RhFbq8zuzdsfpAN3w+iS4isvTsPk9f1ItzFNe+BmUvEOmPhXUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass (client-ip=209.85.166.46; helo=mail-io1-f46.google.com; envelope-from=jmforbes@linuxtx.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxtx.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxtx.org (client-ip=209.85.166.46; helo=mail-io1-f46.google.com; envelope-from=jmforbes@linuxtx.org; receiver=lists.ozlabs.org)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgVx34Hswz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 07:19:34 +1100 (AEDT)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-8c3414ad279so206414939f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Oct 2025 13:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759781971; x=1760386771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMQ7AMWhdctXnD7KUrakUOl3r47iwY0bunSrG+xUVBs=;
        b=tQr+7YZx8rpyEjifC2dWH/4Bwecc6SnZbqyJF7+l2mFcIbjjdn2YBY3of4iOvvMcqU
         zgXofVIb+BqeSqgyo0flWcXMq2VmgNz3R+SCE45yk+b/noDK+1/YsQ1Y8Pa1Qg+1ecmN
         jbQRX/sdpGuRssxZwdPZsMsHfv+ny3VfHhKZCmonwFcHnmDeHInizC/kpoWWhp/lBViX
         +2dIvV4NAKw8UcXwYV0r3ksEzLX++u7TP9HPXk+joLR5jkoIMWUBiNm2iU88bzwVY+9K
         oYZYp8e0OfsXvCKVQFV5RfgiLN+L8jsTQVkSI0Jdlw+pOcfFdpEZoVqraxKgPpVhZJjP
         DKXw==
X-Forwarded-Encrypted: i=1; AJvYcCVsx8qP96XpdTqFCkKpIkt4G+rH+hyD0N+FLukjSKgHXpffpYUjmKqAjWqt3ueR67Q8S463PIqKuaNY/jY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzOa+LXq6vwOU6B3HkJzdbp0qJQOk1O/f6nUJDb4jBt5+JiSvAh
	JERxDAKL8Ax+EvldQXt/njz+llvZ0kHMAJRQG8oyl8QCXiUXIQxai22s5Y1+9/YbCl/IE8v2C9x
	f25cbU2Gtj7P6fT3Y1Hzz4Y15wvgFX9DbJXuvFP9ZyLdXsgWyVVrtkg==
X-Gm-Gg: ASbGncud+4gTYG5Lv/taJ+Id+5gwmeMknDtrDUalAYdh/x/Rf/S4Bo95RiA53k3U+SE
	gMDquRNWSPiGOY7TSncFQU4ujb4AXv+5beXQ5VCUa+LPcmVWSOOa43yy+k2JlrAd/G9ckN3mjvx
	PLQOuC6DPX9A4tTbqS9TEyw2x/XYwRCAu1l/8lumJRoWVfM4WUs61DAFiXcXEz/KhG3UGD/Wzd0
	yfxyzz2/ldUqPGaR1GIxQapIar9a+7WTw==
X-Google-Smtp-Source: AGHT+IHRsp5f2Ku6tRb0jzYKixpe8eVlAjBgkS13HoHpwiJO4HW1LYKeuVIAV6O+Y2oX7uDDLHkb1J66/VTyrDNExLc=
X-Received: by 2002:a05:6e02:178b:b0:42d:8a3f:ec8b with SMTP id
 e9e14a558f8ab-42e7ad01f91mr194991055ab.3.1759781971030; Mon, 06 Oct 2025
 13:19:31 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
In-Reply-To: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
From: Justin Forbes <jforbes@fedoraproject.org>
Date: Mon, 6 Oct 2025 14:19:20 -0600
X-Gm-Features: AS18NWACojPXOJnwcNavqYHbaQyGIFY7GHsRyGCpNIUDTuuHWfnt5-IAZ7A22L4
Message-ID: <CAFxkdApQVEqCjQMAUqy8cuKnMy8GY9j+brgPZBkxCpeGi5xHxA@mail.gmail.com>
Subject: Re: [PATCH RESEND] powerpc/tools: drop `-o pipefail` in gcc check scripts
To: Jan Stancek <jstancek@redhat.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, 
	joe.lawrence@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 23, 2025 at 9:31=E2=80=AFAM Jan Stancek <jstancek@redhat.com> w=
rote:
>
> We've been observing rare non-deterministic kconfig failures during
> olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
> disabled and with it number of other config options that depend on it.
>
> The reason is that gcc-check-fpatchable-function-entry.sh can fail
> if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit while
> there is still someone writing on other side of pipe. `pipefail`
> propagates that error up to kconfig.
>
> This can be seen for example with:
>   # (set -e; set -o pipefail; yes | grep -q y); echo $?
>   141
>
> or by running the actual check script in loop extensively:
>   ----------------------------- 8< -------------------------------
>   function kconfig()
>   {
>     for i in `seq 1 100`; do
>       arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh \
>         ./scripts/dummy-tools/gcc -mlittle-endian \
>         || { echo "Oops"; exit 1; }
>     done
>   }
>
>   for ((i=3D0; i<$(nproc); i++)); do kconfig & done
>   wait; echo "Done"
>   ----------------------------- >8 -------------------------------
>
> Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-functio=
n-entry")
> Fixes: b71c9ffb1405 ("powerpc: Add arch/powerpc/tools directory")
> Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
> Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh | 1 -
>  arch/powerpc/tools/gcc-check-mprofile-kernel.sh           | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh b/=
arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> index 06706903503b..baed467a016b 100755
> --- a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> +++ b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
> @@ -2,7 +2,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>
>  set -e
> -set -o pipefail
>
>  # To debug, uncomment the following line
>  # set -x
> diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/power=
pc/tools/gcc-check-mprofile-kernel.sh
> index 73e331e7660e..6193b0ed0c77 100755
> --- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> +++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
> @@ -2,7 +2,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>
>  set -e
> -set -o pipefail
>
>  # To debug, uncomment the following line
>  # set -x
> --
> 2.47.1

Would love to see this picked up, it fixes a problem we have run into
with our CI.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>

