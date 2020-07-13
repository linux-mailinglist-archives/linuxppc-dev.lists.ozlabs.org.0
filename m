Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E716521D41D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 12:57:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B50wk3ShkzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 20:57:42 +1000 (AEST)
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
 header.s=20161025 header.b=XGjH/J3Y; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B50tC4Wr4zDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 20:55:31 +1000 (AEST)
Received: by mail-il1-x141.google.com with SMTP id o3so10718234ilo.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 03:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/nQI/nHNNWtxQ746r21uQY0IB9tAtjZIYWcUcpb8iaY=;
 b=XGjH/J3Y2Aee09Isxyvjln/9KAk4VinrIMOlwBnXqXkpWLb6k6n70Nm0CA1Lg/NIzq
 d8P9ujasJFNf1nzzbPoE/ATtPliUsasqu5o1jsjsM5lDJllJOeGfJMnODJq0ARaSV9/c
 9F8A4B+CUcH0IPpfR479Bn/iYP0axwmoq1N9k2hacBCnQRYQUSZXAMobJR9JKf1zDWAF
 bcNYCVVtO0RkUZw64J1pqSEquYoHnZrZmv/VuTyo58gBSOyoiDTc9KkCJhFb4OMX7Og/
 ocMvhT5NrD6jGr1ESgnEo04sPPOpllanxoAnSJ0trp06jktI+huTBpzBaVGun//RFLgt
 Phmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/nQI/nHNNWtxQ746r21uQY0IB9tAtjZIYWcUcpb8iaY=;
 b=NU6dl9wyzJm57lkHCIp+9477nNRfCURf5X4Gar1LcA6+3H38KRaGsrjZXurQuTXt3F
 FyscpBpDx1pf9QZgznRQHMK2jsWOGEb9pSB127EW8ABD4xtxinmEFWBVG3wo9kIr+2pZ
 nVkejP6fLI+IgYyjKJv3ywwhjBX2M5QBwMaZh4rM6T+hwG5MOZEQEHlmJOUE9iddJtlj
 hazeMmTWt2u/VH4FuOcA0cwUZKxoj75oGZCUi9clpUk2huHSYRTphjJGmAKIB9omI5M4
 jwy8QXwc12bowLZWVi+Eh1hE7kbe7QkzY3rzGwSNHFR9IZ4eWTwZga5kr5z3xtGEQIIw
 MfKQ==
X-Gm-Message-State: AOAM532ImDNszVo2RSpDpLAHPYpUbIuI9A56SqxJsLJZdyx9vL7BbwOx
 PE9nCTCpHqPJW7b7ZDOwcoW8XDmREhHHFez7nfU=
X-Google-Smtp-Source: ABdhPJwVM/WK+xpzgnRKy46wD9pVo41iHbml6J/Ownnli9jiQZozGPb6BJoDKp+IVIdDmzyx1KHwOKmN9mG5friWuM4=
X-Received: by 2002:a92:4913:: with SMTP id w19mr60500040ila.185.1594637727358; 
 Mon, 13 Jul 2020 03:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200706013619.459420-1-oohall@gmail.com>
 <20200706013619.459420-7-oohall@gmail.com>
 <c808c6d8-b5ed-3256-5396-4300be9fa308@ozlabs.ru>
In-Reply-To: <c808c6d8-b5ed-3256-5396-4300be9fa308@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 13 Jul 2020 20:55:15 +1000
Message-ID: <CAOSf1CFsC8PeLW3Deh=vf8pJQbo7Gg7oDTSOk0T0Da1TBptwGg@mail.gmail.com>
Subject: Re: [PATCH 06/14] powerpc/eeh: Remove VF config space restoration
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
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 13, 2020 at 8:32 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> >  #ifdef CONFIG_PCI_IOV
> >  int pseries_send_allow_unfreeze(struct pci_dn *pdn,
> >                               u16 *vf_pe_array, int cur_vfs)
> > @@ -848,7 +824,7 @@ static struct eeh_ops pseries_eeh_ops = {
> >       .read_config            = pseries_eeh_read_config,
> >       .write_config           = pseries_eeh_write_config,
> >       .next_error             = NULL,
> > -     .restore_config         = pseries_eeh_restore_config,
> > +     .restore_config         = NULL, /* NB: configure_bridge() does this */
>
>
> configure_bridge() calls rtas_call(ibm_configure_pe, 3, 1, NULL...)
> which reconfigures the PE and which is quite different from what
> pseries_eeh_restore_config() used to do although the comment suggests it
> is about the same thing. I am pretty sure the new code produces a better
> result so I suggest ditching this comment and adding a note to the
> commit log may be. Thanks,

I put the comment there largely because the EEH core seems to think
that restore_config() is what should be called to reset the device's
config space to the defaults set be firmware. On PowerNV it does
actually do that and configure_bridge is this:

static int pnv_eeh_configure_bridge(struct eeh_pe *pe)
{
        return 0;
}

So... there's definitely something strange going on there. I don't
remember the exact details, but I think the generic EEH code calls
into RTAS to collect debug data and apparently that requires the
device to be accessible via MMIO (i.e BARs need to be restored) which
is why the pseries .configure_bridge() calls configure_pe. It might
work out better, but having something called "restore_config" that
doesn't actually restore the config is uh... modern. It's something
that probably needs a rework at some point. Anyway, I think the
comment is more helpful than it is misleading. Especially if you
consider the PowerNV behaviour.

> >  #ifdef CONFIG_PCI_IOV
> >       .notify_resume          = pseries_notify_resume
> >  #endif
> >
>
> --
> Alexey
