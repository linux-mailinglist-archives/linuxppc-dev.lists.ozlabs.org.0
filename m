Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6EB1DF22F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 00:43:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TM3W6bwqzDqZP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 08:43:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.66; helo=mail-io1-f66.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TM073M8mzDr0f
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 08:40:53 +1000 (AEST)
Received: by mail-io1-f66.google.com with SMTP id f4so13121463iov.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 15:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L9O1ztl73QCyaz4czM7KN6rZzxlSQiG/LQQETJdvECE=;
 b=OpBTadNtNZJ1O5p585Gga2X+0iivHaK+N7HBDK1dWFxWgweZwsFx9vgzxq1/Y6QWsf
 QxFFn74YxjD6htitZC5DSiEYyHV5/qyxOtRGkTkf6t3fszSwj4Pz3gPb7zpcwI7pmFNT
 evZYhn0KR7HplBFv1IwLAoTg1UgUeHUPufP3Paju3nkhdzSRr37Lovw9MnleIgWQbYO8
 I95x8vpoIIP2kRK/aXqSX31AkrGBvEroZtVtfG2nySLQld8lkzCYsIV03iwci/Wn4biX
 pGZZtQTqkwpl5L4nS2lX7k4Bt9sTe3Q/Ue/zMZ8leAiJQvmEFLuKM7E+jCiovgzmDB0V
 2stA==
X-Gm-Message-State: AOAM532VLJEVVDzMGmIss9ODniTNuwOegqKJWrSzGH5P/9lO6Dn1n1Rf
 HhUtLpC58h1BM0O4r7baYIx6PCaO5c8=
X-Google-Smtp-Source: ABdhPJwhLZ/xCsORoPWXDqyUNZ3ySCXUMxfU7bi/xGVFXZAQ7blyM9rci/RwM0w21JBLH4IQaWhffw==
X-Received: by 2002:a6b:6b04:: with SMTP id g4mr4974402ioc.75.1590187249033;
 Fri, 22 May 2020 15:40:49 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52])
 by smtp.gmail.com with ESMTPSA id h5sm5117302ile.35.2020.05.22.15.40.48
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 15:40:48 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id j8so13117098iog.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 15:40:48 -0700 (PDT)
X-Received: by 2002:a02:5e81:: with SMTP id h123mr9862796jab.99.1590187248159; 
 Fri, 22 May 2020 15:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
 <be8cd229-884a-40e6-3363-7c4680a51b30@web.de>
 <0b718268-d330-dfc1-aca3-3dd3203363d7@cmss.chinamobile.com>
 <20200414083036.GC14722@kadam>
 <f712918c-2f61-0ba5-2ba8-b5ca3cce9a35@cmss.chinamobile.com>
In-Reply-To: <f712918c-2f61-0ba5-2ba8-b5ca3cce9a35@cmss.chinamobile.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 22 May 2020 17:40:24 -0500
X-Gmail-Original-Message-ID: <CADRPPNRJe6aE3MXjK0z6uYtey3smU8cbFcGBqqv0ELJ9SxApvQ@mail.gmail.com>
Message-ID: <CADRPPNRJe6aE3MXjK0z6uYtey3smU8cbFcGBqqv0ELJ9SxApvQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
To: Tang Bin <tangbin@cmss.chinamobile.com>
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 4:13 AM Tang Bin <tangbin@cmss.chinamobile.com> wrote:
>
> Hi
>
> On 2020/4/14 16:30, Dan Carpenter wrote:
> > On Fri, Apr 10, 2020 at 04:05:06PM +0800, Tang Bin wrote:
> >>>
> >>>> Thus it must be fixed.
> >>> Wording alternative:
> >>>     Thus adjust the error detection and corresponding exception handling.
> >> Got it.
> > Wow...
> >
> > No, don't listen to Markus when it comes to writing commit messages.
> > You couldn't find worse advice anywhere.  :P
>
> I'm actively waiting for a reply from the maintainer. Thank you very much.

Sorry for the late response.

Acked-by: Li Yang <leoyang.li@nxp.com>

Regards,
Leo
