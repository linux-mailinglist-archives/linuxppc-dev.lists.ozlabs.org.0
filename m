Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFE32C409E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:54:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch1711cf6zDqft
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 23:54:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgzt73BYnzDqdp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:58:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzsw4TNYz9sVx; Wed, 25 Nov 2020 22:57:55 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201023024539.9512-1-po-hsu.lin@canonical.com>
References: <20201023024539.9512-1-po-hsu.lin@canonical.com>
Subject: Re: [PATCHv2] selftests/powerpc/eeh: disable kselftest timeout
 setting for eeh-basic
Message-Id: <160630540002.2174375.2388323036006565077.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:57:55 +1100 (AEDT)
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
Cc: mathieu.desnoyers@efficios.com, shuah@kernel.org, joe.lawrence@redhat.com,
 mbenes@suse.cz
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 23 Oct 2020 10:45:39 +0800, Po-Hsu Lin wrote:
> The eeh-basic test got its own 60 seconds timeout (defined in commit
> 414f50434aa2 "selftests/eeh: Bump EEH wait time to 60s") per breakable
> device.
> 
> And we have discovered that the number of breakable devices varies
> on different hardware. The device recovery time ranges from 0 to 35
> seconds. In our test pool it will take about 30 seconds to run on a
> Power8 system that with 5 breakable devices, 60 seconds to run on a
> Power9 system that with 4 breakable devices.
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/powerpc/eeh: disable kselftest timeout setting for eeh-basic
      https://git.kernel.org/powerpc/c/f5eca0b279117f25020112a2f65ec9c3ea25f3ac

cheers
