Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F2B52AF45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 02:40:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2vK15RVDz3cFZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 10:40:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ifBigZ+V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2vJR2xksz3bmR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 10:39:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ifBigZ+V; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L2vJM1qpTz4xZ2;
 Wed, 18 May 2022 10:39:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652834372;
 bh=PfasWlhYL5IIEatPGqyd0PllM8n5gWkCvmvKfOjR5ZI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ifBigZ+VFYy/C+eimo7bpL5w+3/z23uyazvVk5US29tdXqfEiyiE2kgsivrZ9PIIY
 xi0/+sPtH+wVDTUG0qAjQJTiIjqyDqlL2IbsUzxiu+s+dCJ4zWZp+Ehr10/1HqDsYt
 hEKGFpjk44MjU3NvI8HBJAVNkEuJSlxBdnD/xv1GMNgSd69NNeAHvGIltaDYCpZLAr
 uq0Vu4JdKVZ4PcikfUl4RGDPutZ8MoQlrUs82K/KMzD7oqdCZepJvmEPNAhwA6RjgK
 os8uDWp7ExAUFBZdGl8wH36Vnq/WpSfhCyHnbhrrSltUexy+gwulzJLOZshcUK0aCG
 VuB3+hsPMHw2A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
In-Reply-To: <YoQcNkB6R/E3vf51@zeniv-ca.linux.org.uk>
References: <20220421070440.1282704-1-hch@lst.de>
 <YoQcNkB6R/E3vf51@zeniv-ca.linux.org.uk>
Date: Wed, 18 May 2022 10:39:17 +1000
Message-ID: <87y1yzoeru.fsf@mpe.ellerman.id.au>
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
Cc: netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Al Viro <viro@zeniv.linux.org.uk> writes:
> On Thu, Apr 21, 2022 at 09:04:40AM +0200, Christoph Hellwig wrote:
>> csum_and_copy_from_user and csum_and_copy_to_user are exported by
>> a few architectures, but not actually used in modular code.  Drop
>> the exports.
>> 
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> Acked-by: Al Viro <viro@zeniv.linux.org.uk>
>
> Not sure which tree should it go through - Arnd's, perhaps?

It's already in akpm's tree:

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-nonmm-stable&id=6308499b5e99c0c903fde2c605e41d9a86c4be6c

cheers
