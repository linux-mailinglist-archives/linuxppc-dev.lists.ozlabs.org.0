Return-Path: <linuxppc-dev+bounces-262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E8695977A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:08:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wphq6159Wz2yDt;
	Wed, 21 Aug 2024 20:08:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k66gheOZ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wphq50KHJz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 20:08:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724234881;
	bh=q05tTq/Z6zBxyd46tN+4KHNBHV/+WJTKBhTTT5LEJag=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k66gheOZDufQe66+f7wNRVICsfTUj5hdvGLkpW/Po/Hx3m+3yLN/zGL/RwhnmBQHO
	 UYoPPC2xwymEfE5h6R0aWvG6Gq1VBj1i0Kr4o2aPL4tpnPbgjJgqox93V9x/Xu/FZm
	 usuoALNZZDY0d1CGryG0pXhu38AFxTClZLtKhNeAnkzGQlB9YPkgDRuL6Xijt252Ej
	 ZkCueBW8WH7mse6a5cuWVh1MFKAbAMrgXy4mtZmwY8bCNt6nEG/czgHgp1N1PqHam/
	 5KmL3RqtXlz+waR0OkgzlNOEZwOcN4hhg76GiLC+UjJD7KT31v3y+O3iwS70u5FAPW
	 mqCjcOHi0xo2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wphq43yLYz4x11;
	Wed, 21 Aug 2024 20:08:00 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, tyreld@linux.ibm.com, brking@linux.ibm.com,
 hbabu@us.ibm.com, Haren Myneni <haren@linux.ibm.com>, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH] powerpc/pseries: Use correct data types from
 pseries_hp_errorlog struct
In-Reply-To: <20240821053939.803169-1-haren@linux.ibm.com>
References: <20240821053939.803169-1-haren@linux.ibm.com>
Date: Wed, 21 Aug 2024 20:08:00 +1000
Message-ID: <87seuyrxxb.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Haren Myneni <haren@linux.ibm.com> writes:
> _be32 type is defined for some elements in pseries_hp_errorlog
> struct but also used them u32 after be32_to_cpu() conversion.
>
> Example: In handle_dlpar_errorlog()
> hp_elog->_drc_u.drc_index = be32_to_cpu(hp_elog->_drc_u.drc_index);
>
> And later assigned to u32 type
> dlpar_cpu() - u32 drc_index = hp_elog->_drc_u.drc_index;
>
> This incorrect usage is giving the following warnings and the
> patch resolve these warnings with the correct assignment.
>
> arch/powerpc/platforms/pseries/dlpar.c:398:53: sparse: sparse:
> incorrect type in argument 1 (different base types) @@
> expected unsigned int [usertype] drc_index @@
> got restricted __be32 [usertype] drc_index @@
> ...
> arch/powerpc/platforms/pseries/dlpar.c:418:43: sparse: sparse:
> incorrect type in assignment (different base types) @@
> expected restricted __be32 [usertype] drc_count @@
> got unsigned int [usertype] @@
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202408182142.wuIKqYae-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202408182302.o7QRO45S-lkp@intel.com/
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

Thanks for fixing these.

I'd prefer it if you could rebase this to go at the start of your DLPAR
IO series, ie. fix the existing errors first, and then add your series
on top of that.

cheers

