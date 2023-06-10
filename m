Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E6A72A7C4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 03:47:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdLRj23PFz3fPG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 11:47:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LNV/FdI5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LNV/FdI5;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdLQr3G5rz3dyN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 11:46:43 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-256531ad335so1239017a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 18:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686361600; x=1688953600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nO6vzid1K69dvPDtrTKEIUfMDvueRgprm9O2MIgWICA=;
        b=LNV/FdI5PMCvcEXV+WiQ+PVKs5xxGkDes2/0Quu5bksLuYJi7BOzosmvDCYr9IfN2c
         xdAbrSB3r2a2KrDL2+YcW16r6MV+OSUYbFtfSWZL3V3PqINLhXVcMsfMFvlpL5l8/If2
         iYn+PYlKqcdMRQ36S4FNOaUyLe1rUxlv1ayysLrccRG91tHreSjZHSmVmi3vbgbnsBvQ
         E8X1nXQsvqF0peRhameHI38vUHivkri9PcbLfZqjaYF+1rC6ulntc7ruMfPWV9EMrU+4
         iRXbO3Ea9BxOSChhB2SLsAv2JS6erW15Ej3NmSRX8PKr9LClomq9ysZvKumnYxPl3D1c
         V2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686361600; x=1688953600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nO6vzid1K69dvPDtrTKEIUfMDvueRgprm9O2MIgWICA=;
        b=YPbGk1WuFuK4+bzK90nFM6OmQu5olaJcdCiQCmK6+HOpYQgVKrf9WHHY7n/z8NPMhz
         6bwJ97qtfpQpuZzIuzRCIN7W3opbBCbKZSu08i2f7wSwJxkQCBcNGXhRLGEuUDFLPD9v
         ozDdVdLpeLaoIKmCIYfpSbOdwRevRB7cgbBvTCa2dDQ62Eol4JbytP92z44ZewPYIIQh
         SUmBRWUwlD6tpzHEiMLz4OmH49dSEPXwdCk/ftslRaVyPgbJh+VZpzNK+jlnu9ZVh7XA
         7TqcwkRBDOMUf2W9s9L4a9OluVG0EvFwd3GIO/rkMTTtrsn5c75MPpJHHek7Bmx5RuGg
         kntw==
X-Gm-Message-State: AC+VfDwsuFHjO730r0ztWoMF//HPZwN7N+1k3dHFecS5bswYOecZSRgq
	cKQFgzApD1GTrmCUtCDRQDMKvWXZBvMVpq1uZnA=
X-Google-Smtp-Source: ACHHUZ48tqUVwDz9/d14iBGqnipYCI/liB2uXObdEuicH3caZ5C/h2oTO6YKZ4sD24Q33UWiGN9OCQLFD9t5U7l/W6g=
X-Received: by 2002:a17:90b:ed8:b0:250:2311:1535 with SMTP id
 gz24-20020a17090b0ed800b0025023111535mr2814927pjb.24.1686361600430; Fri, 09
 Jun 2023 18:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com> <CT6641NE8LNV.20P6CCOLXZEP@wheely>
In-Reply-To: <CT6641NE8LNV.20P6CCOLXZEP@wheely>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Sat, 10 Jun 2023 11:46:28 +1000
Message-ID: <CACzsE9rTBTVtdTwSom-mL5ZV0PU86V8epnGvsxdcbJcGeXj5+A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/6] KVM: PPC: Nested PAPR guests
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: mikey@neuling.org, kautuk.consul.1980@gmail.com, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, Jordan Niethe <jpn@linux.vnet.ibm.com>, sbhat@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 7, 2023 at 3:54=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com> =
wrote:
>
> On Mon Jun 5, 2023 at 4:48 PM AEST, Jordan Niethe wrote:
> > There is existing support for nested guests on powernv hosts however th=
e
> > hcall interface this uses is not support by other PAPR hosts.
>
> I kind of liked it being called nested-HV v1 and v2 APIs as short and
> to the point, but I suppose that's ambiguous with version 2 of the v1
> API, so papr is okay. What's the old API called in this scheme, then?
> "Existing API" is not great after patches go upstream.

Yes I was trying for a more descriptive name but it is just more
confusing and I'm struggling for a better alternative.

In the next revision I'll use v1 and v2. For version 2 of v1
we now call it v1.2 or something like that?

>
> And, you've probably explained it pretty well but slightly more of
> a background first up could be helpful. E.g.,
>
>   A nested-HV API for PAPR has been developed based on the KVM-specific
>   nested-HV API that is upstream in Linux/KVM and QEMU. The PAPR API
>   had to break compatibility to accommodate implementation in other
>   hypervisors and partitioning firmware.
>
> And key overall differences
>
>   The control flow and interrupt processing between L0, L1, and L2
>   in the new PAPR API are conceptually unchanged. Where the old API
>   is almost stateless, the PAPR API is stateful, with the L1 registering
>   L2 virtual machines and vCPUs with the L0. Supervisor-privileged
>   register switching duty is now the responsibility for the L0, which
>   holds canonical L2 register state and handles all switching. This
>   new register handling motivates the "getters and setters" wrappers
>   ...

I'll include something along those lines.

Thanks,
Jordan

>
> Thanks,
> Nick
>
