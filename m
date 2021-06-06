Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E4B39CED0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:13:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyb5G2m24z3bwp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:13:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb3D0r0Wz306g
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:08 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb3B0qBZz9sWH; Sun,  6 Jun 2021 22:12:05 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <2541e4e415505b27db8ccbb8977035c20e408ef4.1620405461.git.christophe.leroy@csgroup.eu>
References: <2541e4e415505b27db8ccbb8977035c20e408ef4.1620405461.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/8xx: Update mpc885_ads_defconfig to improve CI
Message-Id: <162298131541.2353459.4370077652152199678.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:35 +1000
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

On Fri, 7 May 2021 16:37:53 +0000 (UTC), Christophe Leroy wrote:
> mpc885_ads_defconfig is used by several CI robots.
> 
> A few functionnalities are specific to 8xx and are not covered
> by other default configuration, so improve build test coverage
> by adding them to mpc885_ads_defconfig.
> 
> 8xx is the only platform supporting 16k page size in addition
> to 4k page size. Considering that 4k page size is widely tested
> by other configurations, lets make 16k pages the selection for
> 8xx, as it has demonstrated in the past to be a weakness.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/8xx: Update mpc885_ads_defconfig to improve CI
      https://git.kernel.org/powerpc/c/9a1762a4a4ff3cc096c605212165f59481e84503

cheers
