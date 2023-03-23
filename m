Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 212696C6DC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 17:36:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj9vz07Zhz3fS6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 03:36:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.179; helo=mail-qt1-f179.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj9vN0dTXz3f4X
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 03:35:59 +1100 (AEDT)
Received: by mail-qt1-f179.google.com with SMTP id s12so27212831qtq.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 09:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UL3/4GqvmmUqfCC6k4K5nIi6sLrnnlUEco09johNyxg=;
        b=aDDq4TyYsXL9MCvuIL4huVH9sNUbT86z3X5H0XJduSnN9hqUSg5gvzPEq1PH4FzIaw
         ItH9PJWUtcfHdisRrBXresBcas3wlf+DM4EmmVMosVFtAEd1TzHM5AI7TgygbaynVyRh
         h9veVYYoirujXkdAVcKr+rxTQAOAz8KHEt6IQhKtvX/tIuJrm5ErVXvsGJbY5bfTH5mX
         x7Gv7ixUk5wMUE0IsmTKonBO9LVh+bXnMJHw8RWGrOifrU8XD0n6O15mM02d54Vjwe7Q
         O3i86WWKK2sbAOUYggfdXBdFP4KrIrJDtK18epXcBwR8E/Mg3DE5LBcV9ZNbrlJMpSk/
         2QuQ==
X-Gm-Message-State: AO0yUKUK4zzJITrc0ogjmtfql+Y6XOnDqawKrifitOgiClZvPBeChQP6
	uEOwpbiofJaX3LAi96WzIOesQvnN0GBeSA==
X-Google-Smtp-Source: AK7set9Iq1ciwaPBxs2fTwzA7bohcAE+9LhSWNc2IIn9CPBFp05WqoYXJ6bkL75TWnFyY9dTaHy8BA==
X-Received: by 2002:ac8:4e42:0:b0:3bf:e415:5cc3 with SMTP id e2-20020ac84e42000000b003bfe4155cc3mr14496699qtw.58.1679589356686;
        Thu, 23 Mar 2023 09:35:56 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id w2-20020ac87182000000b003b9a6d54b6csm11868126qto.59.2023.03.23.09.35.56
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 09:35:56 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id s12so27212743qtq.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 09:35:56 -0700 (PDT)
X-Received: by 2002:a05:6902:728:b0:a09:314f:a3ef with SMTP id
 l8-20020a056902072800b00a09314fa3efmr2603297ybt.12.1679588947338; Thu, 23 Mar
 2023 09:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <ZBxiaflGTeK8Jlgx@smile.fi.intel.com> <20230323150238.GA2550157@bhelgaas>
 <ZBxrfy83MRjnReAs@smile.fi.intel.com>
In-Reply-To: <ZBxrfy83MRjnReAs@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Mar 2023 17:28:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkavUwZrfuJ5YSsb2kkHVZ0TCzcme5o6CkYGcSDVt+jw@mail.gmail.com>
Message-ID: <CAMuHMdWkavUwZrfuJ5YSsb2kkHVZ0TCzcme5o6CkYGcSDVt+jw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] PCI: Introduce pci_dev_for_each_resource()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy,

On Thu, Mar 23, 2023 at 4:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Mar 23, 2023 at 10:02:38AM -0500, Bjorn Helgaas wrote:
> > I poked around looking for similar patterns elsewhere with:
> >   git grep "#define.*for_each_.*_p("
> >   git grep "#define.*for_each_.*_idx("
> >
> > I didn't find any other "_p" iterators and just a few "_idx" ones, so
> > my hope is to follow what little precedent there is, as well as
> > converge on the basic "*_for_each_resource()" iterators and remove the
> > "_idx()" versions over time by doing things like the
> > pci_claim_resource() change.
>
> The p is heavily used in the byte order conversion helpers.

I can't seem to find them. Example?

Or do you mean cpu_to_be32p()? There "p" means pointer,
which is something completely different.

> > What do you think?  If it seems like excessive churn, we can do it
> > as-is and still try to reduce the use of the index variable over time.
>
> I think _p has a precedent as well. But I can think about it a bit, maybe
> we can come up with something smarter.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
