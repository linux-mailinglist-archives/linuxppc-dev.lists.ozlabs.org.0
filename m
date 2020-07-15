Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C82D7220419
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 06:48:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B64dV58KGzDqjN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 14:48:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PcN/ifzF; dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B64bt3yyGzDqfv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 14:46:50 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id l1so898368ioh.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 21:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k2AniyWHgOOKiRIFTEw3xrhdsT0uCBNtjXYW02vNp2A=;
 b=PcN/ifzFJEU72bPg56QeRSYFNu845DFQnYpO2sHLQbdiHPsCHD8zOLEC1YoHKCm9rC
 8sxKN+mGlnhO1qdc80ylpyByW6BvOql0tTROfL/4XGqsMtXtcuo3QR24MN7Piq8+Yix1
 nBd0x4gaj2GbmOXyqqMHBKUIzkSQKf6cWDHuYnBGmCqOo51oh8QjgkSJYPVA+IkBKXOc
 Mv3XABgicuqmypgXC+wBM/FQ2t9LTfrs3gv7w2sZSB/k/t/fZpZmbpN1usm5kldrrS5W
 qDTLDufyHHymh6INRjUSPyZWkVhbKu9W9pijnHiLBSu3oBlnVsV1NTzNwcaciERYsP8s
 n6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k2AniyWHgOOKiRIFTEw3xrhdsT0uCBNtjXYW02vNp2A=;
 b=nP4yBjKmCgnxL31VC6Lq9yaDcHDovnAqKaKgvtPV6hNRvj87h58CsgEq3m0vP2qc5o
 XJJJWDNsufas4m7LVBIU92c10QwkUXm1ubOz18lScq1XGK4+yRSCe/IwF4sg413AFhuS
 jpNFM5vwL2tJf7CHl2kwwkG25Ua3FSi+45tbmq6nZvWoUNxy6stjVxMpYtzHyW1U5Jnp
 U9FD59AotAS/Fo9pY/K97MT0xZ2WVucBrydUBPvZK4yWtYqE4vPX9Ytr9XHf8t9gamAa
 rPvGwztK+TtsEYislLiFjFYtyiEo2OEVDZbwcMq054nqAbOTGPYIS6EAJFDfSPrmWJ0v
 R/tw==
X-Gm-Message-State: AOAM530trGHS6bGjRisfhOgDIW0qUmVcQHgt0d7s561FbjsPpcOCwuI/
 Ov//FLoDlyaWX6wlL4sf91sZLww4HoGB4KYlefw=
X-Google-Smtp-Source: ABdhPJytXrFkbInRbcFiRtg73ueFeyOxHqU3yJceYP4vVn5mj/Pvq6d/KrE9fTR+AjQ9a2VsA03V4Q2xqWh6sFM7yNA=
X-Received: by 2002:a05:6602:2c83:: with SMTP id
 i3mr8274717iow.144.1594788407216; 
 Tue, 14 Jul 2020 21:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-13-oohall@gmail.com>
 <ece39d29-6ab0-dcf4-0561-3c488c7921f9@ozlabs.ru>
 <CAOSf1CGbDWFzuh5pD3CYayTXOFsw18E0kFn052xtxrdes_2_zw@mail.gmail.com>
 <f97edf44-0029-5a33-0cff-7067a81f10ba@ozlabs.ru>
In-Reply-To: <f97edf44-0029-5a33-0cff-7067a81f10ba@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 15 Jul 2020 14:46:36 +1000
Message-ID: <CAOSf1CGdGQ0cFNmfL=gVNcqX+JhT_W=73UWYd6aVourvtEs4ow@mail.gmail.com>
Subject: Re: [PATCH 12/15] powerpc/powernv/sriov: De-indent setup and teardown
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 2:41 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 15/07/2020 14:21, Oliver O'Halloran wrote:
> > On Wed, Jul 15, 2020 at 2:00 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> >>
> >>
> >> or we could just skip setting
> >>
> >> ppc_md.pcibios_sriov_enable = pnv_pcibios_sriov_enable;
> >>
> >> for uninteresting platforms in pnv_pci_init_ioda_phb().
> >
> > I don't think so. ppc_md is per-platform, not per-PHB andw e still
> > have to deal with a mixture of IODA/NVLink/OpenCAPI PHBs on a single
> > system.
>
> NVLink/OpenCAPI won't have SRIOV devices.

...OR WILL THEY?

> Other types won't appear on
> the same platform simultaneously. It is not too clean, yes.

Sure, my point is that's a per-PHB setting rather than a per-platform
one so we should set it up like that.

> > We could make it a callback in pnv_phb, but  it seemed like
> > more indirection than it's worth.
>
> I genuinely dislike how we use ppc_md so removing things from it is
> definitely a good thing.

you wouldn't be able to get rid of it. We'd have something like what
we have for the existing pcibios calls where there's a "generic" one
that bounces it to a member of pci_controller_ops, which then bounces
it to the pnv_phb method. It's bad and I hate it.

>
>
> --
> Alexey
