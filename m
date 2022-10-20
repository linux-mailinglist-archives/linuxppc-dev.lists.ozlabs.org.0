Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFAE605BC9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 12:03:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtNT20Hd3z3chN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 21:03:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtNRx5Vslz3c69
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 21:02:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MtNRt4Jxbz4xG9;
	Thu, 20 Oct 2022 21:02:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Haren Myneni <haren@linux.ibm.com>, nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
In-Reply-To: <efa9c16e4a78dda4567a16f13dabfd73cb4674a2.camel@linux.ibm.com>
References: <efa9c16e4a78dda4567a16f13dabfd73cb4674a2.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Use lparcfg to reconfig VAS windows for DLPAR CPU
Message-Id: <166626010935.237349.12980991434334935565.b4-ty@ellerman.id.au>
Date: Thu, 20 Oct 2022 21:01:49 +1100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 06 Oct 2022 22:29:59 -0700, Haren Myneni wrote:
> The hypervisor assigns VAS (Virtual Accelerator Switchboard)
> windows depends on cores configured in LPAR. The kernel uses
> OF reconfig notifier to reconfig VAS windows for DLPAR CPU event.
> In the case of shared CPU mode partition, the hypervisor assigns
> VAS windows depends on CPU entitled capacity, not based on vcpus.
> When the user changes CPU entitled capacity for the partition,
> drmgr uses /proc/ppc64/lparcfg interface to notify the kernel.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries: Use lparcfg to reconfig VAS windows for DLPAR CPU
      https://git.kernel.org/powerpc/c/2147783d6bf0b7ca14c72a25527dc5135bd17f65

cheers
