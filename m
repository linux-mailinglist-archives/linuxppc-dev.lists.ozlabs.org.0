Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CB341C17
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 08:18:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NxWM2qMkzDqyB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 16:18:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::144; helo=mail-it1-x144.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QpKKbnUb"; 
 dkim-atps=neutral
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NxTV04NMzDqwM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 16:16:27 +1000 (AEST)
Received: by mail-it1-x144.google.com with SMTP id n189so8793409itd.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 23:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aGy9IFO57oTCj0G1QGf9ijD6BvdMCfXrg0IuYC8FsMg=;
 b=QpKKbnUb+wu2a3I1GKvDXb/QcUvJkUmidYSvLhDgtEWHIm83+gsqUwZQ7m2uA2q0vF
 bwD0J2kbwtCT4Rg2xYidFS/14O6lY8DzYI+YsmyWyIYQ6Tserpr5UySdeFYXp0tC6Wdb
 RM0x68NGQoKahitjxp/plkh0QfKLQfLh19R71N2Aw639AkS2pM5sqUgBQrxEeuWBoeFv
 ACITR3mtZzKONAbrvM/cb3lhbGMqH5U6gyQc8phFdWz6WEkWNL15VJJ0bsAy+wwYL3cH
 kry1QNH6B23K7/3pYwjkfvVtCKhEssxOR/OpLXraZ3vwMhHdpgiS8LybCQoa46OY63VO
 +5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aGy9IFO57oTCj0G1QGf9ijD6BvdMCfXrg0IuYC8FsMg=;
 b=cw7T/x1AZb3q/vZWlEd1mshkPHVN6cnwGcnefA26NnhQdb0+LCBdGvEjNkmwEMDgJI
 iyXQ5As3vSu/dJptaFeuk1XVr99eHIfhwf1FVsj+SHCT0vSdEAbIR+nZeUiVtfG9Ch0B
 w63JbprFo47imSf3A3ifmPzH+h7D/tAKh24JwAfIozregr6CfQafblvjegN7DYY9ZAD3
 N7bW7RhEIrXDQd/4rUddVWfUDMiKAV0bAFIvp8vGZfKhagzvHmmutwtQjp5eUO6SdJ8z
 xRTt5FE66w5w5Mj0ZNlapyeLPP3jeIS2IM6Rs7k/yzRVDAn2TPHgcawVGaIIcba7AU0I
 gItQ==
X-Gm-Message-State: APjAAAXzafp2z65oMOWGP1giA+hKV4S1hnOTQXSX5wEAkFiJuHYkFpKn
 KzntQXQcZsOLql6oBc5/80QX0qOTFizfiXIiTq8=
X-Google-Smtp-Source: APXvYqyrfvIZE8yeqcCAGQV5d5bhMbk92ySPIqKYOj12Elmj94tZL0eA5XTrEzlj0ClpX2yXV2ejn1WHX0WL+o+yQ6Y=
X-Received: by 2002:a02:5a02:: with SMTP id v2mr48755671jaa.124.1560320184450; 
 Tue, 11 Jun 2019 23:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190530070355.121802-1-aik@ozlabs.ru>
 <deb34b5f-9472-2156-e58d-8dbcb0a38979@anastas.io>
 <1e3de274-aec4-6e69-5e37-be15ea888deb@anastas.io>
In-Reply-To: <1e3de274-aec4-6e69-5e37-be15ea888deb@anastas.io>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 12 Jun 2019 16:16:12 +1000
Message-ID: <CAOSf1CEoEgWwD2qmBHiCG0B4JjmS0g=SUqm+OEYsbvv11QSARw@mail.gmail.com>
Subject: Re: [PATCH kernel v3 0/3] powerpc/ioda2: Yet another attempt to allow
 DMA masks between 32 and 59
To: Shawn Anastasio <shawn@anastas.io>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>,
 David Gibson <david@gibson.dropbear.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Sam Bobroff <sbobroff@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2019 at 3:06 PM Shawn Anastasio <shawn@anastas.io> wrote:
>
> On 6/5/19 11:11 PM, Shawn Anastasio wrote:
> > On 5/30/19 2:03 AM, Alexey Kardashevskiy wrote:
> >> This is an attempt to allow DMA masks between 32..59 which are not large
> >> enough to use either a PHB3 bypass mode or a sketchy bypass. Depending
> >> on the max order, up to 40 is usually available.
> >>
> >>
> >> This is based on v5.2-rc2.
> >>
> >> Please comment. Thanks.
> >
> > I have tested this patch set with an AMD GPU that's limited to <64bit
> > DMA (I believe it's 40 or 42 bit). It successfully allows the card to
> > operate without falling back to 32-bit DMA mode as it does without
> > the patches.
> >
> > Relevant kernel log message:
> > ```
> > [    0.311211] pci 0033:01     : [PE# 00] Enabling 64-bit DMA bypass
> > ```
> >
> > Tested-by: Shawn Anastasio <shawn@anastas.io>
>
> After a few days of further testing, I've started to run into stability
> issues with the patch applied and used with an AMD GPU. Specifically,
> the system sometimes spontaneously crashes. Not just EEH errors either,
> the whole system shuts down in what looks like a checkstop.

Any specific workload? Checkstops are harder to debug without a system
in the failed state so we'd need to replicate that locally to get a
decent idea what's up.

> Perhaps some subtle corruption is occurring?
