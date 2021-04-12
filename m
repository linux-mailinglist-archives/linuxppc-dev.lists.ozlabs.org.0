Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F835C1B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 11:42:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJkKj2jdsz3bxN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 19:42:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EI0crJes;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EI0crJes; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJkKF42Npz309p
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 19:41:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FJkK23pJvz9sCD;
 Mon, 12 Apr 2021 19:41:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618220503;
 bh=qKUReVSabx2CuMNjbJlsyrB/4dzn/agdSM7iEVUdJFE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EI0crJes1a/+RqdpvZLEAvaeJSuKP8N8cwfdww93gWYxTDEwk/z7w5zNQZG5BAEZd
 ev3Jn5y9op0/i9JCxYb9TguxAMm8bB/voRAgJLL4Ijy05V7KcdYLFTXDKOke8vJbCS
 RjzGshVhLlUYRHa2SNMBvGbr1dFb2MSejY1iYDIauJls7QOB5ypl7lVgKongVwTmuD
 7h+MR2KVudCiNQSNYaaKPV9eqVoxbvnpndlLZmB3u5KZfN+rX/LVphobTYVG53Z3+L
 d6f1izCOSt7lDm1hwVd+/bwDl0PSXgw/yDq+w0FxS9jnvnqXM2ThTwAITB7vaKbRMa
 6M/gf3g51FSHQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alex Williamson <alex.williamson@redhat.com>, Christoph Hellwig
 <hch@lst.de>
Subject: Re: [PATCH 1/2] vfio/pci: remove vfio_pci_nvlink2
In-Reply-To: <20210406133805.715120bd@omen>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210326061311.1497642-2-hch@lst.de> <20210406133805.715120bd@omen>
Date: Mon, 12 Apr 2021 19:41:41 +1000
Message-ID: <87y2dndelm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-api@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alex Williamson <alex.williamson@redhat.com> writes:
> On Fri, 26 Mar 2021 07:13:10 +0100
> Christoph Hellwig <hch@lst.de> wrote:
>
>> This driver never had any open userspace (which for VFIO would include
>> VM kernel drivers) that use it, and thus should never have been added
>> by our normal userspace ABI rules.
>> 
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> ---
>>  drivers/vfio/pci/Kconfig            |   6 -
>>  drivers/vfio/pci/Makefile           |   1 -
>>  drivers/vfio/pci/vfio_pci.c         |  18 -
>>  drivers/vfio/pci/vfio_pci_nvlink2.c | 490 ----------------------------
>>  drivers/vfio/pci/vfio_pci_private.h |  14 -
>>  include/uapi/linux/vfio.h           |  38 +--
>>  6 files changed, 4 insertions(+), 563 deletions(-)
>>  delete mode 100644 drivers/vfio/pci/vfio_pci_nvlink2.c
>
> Hearing no objections, applied to vfio next branch for v5.13.  Thanks,

Looks like you only took patch 1?

I can't take patch 2 on its own, that would break the build.

Do you want to take both patches? There's currently no conflicts against
my tree. It's possible one could appear before the v5.13 merge window,
though it would probably just be something minor.

Or I could apply both patches to my tree, which means patch 1 would
appear as two commits in the git history, but that's not a big deal.

cheers
