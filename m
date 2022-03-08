Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B090D4D16F7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:12:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCZ2g4Fx3z3dNb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 23:12:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCZ0j712xz3bYw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 23:10:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCZ0j5TNkz4xxx;
 Tue,  8 Mar 2022 23:10:45 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 Haren Myneni <haren@linux.ibm.com>, nathanl@linux.ibm.com
In-Reply-To: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
References: <3968502921a0ce3c332d7fe8da8545ae85fc09d0.camel@linux.ibm.com>
Subject: Re: [PATCH v6 0/9] powerpc/pseries/vas: NXGZIP support with DLPAR
Message-Id: <164674126387.3322453.7027227419911490620.b4-ty@ellerman.id.au>
Date: Tue, 08 Mar 2022 23:07:43 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Feb 2022 17:09:57 -0800, Haren Myneni wrote:
> PowerPC provides HW compression with NX coprocessor. This feature
> is available on both PowerNV and PowerVM and included in Linux.
> Since each powerpc chip has one NX coprocessor, the VAS introduces
> the concept of windows / credits to manage access to this hardware
> resource. On powerVM, these limited resources should be available
> across all LPARs. So the hypervisor assigns the specific credits
> to each LPAR based on processor entitlement so that one LPAR does
> not overload NX. The hypervisor can reject the window open request
> to a partition if exceeds its credit limit (1 credit per window).
> 
> [...]

Applied to powerpc/next.

[1/9] powerpc/pseries/vas: Use common names in VAS capability structure
      https://git.kernel.org/powerpc/c/40562fe4fa3d94c7462ec909ab89b075e26c59ac
[2/9] powerpc/pseries/vas: Save PID in pseries_vas_window struct
      https://git.kernel.org/powerpc/c/976410cd2cb4c6ed53bd12c192fc46bbcc0fbce7
[3/9] powerpc/vas: Add paste address mmap fault handler
      https://git.kernel.org/powerpc/c/1fe3a33ba0a37e7aa0df0acbe31d5dda7610c16e
[4/9] powerpc/vas: Return paste instruction failure if no active window
      https://git.kernel.org/powerpc/c/b5c63d90cc2de8ac6724fec84d1d72cfebcae41d
[5/9] powerpc/vas: Map paste address only if window is active
      https://git.kernel.org/powerpc/c/6a8d4ca891aa5f9402973eab5d7d9cf3929678b7
[6/9] powerpc/pseries/vas: Close windows with DLPAR core removal
      https://git.kernel.org/powerpc/c/8ef7b9e1765a52c8023d9133a2438ac9f6da486a
[7/9] powerpc/pseries/vas: Reopen windows with DLPAR core add
      https://git.kernel.org/powerpc/c/c656cfe571a9b8b882e31177f554bd79141fc015
[8/9] powerpc/pseries/vas: sysfs interface to export capabilities
      https://git.kernel.org/powerpc/c/b903737bc522e0ef3f45a2a60c364ff547572c9b
[9/9] powerpc/pseries/vas: Add 'update_total_credits' entry for QoS capabilities
      https://git.kernel.org/powerpc/c/45f06eac30e5abebecc66e41e7c89d5b4413bac1

cheers
