Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289BC1098
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 12:31:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46gQ1Q4HSpzDq5b
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 20:31:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46gPzJ3hk6zDr24
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 20:29:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46gPzJ0vTlz9sNw; Sat, 28 Sep 2019 20:29:16 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 253c892193ab58da6b1d94371285971b22c63260
In-Reply-To: <20190926122502.14826-1-oohall@gmail.com>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/eeh: s/CONFIG_IOV/CONFIG_PCI_IOV/
Message-Id: <46gPzJ0vTlz9sNw@ozlabs.org>
Date: Sat, 28 Sep 2019 20:29:16 +1000 (AEST)
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-09-26 at 12:25:02 UTC, Oliver O'Halloran wrote:
> Whoops.
> 
> Fixes: bd6461cc7b3c ("powerpc/eeh: Add a eeh_dev_break debugfs interface")
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/253c892193ab58da6b1d94371285971b22c63260

cheers
