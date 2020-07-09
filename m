Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A37DB21A3CE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 17:34:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2gFS4fLnzDrCQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 01:34:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.82;
 helo=conssluserg-03.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=XzW+BQ/J; 
 dkim-atps=neutral
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2gCH3W0XzDr95
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 01:32:10 +1000 (AEST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 069FVmfG015335
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 00:31:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 069FVmfG015335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1594308709;
 bh=OtxKPGTO/pZbwYh7E0pVV6aQCW7rvgzMKyprc/l7uvw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XzW+BQ/JSn+dV64V8fqNHJK+OdIyiLSnfnsrK6xtIhY738jFwF18rBafhnhFMTIjq
 It/Z7XU0oM8JfclHnU+t80A1fUpjloOc4MZzb/b0jhxlre9ReCB4/JOtR367Z824ab
 sIGKVYQyJRh3ZFwXzZpqWSd2ynbGJ2X/OcmdyyYc8G/5SLM6qHGC4vzaH7S4QmdvRx
 +Ff/LkThpBaC0qs07UgJZ+Tz6WT0buGdUZidykrBcEhPMk6ezn6iv7yDqPf83o149l
 f96C3Xqo+fe3xx9/S3nmjSlOkr5w+hvhSr2NyZKXzOhexLVbZtLNeLGbT4uQnE1f2f
 qrqlu6fGfiR2Q==
X-Nifty-SrcIP: [209.85.219.179]
Received: by mail-yb1-f179.google.com with SMTP id 187so1228690ybq.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 08:31:48 -0700 (PDT)
X-Gm-Message-State: AOAM531itlsDIjuTc7kGyYBQRTebXjQsyHgf5Q3G2luPs+JJSrI6K3ZH
 wBe1N9eqCPKoqkvMtNLBDXBsM3ikezNEhh0Cnlg=
X-Google-Smtp-Source: ABdhPJxAnxTJNTtnQtFovYQkrUal1o80dMPa969JqVz6oQaG8jBDcy1jbc08IXGNVNtiEaHsg2cPflWUKNAmtElJid0=
X-Received: by 2002:ab0:71d3:: with SMTP id n19mr46109137uao.25.1594308707342; 
 Thu, 09 Jul 2020 08:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200707180414.10467-1-rdunlap@infradead.org>
 <20200707180414.10467-11-rdunlap@infradead.org>
In-Reply-To: <20200707180414.10467-11-rdunlap@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 10 Jul 2020 00:31:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQB6DCw3CZyViCOWCZURfHQKm2JFx0Ypfhai9ecX6T9GQ@mail.gmail.com>
Message-ID: <CAK7LNAQB6DCw3CZyViCOWCZURfHQKm2JFx0Ypfhai9ecX6T9GQ@mail.gmail.com>
Subject: Re: [PATCH 10/20] Documentation: kbuild/kconfig-language: eliminate
 duplicated word
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
Cc: kvm@vger.kernel.org, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Paul Cercueil <paul@crapouillou.net>,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-leds@vger.kernel.org,
 linux-s390 <linux-s390@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi <linux-scsi@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Matthew Wilcox <willy@infradead.org>, Halil Pasic <pasic@linux.ibm.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Wang <james.qian.wang@arm.com>, linux-input@vger.kernel.org,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>, linux-mips@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Wu Hao <hao.wu@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Jiri Kosina <jikos@kernel.org>,
 Hannes Reinecke <hare@suse.com>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-mm@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jason Wessel <jason.wessel@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 8, 2020 at 3:06 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Drop the doubled word "the".
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Masahiro Yamada <masahiroy@kernel.org>



I guess this series will go in via the doc sub-system.

If so, please feel free to add:

Acked-by: Masahiro Yamada <masahiroy@kernel.org>






> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> ---
>  Documentation/kbuild/kconfig-language.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20200701.orig/Documentation/kbuild/kconfig-language.rst
> +++ linux-next-20200701/Documentation/kbuild/kconfig-language.rst
> @@ -681,7 +681,7 @@ translate Kconfig logic into boolean for
>  find dead code / features (always inactive), 114 dead features were found in
>  Linux using this methodology [1]_ (Section 8: Threats to validity).
>
> -Confirming this could prove useful as Kconfig stands as one of the the leading
> +Confirming this could prove useful as Kconfig stands as one of the leading
>  industrial variability modeling languages [1]_ [2]_. Its study would help
>  evaluate practical uses of such languages, their use was only theoretical
>  and real world requirements were not well understood. As it stands though



--
Best Regards
Masahiro Yamada
