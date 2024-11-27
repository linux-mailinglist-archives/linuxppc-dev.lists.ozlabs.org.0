Return-Path: <linuxppc-dev+bounces-3591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C219DAEF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2024 22:30:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzCKB0q1Mz2xf7;
	Thu, 28 Nov 2024 08:30:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732743022;
	cv=none; b=THK+cIprwUUVcOY6A34NxqU7xniGIyw7Qv1cuERMjNY97NsIQNvurnVdZ8pitgyDdf43osvlAUFad/31IdhZlI9IEMhguO/HWmNrJBsFzv8Uyzag443WdnGLRCRkJmh3oFp2wU3dHFSltwybnLPz04+30MiJZMoWWLj3eJLW/EojAdQ2Jsd4Y9RQ2Q7XnRKK1obHSFbgmc0mekuwHs3GWkK/JC9XoMI/D5xwspAKH+kP5A1G/2CpKzRGXqauiN1WOevigYwG9XzegacIFl9hMbv2CNuS3beJ1CNrRPOABvWrWaerajaxhEKfKVpQDflXEoCUPCAtA8K3gzFqCJNu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732743022; c=relaxed/relaxed;
	bh=RycxGQllmYs1Ywc92x6jS1gae5cW4xksFUq6Soi02QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6iX3eHd/PXnOO9ytcOQdsxMWPCNIJrkl9R6dthRGyKg3t3wYHCQsqW81YjHJnskqhMIWOQ88gW9819CVUU5kFQUXL0F/+zSbnXCJJxNU9sbkNEn9DL7PE8xNZP9KTAX4ADojG6qWCvFL9xEXGQtqZZ+yGvPFl/Dbn6r61/ii5TKq+r7m3DJsocnNoTqGWKWL5H0VtZ/+itge/JUfeoznJz/HBPiZC5OpBSfZ+iBIjnschKzwMmp+yapOXbYaRfQfUNsfnUQVgBP1wyneTgbjKX2s6LR7ctmhTMmySGudUNfL0rgrgbgJo7HgeryjiFYRXRN0n8tyiMEstyAXB6Hjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzCK72b4lz2xYw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 08:30:19 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4ARLR3GW027113;
	Wed, 27 Nov 2024 15:27:04 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4ARLR2qE027111;
	Wed, 27 Nov 2024 15:27:02 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 27 Nov 2024 15:27:02 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, jk@ozlabs.org,
        arnd@arndb.de, geoff@infradead.org
Subject: Re: [RFC PATCH 01/20] powerpc/cell: Remove support for IBM Cell Blades
Message-ID: <20241127212702.GP29862@gate.crashing.org>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi!

On Thu, Nov 14, 2024 at 11:50:50PM +1100, Michael Ellerman wrote:
> IBM Cell Blades used the Cell processor and the "blade" server form
> factor. They were sold as models QS20, QS21 & QS22 from roughly 2006 to
> 2012 [1]. They were used in a few supercomputers (eg. Roadrunner) that
> have since been dismantled, and were not that widely used otherwise.

Sad to see this go as well as native powerpc blades just days ago.  But
yeah it is time (and we are all getting old, etc.)

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>

> Until recently I still had a working QS22, which meant I was able to
> keep the platform support working, but unfortunately that machine has
> now died.

You're only sad for sentimental reasons, I hope?  :-)


Segher

