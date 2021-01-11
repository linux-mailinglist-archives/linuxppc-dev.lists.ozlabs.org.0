Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3152F2260
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jan 2021 23:02:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF74B0rGbzDqgn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 09:02:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=u4OsVlAA; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF71v43dnzDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 09:00:46 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id x23so602276lji.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jan 2021 14:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jVdLysk1x6ZZsXbP0Zr5h+mMevWQuwTL1CpskBya6v8=;
 b=u4OsVlAAndy3l+Ngu/fYohy/mYFqxZDi4TLDNXDuZeeg3kChazJI9iXpzSE1HPcz3J
 UBulNCJkOdWiFliA2DuqX/vmg2SByWNgmhYs9F6nwFU7kL69aOkIMK8utFqCFoMW9Gw8
 nRTHRCtzv8cSD3n/3/R6hEg4dWPf2eXdapGk9/S6u6IQpV03ZNiontp3DtUP5s4RekbR
 h/z5F4A9AIq0Rvg381fUFmRmIYQkyRJBSDApLDdZT1yQbygM/j6lmuKKJgCEZCZDpD0A
 MnBrktjJ7LQoerAsJn3KfGe346IrqAtOZXXp/107SzHRLheTBO9SjLSojxn8uwHMUfVY
 ehzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jVdLysk1x6ZZsXbP0Zr5h+mMevWQuwTL1CpskBya6v8=;
 b=CHIaazVfXihSMG2Y4OzmJ6mVIIq7zILwJ2L8Bei8CXY/FrqAVXCozffdv3btRd5NBo
 QKpPkwdSZZ0B9KmCYizv+arKLC4I+d7BGw8K2UFtt4pTB+kfqwhy+EULLYvBkcvEYUVC
 2OCjQC3SceeeWbfL1/JAcU2Bqxh1S6LOeV9mHirPlIEV9dqJT1iUrdwQv6HhxFA352H9
 G5c6IdO6EnAZwO+TBxZ7ICSX23Ng8W9EM2hLcrxgfuZRWD7l429FOqRIzI+mL/V+VGJF
 AbNR43GOaafuggfLV5Q9iHlbCaDT8yBhFXKblDZcYYNZs0UGcZf6oMYpj5D8NvAYki1a
 +Ljg==
X-Gm-Message-State: AOAM531e5fF2n1x/UHOLTMYzfO92MFWeleRqgGzY30a4vRWcV0lDurj4
 r/Vox/RnBhydK7DO4erwMbj/gAYSZNCT1uy/cZHAuA==
X-Google-Smtp-Source: ABdhPJyn6aCXyneWJOgZKxnoF9Ct2sh9Dfr16D2OhX3Out/rqGrQWppRJQJ0dfvbe8j5pKv+eDAPpyQFMjIjJbKbdMw=
X-Received: by 2002:a05:651c:1312:: with SMTP id
 u18mr647685lja.200.1610402441598; 
 Mon, 11 Jan 2021 14:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20210110231752.1418816-1-alexandre.belloni@bootlin.com>
 <20210110231752.1418816-3-alexandre.belloni@bootlin.com>
In-Reply-To: <20210110231752.1418816-3-alexandre.belloni@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Jan 2021 23:00:30 +0100
Message-ID: <CACRpkdaGRujF0p-57L5HgRmP=3sZOUSBfCnwAxv67dhDwiBkNQ@mail.gmail.com>
Subject: Re: [PATCH 02/17] rtc: pl031: use RTC_FEATURE_ALARM
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 11, 2021 at 12:18 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> Clear RTC_FEATURE_ALARM instead of setting set_alarm, read_alarm and
> alarm_irq_enable to NULL.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
