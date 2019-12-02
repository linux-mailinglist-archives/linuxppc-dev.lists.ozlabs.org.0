Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DDB10F309
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 23:58:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RgX93VRPzDqJj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 09:58:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RgTz5TDgzDqD0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 09:56:54 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id d62so1344186oia.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 14:56:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5dllmzilFshZS41Rqd+tPknCh99mINDcFfUz5Z0ooFc=;
 b=F44umgqC1PiDyCetxdJV8UK9HViOpJuGVdm/PRYg9HQS3CTSnylQwdFJUhYKblEoYG
 0ag6X4vB9y1r7HTrrfFHpFcHMu/5vpTIFAVVHqOfdlDvD3A315y3snqspso3Za7M/jv8
 XrGUeenYaF9mxdYgc0U2Aeb7pHk3n4W3gf//nM3b3gYWrrFR/Z9d/HMkPybX+Zo3f6wW
 yswGwFGA0np0tWObl0bEw1Vaz4TLHPldlidKGDghc+sTp32H6YCPpH5OE3pXmrLoCEiz
 lNStGhPPHJvi7/gLEazwF+BylYpVJN4nYLqO7tspf08IrCPPBes1jxJi8YmLZs8jUHUp
 CmJQ==
X-Gm-Message-State: APjAAAVtKe+73H4RgWF7UA8w0NvUJC9BS3LfNl3Ck4dHES5K9rfe5xun
 5kk3tybiG4FhX9jS2ayrLmJodMTp
X-Google-Smtp-Source: APXvYqwnTLna9/njfp4Mt0mB9c1VgwGkQpN0DOKj1sU0pqK+kt6ojIvDnwAjQy6zFyfbSQYWD+djUg==
X-Received: by 2002:aca:1e02:: with SMTP id m2mr1236572oic.81.1575327411555;
 Mon, 02 Dec 2019 14:56:51 -0800 (PST)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
 [209.85.210.47])
 by smtp.gmail.com with ESMTPSA id q22sm366631otm.2.2019.12.02.14.56.50
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 14:56:51 -0800 (PST)
Received: by mail-ot1-f47.google.com with SMTP id 77so1130229oty.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 14:56:50 -0800 (PST)
X-Received: by 2002:a9d:6745:: with SMTP id w5mr1041681otm.221.1575327410613; 
 Mon, 02 Dec 2019 14:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
 <7beef282-1dd8-7c7a-4f6d-d0605d11eab5@kernel.org>
 <fb810251-f444-bd5d-54e3-774d2e1ccdb9@rasmusvillemoes.dk>
In-Reply-To: <fb810251-f444-bd5d-54e3-774d2e1ccdb9@rasmusvillemoes.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Mon, 2 Dec 2019 16:56:39 -0600
X-Gmail-Original-Message-ID: <CADRPPNSXS95DCpbnEG14tN7H4uxo7kFb8-azMU+MfPStyRcdpQ@mail.gmail.com>
Message-ID: <CADRPPNSXS95DCpbnEG14tN7H4uxo7kFb8-azMU+MfPStyRcdpQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/49] QUICC Engine support on ARM, ARM64, PPC64
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 David Miller <davem@davemloft.net>
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
Cc: Timur Tabi <timur@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 2, 2019 at 2:14 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> On 01/12/2019 17.10, Timur Tabi wrote:
> > On 11/28/19 8:55 AM, Rasmus Villemoes wrote:
> >> There have been several attempts in the past few years to allow
> >> building the QUICC engine drivers for platforms other than PPC32. This
> >> is yet another attempt.
> >>
> >> v5 can be found
> >> here:https://lore.kernel.org/lkml/20191118112324.22725-1-linux@rasmusvillemoes.dk/
> >>
> >
> > If it helps:
> >
> > Entire series:
> > Acked-by: Timur Tabi <timur@kernel.org>
>
> Thanks. I'll leave it to Li Yang whether to apply that - they already
> all (except for the last-minute build fix) have your R-b.
>
> Li Yang, any chance you could pick up these patches so they have plenty
> of time in -next until 5.6?

Sure.  I will.  I'm waiting for the Ack from David on the networking side.

Regards,
Leo
