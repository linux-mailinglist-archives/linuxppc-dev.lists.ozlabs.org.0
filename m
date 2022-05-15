Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFC35276E9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 12:19:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1JJx3tP2z3fb6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 20:19:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1JGC0y9kz3f7f
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 20:17:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1JG93lXtz4xXJ;
 Sun, 15 May 2022 20:17:05 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: benh@kernel.crashing.org, ruscur@russell.cc,
 YueHaibing <yuehaibing@huawei.com>, oohall@gmail.com, mpe@ellerman.id.au,
 nick.child@ibm.com, paulus@samba.org, christophe.leroy@csgroup.eu
In-Reply-To: <20220316104239.26508-1-yuehaibing@huawei.com>
References: <20220316104239.26508-1-yuehaibing@huawei.com>
Subject: Re: [PATCH v2 -next] powerpc/eeh: Remove unused inline functions
Message-Id: <165260954984.1040779.9924441836509487459.b4-ty@ellerman.id.au>
Date: Sun, 15 May 2022 20:12:29 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 16 Mar 2022 18:42:39 +0800, YueHaibing wrote:
> pseries_eeh_init_edev() is exclusively in eeh_pseries.c,
> make it static and remove unused inline function.
> pseries_eeh_init_edev_recursive() is only called from files build
> wich CONFIG_HOTPLUG_PCI_RPA which depends on CONFIG_PSERIES and
> CONFIG_EEH, so can remove the unused inline version.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/eeh: Remove unused inline functions
      https://git.kernel.org/powerpc/c/f06351f8c0c85e2d53e73c53a33b4ef55b4ad6de

cheers
