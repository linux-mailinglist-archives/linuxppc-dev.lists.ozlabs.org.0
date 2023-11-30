Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 999D07FFEC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 23:53:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=CsVIFbK8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShBLz0RxGz3cbX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 09:53:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=CsVIFbK8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShBL622X0z2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 09:53:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1708B62009;
	Thu, 30 Nov 2023 22:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA2EC433C8;
	Thu, 30 Nov 2023 22:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701384772;
	bh=3Pjy/K2UERmUE9Lf5OSdmJ9hD0GKJkBFKQQACti98iE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CsVIFbK84G7b2Vl8DXsPn+xC+ko6DzsEYdCpeoLL49f/wjG0q7+XJFA8Efc8EDrLB
	 kWNBU0rp11lJIwEumnlUF0vW1QFCt/iSvb53/VZenYE6vQugSPGW+tCvDkbxMuIybt
	 NjkhWJl8mlNRuK5K9LKmAwQg0Qj5GbFQr6QhmUwg=
Date: Thu, 30 Nov 2023 14:52:51 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20231130145251.f9dca8d062117e8ae1b129c1@linux-foundation.org>
In-Reply-To: <87sf4m27dz.fsf@mail.lhotse>
References: <20231127132809.45c2b398@canb.auug.org.au>
	<20231127144852.069b2e7e@canb.auug.org.au>
	<20231201090439.7ae92c13@canb.auug.org.au>
	<87sf4m27dz.fsf@mail.lhotse>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 01 Dec 2023 09:39:20 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:

> > I am still carrying this patch (it should probably go into the mm
> > tree).  Is someone going to pick it up (assuming it is correct)?
> 
> I applied it to my next a few days ago, but I must have forgotten to
> push. It's in there now.

I'll keep a copy in mm.git, to keep the dependencies nice.  I added
your acked-by.
