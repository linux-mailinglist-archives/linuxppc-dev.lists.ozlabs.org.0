Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF477274DC0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 02:18:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwzL74xGpzDqY4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 10:18:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwz9n07l1zDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 10:11:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=ft7brIP1; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4Bwz9m5k2Rz9sTg; Wed, 23 Sep 2020 10:11:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1600819884; bh=zpg+PBUfeJ7GI3Gz66qYPvlYKR/QNsHAQJk+f2ycHTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ft7brIP1rvFIR4NTmNsJKzMfXV/89YfNorLxZNlXAM6KmlKaM7W9wyGGSrRejyent
 hGPBgJ5wgrV4+1+ZsGf0ATuFH+qbWk2KJo8wQ55trRHmqUIJddBrWmVXaRvr8rswaB
 5Qu1qoSeMzNasAuEtpDGgAChHH29TUCLVDNrohxWvpZPtMMHQMavzYDT3jHlykaCti
 +8wYSgtTZRf6rcGOCmVOAzlWxkK1pNjcgR5KCKSIBZFQ0UWtyisEQDajmfFkDk36AL
 W7phA3GAObn8S/xZcWn2ZFUt6nxQXC5k3PDqYNWPVD4zh93d11bCnv3QiGtPTBJyyj
 YA+e/ut9cgDeA==
Date: Wed, 23 Sep 2020 10:10:20 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] KVM: PPC: Don't return -ENOTSUPP to userspace in ioctls
Message-ID: <20200923001020.GF531519@thinks.paulus.ozlabs.org>
References: <159982162511.459323.13495475646618845164.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159982162511.459323.13495475646618845164.stgit@bahia.lan>
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
Cc: trivial@kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 11, 2020 at 12:53:45PM +0200, Greg Kurz wrote:
> ENOTSUPP is a linux only thingy, the value of which is unknown to
> userspace, not to be confused with ENOTSUP which linux maps to
> EOPNOTSUPP, as permitted by POSIX [1]:
> 
> [EOPNOTSUPP]
> Operation not supported on socket. The type of socket (address family
> or protocol) does not support the requested operation. A conforming
> implementation may assign the same values for [EOPNOTSUPP] and [ENOTSUP].
> 
> Return -EOPNOTSUPP instead of -ENOTSUPP for the following ioctls:
> - KVM_GET_FPU for Book3s and BookE
> - KVM_SET_FPU for Book3s and BookE
> - KVM_GET_DIRTY_LOG for BookE
> 
> This doesn't affect QEMU which doesn't call the KVM_GET_FPU and
> KVM_SET_FPU ioctls on POWER anyway since they are not supported,
> and _buggily_ ignores anything but -EPERM for KVM_GET_DIRTY_LOG.
> 
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Thanks, applied.

Paul.
