Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D6A2D5C01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 14:38:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsFPC6YY9zDr0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 00:38:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXx1bWGzDqlD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXv4cNwz9sXc; Thu, 10 Dec 2020 22:30:07 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 Ganesh Goudar <ganeshgr@linux.ibm.com>
In-Reply-To: <20201130083057.135610-1-ganeshgr@linux.ibm.com>
References: <20201130083057.135610-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v5] lkdtm/powerpc: Add SLB multihit test
Message-Id: <160756606193.1313423.7582264181427808989.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:07 +1100 (AEDT)
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
Cc: msuchanek@suse.de, mahesh@linux.ibm.com, npiggin@gmail.com,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 30 Nov 2020 14:00:57 +0530, Ganesh Goudar wrote:
> To check machine check handling, add support to inject slb
> multihit errors.

Applied to powerpc/next.

[1/1] lkdtm/powerpc: Add SLB multihit test
      https://git.kernel.org/powerpc/c/3ba150fb21207e4a7f4b600eb2dbbe83f94571fe

cheers
