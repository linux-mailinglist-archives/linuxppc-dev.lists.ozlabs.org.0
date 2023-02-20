Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 033CC69C4A1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 04:53:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKpRN5xVXz3cHm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 14:53:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKpPm4yntz3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 14:51:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKpPm23NKz4x87;
	Mon, 20 Feb 2023 14:51:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230209105649.127707-1-ganeshgr@linux.ibm.com>
References: <20230209105649.127707-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH] powerpc/eeh: Set channel state after notifying the drivers
Message-Id: <167686495538.2406274.5208914281523648348.b4-ty@ellerman.id.au>
Date: Mon, 20 Feb 2023 14:49:15 +1100
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
Cc: dick.kennedy@broadcom.com, oohall@gmail.com, mahesh@linux.ibm.com, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 9 Feb 2023 16:26:49 +0530, Ganesh Goudar wrote:
> When a PCI error is encountered 6th time in an hour we
> set the channel state to perm_failure and notify the
> driver about the permanent failure.
> 
> However, after upstream commit 38ddc011478e ("powerpc/eeh:
> Make permanently failed devices non-actionable"), EEH handler
> stops calling any routine once the device is marked as
> permanent failure. This issue can lead to fatal consequences
> like kernel hang with certain PCI devices.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/eeh: Set channel state after notifying the drivers
      https://git.kernel.org/powerpc/c/9efcdaac36e1643a1b7f5337e6143ce142d381b1

cheers
