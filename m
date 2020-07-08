Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 948A32182FA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 10:58:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1tWX5DjzzDr4Q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 18:58:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1tTX0QqGzDqKv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 18:56:47 +1000 (AEST)
Received: from net-130-25-222-52.cust.vodafonedsl.it ([130.25.222.52]
 helo=uefi)
 by centrum.lixper.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.84_2) (envelope-from <giuseppe@sguazz.it>)
 id 1jt5si-0001a5-G4
 for linuxppc-dev@lists.ozlabs.org; Wed, 08 Jul 2020 10:56:44 +0200
Message-ID: <aab7a9fefe9ccfa272fbc45eeaa8228fced14d3b.camel@sguazz.it>
Subject: Re: kernel since 5.6 do not boot anymore on Apple PowerBook
From: Giuseppe Sacco <giuseppe@sguazz.it>
To: linuxppc-dev@lists.ozlabs.org
Date: Wed, 08 Jul 2020 10:56:38 +0200
In-Reply-To: <639a48d1-815b-33f1-3c9e-cd9ca8ec41b1@csgroup.eu>
References: <89e412a76350b28f791bb8a2b6f9647a034f6fc8.camel@sguazz.it>
 <04544f16-fb20-54b9-e56e-47d45af03b6c@csgroup.eu>
 <c98f8586c16c86bb9b4485138bbabce9f15c282b.camel@sguazz.it>
 <64815669-5282-f74f-efc6-6c4c376fb602@csgroup.eu>
 <990279c219476c4d513df52454adf583de32641a.camel@sguazz.it>
 <211a35b02193ae79a201d4d567fe1d7a53a979f5.camel@sguazz.it>
 <639a48d1-815b-33f1-3c9e-cd9ca8ec41b1@csgroup.eu>
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

Salut Cristophe,

Il giorno mer, 08/07/2020 alle 10.38 +0200, Christophe Leroy ha
scritto:
> Hi Giuseppe,
> 
> Le 08/07/2020 à 09:59, Giuseppe Sacco a écrit :
> > Hello Cristophe,
> > 
> > Il giorno mar, 07/07/2020 alle 17.34 +0200, Giuseppe Sacco ha
> > scritto:
[...]
> > > > And can you try without CONFIG_VMAP_STACK on 5.6.19
> > > 
> > > Sure, I'll let you know.
> > 
> > No, this change did not make the kernel boot. I only changed the
> > option
> > you proposed:
> > 
> > $ grep VMAP .config
> > CONFIG_HAVE_ARCH_VMAP_STACK=y
> > # CONFIG_VMAP_STACK is not set
> > 
> 
> Ok, at least it is not that. I wanted to be sure because this is a
> huge 
> change added recently that is selected by default.
> 
> I tried on QEMU with your config, it boots properly.
> 
> So I think the only way now will be to bisect. Hope you were able to 
> setup a cross compiler on a speedy machine.

thank you for your time; indeed I may now crosscompile the kernel in 15
minutes instead of about 390... I hope to have a final result in a
couple of days.

Bye,
Giuseppe

