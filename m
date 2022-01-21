Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763C2496136
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 15:37:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgMQn26Cqz3cDn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 01:37:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GO3LxVF/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=GO3LxVF/; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgMQ4737gz3cNC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 01:36:28 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0518BCE2322;
 Fri, 21 Jan 2022 14:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1CFC340E1;
 Fri, 21 Jan 2022 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642775784;
 bh=kXpwOXT1nIvhly2udYx2qRpbQIg4fCR3FP1QYarDZuc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GO3LxVF/0++4Ij2aw75wvOrdoMPMtwCkSsKEae6vS5ZvlNsasWKn1dDcbXSClt5Zg
 XMnhaT54HVwL/pMNW1vERm3KmHAezhtQ5Wy0ZFkjsu71SD8bYbC5oYb9KhlDBw60PN
 UQ4K24Ecvoc7/0UpxAWGV7xngm+HiN0W2/p54ku4=
Date: Fri, 21 Jan 2022 15:36:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc: Add missing SPDX license identifiers
Message-ID: <YerE5fXIUJQZbhZU@kroah.com>
References: <d2c52284244d6dcb3472d2041abe43b456d116df.1642762977.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2c52284244d6dcb3472d2041abe43b456d116df.1642762977.git.christophe.leroy@csgroup.eu>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 21, 2022 at 11:03:20AM +0000, Christophe Leroy wrote:
> Several files are missing SPDX license identifiers.
> 
> Following files are given the following SPDX identifier based on the comments in the top of the file:

Nit, please wrap your changelog text properly.

> 
> 	boot/crtsavres.S:/* SPDX-License-Identifier: GPL-2.0+ */
> 	include/asm/epapr_hcalls.h:/* SPDX-License-Identifier: GPL-2.0+ OR BSD */
> 	include/asm/fsl_hcalls.h:/* SPDX-License-Identifier: GPL-2.0+ OR BSD */
> 	include/asm/ibmebus.h:/* SPDX-License-Identifier: GPL-2.0 OR OpenIB BSD */
> 	include/asm/sfp-machine.h:/* SPDX-License-Identifier: LGPL-2.0+ */
> 	kvm/mpic.c:// SPDX-License-Identifier: GPL-2.0
> 	lib/crtsavres.S:/* SPDX-License-Identifier: GPL-2.0+ */
> 	mm/book3s64/hash_4k.c:// SPDX-License-Identifier: LGPL-2.0
> 	mm/book3s64/hash_64k.c:// SPDX-License-Identifier: LGPL-2.0
> 	mm/book3s64/hash_hugepage.c:// SPDX-License-Identifier: LGPL-2.1
> 	platforms/pseries/ibmebus.c:// SPDX-License-Identifier: GPL-2.0 OR OpenIB BSD
> 	tools/head_check.sh:# SPDX-License-Identifier: GPL-2.0+
> 	xmon/ppc.h:/* SPDX-License-Identifier: GPL-1.0+ */
> 
> Add to other files the default kernel license identifier, in extenso GPL-2.0.

That might be good for a single commit alone, don't mix it up with the
other files that you are removing stuff from.

thanks,

greg k-h
