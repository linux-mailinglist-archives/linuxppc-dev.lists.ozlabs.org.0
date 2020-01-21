Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5781435EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 04:33:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481vJV5pRpzDqKN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 14:33:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 481vH13y5KzDqVN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 14:32:13 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1itkAR-0005jP-1X; Mon, 20 Jan 2020 21:25:27 -0600
Message-ID: <bd0fa23b900fe967a8c3c11abd1ba9a47cec474f.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: wangwenhu <wenhu.pku@gmail.com>, Kumar Gala <galak@kernel.crashing.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 20 Jan 2020 21:25:25 -0600
In-Reply-To: <20200120144327.20800-1-wenhu.pku@gmail.com>
References: <20200120144327.20800-1-wenhu.pku@gmail.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: wenhu.pku@gmail.com, galak@kernel.crashing.org,
 benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 trivial@kernel.org, wenhu.wang@vivo.com, harninder.rai@nxp.com
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
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
Cc: Rai Harninder <harninder.rai@nxp.com>, wenhu.wang@vivo.com,
 trivial@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-01-20 at 06:43 -0800, wangwenhu wrote:
> From: wangwenhu <wenhu.wang@vivo.com>
> 
> When generating .config file with menuconfig on Freescale BOOKE
> SOC, FSL_85XX_CACHE_SRAM is not configurable for the lack of
> description in the Kconfig field, which makes it impossible
> to support L2Cache-Sram driver. Add a description to make it
> configurable.
> 
> Signed-off-by: wangwenhu <wenhu.wang@vivo.com>

The intent was that drivers using the SRAM API would select the symbol.  What
is the use case for selecting it manually?

Since this code was added almost ten years ago and there are still no (in-
tree?) users of the API, we should just remove the sram code (unless this
prods someone to submit such a user very soon).

-Scott


