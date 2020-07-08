Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA79218E6A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 19:38:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B263C18JmzDqpv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 03:38:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=centrum.lixper.it (client-ip=46.4.16.148; helo=centrum.lixper.it;
 envelope-from=srs0=/ymy=at=sguazz.it=giuseppe@centrum.lixper.it;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sguazz.it
Received: from centrum.lixper.it (centrum.lixper.it [46.4.16.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B261d3TyFzDq9V
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 03:36:53 +1000 (AEST)
Received: from net-130-25-222-52.cust.vodafonedsl.it ([130.25.222.52]
 helo=uefi)
 by centrum.lixper.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.84_2) (envelope-from <giuseppe@sguazz.it>)
 id 1jtDzw-0005J0-6Z
 for linuxppc-dev@lists.ozlabs.org; Wed, 08 Jul 2020 19:36:50 +0200
Message-ID: <e6878657490aa34b54b3daf0430073078a9840e7.camel@sguazz.it>
Subject: Re: kernel since 5.6 do not boot anymore on Apple PowerBook
From: Giuseppe Sacco <giuseppe@sguazz.it>
To: linuxppc-dev@lists.ozlabs.org
Date: Wed, 08 Jul 2020 19:36:38 +0200
In-Reply-To: <c2a89243-6135-4edd-2c1c-42c2159b5a1e@csgroup.eu>
References: <89e412a76350b28f791bb8a2b6f9647a034f6fc8.camel@sguazz.it>
 <04544f16-fb20-54b9-e56e-47d45af03b6c@csgroup.eu>
 <c98f8586c16c86bb9b4485138bbabce9f15c282b.camel@sguazz.it>
 <64815669-5282-f74f-efc6-6c4c376fb602@csgroup.eu>
 <990279c219476c4d513df52454adf583de32641a.camel@sguazz.it>
 <211a35b02193ae79a201d4d567fe1d7a53a979f5.camel@sguazz.it>
 <639a48d1-815b-33f1-3c9e-cd9ca8ec41b1@csgroup.eu>
 <aab7a9fefe9ccfa272fbc45eeaa8228fced14d3b.camel@sguazz.it>
 <498426507489f2c8e32daaf7af1105b5adba552f.camel@sguazz.it>
 <c2a89243-6135-4edd-2c1c-42c2159b5a1e@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GeoIP: IT
X-SRS: Sender address rewritten from <giuseppe@sguazz.it> to
 <SRS0=/yMY=AT=sguazz.it=giuseppe@centrum.lixper.it> by centrum.lixper.it.
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Cristophe,

Il giorno mer, 08/07/2020 alle 19.09 +0200, Christophe Leroy ha
scritto:
> Hi
> 
> Le 08/07/2020 à 19:00, Giuseppe Sacco a écrit :
> > Hello,
> > while trying to debug a problem using git bisect, I am now at a point
> > where I cannot build the kernel at all. This is the error message I
> > get:
> > 
> > $ LANG=C make ARCH=powerpc \
> >   CROSS_COMPILE=powerpc-linux- \
> >   CONFIG_MODULE_COMPRESS_GZIP=true \
> >   INSTALL_MOD_STRIP=1 CONFIG_MODULE_COMPRESS=1 \
> >   -j4 INSTALL_MOD_PATH=$BOOT INSTALL_PATH=$BOOT \
> >   CONFIG_DEBUG_INFO_COMPRESSED=1 \
> >   install modules_install
> > make[2]: *** No rule to make target 'vmlinux', needed by
> 
> Surprising.
> 
> Did you make any change to Makefiles ?

No

> Are you in the middle of a bisect ? If so, if the previous builds 
> worked, I'd do 'git bisect skip'

Yes, the previous one worked.

> What's the result with:
> 
> LANG=C make ARCH=powerpc CROSS_COMPILE=powerpc-linux- vmlinux

$ LANG=C make ARCH=powerpc CROSS_COMPILE=powerpc-linux- vmlinux
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  CHK     include/generated/compile.h
  CC      kernel/module.o
kernel/module.c: In function 'do_init_module':
kernel/module.c:3593:2: error: implicit declaration of function
'module_enable_ro'; did you mean 'module_enable_x'? [-Werror=implicit-
function-declaration]
 3593 |  module_enable_ro(mod, true);
      |  ^~~~~~~~~~~~~~~~
      |  module_enable_x
cc1: some warnings being treated as errors
make[1]: *** [scripts/Makefile.build:267: kernel/module.o] Error 1
make: *** [Makefile:1735: kernel] Error 2

So, should I 'git bisect skip'?

Thank you,
Giuseppe

