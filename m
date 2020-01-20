Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D6714293D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 12:26:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481Trt3mCdzDqSG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 22:26:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::e35;
 helo=mail-vs1-xe35.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dO4kN0c5; dkim-atps=neutral
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481ThL5KBQzDqcc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 22:19:13 +1100 (AEDT)
Received: by mail-vs1-xe35.google.com with SMTP id t12so18684240vso.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 03:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gxSL5xhOZst+pCmxYqXG3YKuQuTkwZHSeWZWlmDk2HQ=;
 b=dO4kN0c5Z35cMUG2zQrTTvrk7RGA1amnG3n9P90IImjqOjjDZjhvuNsBSQhiMMXNLE
 CDMzF/9s8uqA4Df+Ru+q/8o6Ouxz8CivtgQKiNcmW5hnOdZ8mnY280zn88iNKXHA4HHx
 v5zrMudqkmHMQsgJ+ZK6LDx/ugBBzSbxVlKmqeIoYtmGlsZNG3E1/Jp9qS/Vh+/O5REk
 e1cfWSdt0nlct528AyTTlNPiUtRbL7oq0VMka5yYnWJqaw9p9UgOFniXL16lo6h50H4c
 y7Ehogowgx0mQP8OD9KRCYSTcly0Uhmhx6kZVObbXxBKYt+GzA3udIsIzRADe0patW2A
 Dy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gxSL5xhOZst+pCmxYqXG3YKuQuTkwZHSeWZWlmDk2HQ=;
 b=AYZltM+eySkzONQUgF2J1E1j1FEpzrMLf0bVbCGpNlj1sd9k+0sVQ8dBU1CcZEulto
 mM/1lBP6jXZTWFM0K587sCnuQtkg+C95dMMx7ZUfQT4NhlbO54DWeYsxtiJa4FDIfugN
 xyxwu2ZHwSIuGAMEjQwQUuIRCjednNn6/OZmJ9PB/XsJs36C9HDLjjQg+chOl8ppYuGV
 UAtPSrJWPob8ObO6WoJObVO4zh8sbFftYWd1MTmxabxV42YncEYpOh34V/038vbImCl+
 AgCrSAM3GUw0CwElR0Dut/OzroJHdE9qOsVM7T1hZE25RSRQFs0ae93fF5K3usc6YKyd
 V5Vw==
X-Gm-Message-State: APjAAAWVlaoc8PQfujx80KXO2j9ysJwDWnC2ZFjDl9Tlm3NwqFi61cIs
 fm8UcOpc0QgbCsvo3WRRz5It/MCkCp5YWEiB8qkfsg==
X-Google-Smtp-Source: APXvYqwEK7V8CGTKtpdB2cbeBf8HgalOPvhYLB27hK6pTw6dPNJlNxuuxk0NzlvlQGtXVEkoS9slrLYLBvgzGRuZTI8=
X-Received: by 2002:a67:6282:: with SMTP id
 w124mr11959722vsb.191.1579519149014; 
 Mon, 20 Jan 2020 03:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20200108093903.57620-1-hdegoede@redhat.com>
 <20200108093903.57620-2-hdegoede@redhat.com>
 <61bc9265-ece0-eeb6-d4a1-4631138ecf29@intel.com>
 <8d67882d-04a8-0607-be4e-c1430b7fda21@redhat.com>
 <84a32714-ba08-74a0-0c76-3c36db44dd68@intel.com>
 <93446e09-5f12-800a-62fa-bf3ecea7273d@redhat.com>
 <399ac7d5-2518-799a-595e-f6b6878cf4ab@intel.com>
 <a9ab8946-c599-5f83-7527-2387a9e82e8a@xenosoft.de>
 <CAPDyKFoydOuSE=Eaq168=2_Ycouo7hzyw+RZXhGq7q4D4Qe8TQ@mail.gmail.com>
 <fda179eb-df5f-ba87-aaf0-524fffca745b@xenosoft.de>
In-Reply-To: <fda179eb-df5f-ba87-aaf0-524fffca745b@xenosoft.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 20 Jan 2020 12:18:32 +0100
Message-ID: <CAPDyKFoTuvrq8PYoXVaZoJN+zBUGVkQkYAhwber7rez32y3Sxg@mail.gmail.com>
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

On Mon, 20 Jan 2020 at 10:17, Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
>
> Am 16.01.20 um 16:46 schrieb Ulf Hansson:
> > On Thu, 16 Jan 2020 at 12:18, Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> >> Hi All,
> >>
> >> We still need the attached patch for our onboard SD card interface
> >> [1,2]. Could you please add this patch to the tree?
> > No, because according to previous discussion that isn't the correct
> > solution and more importantly it will break other archs (if I recall
> > correctly).
> >
> > Looks like someone from the ppc community needs to pick up the ball.
> I am not sure if the ppc community have to fix this issue because your
> updates (mmc-v5.4-2) are responsible for this issue. If nobody wants to
> fix this issue then we will lost the onboard SD card support in the
> future. PLEASE check the 'mmc-v5.4-2' updates again.

Applying your suggested fix breaks other archs/boards. It's really not
a good situation, but I will not take a step back when it's quite easy
to take a step forward instead.

Someone just need to care and send a patch, it doesn't look that hard
to me, but maybe I am wrong.

Apologies if this isn't the answer you wanted, but that's all I can do
for now, sorry.

Kind regards
Uffe
