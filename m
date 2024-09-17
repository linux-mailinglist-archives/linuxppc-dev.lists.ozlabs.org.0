Return-Path: <linuxppc-dev+bounces-1420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CF897AC54
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2024 09:44:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7DMN1NqRz2xrC;
	Tue, 17 Sep 2024 17:44:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726559088;
	cv=none; b=GwdNZN7rt+PC2Atx3i9GWfMqIsROUOrhq8hTtgjyE3sVS78akwv3cbN421/L6BX3fCkUTf1iBpExGVyaXz+npScClOLPaFubQbP3cMWXj8ShMQqUEQgPkBDJhIOL3mUo3G/vWvj8B5lNTeLRqDjcJAYRLIFCAKhjY7/PCiGkOcupVOAZGVgDTn+4y/E25ohnLd6jLdKrFX+SX+YEPXLJOG9kj/8hZJ5PRj0EvehLBqnmIIkpflCWNU5LWXNDEQmLQvJ6wgqbah2ppD4/MSauluRGbRvPT4T2cdSEUKJ0BJcCgpSPXMMgJp5aDBocU6Al+kTo9Vl4UFfi+pJ1lkHZ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726559088; c=relaxed/relaxed;
	bh=HXtH2eVTQf4rqXucFnUKrcwkS/DSICdVqtIc6U1KH5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRflHY6x0f99b7CvIX68I3K37B04V4sG+XIUrDBHhOGF7JeOdJ2Y8VsDiWB56YtMm7IcTtMbzjtblgzAwMMpMowKCZD1juVFwH7CIrQFJ4FvdUGJh8uqRDBIUT7rkmx4380i6kFns5yFvODYFRzksHYOGwN0N04ihieylzVMz31F8q7sx3NaFf4gtzHog91AtZY9jWP+N0wwpLbHCgF/MlLRp9uARMLqOjkwiqnhjqjlnC97xtSpqWk3niU6wOS/eTSVDjdXEPMyltqallKT17+CHJ3FsJ475UVz+k8jElvcAZxcqf67idr5Ccr4QXkvlxnFpiXNfesM8otSvX2Ncg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7DMM3nShz2xb9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 17:44:46 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 48H7bs3P021626;
	Tue, 17 Sep 2024 02:37:54 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 48H7bpcE021625;
	Tue, 17 Sep 2024 02:37:51 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 17 Sep 2024 02:37:50 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu,
        sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, almasrymina@google.com, kuba@kernel.org
Subject: Re: [PATCH] powerpc/atomic: Use YZ constraints for DS-form instructions
Message-ID: <20240917073750.GZ29862@gate.crashing.org>
References: <20240916120510.2017749-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916120510.2017749-1-mpe@ellerman.id.au>
User-Agent: Mutt/1.4.2.3i

Hi!

On Mon, Sep 16, 2024 at 10:05:10PM +1000, Michael Ellerman wrote:
> The 'ld' and 'std' instructions require a 4-byte aligned displacement
> because they are DS-form instructions. But the "m" asm constraint
> doesn't enforce that.
> 
> That can lead to build errors if the compiler chooses a non-aligned
> displacement, as seen with GCC 14:
> 
>   /tmp/ccuSzwiR.s: Assembler messages:
>   /tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is not a multiple of 4)
>   make[5]: *** [scripts/Makefile.build:229: net/core/page_pool.o] Error 1
> 
> Dumping the generated assembler shows:
> 
>   ld 8,39(8)       # MEM[(const struct atomic64_t *)_29].counter, t
> 
> Use the YZ constraints to tell the compiler either to generate a DS-form
> displacement, or use an X-form instruction, either of which prevents the
> build error.

Great explanation text, a perfect commit!  :-)

> See commit 2d43cc701b96 ("powerpc/uaccess: Fix build errors seen with
> GCC 13/14") for more details on the constraint letters.
> 
> Fixes: 9f0cbea0d8cc ("[POWERPC] Implement atomic{, 64}_{read, write}() without volatile")
> Cc: stable@vger.kernel.org # v2.6.24+
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20240913125302.0a06b4c7@canb.auug.org.au
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-By: Segher Boessenkool <segher@kernel.crashing.org>


Segher

