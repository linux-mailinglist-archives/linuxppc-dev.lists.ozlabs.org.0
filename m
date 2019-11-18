Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC97FFCD6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 02:26:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GWWh63P6zDqZq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 12:26:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OaL5xvhA"; 
 dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GWTP0F1LzDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 12:24:38 +1100 (AEDT)
Received: by mail-il1-x141.google.com with SMTP id i6so5043543ilr.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 17:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vfDS8dFNimEvVAjpqdIXhbFXsWxzAggM6k11XcII1JY=;
 b=OaL5xvhA0a1k+iNdTmxWmyW2z2H5yzB6neo82QGAjaDsxLKSxfcurcwjp6xR4yTfSK
 cHtosk4EPsjyKu9fUjdqhZCVJQDKorFjwhznx5cu4xv2B5gP0DcrDH7Hi1SOFhkebX4a
 VZlRrQs4VnXJH6PUQVukgYVg1p7GiQOp8oQBWULV1b8jmNF7L0x7QFnMUl67ANqN4uAP
 WZdlNUFK71VdF1WTkM4NpkwrCyZLdP/pks5urHoQMCpuWQMcNhVibcs8Qa+3MEKvmlRk
 O/D1c4tKZsvnyYmSuLxk2RZ52H0EZoIPvTc2/8vD/F5AO97khw4N3uNZJSarRqt2/Rpz
 AllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vfDS8dFNimEvVAjpqdIXhbFXsWxzAggM6k11XcII1JY=;
 b=LnErHaSTMC+vKDNuZ/AirF/y06hbUTJI6/He9Ck73rW4vTaA6MEa+CRWhLtAgaveVc
 glHbHE3czJn++2AePlP/2dKknaGmHyaH4gTW40j5fB8Nyu7In95/7gBV4V11tXPZtY+8
 Zf/tM8CmRoaUGxC+Tddv1tMjgGvep/wV9hssWOkaSTO0PAY73WSA0CuydYR1mxl63jqd
 T7eNa72ufPoJw/erS+6hre/J8/Khsutx6ksc7/YuQPEEynWSwOaGYSO9bynQyZhVOGau
 DiqAq3tFDDZNeM5Bzpgic6ujyy7CGOJBOk3LqwDU5UTVf0kjLicjOh9Js4pu4BG/o+wT
 entQ==
X-Gm-Message-State: APjAAAVEcsbgK8GCmuYAb7CIpZJj5Y8SD3bO/+rBCkXbj6XTdIDzx+ln
 kh09NNbrIQv01OADHS7do2w4yH89Q7J9weoczbh3wEMC
X-Google-Smtp-Source: APXvYqwpi86NSM1IQscJ6mBkjDSeBu0g1b9RyKRYi1GXwkUsq2dfu6TiNBLVarayVLAb52Pc61lul3/PHY29iYdnd60=
X-Received: by 2002:a92:d7c6:: with SMTP id g6mr8683504ilq.298.1574040275164; 
 Sun, 17 Nov 2019 17:24:35 -0800 (PST)
MIME-Version: 1.0
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <010252f2-7f94-4a8a-90ae-82ff49b622d6@ozlabs.ru>
 <e8cb8ac1-b54e-ce15-e1ea-6131b7386342@linux.ibm.com>
 <7553103.1BsQ81z3e0@townsend>
In-Reply-To: <7553103.1BsQ81z3e0@townsend>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 18 Nov 2019 12:24:24 +1100
Message-ID: <CAOSf1CEzb_Y4NdXGNPYTOxTR5w7OtBUU+VY46CR6Ou5kwEhJqA@mail.gmail.com>
Subject: Re: [PATCH 01/11] powerpc/powernv/ioda: Fix ref count for devices
 with their own PE
To: Alistair Popple <alistair@popple.id.au>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Reza Arbab <arbab@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 Christophe Lombard <clombard@linux.ibm.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alastair D'Silva <alastair@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 18, 2019 at 12:06 PM Alistair Popple <alistair@popple.id.au> wr=
ote:
>
> On Wednesday, 13 November 2019 4:38:21 AM AEDT Frederic Barrat wrote:
> >
> > However, one question is whether this patch breaks nvlink and if nvlink
> > assumes the devices won=E2=80=99t go away because we explicitly take a =
reference
> > forever. In npu_dma.c, there are 2 functions which allow to find the GP=
U
> > associated to a npu device, and vice-versa. Both functions return a
> > pointer to a struct pci_dev, but they don=E2=80=99t take a reference on=
 the
> > device being returned. So that seems dangerous. I=E2=80=99m probably mi=
ssing
> > something.
> >
> > Alexey, Alistair: what, if anything, guarantees, that the npu or gpu
> > devices stay valid. Is it because we simply don=E2=80=99t provide any m=
eans to
> > get rid of them ? Otherwise, don=E2=80=99t we need the callers of
> > pnv_pci_get_gpu_dev() and pnv_pci_get_npu_dev() to worry about referenc=
e
> > counting ? I=E2=80=99ve started looking into it and the changes are sca=
ry, which
> > explains Greg=E2=80=99s related commit 02c5f5394918b.
>
> To be honest the reference counting looks like it has evolved into someth=
ing
> quite suspect and I don't think you're missing anything. In practice thou=
gh we
> likely haven't hit any issues because the original callers didn't store
> references to the pdev which would make the window quite small (although =
the
> pass through work may have changed that). And as you say there simply was=
n't
> any means to get rid of them anyway (EEH, hotplug, etc. has never been
> implemented or supported for GPUs and all sorts of terrible things happen=
 if
> you try).

In other words: leaking a ref is the only safe thing to do.

> The best solution would likely be to review the reference counting and to
> teach callers of get_*_dev() to call pci_put_dev(), etc.

The issue is that the two callers of get_pci_dev() are non-GPL
exported symbols so we don't know what's calling them or what their
expectations are. We be doing whatever makes sense for OpenCAPI and if
that happens to cause a problem for someone else, then they can deal
with it.

Oliver
