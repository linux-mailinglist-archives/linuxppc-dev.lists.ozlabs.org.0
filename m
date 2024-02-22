Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 537B68604D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 22:30:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Hh5Zm4Yv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgmX01xBmz3vXv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 08:30:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Hh5Zm4Yv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgmWC65QJz3bX5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 08:29:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9DCA606DC;
	Thu, 22 Feb 2024 21:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18839C433C7;
	Thu, 22 Feb 2024 21:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1708637377;
	bh=t85/vLINNj4QjqTdLkHVSWfMx17aHlL+u2dxKq3yYy8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Hh5Zm4YvDfOKF5br8tkmh9sJvT791U5KssSAIS8LfOqGSzl3slitWdXs3E1Em8lxo
	 eW/hjzCE3XTpXQTswpeuaep38I7mm0zb4+bnWgNGgZIUZ8CEoNf8Y2On7Vgpn2ddNO
	 Q3Fn70VpnIcWdCXFtJ96SSNkluqeWjcO+vqu/Qw4=
Date: Thu, 22 Feb 2024 13:29:36 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v2 00/14] Split crash out from kexec and clean up
 related config items
Message-Id: <20240222132936.e7dc50acbf5d1b653cb2e02c@linux-foundation.org>
In-Reply-To: <3393a42f-d9b3-4031-bdef-78bb2ce758f1@linux.ibm.com>
References: <20240119145241.769622-1-bhe@redhat.com>
	<9101bb07-70f1-476c-bec9-ec67e9899744@linux.ibm.com>
	<Zb8D1ASrgX0qVm9z@MiWiFi-R3L-srv>
	<559f2595-1477-4ef0-80e4-85ae8b426de7@linux.ibm.com>
	<20240221125752.36fbfe9c307496313198b60f@linux-foundation.org>
	<3393a42f-d9b3-4031-bdef-78bb2ce758f1@linux.ibm.com>
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

On Thu, 22 Feb 2024 10:47:29 +0530 Hari Bathini <hbathini@linux.ibm.com> wrote:

> 
> 
> On 22/02/24 2:27 am, Andrew Morton wrote:
> > On Wed, 21 Feb 2024 11:15:00 +0530 Hari Bathini <hbathini@linux.ibm.com> wrote:
> > 
> >> On 04/02/24 8:56 am, Baoquan He wrote:
> >>>>> Hope Hari and Pingfan can help have a look, see if
> >>>>> it's doable. Now, I make it either have both kexec and crash enabled, or
> >>>>> disable both of them altogether.
> >>>>
> >>>> Sure. I will take a closer look...
> >>> Thanks a lot. Please feel free to post patches to make that, or I can do
> >>> it with your support or suggestion.
> >>
> >> Tested your changes and on top of these changes, came up with the below
> >> changes to get it working for powerpc:
> >>
> >>   
> >> https://lore.kernel.org/all/20240213113150.1148276-1-hbathini@linux.ibm.com/
> > 
> > So can we take it that you're OK with Baoquan's series as-is?
> 
> Hi Andrew,
> 
> If you mean
> 
> v3 (https://lore.kernel.org/all/20240124051254.67105-1-bhe@redhat.com/)
> +
> follow-up from Baoquan 
> (https://lore.kernel.org/all/Zb8D1ASrgX0qVm9z@MiWiFi-R3L-srv/)
> 
> Yes.
> 

Can I add your Acked-by: and/or Tested-by: to the patches in this series?
