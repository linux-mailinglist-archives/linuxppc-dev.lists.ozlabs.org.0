Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3EC8748B7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 08:31:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=YhCwdWI5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr1G35FTTz3vb6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 18:31:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=YhCwdWI5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr1FL75ljz3d24
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 18:31:17 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9D2560002;
	Thu,  7 Mar 2024 07:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709796670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E/G30HQxLWRoFZIvYSd3SRA2snV7wVPADu6RkLNz5Vc=;
	b=YhCwdWI5VgfWOlO+rdWF7RO2fwNn7lMLmJDNBX2NEAMPZO4OeQ1oh+5NminfFfM95kOzJ+
	++1G/8FL6lEB+7Kli0tiJSU0cJAP69njWF4/wWjm0GpZKhif+96kfl7Ma8PoekzT/p6JKr
	yD1kSC9Drw4GrHekHNrkfd0kbH05JYEjak3788Rlb/NuG/7kXO0zD54llmCWfhE2x8ePvP
	xjhHpIm6yhuub04Bw8n2umzSt8CHcRLlZ84recBGwmnvStlHWQHgyQahpzEtXtusV9D4+Z
	RO+Z/8frZyD1vM6m+QAggw4I0f0h5K6mOR5uXh8VzPfYP7bh9YMs9cXavpjp/Q==
Date: Thu, 7 Mar 2024 08:31:07 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v6 3/5] lib/bitmap: Introduce bitmap_scatter() and
 bitmap_gather() helpers
Message-ID: <20240307083107.0fcd940f@bootlin.com>
In-Reply-To: <Zehx-v7h38TPJWwe@smile.fi.intel.com>
References: <20240306080726.167338-1-herve.codina@bootlin.com>
	<20240306080726.167338-4-herve.codina@bootlin.com>
	<Zehrd/VgW5AnfJEu@yury-ThinkPad>
	<Zehx-v7h38TPJWwe@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yury,

On Wed, 6 Mar 2024 15:39:06 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Wed, Mar 06, 2024 at 05:11:19AM -0800, Yury Norov wrote:
> > On Wed, Mar 06, 2024 at 09:07:19AM +0100, Herve Codina wrote:  
> 
> ...
> 
> > Signed-off-by: Yury Norov <yury.norov@gmail.com>  
> 
> Why? Shouldn't be Acked-by?
> 
> > Would you like to move this with the rest of the series? If so please
> > pull my Sof-by, otherwise I can move it with bitmap-for-next.  
> 

A new iteration of the series is planned.
Yury, may I add your Acked-by in the next iteration ?

Best regards,
Hervé
