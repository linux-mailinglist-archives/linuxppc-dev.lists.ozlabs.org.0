Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 988DE4BD922
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 11:42:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2Jly6tqmz3cVr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 21:42:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=Vkqt80mz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=Vkqt80mz; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2JlJ3Ll6z30Nj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 21:42:03 +1100 (AEDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 82D832223E;
 Mon, 21 Feb 2022 11:41:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645440119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/oFMNHJ9Vt/cbN7UZwsXwP2TGn4Fh6S9plzC8KDPhWw=;
 b=Vkqt80mzuse0ER9la84yeucxS3JKND+I1DI/w9usr/Hjm9HGfo8KLwkCAn3/C6Q3gZUZMR
 3ySdi7+9VcM51vKGTwh5ShkhCGdbgFw3/u2WeSfUIMcq+Zt2p7CiVe2qTtuKxogCPj6AAN
 dEzuYLUpC/tDZmGgtN8xFWgZeNn24rs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Feb 2022 11:41:58 +0100
From: Michael Walle <michael@walle.cc>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] soc: fsl: guts: cleanups and serial_number support
In-Reply-To: <20220209163242.430265-1-michael@walle.cc>
References: <20220209163242.430265-1-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <1e46ae6508997c2bb3f1f0c922ae81d8@walle.cc>
X-Sender: michael@walle.cc
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Sudeep Holla <Sudeep.Holla@arm.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Arnd Bergmann <arnd@arndb.de>,
 Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

any news here? Through which tree is this supposed to go?

Am 2022-02-09 17:32, schrieb Michael Walle:
> This series converts the guts driver from a platform driver to just an
> core_initcall. The driver itself cannot (or rather should never) be
> unloaded because others depends on detecting the current SoC revision
> to apply chip errata. Other SoC drivers do it the same way. Overall I
> got rid of all the global static variables.
> 
> The last patch finally adds unique id support to the guts driver. But
> because the binding [1] for the security fuse processor is still 
> pending,
> it is marked as RFC.

As I was about to resend this series without the RFC tag, I noticed
that I forgot to mark patch 7/7 as RFC in v2 anyway. So no need for
resending.

The binding was acked by Rob and already picked up via the nvmem tree.

-michael

> 
> [1] 
> https://lore.kernel.org/linux-devicetree/20220127163728.3650648-2-michael@walle.cc/
> 
> changes since v1:
>  - call kfree() in error case, thanks Dan
>  - add missing of_node_put(np), thanks Dan
> 
> Michael Walle (7):
>   soc: fsl: guts: machine variable might be unset
>   soc: fsl: guts: remove module_exit() and fsl_guts_remove()
>   soc: fsl: guts: embed fsl_guts_get_svr() in probe()
>   soc: fsl: guts: allocate soc_dev_attr on the heap
>   soc: fsl: guts: use of_root instead of own reference
>   soc: fsl: guts: drop platform driver
>   soc: fsl: guts: add serial_number support
> 
>  drivers/soc/fsl/guts.c | 219 ++++++++++++++++++++++-------------------
>  1 file changed, 118 insertions(+), 101 deletions(-)
