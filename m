Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3004425117F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 07:29:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbHc73LG8zDqGk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 15:29:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=centrum.lixper.it (client-ip=46.4.16.148; helo=centrum.lixper.it;
 envelope-from=srs0=ucx2=cd=sguazz.it=giuseppe@centrum.lixper.it;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sguazz.it
X-Greylist: delayed 1796 seconds by postgrey-1.36 at bilbo;
 Tue, 25 Aug 2020 15:28:03 AEST
Received: from centrum.lixper.it (centrum.lixper.it [46.4.16.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbHZW0SslzDqGC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 15:28:02 +1000 (AEST)
Received: from net-2-44-194-190.cust.vodafonedsl.it ([2.44.194.190] helo=uefi)
 by centrum.lixper.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <giuseppe@sguazz.it>)
 id 1kAJOq-0005X5-73; Mon, 24 Aug 2020 22:49:05 +0200
Message-ID: <e7a620fa7521e84e2010660b87f20dd24a3b0cd4.camel@sguazz.it>
Subject: Re: kernel since 5.6 do not boot anymore on Apple PowerBook
From: Giuseppe Sacco <giuseppe@sguazz.it>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Date: Mon, 24 Aug 2020 22:48:58 +0200
In-Reply-To: <f96d336d-fb81-fe9d-9890-db57c6560e85@csgroup.eu>
References: <89e412a76350b28f791bb8a2b6f9647a034f6fc8.camel@sguazz.it>
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
 <3558dadc530a60e9e3f958f0d6d4a0f28958ae86.camel@sguazz.it>
 <a62714c0-1b17-305d-577d-529e1781ec56@csgroup.eu>
 <8ce38d9bb162268f53a2292a916c44579421e552.camel@sguazz.it>
 <5158eae8-6809-ae07-0d16-58f2a766f534@csgroup.eu>
 <c707f59d379a51b83ba52e796d137887219c32fc.camel@sguazz.it>
 <f96d336d-fb81-fe9d-9890-db57c6560e85@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-GeoIP: IT
X-SRS: Sender address rewritten from <giuseppe@sguazz.it> to
 <SRS0=uCx2=CD=sguazz.it=giuseppe@centrum.lixper.it> by centrum.lixper.it.
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

Hello Christophe,

Il giorno lun, 24/08/2020 alle 07.17 +0200, Christophe Leroy ha
scritto:
> Hello Giuseppe,
[...]
> The Oopses in the video are fixed in 5.9-rc2, see my response to your 
> other mail.

Right, I just updated from git and rebuilt the kernel whith
CONFIG_VMAP_STACK not set and the machine boots correctly.

> So now we know that your kernel doesn't boot when CONFIG_VMAP_STACK is set.
> Can you remind the exact problem ?

latest kernel with CONFIG_VMAP_STACK set stops after writing:
pmac32_cpufreq: registering PowerMac CPU frequency driver
pmac32_cpufreq: Low: 667 MHz, High: 867 Mhz, Boot: 667 MHz

> One common problem with CONFIG_VMAP_STACK is when some drivers are 
> invalidly using buffers in stack for DMA.
> 
> Couldn't try with CONFIG_DEBUG_VIRTUAL (without CONFIG_VMAP_STACK) and 
> see if it triggers some warnings ?

I've just tried: it boots without any special warning. What should I
look for? This is an excerpt of dmesg output about the line it would
otherwise stop:

[...]
[    6.566984] PowerMac i2c bus pmu 2 registered
[    6.574879] PowerMac i2c bus pmu 1 registered
[    6.582634] PowerMac i2c bus mac-io 0 registered
[    6.590323] i2c i2c-2: No i2c address for /pci@f2000000/mac-io@17/i2c@18000/i2c-modem
[    6.598290] PowerMac i2c bus uni-n 1 registered
[    6.606196] i2c i2c-3: i2c-powermac: modalias failure on /uni-n@f8000000/i2c@f8001000/cereal@1c0
[    6.614320] PowerMac i2c bus uni-n 0 registered
[    6.622501] pmac32_cpufreq: Registering PowerMac CPU frequency driver
[    6.630580] pmac32_cpufreq: Low: 667 Mhz, High: 867 Mhz, Boot: 667 Mhz
[    6.639518] ledtrig-cpu: registered to indicate activity on CPUs
[    6.647894] NET: Registered protocol family 10
[    6.656492] Segment Routing with IPv6
[    6.664490] mip6: Mobile IPv6
[    6.672337] NET: Registered protocol family 17
[    6.680213] mpls_gso: MPLS GSO support
[...]

Bye,
Giuseppe

