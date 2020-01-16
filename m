Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5415113DF29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 16:49:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z7ss05Z4zDqbt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 02:49:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::e44;
 helo=mail-vs1-xe44.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=k2BorqGR; dkim-atps=neutral
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z7qW44vFzDqYB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 02:47:14 +1100 (AEDT)
Received: by mail-vs1-xe44.google.com with SMTP id u14so12955837vsu.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e8GCNZcg16saTrMZk9XDpdMaVZPA9De2RuDrXztHKIQ=;
 b=k2BorqGRv1qecoewrZRof15MBjeX/nLBmpC89UNAKjqBpUv+vsGetaEEc4jezRDpdc
 tlj4QgYXN3P22IEUxfsuDvBx37inTng/nxtGxBE0uDgAkYoys5WL44o6fJBqJZKzADl/
 wRsNZ7d3SnQ+tO4x9wkExC9KeBWArdwGKnMYfESx1zC0Sc1O6zgxDycMQ72JyMIGlqPc
 7tbyenglNkIrRS7BtwiS2TxSU0yE+SG+E1GdWaQol11w/7wje3jRk8+fbtn3OnpY54Ie
 IbXpyQGy3tsPShbYWkAtOaOEHLh1RdWdaDJ1WEzaNuE1xOK7wydpA2OwNRJEGqTP5Ca9
 ewng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e8GCNZcg16saTrMZk9XDpdMaVZPA9De2RuDrXztHKIQ=;
 b=hvCJZXU/vKTg+oMarDWy5BWlmjh+ofCxNuN2FTcrVlufgIodwI0Kn6/9GhJCPLqcxB
 wp2cvYeC7UNy3tP9XA38zz03JjHBPpnDAaPm1hE+69yxDQ9oCekbiCPPiMo90ciD6qwd
 ash8gespA8sbOuI3JqPEM8uTv3y79EIXdWzflWveRTLGhwc3h0nyZf/OhCQuby9uUy9X
 V3ETDGyUWyWoT8FlOpe3DypvydrFQKK32kTVPXTzVKFJBBaK3h3QTnXAdMRu6NUUHVfc
 yL9IdqAmPQf/6ZNmYRI3qFtV7pxUoOZxsWdZKkIQuYW/eizMQF7TPAmV2uFWAZRXjEMB
 o0Hg==
X-Gm-Message-State: APjAAAXkHa4Eo8uTWK1FLLsuG5dBEcg326TmgroaEiyZUeofMMwTZ88q
 cQKQSimw0uS8FGrDlwH+er2KBOPtYmkKlM+g5WdKSg==
X-Google-Smtp-Source: APXvYqyuDnkVyDWBsgR/JhVT3EpQFHRk0GcoPe4/kJeb0QWiOtiYIF2f+u6CXLSRJ5THanvBhvUpWQ7nIc+twQygCcY=
X-Received: by 2002:a67:e9da:: with SMTP id q26mr1979547vso.34.1579189628280; 
 Thu, 16 Jan 2020 07:47:08 -0800 (PST)
MIME-Version: 1.0
References: <20200108093903.57620-1-hdegoede@redhat.com>
 <20200108093903.57620-2-hdegoede@redhat.com>
 <61bc9265-ece0-eeb6-d4a1-4631138ecf29@intel.com>
 <8d67882d-04a8-0607-be4e-c1430b7fda21@redhat.com>
 <84a32714-ba08-74a0-0c76-3c36db44dd68@intel.com>
 <93446e09-5f12-800a-62fa-bf3ecea7273d@redhat.com>
 <399ac7d5-2518-799a-595e-f6b6878cf4ab@intel.com>
 <a9ab8946-c599-5f83-7527-2387a9e82e8a@xenosoft.de>
In-Reply-To: <a9ab8946-c599-5f83-7527-2387a9e82e8a@xenosoft.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 16 Jan 2020 16:46:32 +0100
Message-ID: <CAPDyKFoydOuSE=Eaq168=2_Ycouo7hzyw+RZXhGq7q4D4Qe8TQ@mail.gmail.com>
Subject: Re: [FSL P5020 P5040 PPC] Onboard SD card doesn't work anymore after
 the 'mmc-v5.4-2' updates
To: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Julian Margetson <runaway@candw.ms>, "contact@a-eon.com" <contact@a-eon.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 16 Jan 2020 at 12:18, Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>
> Hi All,
>
> We still need the attached patch for our onboard SD card interface
> [1,2]. Could you please add this patch to the tree?

No, because according to previous discussion that isn't the correct
solution and more importantly it will break other archs (if I recall
correctly).

Looks like someone from the ppc community needs to pick up the ball.

>
> Thanks,
> Christian
>
> [1] https://www.spinics.net/lists/linux-mmc/msg56211.html

I think this discussion even suggested some viable solutions, so it
just be a matter of sending a patch :-)

> [2]
> http://forum.hyperion-entertainment.com/viewtopic.php?f=58&t=4349&start=20#p49012
>

Kind regards
Uffe
