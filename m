Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCA229688D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 04:39:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHT2P5pFGzDqyX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 13:39:09 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHT0M07ytzDqyB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 13:37:21 +1100 (AEDT)
Received: from mail-lj1-f197.google.com ([209.85.208.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1kVmxB-00069a-9C
 for linuxppc-dev@lists.ozlabs.org; Fri, 23 Oct 2020 02:37:17 +0000
Received: by mail-lj1-f197.google.com with SMTP id r8so1561865ljp.21
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 19:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kL6r0YME8JPJ77vl3uRAXuFWZJrygKvOlR68AHYrrHU=;
 b=Mfa3C1t02rY/59G96rfAZubCsJXTUseflMX//z06Ane8IMZZTZQIMiP5kisv29mCOT
 H9XMO5R4BKjzi8mHU7zoVuE64XYqiVLi4dWLZy6BOztZuohVGjcjGe/kzHuUKj9l1L3i
 RaBEBu8EWh6TcRMhmTazI5sHRwRyrZwcwH2O7P7JfrJB1LjpQQmup8icRYWRj9VA9aDK
 LWECg0xzeJwk15dCzmCnult1idRsgjLTUDikoWl9PuSZi7m1wRba9D11GhPebJGNzOsl
 gKsqWtjlgB6cq/NYYSQr20OLBEdXE4Y/ZcVswKY/VSJjowwdJDC/0XrxguZmYl2HGgNG
 wMgQ==
X-Gm-Message-State: AOAM5302lposrFlWY8VRdKyy+WSuuJomfZZCyEn3mthswFSyY2wQPwOA
 Zz2DNF7Jpnsi8mJz+J72tBD3pa9D/K3Fi8jF707ZJSTkgUzxwCExBmlqSpVYFttFNu/FTp2rGti
 4D/70k5KzaUgtQbe2/6a7OEYpnidjMGJzLUCfWkwA1JnieMPX+3sN94FhOg==
X-Received: by 2002:a2e:b610:: with SMTP id r16mr2009858ljn.145.1603420636664; 
 Thu, 22 Oct 2020 19:37:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRfCpmV1tRBi4tQH9ePl5vBE3c7CunlQdQpCfkUSbLWC4WSzKxov2iLonbzZOeUBfANDvUahwOcsIODRjVAck=
X-Received: by 2002:a2e:b610:: with SMTP id r16mr2009846ljn.145.1603420636341; 
 Thu, 22 Oct 2020 19:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201022083616.41666-1-po-hsu.lin@canonical.com>
 <87a6wdy9si.fsf@mpe.ellerman.id.au>
In-Reply-To: <87a6wdy9si.fsf@mpe.ellerman.id.au>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Fri, 23 Oct 2020 10:37:05 +0800
Message-ID: <CAMy_GT8pMJ4So3zHLLUR8EeL8MfUbv2zTv48p8GXUW3Dm_bFOA@mail.gmail.com>
Subject: Re: [PATCH] selftests/powerpc/eeh: disable kselftest timeout setting
 for eeh-basic
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: joe.lawrence@redhat.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
 linux-kselftest@vger.kernel.org, mbenes@suse.cz, shuah <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 23, 2020 at 10:07 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Po-Hsu Lin <po-hsu.lin@canonical.com> writes:
> > The eeh-basic test got its own 60 seconds timeout (defined in commit
> > 414f50434aa2 "selftests/eeh: Bump EEH wait time to 60s") per breakable
> > device.
> >
> > And we have discovered that the number of breakable devices varies
> > on different hardware. The device recovery time ranges from 0 to 35
> > seconds. In our test pool it will take about 30 seconds to run on a
> > Power8 system that with 5 breakable devices, 60 seconds to run on a
> > Power9 system that with 4 breakable devices.
> >
> > Thus it's better to disable the default 45 seconds timeout setting in
> > the kselftest framework to give it a chance to finish. And let the
> > test to take care of the timeout control.
>
> I'd prefer if we still had some timeout, maybe 5 or 10 minutes? Just in
> case the test goes completely bonkers.
>
OK, let's go for 5 minutes.
Will send V2 later.
Thanks for your suggestion!

> cheers
>
> > diff --git a/tools/testing/selftests/powerpc/eeh/Makefile b/tools/testing/selftests/powerpc/eeh/Makefile
> > index b397bab..ae963eb 100644
> > --- a/tools/testing/selftests/powerpc/eeh/Makefile
> > +++ b/tools/testing/selftests/powerpc/eeh/Makefile
> > @@ -3,7 +3,7 @@ noarg:
> >       $(MAKE) -C ../
> >
> >  TEST_PROGS := eeh-basic.sh
> > -TEST_FILES := eeh-functions.sh
> > +TEST_FILES := eeh-functions.sh settings
> >
> >  top_srcdir = ../../../../..
> >  include ../../lib.mk
> > diff --git a/tools/testing/selftests/powerpc/eeh/settings b/tools/testing/selftests/powerpc/eeh/settings
> > new file mode 100644
> > index 0000000..e7b9417
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/eeh/settings
> > @@ -0,0 +1 @@
> > +timeout=0
> > --
> > 2.7.4
