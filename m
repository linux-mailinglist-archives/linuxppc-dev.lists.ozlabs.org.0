Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F23B1B964A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 06:53:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499XVM07zTzDqV1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 14:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499XSZ74P4zDqB0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 14:52:14 +1000 (AEST)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1jSvgG-0007p7-BQ; Sun, 26 Apr 2020 23:47:44 -0500
Message-ID: <35c53c47c4b8cc648f56144306c21224163f1e72.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Greg KH <gregkh@linuxfoundation.org>, 
 =?UTF-8?Q?=E7=8E=8B=E6=96=87=E8=99=8E?= <wenhu.wang@vivo.com>
Date: Sun, 26 Apr 2020 23:47:43 -0500
In-Reply-To: <20200421093427.GC725219@kroah.com>
References: <20200420145128.GA4131449@kroah.com>
 <AB6A-gBhCLyx5bgBRPuIiqp1.3.1587460187094.Hmail.wenhu.wang@vivo.com>
 <20200421093427.GC725219@kroah.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: gregkh@linuxfoundation.org, wenhu.wang@vivo.com,
 arnd@arndb.de, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kernel@vivo.com, robh@kernel.org, christophe.leroy@c-s.fr, mpe@ellerman.id.au,
 rdunlap@infradead.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -1.5 GREYLIST_ISWHITE The incoming server has been whitelisted for
 *      this recipient and sender
Subject: Re: [PATCH v2,RESEND] misc: new driver sram_uapi for user level
 SRAM access
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: robh@kernel.org, arnd@arndb.de, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, kernel@vivo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-04-21 at 11:34 +0200, Greg KH wrote:
> On Tue, Apr 21, 2020 at 05:09:47PM +0800, 王文虎 wrote:
> > Hi, Greg, Arnd,
> > 
> > Thank you for your comments first, and then really very very very sorry
> > for driving Greg to sigh and I hope there would be chance to share Moutai
> > (rather than whisky, we drink it much, a kind of Baijiu), after the virus.
> > 
> > Back to the comments, I'd like to do a bit of documentation or explanation
> > first,
> > which should have been done early or else there would not be so much to
> > explain:
> > 1. What I have been trying to do is to access the Freescale Cache-SRAM
> > device form
> > user level;
> > 2. I implemented it using UIO, which was thought of non-proper;
> 
> I still think that using uio is the best way to do this, and never said
> it was "non-proper".  All we got bogged down in was the DT
> representation of stuff from what I remember.  That should be worked
> through.

The hardware is already reperesented in the DT (the various "fsl,<chip>-l2-
cache-controller" nodes).  What is there to "work through"?

I didn't say UIO was "non-proper" though I did question whether it was the
best fit.  We don't need the IRQ stuff, and we do want some means of
allocating multiple regions to different users (at least, that seems to be a
requirement for Wenhu, and it leaves open the possibility of a kernel driver
allocating some SRAM for itself which appears to be what
arch/powerpc/sysdev/fsl_85xx_cache_sram.c was originally meant for) and I
don't see how you'd do that through UIO.

So that leaves either a separate interface for dynamic region allocation (in
which case why not map through that interface), static allocation via
boot/module parameters which you didn't like, or abusing the device tree with
something that's not hardware description (why don't we replace kmalloc with
some device tree nodes while we're at it).

-Scott


