Return-Path: <linuxppc-dev+bounces-10273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E68B074DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jul 2025 13:36:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhvCc3Fmlz30VV;
	Wed, 16 Jul 2025 21:36:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752665804;
	cv=none; b=GRDJc27YqU5kFUpRT+ABImSsYMSGum8UXdlj2h29nmbWYx2g1bC2ILtpxy65V1d25KglMno3s+Uq/f5AO2EcNzIO7cDslS/12025fO6N9i0u4Rz2bOsHCup7VOKweDjZ0mgjB/pLTszBgTu2WMTpNatX2xW7mc/zTlqz6kXmq/vC4mVioaBJ5o2pTkDtQJmXFpZgESdQkygGt4o8SdprAZVW52tpo629RzcMiBVafjoMs/chGUBV2lCKJGPp30Zc2CFgFs1EbA5NvLbWZG0XjbCHZEInuJ9hneCse+WKLo2h1ddPQ3HGe/sUaRqh3q+ffq+I9JiIShWwgkHWPPcQ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752665804; c=relaxed/relaxed;
	bh=wnXs17ea/7GKQ8OHhl+GERFcL8VpoESI9fyR02xJYbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqgraQAufYFou1TgRx1+uZDc4XM8Zmvy4VWRI3qmvdBpmUvao6KzmTC/9+F6mFM9v/DHLksqmmj7F0frr54AVfbJpC52Vm1PcbflaxiZLdY2p7VnYn3CcmaJCJvICf0VgjJtRZzx0furt7JY9kzG+1/1Uz/mw5aFF7gCC3r5orkAvImVE9FHz4aF98vSXycyBdPNJk+ZVhcDKSUr+YL6ferGOrQmBDgAJpN4Cu7BEP5Ag3lZJriiQDS936T4vqPe23KBFZWU/4XZj25j342tF6dMhYB4DGbhpz1rzU0nI47Z9X9UepjzR0lqcbF2pQXM5741Q9AeQZ9wLh3kLcOaDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qPJxqQZ3; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=qPJxqQZ3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhvCb1FYtz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jul 2025 21:36:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DD425C4978;
	Wed, 16 Jul 2025 11:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658ABC4CEF6;
	Wed, 16 Jul 2025 11:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752665799;
	bh=EEdNTQ9edhqImKKR7yL1jTK7X6XNu/ZXDr2nrumJtGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPJxqQZ3oPlFVetdtZGJOHwLUZ+W4aik7mRKj6oMtlTE4gAI2DzexbmQdFgmwTrWr
	 g9MQg64VxCQs9hS1GtIFuF8z17NllNzMN6Ti4lWVxFdfKQLdrOi/ZB7fB+N8QOl/WJ
	 2rbKYmZMOi2IrSgk/dHKbzkXYFL5WS2wfZ9ch6k8=
Date: Wed, 16 Jul 2025 13:36:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, linux-spdx@vger.kernel.org
Subject: Re: [PATCH v3] powerpc: Drop GPL boilerplate text with obsolete FSF
 address
Message-ID: <2025071628-retrace-collected-52b2@gregkh>
References: <20250711072553.198777-1-thuth@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711072553.198777-1-thuth@redhat.com>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 11, 2025 at 09:25:53AM +0200, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> The FSF does not reside in the Franklin street anymore, so we should not
> request the people to write to this address. Fortunately, these header
> files already contain a proper SPDX license identifier, so it should be
> fine to simply drop all of this license boilerplate code here.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

