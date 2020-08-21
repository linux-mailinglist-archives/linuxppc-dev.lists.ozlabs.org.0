Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDDF24D929
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 17:56:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY5jH6Jn9zDr7G
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 01:56:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=centrum.lixper.it (client-ip=46.4.16.148; helo=centrum.lixper.it;
 envelope-from=srs0=9qiu=b7=sguazz.it=giuseppe@centrum.lixper.it;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=sguazz.it
Received: from centrum.lixper.it (centrum.lixper.it [46.4.16.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY5Rg0ZhvzDrCm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 01:44:30 +1000 (AEST)
Received: from net-2-44-194-190.cust.vodafonedsl.it ([2.44.194.190] helo=uefi)
 by centrum.lixper.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <giuseppe@sguazz.it>)
 id 1k99DM-0001D8-0U; Fri, 21 Aug 2020 17:44:25 +0200
Message-ID: <ae2c93c55a785b5f450fe796619d2688f393fa30.camel@sguazz.it>
Subject: Re: kernel since 5.6 do not boot anymore on Apple PowerBook
From: Giuseppe Sacco <giuseppe@sguazz.it>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Date: Fri, 21 Aug 2020 17:44:18 +0200
In-Reply-To: <5158eae8-6809-ae07-0d16-58f2a766f534@csgroup.eu>
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
 <3558dadc530a60e9e3f958f0d6d4a0f28958ae86.camel@sguazz.it>
 <a62714c0-1b17-305d-577d-529e1781ec56@csgroup.eu>
 <8ce38d9bb162268f53a2292a916c44579421e552.camel@sguazz.it>
 <5158eae8-6809-ae07-0d16-58f2a766f534@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-GeoIP: IT
X-SRS: Sender address rewritten from <giuseppe@sguazz.it> to
 <SRS0=9qIu=B7=sguazz.it=giuseppe@centrum.lixper.it> by centrum.lixper.it.
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

Hello,

Il giorno ven, 21/08/2020 alle 16.03 +0200, Christophe Leroy ha
scritto:
[...]
> Thanks.
> 
> The Oops in the video shows that the issue is at 0x1bcac and msr
> value 
> shows that Instruction MMU is disabled. So this corresponds to
> address 
> 0xc001bcac. In the vmlinux you sent me this address is in 
> power_save_ppc32_restore()
> 
> This issue is fixed by 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/7bce32ccbab3ba3e3e0f27da6961bf6313df97ed.1581663140.git.christophe.leroy@c-s.fr/
> 
> 
> You also said in a previous mail that your original issue also
> happens 
> when CONFIG_VMAP_STACK is not selected. The above bug being linked
> to 
> CONFIG_VMAP_STACK, maybe it would be easier to bisect with 
> CONFIG_VMAP_STACK unselected.

I rebuilt the same kernel that I would otherwise have skipped because
of the other bug, and it worked, indeed.
I will continue my "bisect quest" unselecting VMAP_STACK in order to
speed up the bisecting.

Thank you very much,
Giuseppe

