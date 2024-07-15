Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 102CF9315D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 15:33:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KrZNjzK5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WN37D02V6z3cWN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 23:33:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KrZNjzK5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WN36X0BDsz30Vk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 23:32:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 896B960F32;
	Mon, 15 Jul 2024 13:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BD2C4AF0A;
	Mon, 15 Jul 2024 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721050366;
	bh=1VQXo3PQ5bUOEU7LlOYBCGdHR6/CQC2eaEBkjR0wsG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrZNjzK51rTtDoDFiImif0pGXpQ4jdnFE9ZsBtq2XyEkzAm2mgk5ffOEmJ+6xjaBF
	 64Fz5YaYTnW4qHWMgTc+R6rjAmHBilPRr+ChmGXlCXyLHGXUUHs1k/77XiXRJUGkaq
	 RAyDpAoHDsFDIXYnUjrUmV2KQ5VkbaAWrTWZ8EaY=
Date: Mon, 15 Jul 2024 15:32:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v4] cxl: Fix possible null pointer dereference in
 read_handle()
Message-ID: <2024071537-schematic-envoy-4272@gregkh>
References: <20240715025442.3229209-1-make24@iscas.ac.cn>
 <6c50de6d-7f35-4427-bd11-5f02f5e90c08@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c50de6d-7f35-4427-bd11-5f02f5e90c08@web.de>
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
Cc: Maxime Ripard <mripard@kernel.org>, Shuah Khan <shuah@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>, make24@iscas.ac.cn, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, Wei Liu <wei.liu@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Aleksandr Mishin <amishin@t-argos.ru>, Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Ian Munsie <imunsie@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2024 at 03:18:56PM +0200, Markus Elfring wrote:
> > In read_handle(), of_get_address() may return NULL if getting address and
> > size of the node failed. When of_read_number() uses prop to handle
> > conversions between different byte orders, it could lead to a null pointer
> > dereference. Add NULL check to fix potential issue.
> >
> > Found by static analysis.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 14baf4d9c739 ("cxl: Add guest-specific code")
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> 
> How will interests evolve for caring more according to known research
> and development processes?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10#n398
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/researcher-guidelines.rst?h=v6.10#n5
> 
> 
> > ---
> > Changes in v4:
> > - modified vulnerability description according to suggestions, making the
> > process of static analysis of vulnerabilities clearer. No active research
> > on developer behavior.
> …
> 
> Does such information indicate any communication difficulties?


Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
