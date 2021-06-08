Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA0339EE1D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 07:27:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzdzH1Gt1z3bsD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 15:27:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cTDXmT/O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cTDXmT/O; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzdyn3Kpjz2yWT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 15:26:56 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id u30so19074151qke.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 22:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OhYoLxflbqy2x4T8u5cV5CjjD3rbffxuuzJaYyXO3gI=;
 b=cTDXmT/OQamLVrplThr/blFULqQGxorezrmdpj23q9cJGz0+DSZX4eumowxe0gpEsQ
 GizK7NYafbS03QJoFZ5YLXtPhhyMrIr7vl79lMShB9Gffu0ld+Jg8t29Sm9aeDqbWjtp
 Qh+t2e7ZDcilDqWs/+nl8Fw6ZFXuYzI6itTFciZE3+cSIMxrcsE+MLWb/748C5VYDpd4
 /r+2o0UkCSLDvS4aBqBMuy4M+legNCHEgpBMQ2QIfYnFBg7jXptLlnGItPYWz0zB/vVA
 KIoqzx4YSHFmzt2MtsPx2IGV+yW67IKU0saxGBJwh9427PtGoh/IBGNuiQdQ+JK2JPUL
 NrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OhYoLxflbqy2x4T8u5cV5CjjD3rbffxuuzJaYyXO3gI=;
 b=msky/5RqN4BkYjzbtb0aDyqxz0cTlb8jjugKtlLJQATzLM5NbLBYHHm2d1wVhW6aPX
 jt+pvdnVRa1+FOYz2HBTvgNJvVFkpB6W5HuHA4wZSlLO2A9s2MUt3h1eZSaZoR/Ppk/k
 TzS3OC4+fHecrlg3cuK106XDgYLcbxX9I13pA2EozOz5Sjb4jr0ZgQKstFs35v0kd9wh
 sJpo+zcKOA5LmntsGsAKgx898QGAFAaTwwM/PSyUazqufioVXRc/MnsSFwOhFHDjtI7u
 sgLfwbjEml6xD7I16YiSQro8jyW3KTaJUAwYWa7+pkQCO4RQ3MAnh8IFfnt7x2uUhxNR
 ep8A==
X-Gm-Message-State: AOAM531mj8jIrmChohVvFL8I1bhihAvo1tHWo82eKfuKhlJhRv8YcGPg
 I9nMjWVEo8wQ18KnAlQ4i9TojiMfNqlMIWq5AQQ=
X-Google-Smtp-Source: ABdhPJyU2LS/EIzpbv0za8QUZs/k8bXIZynY+j4mB2wtvu36HqFZh1L4X3T4Vrxtvazt1WMmHZatFaL2SDr74LYEbow=
X-Received: by 2002:a37:d88:: with SMTP id 130mr8857254qkn.34.1623130012658;
 Mon, 07 Jun 2021 22:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210604092228.199588-1-heying24@huawei.com>
In-Reply-To: <20210604092228.199588-1-heying24@huawei.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 8 Jun 2021 15:26:41 +1000
Message-ID: <CAOSf1CELBh4F334LK6+zy+BPOXKcOm92QZw4g71hQ7oQNa68nw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Fix kernel-jump address for ppc64 wrapper boot
To: He Ying <heying24@huawei.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 4, 2021 at 7:39 PM He Ying <heying24@huawei.com> wrote:
>
> From "64-bit PowerPC ELF Application Binary Interface Supplement 1.9",
> we know that the value of a function pointer in a language like C is
> the address of the function descriptor and the first doubleword
> of the function descriptor contains the address of the entry point
> of the function.
>
> So, when we want to jump to an address (e.g. addr) to execute for
> PPC-elf64abi, we should assign the address of addr *NOT* addr itself
> to the function pointer or system will jump to the wrong address.

How have you tested this?

IIRC the 64bit wrapper is only used for ppc64le builds. For that case
the current code is work because the LE ABI (ABIv2) doesn't use
function descriptors. I think even for a BE kernel we need the current
behaviour because the vmlinux's entry point is screwed up (i.e.
doesn't point a descriptor) and tools in the wild (probably kexec)
expect it to be screwed up.

ABIv2 (LE) reference:
https://openpowerfoundation.org/?resource_lib=64-bit-elf-v2-abi-specification-power-architecture
