Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3DB3F0547
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:51:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTpT2CnQz3fQ1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:51:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTgx12dxz3cY6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:46:05 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgv17vGz9sVw; Wed, 18 Aug 2021 23:46:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, benh@kernel.crashing.org, mpe@ellerman.id.au,
 Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20210429174908.16613-1-ldufour@linux.ibm.com>
References: <20210429174908.16613-1-ldufour@linux.ibm.com>
Subject: Re: [PATCH v5] pseries: prevent free CPU ids to be reused on another
 node
Message-Id: <162929391998.3619265.3392197710789152359.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:39 +1000
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Apr 2021 19:49:08 +0200, Laurent Dufour wrote:
> When a CPU is hot added, the CPU ids are taken from the available mask from
> the lower possible set. If that set of values was previously used for CPU
> attached to a different node, this seems to application like if these CPUs
> have migrated from a node to another one which is not expected in real
> life.
> 
> To prevent this, it is needed to record the CPU ids used for each node and
> to not reuse them on another node. However, to prevent CPU hot plug to
> fail, in the case the CPU ids is starved on a node, the capability to reuse
> other nodes’ free CPU ids is kept. A warning is displayed in such a case
> to warn the user.
> 
> [...]

Applied to powerpc/next.

[1/1] pseries: prevent free CPU ids to be reused on another node
      https://git.kernel.org/powerpc/c/bd1dd4c5f5286df0148b5b316f37c583b8f55fa1

cheers
