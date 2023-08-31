Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 563E878E555
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 06:11:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rbnlw23FGz3fbN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 14:11:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbncP0lvDz3btq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 14:04:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbncN0bM2z4x2Z;
	Thu, 31 Aug 2023 14:04:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org, Liang He <windhl@126.com>
In-Reply-To: <20230322030423.1855440-1-windhl@126.com>
References: <20230322030423.1855440-1-windhl@126.com>
Subject: Re: [PATCH] powerpc/mpc5xxx: Add missing fwnode_handle_put()
Message-Id: <169345455033.11824.4191703555535957836.b4-ty@ellerman.id.au>
Date: Thu, 31 Aug 2023 14:02:30 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

On Wed, 22 Mar 2023 11:04:23 +0800, Liang He wrote:
> In mpc5xxx_fwnode_get_bus_frequency(), we should add
> fwnode_handle_put() when break out of the iteration
> fwnode_for_each_parent_node() as it will automatically
> increase and decrease the refcounter.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/mpc5xxx: Add missing fwnode_handle_put()
      https://git.kernel.org/powerpc/c/b9bbbf4979073d5536b7650decd37fcb901e6556

cheers
