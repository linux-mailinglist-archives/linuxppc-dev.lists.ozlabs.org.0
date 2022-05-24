Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 727555328F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:27:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sPc2Ydbz3h9k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:27:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s800Psrz3cDk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:16:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7z6qnFz4yTQ;
 Tue, 24 May 2022 21:15:59 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220404101536.104794-1-ruscur@russell.cc>
References: <20220404101536.104794-1-ruscur@russell.cc>
Subject: Re: [PATCH v2 1/2] powerpc/powernv: Get L1D flush requirements from
 device-tree
Message-Id: <165339056252.1718562.14599568205155142624.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:22 +1000
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
Cc: mopsfelder@gmail.com, joel@jms.id.au, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 4 Apr 2022 20:15:35 +1000, Russell Currey wrote:
> The device-tree properties no-need-l1d-flush-msr-pr-1-to-0 and
> no-need-l1d-flush-kernel-on-user-access are the equivalents of
> H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY and H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS
> from the H_GET_CPU_CHARACTERISTICS hcall on pseries respectively.
> 
> In commit d02fa40d759f ("powerpc/powernv: Remove POWER9 PVR version
> check for entry and uaccess flushes") the condition for disabling the
> L1D flush on kernel entry and user access was changed from any non-P9
> CPU to only checking P7 and P8.  Without the appropriate device-tree
> checks for newer processors on powernv, these flushes are unnecessarily
> enabled on those systems.  This patch corrects this.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/powernv: Get L1D flush requirements from device-tree
      https://git.kernel.org/powerpc/c/2efee6adb56159288bce9d1ab51fc9056d7007d4
[2/2] powerpc/powernv: Get STF barrier requirements from device-tree
      https://git.kernel.org/powerpc/c/d2a3c131981d4498571908df95c3c9393a00adf5

cheers
