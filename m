Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0F8220312
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 05:51:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B63Mp4jBWzDqR2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 13:51:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lixom.net
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=IAhNc2PE; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B63Kv1ZWdzDqJR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 13:49:36 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id a12so744407ion.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 20:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f1CRBSIEJDuFB8dog5jdvBQmdtw3EAxf2Oj6BzpDQQw=;
 b=IAhNc2PEOhArE+GcYrmBe/3NxGeuZx3JCuvw8ORdWaNpd8YNvHPLjFq+HAH3MRMP5S
 oOxyBK2u/zYrAOOjd2SxmZlRdg52TimjplCGTE4uqPKuozcM1fiFENkeKCPQ9TnAqGmC
 qDzl2Wwr+U15OcOwRP1fOnEZpCsaQlWf0zLOAuwadhfEdNRJAzc51eKROOxgfx8Ojn9p
 T23rKIIJKsm16XdyBmajMpVc4HFjxz2XrsVtLUH+3NCWbaIRrG6ISCGQMbYo3oB6eg8Y
 VXr6eeEnaLcVnulcplV88lhEe/D2ixCJV4Udc5gLfEIJqGRTME27xPjf75uimLjop3CO
 simA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f1CRBSIEJDuFB8dog5jdvBQmdtw3EAxf2Oj6BzpDQQw=;
 b=WN72IVqef5v8g6IESNAAI/VlEmvSNYHRhFw5rG5+rKGPIJU5sHtUofJYUJhlnsIPRq
 rzc5Xwz59yWVijnKiAw3m5/s1Sp1qKbQSmeqHcs7JeFS/63i+V/Gb0lK4FcdwIadw2B4
 F9HNRmJpl6jXRoh9A3LgaXJ7psLGZj3jJ4bE1QZPXIcr+hhDpoAa0kNAWJV0fZmYJVy0
 hamgYNWRiisbH24u15t9XLK92NRdeXxWL31CZAQKLPhX9ulgzSLl8/klVkdEqwUyA2Xs
 jiPPkQxY27aGLjOUVV02mRoD+8plsna5748BFXejRgZht8t802/ir+Gjgz6l0D0ehByy
 ODeA==
X-Gm-Message-State: AOAM532KPCWdQ3BtLf4RKNhnGCxcU6qXfhwUdbCyam1it1SCyLUWjvLv
 NpoxhFIWO15aay+9vEeLKWRYzO/4/0iMTuOjScaXwg==
X-Google-Smtp-Source: ABdhPJxIX1Rz1uy6qYWtVhSNi58vBkltN0nc+Y74TsUfZKS2AQDMN6wsabdJmmRCmC3OuMNUYpqM8OhcnmPuarpFxhU=
X-Received: by 2002:a6b:8e56:: with SMTP id q83mr8239025iod.61.1594784975129; 
 Tue, 14 Jul 2020 20:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200714145049.2496163-1-lee.jones@linaro.org>
 <20200714145049.2496163-6-lee.jones@linaro.org>
 <20200715030706.prxya7fyylscoy25@vireshk-i7>
In-Reply-To: <20200715030706.prxya7fyylscoy25@vireshk-i7>
From: Olof Johansson <olof@lixom.net>
Date: Tue, 14 Jul 2020 20:49:24 -0700
Message-ID: <CAOesGMi1dfqPbFJ8YoUoJ75NdU1=XiNoYx+6+JLu44a4LuuYGA@mail.gmail.com>
Subject: Re: [PATCH 05/13] cpufreq/arch: powerpc: pasemi: Move prototypes to
 shared header
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: linux-pm@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Lee Jones <lee.jones@linaro.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 8:07 PM Viresh Kumar <viresh.kumar@linaro.org> wrot=
e:
>
> On 14-07-20, 15:50, Lee Jones wrote:
> > If function callers and providers do not share the same prototypes the
> > compiler complains of missing prototypes.  Fix this by moving the
> > already existing prototypes out to a mutually convenient location.
> >
> > Fixes the following W=3D1 kernel build warning(s):
> >
> >  drivers/cpufreq/pasemi-cpufreq.c:109:5: warning: no previous prototype=
 for =E2=80=98check_astate=E2=80=99 [-Wmissing-prototypes]
> >  109 | int check_astate(void)
> >  | ^~~~~~~~~~~~
> >  drivers/cpufreq/pasemi-cpufreq.c:114:6: warning: no previous prototype=
 for =E2=80=98restore_astate=E2=80=99 [-Wmissing-prototypes]
> >  114 | void restore_astate(int cpu)
> >  | ^~~~~~~~~~~~~~
> >
> > Cc: Olof Johansson <olof@lixom.net>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  arch/powerpc/platforms/pasemi/pasemi.h    | 15 ------------
>
> Is there no sane way we can include this file directly to the cpufreq
> file ?

Yep. arch/powerpc seems to be in the search path for modules on powerpc, so=
:

diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpuf=
req.c
index c66f566a854cb..815645170c4de 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -22,6 +22,8 @@
 #include <asm/time.h>
 #include <asm/smp.h>

+#include <platforms/pasemi/pasemi.h>
+
 #define SDCASR_REG             0x0100
 #define SDCASR_REG_STRIDE      0x1000
 #define SDCPWR_CFGA0_REG       0x0100


-Olof
