Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFF584CCC1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 15:29:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HmqWNc40;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVMv86Mpbz3cQX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 01:29:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HmqWNc40;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVMtP730rz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Feb 2024 01:28:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BABE5CE18F6;
	Wed,  7 Feb 2024 14:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFE9C433F1;
	Wed,  7 Feb 2024 14:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707316120;
	bh=T09NH+K9OB+5cBRVizzfGFKyrC8gvkvf+GGOCbIop6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmqWNc40Wn8O+g2p5nCZRDdlHBgUdcSN7gF43458D1PwN4svHHFHuP4QEf4/DOw4N
	 28bSY1wFrKHOe+iQOF23kKamdoiGMrpHVxGnPbcEDLsQ+EqCyGbgpVa9q0aKGUNe2W
	 i85cJohoGvsPpsKdkgyAmG2P95AmsgLCk5+Hh2rMnlcTuiEsYCByfR5I3EtVvO+KHq
	 1//9zynIJFJo++t4TXcmsStuLflTh0Oosv9wtTAfA95mwV+vq4qYXkHsUJ+Er+2L3H
	 yt+CJIZEXJ6lb40ggUy18ZfMdtfttrThzsAVcNCpQqPiLhN1Oa3kPUDUrlwItdctEA
	 DKBWg1W75H6kg==
Date: Wed, 7 Feb 2024 15:28:37 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH 5/5] sched/vtime: do not include <asm/vtime.h> header
Message-ID: <ZcOTlZwYo1n4-myD@localhost.localdomain>
References: <cover.1706470223.git.agordeev@linux.ibm.com>
 <2402f44309e1c9705501bdc9b798e8fe6d73f905.1706470223.git.agordeev@linux.ibm.com>
 <ZcLBAKMJ5Vbbm2Ln@localhost.localdomain>
 <ZcOP6bm0ekxDUVk6@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcOP6bm0ekxDUVk6@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le Wed, Feb 07, 2024 at 03:12:57PM +0100, Alexander Gordeev a écrit :
> On Wed, Feb 07, 2024 at 12:30:08AM +0100, Frederic Weisbecker wrote:
> > Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
> 
> Thank you for the review, Frederic!
> 
> The Heiko comment is valid and I would add this chunk in v2:
> 
> --- a/arch/powerpc/include/asm/Kbuild
> +++ b/arch/powerpc/include/asm/Kbuild
> @@ -6,5 +6,4 @@ generic-y += agp.h
>  generic-y += kvm_types.h
>  generic-y += mcs_spinlock.h
>  generic-y += qrwlock.h
> -generic-y += vtime.h
>  generic-y += early_ioremap.h
> 
> Would you keep your Reviewed-by?

Sure!
