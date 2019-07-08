Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4966E618F7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 03:38:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hp4l34gwzDqJR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 11:38:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hnfv1RGbzDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 11:19:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45hnft2p3Fz9sP7; Mon,  8 Jul 2019 11:19:33 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 41732bdc9ccd26829cf647711c4b93384e03e529
In-Reply-To: <20190528032925.8836-1-stewart@linux.ibm.com>
To: Stewart Smith <stewart@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [TRIVIAL] [PATCH] powerpc/powernv-eeh: Consisely desribe what
 this file does
Message-Id: <45hnft2p3Fz9sP7@ozlabs.org>
Date: Mon,  8 Jul 2019 11:19:33 +1000 (AEST)
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
Cc: sbobroff@linux.ibm.com, paulus@samba.org, oohall@gmail.com,
 Stewart Smith <stewart@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-05-28 at 03:29:25 UTC, Stewart Smith wrote:
> If the previous comment made sense, continue debugging or call your
> doctor immediately.
> 
> Signed-off-by: Stewart Smith <stewart@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/41732bdc9ccd26829cf647711c4b93384e03e529

cheers
