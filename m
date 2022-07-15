Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2DF576767
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 21:32:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ll1hp5MP9z3cgs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 05:32:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=buserror.net (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ll1hR2WnFz3bkd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 05:32:07 +1000 (AEST)
Received: from [2601:449:8480:af0::c75e]
	by baldur.buserror.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <oss@buserror.net>)
	id 1oCQFW-000HLf-Vh; Fri, 15 Jul 2022 13:41:14 -0500
Message-ID: <db14059bfc4f94e7e1812cdba5290da1ad420e92.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
	Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 15 Jul 2022 13:41:12 -0500
In-Reply-To: <20220707061441.193869-2-u.kleine-koenig@pengutronix.de>
References: <20220707061441.193869-1-u.kleine-koenig@pengutronix.de>
	 <20220707061441.193869-2-u.kleine-koenig@pengutronix.de>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0::c75e
X-SA-Exim-Rcpt-To: u.kleine-koenig@pengutronix.de, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, kernel@pengturonix.de
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Report: 	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: Re: [PATCH 2/3] powerpc/platforms/83xx/suspend: Prevent unloading
 the driver
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
Cc: kernel@pengturonix.de, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-07-07 at 08:14 +0200, Uwe Kleine-König wrote:
> Returning an error in .remove() doesn't prevent a driver from being
> unloaded. On unbind this only results in an error message, but the
> device is remove anyhow.
> 
> I guess the author's idea of just returning -EPERM in .remove() was to
> prevent unbinding a device. To achieve that set the suppress_bind_attrs
> driver property and drop the useless .remove callback.

I don't remember if I thought it would prevent removal, or if it was just the
only thing I could do to signal that removing it would be a bad idea (albeit
of relatively little consequence since it can't be built as a module).  

suppress_bind_attrs didn't exist back then. :-)

In any case,

Acked-by: Scott Wood <oss@buserror.net>

-Scott


