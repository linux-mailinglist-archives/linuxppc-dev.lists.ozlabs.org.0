Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD94217714
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 20:50:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Whk4dPbzDqDB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 04:50:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=dianders@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=PhkRMCL0; dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1WC84M4XzDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 04:27:57 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id i4so44177780iov.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 11:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oM1DHY6yXzcZ+72qIs7pzRLVNbxrBF/RvTQpZ6AZWzE=;
 b=PhkRMCL0cOBM87z2xbKJgL3CzSg3isYeGP+IA1EMLxsIahQd9L+L+LwGrIZc7PupVR
 a64FI53GElPSGAoW7S4KRbWMtj7ZzQU/d6kavHWjiCkTTGRsPczF/Nc5eMops5qwua9F
 jGZbXWfjJB1ippmdWlpUMxsElo+5ounp092ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oM1DHY6yXzcZ+72qIs7pzRLVNbxrBF/RvTQpZ6AZWzE=;
 b=cG1CreU+ERfKiTA9XOfogAsRZDWI7LVp6c2xuL/Ga/hLXbcO36EBrwDbm+lbqdfUlA
 1lyDzyUll3U00Et5FPmx56BLIfZ7/DPNr/Xhrv6sqEvP5RAo8LzP9TcOs2YQn54G5tze
 pHNGmqgNS9dVsoPet2qINww0KuD5mXqw5z9gQx0WvM9oN8GBwlT2B+eOf2SuRpJRhBo8
 FUOd3ZhqIaTO8QHl6Em6TBhSpUNk3fhucWtjGKFMP7UKnalH5xe+ear8rzyAROXB0GPQ
 rBOk1m18RgtexDPR1UlOExttscpfFmqiuCSEG4GoupI4Vx0pLpDMA6h865g7288SSQMi
 pDqQ==
X-Gm-Message-State: AOAM530VspLr7YvSeiKpd0JyXIsjxlRsiqUZkZz6E/OBgtA+UuyPvDOS
 Jo0sfSPMuhafPnD20BcClO7x6IO2orc=
X-Google-Smtp-Source: ABdhPJwR2JunNAa6H/V9ryRYO0lrqVw9DS51On3J0nDkq6t67DgLNGYHYvEB3l7YOCpuEOVSTQqEbw==
X-Received: by 2002:a05:6602:5c3:: with SMTP id
 w3mr33068694iox.3.1594146474527; 
 Tue, 07 Jul 2020 11:27:54 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id o19sm12293267iob.5.2020.07.07.11.27.54
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 11:27:54 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id x9so36898137ila.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 11:27:54 -0700 (PDT)
X-Received: by 2002:a5e:a60d:: with SMTP id q13mr32158974ioi.199.1594146071871; 
 Tue, 07 Jul 2020 11:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-5-rdunlap@infradead.org>
In-Reply-To: <20200707180414.10467-5-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Jul 2020 11:21:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkyZcjziOXSYkcPOdkLBJCfxrVAHUq0SfybXXJ3pQxRg@mail.gmail.com>
Message-ID: <CAD=FV=UkyZcjziOXSYkcPOdkLBJCfxrVAHUq0SfybXXJ3pQxRg@mail.gmail.com>
Subject: Re: [PATCH 04/20] Documentation: kgdb: eliminate duplicated word
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block <linux-block@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jason Wessel <jason.wessel@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Tue, Jul 7, 2020 at 11:05 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Drop the doubled word "driver".
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: kgdb-bugreport@lists.sourceforge.net
> ---
>  Documentation/dev-tools/kgdb.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
