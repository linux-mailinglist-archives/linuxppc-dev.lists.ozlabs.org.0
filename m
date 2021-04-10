Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9304335AE68
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:34:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHcvK36cdz3f4k
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:34:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHcpB17pvz3bqn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:29:36 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FHcp1204Yz9sVt; Sun, 11 Apr 2021 00:29:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20210318034855.74513-1-aneesh.kumar@linux.ibm.com>
References: <20210318034855.74513-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm: Revert "powerpc/mm: Remove DEBUG_VM_PGTABLE
 support on powerpc"
Message-Id: <161806492656.1467223.6962226855018008061.b4-ty@ellerman.id.au>
Date: Sun, 11 Apr 2021 00:28:46 +1000
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

On Thu, 18 Mar 2021 09:18:55 +0530, Aneesh Kumar K.V wrote:
> This reverts commit 675bceb097e6 ("powerpc/mm: Remove DEBUG_VM_PGTABLE support on powerpc")
> 
> All the related issues are fixed by the series
> https://lore.kernel.org/linux-mm/20200902114222.181353-1-aneesh.kumar@linux.ibm.com
> 
> Hence enable it back

Applied to powerpc/next.

[1/1] powerpc/mm: Revert "powerpc/mm: Remove DEBUG_VM_PGTABLE support on powerpc"
      https://git.kernel.org/powerpc/c/937c49d10b4dc8e81ed1a24ffab8d70bba138af1

cheers
