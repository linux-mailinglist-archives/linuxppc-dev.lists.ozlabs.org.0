Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F74285E954
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 21:58:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Bbd9ALrc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg7ss3B6kz3dTW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 07:58:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Bbd9ALrc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg7s05fllz3cV3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 07:57:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F135BCE1DC3;
	Wed, 21 Feb 2024 20:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CEFC433F1;
	Wed, 21 Feb 2024 20:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1708549073;
	bh=cQNUlLy8aiGRIYPC4jZV2h79/t7uLaYDp/ZsuaE++9Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Bbd9ALrcftdB4hiAFAbv+r3I0ERbgznFbhuh6MxPmx8jG8xGLzeq23eo9RRwwfYK+
	 iZCi2iMyB0NelsBsnf7/OypvyrQWmMazP7HA7Jbw0rZNQMouPMIBGFEDM881CMWNgk
	 2e1ZuX9I7suwwEUiqPo2BxD0oszsroHPkKn6qHbQ=
Date: Wed, 21 Feb 2024 12:57:52 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v2 00/14] Split crash out from kexec and clean up
 related config items
Message-Id: <20240221125752.36fbfe9c307496313198b60f@linux-foundation.org>
In-Reply-To: <559f2595-1477-4ef0-80e4-85ae8b426de7@linux.ibm.com>
References: <20240119145241.769622-1-bhe@redhat.com>
	<9101bb07-70f1-476c-bec9-ec67e9899744@linux.ibm.com>
	<Zb8D1ASrgX0qVm9z@MiWiFi-R3L-srv>
	<559f2595-1477-4ef0-80e4-85ae8b426de7@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-s390@vger.kernel.org, Baoquan He <bhe@redhat.com>, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Feb 2024 11:15:00 +0530 Hari Bathini <hbathini@linux.ibm.com> wrote:

> On 04/02/24 8:56 am, Baoquan He wrote:
> >>> Hope Hari and Pingfan can help have a look, see if
> >>> it's doable. Now, I make it either have both kexec and crash enabled, or
> >>> disable both of them altogether.
> >>
> >> Sure. I will take a closer look...
> > Thanks a lot. Please feel free to post patches to make that, or I can do
> > it with your support or suggestion.
> 
> Tested your changes and on top of these changes, came up with the below
> changes to get it working for powerpc:
> 
>  
> https://lore.kernel.org/all/20240213113150.1148276-1-hbathini@linux.ibm.com/

So can we take it that you're OK with Baoquan's series as-is?

Baoquan, do you believe the patches in mm-unstable are ready for moving
into mm-stable in preparation for an upstream merge?



