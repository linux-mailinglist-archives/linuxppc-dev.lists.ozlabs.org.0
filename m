Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7730D2B5CBB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 11:18:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cb22k3PHhzDqTj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 21:18:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=po-hsu.lin@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cb20n4V4fzDqS0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 21:16:40 +1100 (AEDT)
Received: from mail-lj1-f198.google.com ([209.85.208.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1key2N-0003x8-HF
 for linuxppc-dev@lists.ozlabs.org; Tue, 17 Nov 2020 10:16:35 +0000
Received: by mail-lj1-f198.google.com with SMTP id 3so4313188ljq.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 02:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XEdsHRGTcFavudpXhNXpa2iKk6bFAMTvjLBIV8dbsko=;
 b=AOOv5mREqdTfjWEJDZd3p8P1PuTvqADVUKSjpzbVyuo8g3jQKyYclt6RqUZD6t5Aq2
 na44PKy4rJBcTA3QxeLfn2XPsQZqrY0xaTZqAl0lBiHnYlL+pzRY9tPhI5zXzhQX1Bxe
 gzMkarxPSWcruIuhij6aa/fEd5hk6O1WMfd7pQTGwYZWnvkcIIjsTvO1g0Desvlb8Oab
 oVX5p7UgP7aR7dUupLPLDvgKLfdxyoEhZ0p+ZvLLZgMsCfgXPhjkSORuCloYxrIYRWjk
 LQW2m0goqDCPe1M+GXcPKohyrU5qBe1jyvN5cwOLr2X+bdcg8MT4l0otN0i+pdIn6mi5
 es7A==
X-Gm-Message-State: AOAM530PGaTQXsHnoQGnALy3QPDDdknSAforqhEetn5m+BFywTnVZpvG
 2aGECT/CfOeXRbu7gmIsTkiRgeUlyINK3xjaoL+jK3FKm/RQeDewWsE25cBfiNFsUS5Oq9GgYjx
 I5PcAFsvrf4KiOl6tQTsnLEAABMz9Vx9P4b0ScMgM0jnb+5+8MWubQUnHFg==
X-Received: by 2002:a19:3ce:: with SMTP id 197mr1726610lfd.364.1605608194888; 
 Tue, 17 Nov 2020 02:16:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGKNQl8F+w9d73yJM5THTTlbfEgwgYYrzLhz1BoumzV9CXFZOZwDEB9lFaKd0BVNBiA2vGw9Gr5K3Xs8pfgq4=
X-Received: by 2002:a19:3ce:: with SMTP id 197mr1726593lfd.364.1605608194484; 
 Tue, 17 Nov 2020 02:16:34 -0800 (PST)
MIME-Version: 1.0
References: <20201023024539.9512-1-po-hsu.lin@canonical.com>
In-Reply-To: <20201023024539.9512-1-po-hsu.lin@canonical.com>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Tue, 17 Nov 2020 18:16:23 +0800
Message-ID: <CAMy_GT-FNXa+fUjD4wM_8WAgLN7V8O=-E6n5jFULon74ejm=aQ@mail.gmail.com>
Subject: Re: [PATCHv2] selftests/powerpc/eeh: disable kselftest timeout
 setting for eeh-basic
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kselftest@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
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
Cc: mathieu.desnoyers@efficios.com, mbenes@suse.cz, shuah <shuah@kernel.org>,
 joe.lawrence@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,
any update on this patch?
Or do we want to increase the timeout here?
Thanks!

On Fri, Oct 23, 2020 at 10:45 AM Po-Hsu Lin <po-hsu.lin@canonical.com> wrote:
>
> The eeh-basic test got its own 60 seconds timeout (defined in commit
> 414f50434aa2 "selftests/eeh: Bump EEH wait time to 60s") per breakable
> device.
>
> And we have discovered that the number of breakable devices varies
> on different hardware. The device recovery time ranges from 0 to 35
> seconds. In our test pool it will take about 30 seconds to run on a
> Power8 system that with 5 breakable devices, 60 seconds to run on a
> Power9 system that with 4 breakable devices.
>
> Extend the timeout setting in the kselftest framework to 5 minutes
> to give it a chance to finish.
>
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> ---
>  tools/testing/selftests/powerpc/eeh/Makefile | 2 +-
>  tools/testing/selftests/powerpc/eeh/settings | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/powerpc/eeh/settings
>
> diff --git a/tools/testing/selftests/powerpc/eeh/Makefile b/tools/testing/selftests/powerpc/eeh/Makefile
> index b397bab..ae963eb 100644
> --- a/tools/testing/selftests/powerpc/eeh/Makefile
> +++ b/tools/testing/selftests/powerpc/eeh/Makefile
> @@ -3,7 +3,7 @@ noarg:
>         $(MAKE) -C ../
>
>  TEST_PROGS := eeh-basic.sh
> -TEST_FILES := eeh-functions.sh
> +TEST_FILES := eeh-functions.sh settings
>
>  top_srcdir = ../../../../..
>  include ../../lib.mk
> diff --git a/tools/testing/selftests/powerpc/eeh/settings b/tools/testing/selftests/powerpc/eeh/settings
> new file mode 100644
> index 0000000..694d707
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/eeh/settings
> @@ -0,0 +1 @@
> +timeout=300
> --
> 2.7.4
>
