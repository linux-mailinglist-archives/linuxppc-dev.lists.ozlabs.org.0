Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B333A34F7CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:21:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Cmv5G9jz3c8q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:21:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=BKD9ckIu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=BKD9ckIu; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9CmS5YC3z30B7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 15:20:56 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4F9CmR3vGHz9sWQ; Wed, 31 Mar 2021 15:20:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617164455; bh=wCCS9x+0BkoEX0cVVG+0NhLVg9XU1CuM70ITQy8JHDQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BKD9ckIuW6EnC9ffmjIC3iQ/aivwmDsUaoQEjocIdV3hSsRTZAzKCCAXTWrwwVG5z
 Wi8V+ICzuDfBQcozE6O7qNKgcp7y57bgSFQYETDTzTheumKhwIYT2jN7elMQj5inIv
 4I31Gj90JOJ+VRHGvmTcagUZInlcQtlSF+Ro20tWLUhaCF8qusckMOULCQGYymOlH0
 z880TMaIm3fvwCCy9/KFtFlSPoFdWF+N2KzzXHa2Rh66EvvgP6IPIDiEip8dJncpS4
 dRpVGmOVh4VhHnDQ9qiWWNmRXoB57tRcN4GwEQPSnjsUnvxBaO84eRtU4ZeEdE8wMa
 tJt3hQPiyEzzA==
Date: Wed, 31 Mar 2021 13:47:12 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 01/46] KVM: PPC: Book3S HV: Nested move LPCR
 sanitising to sanitise_hv_regs
Message-ID: <YGPisFlG2VjX05iZ@thinks.paulus.ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323010305.1045293-2-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 11:02:20AM +1000, Nicholas Piggin wrote:
> This will get a bit more complicated in future patches. Move it
> into the helper function.

This does change L1-visible behaviour, because now the L1 hypervisor
can see the LPCR bits that L0 is using, whereas previously it couldn't
(and that was deliberate).  I can't point to a specific scenario where
that is a real problem, but nevertheless it worries me.  And the
behaviour change should have been mentioned in the commit message at
least.

Paul.
