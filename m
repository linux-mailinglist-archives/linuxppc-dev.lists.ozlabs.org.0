Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD7A8983EC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 11:25:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Oqeqd8M1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9GS11b6fz3fCg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 20:25:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Oqeqd8M1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9GRK0JZlz3cP7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 20:24:44 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-56e0e1d162bso681577a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Apr 2024 02:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712222681; x=1712827481; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBVrbKnK3ovQO15P41mcUHM/iUWBDjuiISow2hRyoow=;
        b=Oqeqd8M1c+v8/B38hZvPt/wSzWIIIZDVPpdee8BkYuMxbVDkIvvhS1tz9vArdMK6e2
         /lEDHTWlDJo8ISoXagdsOARiwrXZXrfID7lB0w7qTAr6fouvxMI9QIJvz3ctEVxWTOSx
         EcrEquT97xX8oDjTvxnXDw/XLLAp04fqRcdC6pqyU3gSznPlDc1LoF3oOJcAU3oSjcYj
         LQGX7dJEUuBL0Dj5l9oRAt/MeFESHJJlwA18mhmEbuDzQC0w5U0dyNlRMFpphOlPnhv6
         MI71Vxmvo5UWg1Qogw3s3+2CXk2QmWqadfC4F+HbfVnzmEf/UoGYkMT6AkC+CzGmmDgc
         AVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712222681; x=1712827481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBVrbKnK3ovQO15P41mcUHM/iUWBDjuiISow2hRyoow=;
        b=CPCxR+P+PjLSKuFzDzeBe62jq8O8DpvsIojiD/MSCfohOVuvFtBYaIIlvPx6gRNxqm
         rizB88YmcblHCJGXh5bhdKAi1tCIg2A4nnvvmWd0luBrMCujlQaHzYMd19nPY+jYQDPt
         XD4m2N39+20fJYeCIsZygnU6S4DOc4Dy4ByH41cDOXqLPZE0cc2D++nIYdm8zE35691r
         2sip/mbDQlhr3ACYw9FCGpqg0FDClPrymEBvpIMNxlMX81eHS8RTscAqhPYJ6uIR47l3
         +jREE91DcUlWwOPkilHNd1tRUKmNEmmFQpJpiPo80gMpEbiAYdbon/eFhHl9OK7zONXV
         vPcw==
X-Forwarded-Encrypted: i=1; AJvYcCUcDiVmYg4c0gBpl+cyU6CvuTwNYLF9A7n3FFuoBMYS/wgG3yiOdxvphfRhv7uJGbRmQWX0/o4e6CrSzZLH4EopN/aGmdt6xcDa2Bm9eg==
X-Gm-Message-State: AOJu0YxuIHzHp+IGiUZgac/EL0SzCSMcvUtb3YAbkxO5TeRSu0h7s6TF
	VMOvHlJGFeSI9If53HgpiwU5sssbCWdWZqYl9mfVymLArTx7KnonyG/491zVmj48Z87k/bcdG/V
	hUuEBgoHcBnBKXNBFQ5ZJ8pabYGQ=
X-Google-Smtp-Source: AGHT+IFFuzK/Tj73r6cElPFLHYS0K+qrK8YOabFg09GALNmzfEyOCxxfGhkrrxxnyxPeh7bUQ1le67F9/FyVLwJu/PI=
X-Received: by 2002:a17:906:6dd2:b0:a4e:1055:8602 with SMTP id
 j18-20020a1709066dd200b00a4e10558602mr1069503ejt.19.1712222680512; Thu, 04
 Apr 2024 02:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain> <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
In-Reply-To: <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 4 Apr 2024 12:24:04 +0300
Message-ID: <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq flood
To: Finn Thain <fthain@linux-m68k.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 4, 2024 at 2:57=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> w=
rote:
> On Thu, 4 Apr 2024, Andy Shevchenko wrote:

...

> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: Nicholas Piggin <npiggin@gmail.com>
> > > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> > > Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> > > Cc: linux-m68k@lists.linux-m68k.org
> >
> > Second, please move these Cc to be after the '---' line
>
> I thought they were placed above the line for audit (and signing)
> purposes.

I didn't get this, sorry.

> There are thousands of Cc lines in the mainline commit messages
> since v6.8.

Having thousands of mistaken cases does not prove it's a good thing to
follow. I answered Jiri why it's better the way I suggested.

> > > Link: https://github.com/vivier/qemu-m68k/issues/44
> > > Link: https://lore.kernel.org/all/1078874617.9746.36.camel@gaston/
> >
> > Missed Fixes tag?
>
> Would this be ok: Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> I have to ask because some reviewers do not like to see a Fixes tag cite
> that commit.

Yes, or you even may dig into the history.git from history group (see
git.kernel.org) for the real first patch that brought it.

> > > Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> > > ---
> > (here is a good location for Cc:)
>
> Documentation/process/submitting-patches.rst indicats that it should be
> above the "---" separator together with Acked-by etc. Has this convention
> changed recently?

I see, I will prepare a patch to discuss this aspect.

--=20
With Best Regards,
Andy Shevchenko
