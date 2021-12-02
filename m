Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA5466C89
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 23:28:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4rGH2KrCz3cSW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 09:28:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.173;
 helo=mail-qk1-f173.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4rFn5vB5z2xC6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 09:28:27 +1100 (AEDT)
Received: by mail-qk1-f173.google.com with SMTP id 132so1505464qkj.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Dec 2021 14:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ADfUBBKKR2V7Th9eag/BQ1lRZNTT71LihshaeivJjKw=;
 b=5U7236JAganCaGkTe9WqX2qE4o8H7ASMqMIwFY5iRcDTQM8fwFdLVnWE0RgJ8EW4J7
 uh1/0kBIrWSXpQNTG5lrBo+l/s5pjq5fS3QhBmtlkB5JMacB/0FJjlkhj2wO8hUvreEq
 xHyjn/ySAyMDyze9J4ScDbdDBF86MGept0tHnEsMr8PIFksRTyQvJBdB/PWz7KDjPIlz
 7iiompVi0gxv/Sy8kOy4usTGPnsU2qrAdKuZ3XCBy4CU8PfB+bjfQudVLfEn9kVSsLDV
 dr4176E2E+ay2ODOL9MP8wcIXf/08NWAALi+DGhcXmF9rG3UDyNLkg+HD5m1tXTBFolD
 VhSQ==
X-Gm-Message-State: AOAM531hd08IEnNROJ1jNNhWIRHEHGvk/bMMayT+V3loQDgIOlbFqQay
 V6/OVVR9gb+znTzWZj6N5QU52U/r9Xo=
X-Google-Smtp-Source: ABdhPJwRQuaTY5XM0VwqmEWth7y1pfe6NSa+/dJayZ8ZwjEoJUWIHvKmoRZIbs1JISQNBxO7cFGTow==
X-Received: by 2002:a37:9f84:: with SMTP id
 i126mr14781628qke.249.1638484104690; 
 Thu, 02 Dec 2021 14:28:24 -0800 (PST)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com.
 [209.85.219.54])
 by smtp.gmail.com with ESMTPSA id d6sm763488qtq.15.2021.12.02.14.28.23
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 14:28:24 -0800 (PST)
Received: by mail-qv1-f54.google.com with SMTP id kl8so991846qvb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Dec 2021 14:28:23 -0800 (PST)
X-Received: by 2002:a05:6214:1d26:: with SMTP id
 f6mr16312132qvd.19.1638484103593; 
 Thu, 02 Dec 2021 14:28:23 -0800 (PST)
MIME-Version: 1.0
References: <20211110105952.62013-1-andriy.shevchenko@linux.intel.com>
 <20211110105952.62013-3-andriy.shevchenko@linux.intel.com>
 <YZJExzxJ4j8g6jEY@smile.fi.intel.com>
 <AS8PR04MB8946B4800AE34258F7F2BA688F989@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <YZN7+UlXtJi8/i1L@smile.fi.intel.com> <YZ0WlMyS36Gj565C@smile.fi.intel.com>
 <CADRPPNT3yhr3jAPZm=hcON3nd97eLSrkWqFBV6kh6W5gf0w3Xg@mail.gmail.com>
 <YaiS2iHCrGkXgTdX@smile.fi.intel.com>
 <AS8PR04MB894640E4FF4EB7D01604049E8F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <Yak6Co4lO761HmWG@smile.fi.intel.com>
In-Reply-To: <Yak6Co4lO761HmWG@smile.fi.intel.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Thu, 2 Dec 2021 16:28:11 -0600
X-Gmail-Original-Message-ID: <CADRPPNS98G2iBiK0_nE7d6Dq-6FkSDme8a+1is5_GZ-iWJrhvg@mail.gmail.com>
Message-ID: <CADRPPNS98G2iBiK0_nE7d6Dq-6FkSDme8a+1is5_GZ-iWJrhvg@mail.gmail.com>
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

On Thu, Dec 2, 2021 at 3:30 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 02, 2021 at 08:01:54PM +0000, Leo Li wrote:
> > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Sent: Thursday, December 2, 2021 3:33 AM
> > > On Wed, Dec 01, 2021 at 01:41:16PM -0600, Li Yang wrote:
> > > > On Tue, Nov 23, 2021 at 10:32 AM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > > The build test is good.  I have applied it for next.  Thanks.
> > >
> > > Thanks, what about MAINTAINERS updates? I don't see them neither in next
> > > nor in your tree.
> >
> > I am ok with these MAINTAINERS updates.  I thought you want to send them directly to Linus.  I can take them if you like.
>
> I was just pointing out that it would be good that you (as a maintainer of SOC
> FSL) have them applied and pushed for the current cycle, but they are not code
> fixes anyway, so it's not critical.
>
> TL;DR: Yes, please take them, thanks!

Got it.  Both applied for next.  Thanks.

Regards,
Leo
