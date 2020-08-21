Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8ED24D17A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 11:29:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXx6t53wkzDrBh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 19:29:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=centrum.lixper.it (client-ip=46.4.16.148; helo=centrum.lixper.it;
 envelope-from=srs0=9qiu=b7=sguazz.it=giuseppe@centrum.lixper.it;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sguazz.it
X-Greylist: delayed 2091 seconds by postgrey-1.36 at bilbo;
 Fri, 21 Aug 2020 18:58:03 AEST
Received: from centrum.lixper.it (centrum.lixper.it [46.4.16.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXwQg6lsLzDqcw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 18:58:02 +1000 (AEST)
Received: from net-2-44-194-190.cust.vodafonedsl.it ([2.44.194.190] helo=uefi)
 by centrum.lixper.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <giuseppe@sguazz.it>)
 id 1k92KF-00023D-Vn; Fri, 21 Aug 2020 10:23:06 +0200
Message-ID: <3558dadc530a60e9e3f958f0d6d4a0f28958ae86.camel@sguazz.it>
Subject: Re: kernel since 5.6 do not boot anymore on Apple PowerBook
From: Giuseppe Sacco <giuseppe@sguazz.it>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org
Date: Fri, 21 Aug 2020 10:22:58 +0200
In-Reply-To: <59de290b-4b6c-a55e-9289-e640473b1382@csgroup.eu>
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
 <e6878657490aa34b54b3daf0430073078a9840e7.camel@sguazz.it>
 <b70a6343-a380-ff08-a401-04f9ab50be6b@csgroup.eu>
 <59de290b-4b6c-a55e-9289-e640473b1382@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GeoIP: IT
X-SRS: Sender address rewritten from <giuseppe@sguazz.it> to
 <SRS0=9qIu=B7=sguazz.it=giuseppe@centrum.lixper.it> by centrum.lixper.it.
X-Mailman-Approved-At: Fri, 21 Aug 2020 19:27:36 +1000
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

Hello Cristophe,

Il giorno ven, 21/08/2020 alle 08.55 +0200, Christophe Leroy ha
scritto:
> Hi Giuseppe,
> 
> Le 08/07/2020 à 20:44, Christophe Leroy a écrit :
> > 
> > Le 08/07/2020 à 19:36, Giuseppe Sacco a écrit :
> > > Hi Cristophe,
> > > 
> > > Il giorno mer, 08/07/2020 alle 19.09 +0200, Christophe Leroy ha
> > > scritto:
[...]
> > > > What's the result with:
> > > > 
> > > > LANG=C make ARCH=powerpc CROSS_COMPILE=powerpc-linux- vmlinux
> > > 
> > > $ LANG=C make ARCH=powerpc CROSS_COMPILE=powerpc-linux- vmlinux
> > >    CALL    scripts/checksyscalls.sh
> > >    CALL    scripts/atomic/check-atomics.sh
> > >    CHK     include/generated/compile.h
> > >    CC      kernel/module.o
> > > kernel/module.c: In function 'do_init_module':
> > > kernel/module.c:3593:2: error: implicit declaration of function
> > > 'module_enable_ro'; did you mean 'module_enable_x'? [-Werror=implicit-
> > > function-declaration]
> > >   3593 |  module_enable_ro(mod, true);
> > >        |  ^~~~~~~~~~~~~~~~
> > >        |  module_enable_x
> > > cc1: some warnings being treated as errors
> > > make[1]: *** [scripts/Makefile.build:267: kernel/module.o] Error 1
> > > make: *** [Makefile:1735: kernel] Error 2
> > > 
> > > So, should I 'git bisect skip'?
> > 
> > Ah yes, I had the exact same problem last time I bisected.
> > 
> > So yes do 'git bisect skip'. You'll probably hit this problem half a 
> > dozen of times, but at the end you should get a usefull bisect anyway.
> > 
> 
> Were you able to progress ?

Very slowly. I am still working on it, currently at recompile #276.
git-bisect states that I have still about 700 commits to check, but the
real problem is that more than 60% of built kernels crash even before
displaying the cpu_freq message (probably another long lasting bug
hides the one I am looking for). All these skipped kernels make
bisecting very very slow.

A short video about the problem I face when I skip the build is here:
https://eppesuigoccas.homedns.org/~giuseppe/bug%20avvio%20powerbook%20g4.mp4

Bye,
Giuseppe

