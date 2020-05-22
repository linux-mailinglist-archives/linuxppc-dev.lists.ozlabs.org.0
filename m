Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBE21DF103
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 23:23:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TKGs6tlhzDr1d
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 07:23:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.67; helo=mail-io1-f67.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TKFF4DYVzDqd2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 07:22:06 +1000 (AEST)
Received: by mail-io1-f67.google.com with SMTP id 79so12932563iou.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 14:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fXll0AzrUS0bkYtIGXOwEZ5Oxhk9R9vDypCx0QbqWbc=;
 b=Y+yg8qfXbYP3jHHegR1XPlkImYuDdyqIQ/F9av6JCcvP6PwmhaDNnjKtBAArrd93Uk
 s2AnHR9cN6Wdlj2EhoACV19wCPiAtry7DUwa7gwSDpr3VMJ8qWvEInp6u7D1/g4Rmd/H
 Qjeu44uU9icCerkCa1q+STl4QoFAztEoQTpprimgrp8C8ClWfnGx7euSIOgTpuMFYBKP
 JwDiGPBZvc2qrnSI8CskXnn9/k5nzjVAWKChHyr9zUx71xgueLVwwMaz/sQh69NMr7EX
 botrvbMOmWrJsQUwxve6NrzBPlHzGP80cyXzXh2pLNmWVnKYbeCpe/UHulCCKpTdBzYg
 HvrA==
X-Gm-Message-State: AOAM530dJGvaAZusPrNoiV0Llw+gkpX9784lY34PuxnPK/mgBk9TdyFL
 RlUoID4MgYeF9nzfKOF8Lngz421r3eo=
X-Google-Smtp-Source: ABdhPJzNSbK04sqRwzoppCy17uXqdbgv3QVSFKEvuDQqJj168mL90OlLknFkboJUn+UvD63gRhpy0Q==
X-Received: by 2002:a5e:de03:: with SMTP id e3mr3188203iok.0.1590182522939;
 Fri, 22 May 2020 14:22:02 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178])
 by smtp.gmail.com with ESMTPSA id k7sm5016217ilr.41.2020.05.22.14.22.02
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 14:22:02 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id 4so12159893ilg.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 14:22:02 -0700 (PDT)
X-Received: by 2002:a05:6e02:f:: with SMTP id
 h15mr14653120ilr.90.1590182521978; 
 Fri, 22 May 2020 14:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200518221904.GA22274@embeddedor>
 <202005181529.C0CB448FBB@keescook>
 <CADRPPNR-Croux9FgnrQJJmdF2jNnuAmC+2xMJSgSbkbRv9u8Mw@mail.gmail.com>
 <202005202022.588918E61@keescook>
In-Reply-To: <202005202022.588918E61@keescook>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 22 May 2020 16:21:38 -0500
X-Gmail-Original-Message-ID: <CADRPPNTuUUVOHs76JVzELcsyRH_LSi2PGML1t2wob+45LJCXvA@mail.gmail.com>
Message-ID: <CADRPPNTuUUVOHs76JVzELcsyRH_LSi2PGML1t2wob+45LJCXvA@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: Replace one-element array and use
 struct_size() helper
To: Kees Cook <keescook@chromium.org>
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 20, 2020 at 10:24 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, May 20, 2020 at 06:52:21PM -0500, Li Yang wrote:
> > On Mon, May 18, 2020 at 5:57 PM Kees Cook <keescook@chromium.org> wrote:
> > > Hm, looking at this code, I see a few other things that need to be
> > > fixed:
> > >
> > > 1) drivers/tty/serial/ucc_uart.c does not do a be32_to_cpu() conversion
> > >    on the length test (understandably, a little-endian system has never run
> > >    this code since it's ppc specific), but it's still wrong:
> > >
> > >         if (firmware->header.length != fw->size) {
> > >
> > >    compare to the firmware loader:
> > >
> > >         length = be32_to_cpu(hdr->length);
> > >
> > > 2) drivers/soc/fsl/qe/qe.c does not perform bounds checking on the
> > >    per-microcode offsets, so the uploader might send data outside the
> > >    firmware buffer. Perhaps:
> >
> > We do validate the CRC for each microcode, it is unlikely the CRC
> > check can pass if the offset or length is not correct.  But you are
> > probably right that it will be safer to check the boundary and fail
>
> Right, but a malicious firmware file could still match CRC but trick the
> kernel code.
>
> > quicker before we actually start the CRC check.  Will you come up with
> > a formal patch or you want us to deal with it?
>
> It sounds like Gustavo will be sending one, though I don't think either
> of us have the hardware to test it with, so if you could do that part,
> that would be great! :)

That will be great.  I think Zhao Qiang can help with the testing part.

Regards,
Leo
