Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281423572C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 15:43:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKMg02QmCzDqHg
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 23:43:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMT00SlMzDqHg
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:35:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMSz4l3Vz9sTK; Sun,  2 Aug 2020 23:34:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
In-Reply-To: <20200728155039.401445-1-cascardo@canonical.com>
References: <20200728155039.401445-1-cascardo@canonical.com>
Subject: Re: [PATCH] selftests/powerpc: return skip code for spectre_v2
Message-Id: <159637523453.42190.2614653860464292630.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:34:59 +1000 (AEST)
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
Cc: Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jul 2020 12:50:39 -0300, Thadeu Lima de Souza Cascardo wrote:
> When running under older versions of qemu of under newer versions with old
> machine types, some security features will not be reported to the guest.
> This will lead the guest OS to consider itself Vulnerable to spectre_v2.
> 
> So, spectre_v2 test fails in such cases when the host is mitigated and miss
> predictions cannot be detected as expected by the test.
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/powerpc: Return skip code for spectre_v2
      https://git.kernel.org/powerpc/c/f3054ffd71b5afd44832b2207e6e90267e1cd2d1

cheers
