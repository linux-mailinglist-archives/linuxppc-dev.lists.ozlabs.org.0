Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C61D59DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 21:21:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Nyv75b9YzDr6P
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 05:21:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=soleen.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=pasha.tatashin@soleen.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256
 header.s=google header.b=Dyhz804e; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Nykr0HnGzDr3G
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 05:14:05 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id g16so3141717eds.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 12:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rEcYbavgX8JtqJsaFfda+512xKGwZ/fm/kUZY43XBic=;
 b=Dyhz804eVJkifn7MrOk3lXA2cYeO07Wo2pl7mf5YjMFBNH39vMrrhMJ/rIJJabb4dV
 guEH+JGaq2EM2INQSVaVgsuHj0/xRby9hVLII3mauZmrrfgywAQhkpHYiGp/aL59oUW3
 ZskkLFWhScXljJGuVqfdxvI3oQqIPrVtmrQns7kskcjtHK7z8vgsq0bQogumhdMa6aae
 VX9ngNS7wwbyJGWrDeaoO3gxjUUHkHB6XPPl+bx8d3H83IGpB6xBxF5RiluqLnlDU4P1
 jpMhUqIxQYqRBHzlxVjqr6F/k7yqBDkIivvA7gyYKw7NnCA9p0M/HzdhEyOFmn9up+6j
 g+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rEcYbavgX8JtqJsaFfda+512xKGwZ/fm/kUZY43XBic=;
 b=sZXZlb1aDPABQcIeisaLyFgdaOXkHpYqSxpg/A9fzOPIWjhHNs7SOf8FwwdKw9u2az
 BynKPUWC7zib8YB37TzpCOLjAl5otw1CmhBYCOImPSo5udpSH7uD5/Ntej0ShVFB/A9g
 F3g0sTo7MFP5Spvc8WCgfDo2j/YXMkEvrWnHI8nd64px2RYGVzTepNlR49g5Bblv0WVl
 HMykAXNfTz/YVY/cQynir8bY9085BJuZswFH6Flywdl4Jv2hc5cxlOpQtgoPUV50kYmQ
 rZpVqhnjE9ZHTccwzQUtOvJlFPVoZyrNa+zmZtNeKka2NgDO0TBgew6yjZ5m7J/wFOWk
 jPQA==
X-Gm-Message-State: AOAM531prROFbp43Rcig374U/BPSSbOOM7kql/Kbux/xG7Bf2CwgkhjW
 XK6VtRO/kG7hwIo73iKDkfngJj0aQbtDK0NiR1t8OQ==
X-Google-Smtp-Source: ABdhPJzRuccajda0lvZX2w/+DdXmexWrUFl/B2OFA4hS4ryIA7/8/FI38g9Sc/H55qlMNSQAqFa8Wmrf7GbHja6mIt4=
X-Received: by 2002:a05:6402:31b1:: with SMTP id
 dj17mr4444751edb.142.1589570040580; 
 Fri, 15 May 2020 12:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200515184434.8470-1-keescook@chromium.org>
In-Reply-To: <20200515184434.8470-1-keescook@chromium.org>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 15 May 2020 15:13:24 -0400
Message-ID: <CA+CK2bAo163NzFn=t+MXBYcTEHPqkptFw6K0d_yMbhwROdGy2A@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] allow ramoops to collect all kmesg_dump events
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 15, 2020 at 2:44 PM Kees Cook <keescook@chromium.org> wrote:
>
> Hello!
>
> I wanted to get the pstore tree nailed down, so here's the v4 of
> Pavel's series, tweaked for the feedback during v3 review.

Hi Kees,

Thank you, I was planning to send a new version of this series later
today. Let me quickly review it.

Pasha

>
> -Kees
>
> v4:
> - rebase on pstore tree
> - collapse shutdown types into a single dump reason
>   https://lore.kernel.org/lkml/CA+CK2bAPv5u1ih5y9t5FUnTyximtFCtDYXJCpuyjOyHNOkRdqw@mail.gmail.com/
> - fix dump_oops vs max_reason module params
>   https://lore.kernel.org/lkml/20200512233504.GA118720@sequoia/
> - typos
>   https://lore.kernel.org/lkml/4cdeaa2af2fe0d6cc2ca8ce3a37608340799df8a.camel@perches.com/
> - rename DT parsing routines ..._size -> ..._u32
>   https://lore.kernel.org/lkml/CA+CK2bCu8eFomiU+NeBjVn-o2dbuECxwRfssNjB3ys3caCbXeA@mail.gmail.com/
> v3: https://lore.kernel.org/lkml/20200506211523.15077-1-keescook@chromium.org/
> v2: https://lore.kernel.org/lkml/20200505154510.93506-1-pasha.tatashin@soleen.com
> v1: https://lore.kernel.org/lkml/20200502143555.543636-1-pasha.tatashin@soleen.com
>
> Kees Cook (3):
>   printk: Collapse shutdown types into a single dump reason
>   printk: Introduce kmsg_dump_reason_str()
>   pstore/ram: Introduce max_reason and convert dump_oops
>
> Pavel Tatashin (3):
>   printk: honor the max_reason field in kmsg_dumper
>   pstore/platform: Pass max_reason to kmesg dump
>   ramoops: Add max_reason optional field to ramoops DT node
>
>  Documentation/admin-guide/ramoops.rst         | 14 +++--
>  .../bindings/reserved-memory/ramoops.txt      | 13 ++++-
>  arch/powerpc/kernel/nvram_64.c                |  4 +-
>  drivers/platform/chrome/chromeos_pstore.c     |  2 +-
>  fs/pstore/platform.c                          | 26 ++-------
>  fs/pstore/ram.c                               | 58 +++++++++++++------
>  include/linux/kmsg_dump.h                     | 12 +++-
>  include/linux/pstore.h                        |  7 +++
>  include/linux/pstore_ram.h                    |  2 +-
>  kernel/printk/printk.c                        | 32 ++++++++--
>  kernel/reboot.c                               |  6 +-
>  11 files changed, 114 insertions(+), 62 deletions(-)
>
> --
> 2.20.1
>
