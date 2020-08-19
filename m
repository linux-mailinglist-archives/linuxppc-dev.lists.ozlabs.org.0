Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8223249B40
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 12:54:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWl5N6jLxzDqpJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 20:54:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c44;
 helo=mail-oo1-xc44.google.com; envelope-from=allen.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Gso9pMxr; dkim-atps=neutral
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWl3M0QLNzDqfK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 20:52:13 +1000 (AEST)
Received: by mail-oo1-xc44.google.com with SMTP id p137so4789596oop.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NVVSOWbVhc+1jDHdFns3ZSzRukenY167RTrEndwbU+M=;
 b=Gso9pMxrOQWdMFS4oUDFDQopnA2DpTpiZCJFqq/B2ZEoa859lMA5DG1q5AfyFRQC2K
 0BbOOMsaxojyLaYamQN/hpqRKPyyNI6tYgVnrQEOZwypkcXjeXNYOcmggJBzwWOAPH2t
 uDby8ZfkUfgPuCVQ1hjydyCXloT/GD+ySll0NBJQxEcqa5ZYkvWZC8QcBYu6LNGB6qmy
 BNwFxRP4pWhEXUL9/E4VkRndasu5/0pLNTSDu1EbLLgbuQ4nsZFmlQPPbC5atEOXRxVR
 X7KawI1aJh0oYRDXgKsXSAYl9gDpUeMspxL/faww8IWo5Ubp2AZ/wAk+H184A02WZfBJ
 /6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NVVSOWbVhc+1jDHdFns3ZSzRukenY167RTrEndwbU+M=;
 b=ujoAY9UAnTzIXPylCGItbEvGuifV1FPE+tbP69YHxeB9oaliUJZpYFIUJ3U74tfpQU
 o3mLTA+ZOIiyJkzbYr92hC2cilfFuGUi0HboRoV+p4oW7YTVThL9FKEtsMq522U7Oxbw
 oq6F4T8REDMXhwOZcNRSepQe7O+Tk9uzXo78uravetr/4AKtiPtXjT326G5ka3IfQvy/
 aNLYo2PW3kMy74qVgsVzuoZz7pVuQfTL5id5+ECci00QEDOKT7e74Rn7pjFSY20lw+OE
 EvyLz18QFzcmAFyAwTtAgzHUvlwd2NwCB6dc5RP/b/lwX8FOGMiMN3PKiKwJ+ofCKn88
 shCw==
X-Gm-Message-State: AOAM533sBJXpknKOMI93vPRue+/hy3ZB1MuDM6WVsyFe0abeLj9CIUwx
 gAgO229KL0aBWzQkQeWOksRkvDiEY6gVrX1hd+Y=
X-Google-Smtp-Source: ABdhPJza8N+paiL7BVopPlHy+EmjenRyRlSSITcfsn9ivsKXVK0GX/mlG+WzET1CjkKeuuz0KvlkntNnGGj9jJ4neCo=
X-Received: by 2002:a4a:d62c:: with SMTP id n12mr18112364oon.38.1597834329556; 
 Wed, 19 Aug 2020 03:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200817085703.25732-1-allen.cryptic@gmail.com>
 <s5hsgckl084.wl-tiwai@suse.de> <20200818104432.GB5337@sirena.org.uk>
In-Reply-To: <20200818104432.GB5337@sirena.org.uk>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 19 Aug 2020 16:21:58 +0530
Message-ID: <CAOMdWSK79WWsmsxJH9zUMZMfkBNRWXbmEHg-haxNZopHjC1cGw@mail.gmail.com>
Subject: Re: [PATCH 00/10] sound: convert tasklets to use new tasklet_setup()
To: Mark Brown <broonie@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Kees Cook <keescook@chromium.org>,
 timur@kernel.org, Xiubo.Lee@gmail.com, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, clemens@ladisch.de, tiwai@suse.com,
 o-takashi@sakamocchi.jp, nicoleotsuka@gmail.com,
 Allen Pais <allen.cryptic@gmail.com>, perex@perex.cz,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>
> > Mark, may I apply those ASoC patches through my tree together with
> > others?  Those seem targeting to 5.9, and I have a patch set to
> > convert to tasklet for 5.10, which would be better manageable when
> > based on top of those changes.
>
> These patches which I wasn't CCed on and which need their subject lines
> fixing :( .  With the subject lines fixed I guess so so

Extremely sorry. I thought I had it covered. How would you like it
worded?

> Acked-by: Mark Brown <broonie@kernel.org>
>
> but judging from some of the other threads about similar patches that I
> was randomly CCed on I'm not sure people like from_tasklet() so perhaps
> there might be issues.

Yes, there is a new macro by name cast_out() is suggested in place of
from_tasklet(). Hopefully it will go in soon. Will spin out V2 with the change
and also re-word subject line.

> Allen, as documented in submitting-patches.rst please send patches to
> the maintainers for the code you would like to change.  The normal
> kernel workflow is that people apply patches from their inboxes, if they
> aren't copied they are likely to not see the patch at all and it is much
> more difficult to apply patches.

I understand, I'll take care of it in the future. Thank you.

-- 
       - Allen
