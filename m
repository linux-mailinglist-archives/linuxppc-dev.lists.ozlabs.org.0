Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C707891B66
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 14:24:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rFKYRxMF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5h2x5hZkz3vg3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Mar 2024 00:24:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rFKYRxMF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5h2F06fQz3d4D
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Mar 2024 00:24:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D58E3CE2F7C;
	Fri, 29 Mar 2024 13:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D88C433F1;
	Fri, 29 Mar 2024 13:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711718639;
	bh=bQx/BXOUSe4TNoDtXR2BXWY0aFMLcADXigMMWJW/L3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rFKYRxMFWgbTseJJMATejdwMQAFlQv/Gg01agjZQWEoWMUuHtWmzii0H62Wzpj5KT
	 wuktrBJ0GoAHlP5XS1yvLuqjYvss3CWMTe1AnvlI8Hc9WtLczeN0VHc6JwfzhxEcHJ
	 IW/M9vWYf3kCbr3JTTZZT+rhIEPz01karffLPpVI=
Date: Fri, 29 Mar 2024 14:23:39 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: FAILED: Patch "powerpc: xor_vmx: Add '-mhard-float' to CFLAGS"
 failed to apply to 5.10-stable tree
Message-ID: <2024032925-tapering-correct-c88c@gregkh>
References: <20240327122007.2835763-1-sashal@kernel.org>
 <20240327151613.GA1153323@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327151613.GA1153323@dev-arch.thelio-3990X>
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
Cc: Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 08:16:13AM -0700, Nathan Chancellor wrote:
> On Wed, Mar 27, 2024 at 08:20:07AM -0400, Sasha Levin wrote:
> > The patch below does not apply to the 5.10-stable tree.
> > If someone wants it applied there, or to any other stable or longterm
> > tree, then please email the backport, including the original git commit
> > id to <stable@vger.kernel.org>.
> ...
> > ------------------ original commit in Linus's tree ------------------
> > 
> > From 35f20786c481d5ced9283ff42de5c69b65e5ed13 Mon Sep 17 00:00:00 2001
> > From: Nathan Chancellor <nathan@kernel.org>
> > Date: Sat, 27 Jan 2024 11:07:43 -0700
> > Subject: [PATCH] powerpc: xor_vmx: Add '-mhard-float' to CFLAGS
> 
> I have attached a backport that will work for 5.15 and earlier. I think
> you worked around this conflict in 5.15 by taking 04e85bbf71c9 but I am
> not sure that is a smart idea. I think it might just be better to drop
> that dependency and apply this version in 5.15.

I'll go drop it and take this version, thanks!

greg k-h
