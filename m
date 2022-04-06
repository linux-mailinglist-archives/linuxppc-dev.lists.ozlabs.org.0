Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4AC4F6B19
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 22:16:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYbPs1VNVz3bns
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 06:16:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYbPN26syz2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 06:16:08 +1000 (AEST)
Received: from [2601:449:8480:af0::46ce]
 by baldur.buserror.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <oss@buserror.net>)
 id 1ncC2J-006Lmc-Cd; Wed, 06 Apr 2022 15:13:51 -0500
Message-ID: <7c2261ee00920aa6f8e6aeef98d99d34944957ab.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Wed, 06 Apr 2022 15:13:50 -0500
In-Reply-To: <20220323174342.56187-1-andriy.shevchenko@linux.intel.com>
References: <20220323174342.56187-1-andriy.shevchenko@linux.intel.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0::46ce
X-SA-Exim-Rcpt-To: andriy.shevchenko@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, brgl@bgdev.pl,
 linus.walleij@linaro.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
Subject: Re: [PATCH v1 1/1] powerpc/83xx/mpc8349emitx: Get rid of of_node
 assignment
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Paul Mackerras <paulus@samba.org>,
 Linus Walleij <linus.walleij@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-03-23 at 19:43 +0200, Andy Shevchenko wrote:
> Let GPIO library to assign of_node from the parent device.
> This allows to move GPIO library and drivers to use fwnode
> APIs instead of being stuck with OF-only interfaces.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)

Acked-by: Scott Wood <oss@buserror.net>

-Scott


