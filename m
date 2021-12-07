Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AE646BCA7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:31:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7h650sBWz3dx5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:31:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7h2Q5QPqz2ywg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:28:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7h2Q35Rmz4xh2;
 Wed,  8 Dec 2021 00:28:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Cédric Le Goater <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211201165418.1041842-1-clg@kaod.org>
References: <20211201165418.1041842-1-clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Fix compile when !CONFIG_PPC_POWERNV.
Message-Id: <163888363909.3690807.6557313130555656672.b4-ty@ellerman.id.au>
Date: Wed, 08 Dec 2021 00:27:19 +1100
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 1 Dec 2021 17:54:18 +0100, Cédric Le Goater wrote:
> The automatic "save & restore" of interrupt context is a POWER10/XIVE2
> feature exploited by KVM under the PowerNV platform. It is not
> available under pSeries and the associated toggle should not be
> exposed under the XIVE debugfs directory.
> 
> Introduce a platform handler for debugfs initialization and move the
> 'save-restore' entry under the native (PowerNV) backend to fix compile
> when !CONFIG_PPC_POWERNV.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/xive: Fix compile when !CONFIG_PPC_POWERNV.
      https://git.kernel.org/powerpc/c/2a2ac8a7018b953cd23d770ebd28f8e1ea365df4

cheers
