Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 177A353289B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:16:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6s8N0G3Nz3drQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:16:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7R2sq7z3bj3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7P5KWyz4xbd;
 Tue, 24 May 2022 21:15:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: cgel.zte@gmail.com, benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20220407090043.2491854-1-lv.ruyi@zte.com.cn>
References: <20220407090043.2491854-1-lv.ruyi@zte.com.cn>
Subject: Re: [PATCH] powerpc/powernv: fix missing of_node_put in uv_init()
Message-Id: <165339057982.1718562.14767905172605288710.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:39 +1000
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
Cc: lv.ruyi@zte.com.cn, linuxppc-dev@lists.ozlabs.org,
 Zeal Robot <zealci@zte.com.cn>, paulus@samba.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 7 Apr 2022 09:00:43 +0000, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> of_find_compatible_node() returns node pointer with refcount incremented,
> use of_node_put() on it when done.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/powernv: fix missing of_node_put in uv_init()
      https://git.kernel.org/powerpc/c/3ffa9fd471f57f365bc54fc87824c530422f64a5

cheers
