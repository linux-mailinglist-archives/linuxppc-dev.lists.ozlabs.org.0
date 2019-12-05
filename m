Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDB4113D46
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 09:45:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T8Sh1LkQzDqYh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 19:45:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=daniel.baluta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U2VSti3x"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47T8QW4Nw9zDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 19:44:03 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id p17so2665528wmi.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2019 00:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lU1EvzM/eLD0n0vZaZM7AMkwMVY8sZSz0h3WsdV8t0E=;
 b=U2VSti3xVYS3TZPRfEbXKHUduQrzXSc5f+w1SuhjId7MWQwy7oOm4AD/MgMfRrvBTD
 8BVTycGLuJp8sE6OQ+FG0TCjsXTjRI964j4m5fup+dxVQ1Mlsa/+9p6kWM4HQEUnLUPB
 jDoOpTvvmLrggMmDLQIrbrpt5LlAn6GbQjyJzvu+gdCJX+gp30vQL38CMQoJbw+vSUBh
 vzqWSDfZ60M9svZzy8bab7AWE7X0RDQRXDUrvfoAx35v2NKnCNG3v2WH50/J0oJuj6Vy
 N0t0vFI5R42CNnD2QpW2oIE8fwT3iMnetrtWzEp9GEPetG4/UuqNqfJVlZQZR3k3ONod
 jj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lU1EvzM/eLD0n0vZaZM7AMkwMVY8sZSz0h3WsdV8t0E=;
 b=ktgpSMmGbnDS+6j/6xCx3gJsZ36nlHmivX/sisAPolp7G7rksx3TWLXfIya96frKpC
 WiLFD0W+zDr8qtiPAeh+SG3rsTM3kI/kU9U4sEpAHqLU7TyML+RvLyDyrlnIfk2z1knp
 g9f7NSESI+M6N9tdE5xSWspnyDSe1IyQzANZz5htYq5W8CQyURvQt6Z+T1Jzbz4ew+jN
 sWAtxoVGdABCxi34g9v5Owb3yGZnGtldaCHx2fKpJ488jJofhIzCqwwZeko+s6NMvu1E
 kVaJIZ8wfWOe2fK6andfD281uv5O2ynbl37mtVh3Zg/3jiNnhuNfKOl6/hQb/uujHRra
 TT5A==
X-Gm-Message-State: APjAAAVhFqJDTHimHAwiAH9P0lwi3lL88pjzpSgFuVwM5JW4YL/RYvuQ
 Bl6Txq0K0GjVgc4fqBzwe0LcD8+JJNNve3wVyCQ=
X-Google-Smtp-Source: APXvYqzHaKRUEfbiAOswMp49ewBcixg21LL6YP05PzNudQhdouGxpQM6W2U/QiJNtYTg+vZqQcCAgBCV7oa+geJPtRg=
X-Received: by 2002:a1c:4944:: with SMTP id w65mr3776661wma.39.1575535439089; 
 Thu, 05 Dec 2019 00:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20191128223802.18228-1-michael@walle.cc>
In-Reply-To: <20191128223802.18228-1-michael@walle.cc>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 5 Dec 2019 10:43:46 +0200
Message-ID: <CAEnQRZCnQAUVowOJw5aPe9rYWU5DKR4bFbmQLYV2BzYqOhRJmQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: add IRQF_SHARED
To: Michael Walle <michael@walle.cc>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 29, 2019 at 12:40 AM Michael Walle <michael@walle.cc> wrote:
>
> The LS1028A SoC uses the same interrupt line for adjacent SAIs. Use
> IRQF_SHARED to be able to use these SAIs simultaneously.

Hi Michael,

Thanks for the patch. We have a similar change inside our internal tree
(it is on my long TODO list to upstream :D).

We add the shared flag conditionally on a dts property.

Do you think it is a good idea to always add shared flag? I'm thinking
on SAI IP integrations where the interrupt is edge triggered.

AFAIK edge triggered interrupts do not get along very well
with sharing an interrupt line.
