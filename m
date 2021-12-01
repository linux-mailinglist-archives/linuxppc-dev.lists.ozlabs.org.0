Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48E4656AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 20:42:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J48cB1Qxzz3cSM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 06:42:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.49; helo=mail-qv1-f49.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J48bg6zfrz305j
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 06:41:33 +1100 (AEDT)
Received: by mail-qv1-f49.google.com with SMTP id j9so22746217qvm.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 11:41:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bjDuMIeNukQm5l61QJg6nNUANP6Dica4CrK7FOgg6ks=;
 b=ZpSueGKYxp5cZLTRJhwAgnj5bXz2AdvU94HCePUb7m0L/cxbz2BUevN5xub0TyPrGm
 54sB2nhbtdbjX6OnBRlpqYsjQrhzJI1BrrOSbuJU+T62lpxC8r5oXaPZ3oBdhLYCQMzx
 eAZS7/W3YUF1T/mnKUzu4CsraH2nWZEt5FG7CRo72nKpNGgJO4hCEAOb1sJRj5slbnds
 1yLMy2s6ck5iFqEnKpykcB6OQ7oHZT5RulE0ywteXE35bHw92ZfQOdQHnc0AI2Ztm93n
 pksOGq4H9E40UZ7SYFwesvIWgBdAu5iEb5jvLNYqcsTstUg1yBWfrFyy9TyrXqAvCWN3
 XAKA==
X-Gm-Message-State: AOAM5323uzuOR0CixWYVQ9QXQqcjebTVex+v/V2BbgyE1GjuZBYel8yg
 8XTn/+OqkNbThp6fj7JD3eQGQ0A9wdE=
X-Google-Smtp-Source: ABdhPJyJRqexARs7xtsBoARVpX1TVMfu0v+e/IyFdWT+GERIfafsvQp7vLNwN/6k3MuyqYrbjB6N6g==
X-Received: by 2002:a05:6214:2c5:: with SMTP id
 g5mr8593539qvu.109.1638387690369; 
 Wed, 01 Dec 2021 11:41:30 -0800 (PST)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com.
 [209.85.222.176])
 by smtp.gmail.com with ESMTPSA id s4sm386586qko.47.2021.12.01.11.41.29
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 11:41:30 -0800 (PST)
Received: by mail-qk1-f176.google.com with SMTP id m192so32285025qke.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 11:41:29 -0800 (PST)
X-Received: by 2002:a05:620a:298e:: with SMTP id
 r14mr8391905qkp.509.1638387689177; 
 Wed, 01 Dec 2021 11:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20211110105952.62013-1-andriy.shevchenko@linux.intel.com>
 <20211110105952.62013-3-andriy.shevchenko@linux.intel.com>
 <YZJExzxJ4j8g6jEY@smile.fi.intel.com>
 <AS8PR04MB8946B4800AE34258F7F2BA688F989@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <YZN7+UlXtJi8/i1L@smile.fi.intel.com> <YZ0WlMyS36Gj565C@smile.fi.intel.com>
In-Reply-To: <YZ0WlMyS36Gj565C@smile.fi.intel.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 1 Dec 2021 13:41:16 -0600
X-Gmail-Original-Message-ID: <CADRPPNT3yhr3jAPZm=hcON3nd97eLSrkWqFBV6kh6W5gf0w3Xg@mail.gmail.com>
Message-ID: <CADRPPNT3yhr3jAPZm=hcON3nd97eLSrkWqFBV6kh6W5gf0w3Xg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] soc: fsl: Replace kernel.h with the necessary
 inclusions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 23, 2021 at 10:32 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 16, 2021 at 11:38:01AM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 15, 2021 at 10:24:36PM +0000, Leo Li wrote:
> > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Sent: Monday, November 15, 2021 5:30 AM
> > > > On Wed, Nov 10, 2021 at 12:59:52PM +0200, Andy Shevchenko wrote:
> >
> > ...
> >
> > > > > v2: updated Cc list based on previous changes to MAINTAINERS
> > > >
> > > > Any comments on this, please?
> > > >
> > > > I really want to decrease amount of kernel.h usage in the common headers.
> > > > So others won't copy'n'paste bad example.
> > >
> > > There seems to be no problem with the patch although I didn't get time to really compile with it applied.
> > >
> > > Will pick them up later after build test.
> >
> > Thank you!
> >
> > Note, it has two fixes against MAINTAINERS which may be sent, I believe,
> > sooner than later to Linus.
>
> Any new so far?

The build test is good.  I have applied it for next.  Thanks.

Regards,
Leo
