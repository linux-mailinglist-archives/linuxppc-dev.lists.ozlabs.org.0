Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C972201EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 03:40:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B60Sr1rrnzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 11:40:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gmqOVfBN; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B60R46Ss1zDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 11:38:56 +1000 (AEST)
Received: by mail-il1-x141.google.com with SMTP id o3so509311ilo.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 18:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S3UiAgjVYnkhGr4zBNyOfW+SPlxg7CLFetdCam4UR8w=;
 b=gmqOVfBNpcJdB380ahp1DbkMoY/8mXKPhaD03T860bOQPQvhAQssJJ8U81HB6JlPXN
 RUJxmwFW9xM4Uamtt6Uu+5mzu9DniIiQ7KPW0csUekpSxQNKotRcRZqrWuxhv+yxYj1m
 mThaiX5899rFYjvPPx7jPtCaNdFqVKH4DfAY/n3LsJCSGlnUoGms5gXvLk3chiR0qwmS
 m5Z/DsZ8DDU8ZvTPUUNgnfyv9j4tbf5SxDO/mtLnNs5k6ZY54oTlA6zQ9gk+45MjqQUq
 X0u1pCvj4IyyIvrl4S9i0kRZga4hTp/p7ZRmhUZy8xdgXDTRT3V5UGYBsyTEZyLuTy5a
 o4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S3UiAgjVYnkhGr4zBNyOfW+SPlxg7CLFetdCam4UR8w=;
 b=mnJ9ebCK+TKTyFVe9BSEzUu27O8SC2SvGja+yBUGdE0l3B6HkidyLvigsd59FmafSu
 rEWdxuxcb9UkTnmz8EYggsgkMIKUbgWPB1qE5oKbc0wzDX7PPjahn4EYDrIMCBuxvIzA
 DhmVVFmpWvuIUvFdxPGpQhfvR3VvI88w412/4FIx4zKC4/B8BXCz7PM+jwCE+D6wGH3W
 68E8r1Sug3HqwNjDB6gljmBJG3beWMhWm95QuYh73KKol45vxECmEeMeJdoZi+13ON5f
 WfrefuojUhXVbHPqAkIaRNJsqm4M8tYb6PZzNNmWfVC0sn2pD0ClCidcpMfqM8Gf5xaG
 dDTA==
X-Gm-Message-State: AOAM531jeGgXpyg/AeYCoAwf5499Dxty9rvZjkEu3OfR2JliTFcWeFxG
 NmMgvPFkeLQzZfevqSElxsM9GRcNMw72ed56F3k=
X-Google-Smtp-Source: ABdhPJwQDI669FhPRulr0OrW0UfXpgqh/h/Ov2d1W/ssFQiYCCuBkJWwy2FXuCS4zmLqKfVGWqmtHzMG4QOEUbFffTw=
X-Received: by 2002:a92:cf51:: with SMTP id c17mr7069052ilr.122.1594777133313; 
 Tue, 14 Jul 2020 18:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-4-oohall@gmail.com>
 <ee5a00db-badd-12fe-1c46-eaba5afc8dea@ozlabs.ru>
 <CAOSf1CESRPypebf6+rnkZkNmi6+xL4+QP1xgAS1szGsZDBcs8A@mail.gmail.com>
 <34f7eea2-4ace-9931-7b5f-98ec159f3532@ozlabs.ru>
In-Reply-To: <34f7eea2-4ace-9931-7b5f-98ec159f3532@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 15 Jul 2020 11:38:41 +1000
Message-ID: <CAOSf1CGhc1i64_DS18evMhwoXvMWyafOk3r2czUz49F6gERtfw@mail.gmail.com>
Subject: Re: [PATCH 03/15] powerpc/powernv/pci: Add explicit tracking of the
 DMA setup state
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 5:21 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> On 14/07/2020 15:58, Oliver O'Halloran wrote:
> > On Tue, Jul 14, 2020 at 3:37 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> >>
> >> On 10/07/2020 15:23, Oliver O'Halloran wrote:
> >>> This also means the only remaining user of the old "DMA Weight" code is
> >>> the IODA1 DMA setup code that it was originally added for, which is good.
> >>
> >>
> >> Is ditching IODA1 in the plan? :)
> >
> > That or separating out the pci_controller_ops for IODA1 and IODA2 so
> > we can stop any IODA2 specific changes from breaking it.
>
> Is IODA1 tested at all these days? Or, is anyone running upstream
> kernels anywhere and keeps shouting when it does not work on IODA1? Thanks,

Cedric has a P7 with OPAL. That's probably the one left though.
