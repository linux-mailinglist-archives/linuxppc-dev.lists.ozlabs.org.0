Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E421436E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 06:58:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481yWR5NcfzDqMm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 16:58:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 481yTh2YVwzDqd7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 16:56:40 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1itmQK-0006oP-A0; Mon, 20 Jan 2020 23:50:00 -0600
Message-ID: <0948b2f469c5e9d9241477e7f0cba677bbcd1780.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: =?UTF-8?Q?=E7=8E=8B=E6=96=87=E8=99=8E?= <wenhu.wang@vivo.com>
Date: Mon, 20 Jan 2020 23:49:59 -0600
In-Reply-To: <AFAA8AA0CH7o6kMJF-XfXKq9.3.1579584019640.Hmail.wenhu.wang@vivo.com>
References: <AFAA8AA0CH7o6kMJF-XfXKq9.3.1579584019640.Hmail.wenhu.wang@vivo.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: wenhu.wang@vivo.com, wenhu.pku@gmail.com,
 galak@kernel.crashing.org, benh@kernel.crashing.org, paulus@samba.org,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org, harninder.rai@nxp.com
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
Subject: Re: [PATCH] powerpc/Kconfig: Make FSL_85XX_CACHE_SRAM configurable
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
Cc: Rai Harninder <harninder.rai@nxp.com>, trivial@kernel.org,
 linux-kernel@vger.kernel.org, wangwenhu <wenhu.pku@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-01-21 at 13:20 +0800, 王文虎 wrote:
> From: Scott Wood <oss@buserror.net>
> Date: 2020-01-21 11:25:25
> To:  wangwenhu <wenhu.pku@gmail.com>,Kumar Gala <galak@kernel.crashing.org>,
> Benjamin Herrenschmidt <benh@kernel.crashing.org>,Paul Mackerras <
> paulus@samba.org>,Michael Ellerman <mpe@ellerman.id.au>,
> linuxppc-dev@lists.ozlabs.org,linux-kernel@vger.kernel.org
> Cc:  trivial@kernel.org,wenhu.wang@vivo.com,Rai Harninder <
> harninder.rai@nxp.com>
> Subject: Re: [PATCH] powerpc/Kconfig: Make FSL_85XX_CACHE_SRAM
> configurable>On Mon, 2020-01-20 at 06:43 -0800, wangwenhu wrote:
> > > From: wangwenhu <wenhu.wang@vivo.com>
> > > 
> > > When generating .config file with menuconfig on Freescale BOOKE
> > > SOC, FSL_85XX_CACHE_SRAM is not configurable for the lack of
> > > description in the Kconfig field, which makes it impossible
> > > to support L2Cache-Sram driver. Add a description to make it
> > > configurable.
> > > 
> > > Signed-off-by: wangwenhu <wenhu.wang@vivo.com>
> > 
> > The intent was that drivers using the SRAM API would select the
> > symbol.  What
> > is the use case for selecting it manually?
> > 
> 
> With a repository of multiple products(meaning different defconfigs) and
> multiple
> developers, the Kconfigs of the Kernel Source Tree change frequently. So the
> "make menuconfig"
> process is needed for defconfigs' re-generating or updating for the
> complexity of dependencies
> between different features defined in the Kconfigs.

That doesn't answer my question of how the SRAM code would be useful other
than to some other driver that uses the API (which would use "select").  There
is no userspace API.  You could use the kernel command line to configure the
SRAM but you need to get the address of it for it to be useful.

> > Since this code was added almost ten years ago and there are still no (in-
> > tree?) users of the API, we should just remove the sram code (unless this
> > prods someone to submit such a user very soon).
> > 
> 
> Yes, pretty long a time. But we DO really use the API now for
> PPCE500/Freescale SoC.

I do not see any users in the kernel tree.  Are you talking about out-of-tree
code, or something that you've submitted or will submit soon?  Or are you
accessing it via /dev/mem?

> Like sometimes we need to reset the whole RAM, then the L2-Cache would be
> used as
> SRAM for backup using. Since it is useful for us now, a re-consideration is
> recommanded.

Where is the code that would do this?

-Scott
> 

