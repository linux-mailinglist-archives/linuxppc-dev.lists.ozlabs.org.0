Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B699A72A7F0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 03:55:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdLdR3XDCz3fbv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 11:55:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=feVNO1Th;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=feVNO1Th;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdLcZ0MmWz3f0s
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 11:55:09 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-25bb39b862fso12113a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 18:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686362107; x=1688954107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2wh/UrjanufpJz44BmiMwc9ysr757JWcCqw7JQZgaA=;
        b=feVNO1Thyo2sUhxcMcbaZOhg0FlmNNPyGVkgwtblF28mHhFoHHCjr8gGjA/vU8Xvv4
         DcLYRUKWOKJTS+LVzAZPdH/qkKygpbN6voS62JZQ0lNXcCupH6qPGyEf68bqQ3OPvyX0
         +0HJkywZQYsQIg9aJILMwKVaNDO6KGetTIEBXLNLoAcw+GQrpt4cOmAqfnKXAGgrid5m
         XYieoBUlGIqFPrRfTBAg5iHQCA4RotZRM+wn7tMI86F65NweMJN2iDNKqOD0AfAWcD2G
         FQ1qr34wgdH9PXCdP8dzUJc2fA1HB1tRq9QuY5AGcQkUWJ+cA72S5BXYrcCzu0mJtQ0z
         8PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686362107; x=1688954107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2wh/UrjanufpJz44BmiMwc9ysr757JWcCqw7JQZgaA=;
        b=ZEQKbwrAxLrJmV1b9v6UqRO9U31rbVFG2MHFABNpdGxJ7uL+e9Un8MuACmdU2/9RG5
         6/TQNyN+JpFpu28VxLAtkwnFZ3ThYn8aSNn+IR4lfGG8JFq+C2OlQk6U0SbYK9ozdTiP
         USneKkji92jn3e4HPzxRiQErTKyv18ohzh4DGxJbMbwaAvqThPWE6d+vf9V6AK+0i5bR
         IaaVQZyS/YGBUs+E7D2GlliAf40XcMaXyN/gFUexGCyY9/e2KCzLEjG7oQPjLcpCPK5o
         jLBzYKZpHXD59fnWuyvyXmKFKwu8gM0PrqYPuPy3vl8+GNtR2SdZkNWELde1lVaDS933
         jbkA==
X-Gm-Message-State: AC+VfDwOl+ZgEOef4VGKEzDOsk1o5DhSKV7rbcigGvYJ3VDeJlpxFZUM
	WnO5ArXLe3SHLfycCRz0FhqMENIn1cppcQQvVMlWSPIlCuY=
X-Google-Smtp-Source: ACHHUZ7nvJVCagpU3QzMwxk4tI9YszwKv8pY+vsiwjdSjju24Nj4wuqO0v1/j7LJipdEqRbsTj6BvD4GjEtOlvRsm4g=
X-Received: by 2002:a17:90b:3508:b0:23f:81c0:eadd with SMTP id
 ls8-20020a17090b350800b0023f81c0eaddmr2724100pjb.47.1686362106985; Fri, 09
 Jun 2023 18:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
 <20230605064848.12319-3-jpn@linux.vnet.ibm.com> <CT6996Z3V83E.21I51JGIDHPOE@wheely>
In-Reply-To: <CT6996Z3V83E.21I51JGIDHPOE@wheely>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Sat, 10 Jun 2023 11:54:55 +1000
Message-ID: <CACzsE9oNLp7eSDiNhTB_hWn1TSu9Obr2rNPgTyK7_fYGXvu5Fw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/6] KVM: PPC: Add fpr getters and setters
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
Cc: mikey@neuling.org, kvm@vger.kernel.org, sbhat@linux.ibm.com, kvm-ppc@vger.kernel.org, Jordan Niethe <jpn@linux.vnet.ibm.com>, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 7, 2023 at 5:56=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com> =
wrote:
[snip]
>
> Is there a particular reason some reg sets are broken into their own
> patches? Looking at this hunk you think the VR one got missed, but it's
> in its own patch.
>
> Not really a big deal but I wouldn't mind them all in one patch. Or at
> least the FP/VR/VSR ine one since they're quite regular and similar.

There's not really a reason,

Originally I had things even more broken apart but then thought one
patch made
more sense. Part way through squashing the patches I had a change of
heart
and thought I'd see if people had a preference.

I'll just finish the squashing for the next series.

Thanks,
Jordan
>
> Thanks,
> Nick
>
