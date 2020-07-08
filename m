Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20489218262
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 10:30:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1stn2fV5zDr6q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 18:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=centrum.lixper.it (client-ip=46.4.16.148; helo=centrum.lixper.it;
 envelope-from=srs0=/ymy=at=sguazz.it=giuseppe@centrum.lixper.it;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sguazz.it
X-Greylist: delayed 1700 seconds by postgrey-1.36 at bilbo;
 Wed, 08 Jul 2020 18:28:00 AEST
Received: from centrum.lixper.it (centrum.lixper.it [46.4.16.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1srJ3cYqzDqr6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 18:28:00 +1000 (AEST)
Received: from net-130-25-222-52.cust.vodafonedsl.it ([130.25.222.52]
 helo=uefi)
 by centrum.lixper.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.84_2) (envelope-from <giuseppe@sguazz.it>)
 id 1jt4zN-0007lh-Ja
 for linuxppc-dev@lists.ozlabs.org; Wed, 08 Jul 2020 09:59:34 +0200
Message-ID: <211a35b02193ae79a201d4d567fe1d7a53a979f5.camel@sguazz.it>
Subject: Re: kernel since 5.6 do not boot anymore on Apple PowerBook
From: Giuseppe Sacco <giuseppe@sguazz.it>
To: linuxppc-dev@lists.ozlabs.org
Date: Wed, 08 Jul 2020 09:59:28 +0200
In-Reply-To: <990279c219476c4d513df52454adf583de32641a.camel@sguazz.it>
References: <89e412a76350b28f791bb8a2b6f9647a034f6fc8.camel@sguazz.it>
 <04544f16-fb20-54b9-e56e-47d45af03b6c@csgroup.eu>
 <c98f8586c16c86bb9b4485138bbabce9f15c282b.camel@sguazz.it>
 <64815669-5282-f74f-efc6-6c4c376fb602@csgroup.eu>
 <990279c219476c4d513df52454adf583de32641a.camel@sguazz.it>
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

Hello Cristophe,

Il giorno mar, 07/07/2020 alle 17.34 +0200, Giuseppe Sacco ha scritto:
> Il giorno mar, 07/07/2020 alle 16.52 +0200, Christophe Leroy ha
> scritto:
> > Le 07/07/2020 à 16:03, Giuseppe Sacco a écrit :
> > > Hello Cristophe,
> > > 
> > > > Can you tell which defconfig you use or provide your .config
> > > 
> > > You may get the standard one from debian or a reduced one that I
> > > made on purpose. The latter is here:
> > > https://eppesuigoccas.homedns.org/~giuseppe/config-5.4.50.gz
> > > 
> > >  (boot)
> > > https://eppesuigoccas.homedns.org/~giuseppe/config-5.6.19.gz
> > > 
> > >  (no boot)
> > 
> > Thanks
> > 
> > Can you provide the complete output when it works, so that I can
> > see 
> > what is after the place it stops when it fails.
> 
> Here it is:
> https://eppesuigoccas.homedns.org/~giuseppe/dmesg-5.4.40-minimo.gz
> 
> 
> > And can you try without CONFIG_VMAP_STACK on 5.6.19
> 
> Sure, I'll let you know.

No, this change did not make the kernel boot. I only changed the option
you proposed:

$ grep VMAP .config 
CONFIG_HAVE_ARCH_VMAP_STACK=y
# CONFIG_VMAP_STACK is not set

Thanks,
Giuseppe

