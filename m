Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 390A83AC20B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:24:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5m5Y6CKSz3c1y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:24:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m496Ggnz3c0G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:49 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4541Wvz9sXb; Fri, 18 Jun 2021 14:22:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <5838caffa269e0957c5a50cc85477876220298b0.1623063174.git.christophe.leroy@csgroup.eu>
References: <5838caffa269e0957c5a50cc85477876220298b0.1623063174.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] powerpc: Define empty_zero_page[] in C
Message-Id: <162398829697.1363949.8863181598389195121.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:36 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 7 Jun 2021 10:56:04 +0000 (UTC), Christophe Leroy wrote:
> At the time being, empty_zero_page[] is defined in each
> platform head.S.
> 
> Define it in mm/mem.c instead, and put it in BSS section instead
> of the DATA section. Commit 5227cfa71f9e ("arm64: mm: place
> empty_zero_page in bss") explains why it is interesting to have
> it in BSS.

Applied to powerpc/next.

[1/3] powerpc: Define empty_zero_page[] in C
      https://git.kernel.org/powerpc/c/45b30fafe528601f1a4449c9d68d8ebe7bbc39ad
[2/3] powerpc: Define swapper_pg_dir[] in C
      https://git.kernel.org/powerpc/c/e72421a085a8dc81c71b0daeb89612279c2c621c
[3/3] powerpc/32s: Rename PTE_SIZE to PTE_T_SIZE
      https://git.kernel.org/powerpc/c/91e9ee7e949bff08cc3845a4811185e826b6e2f1

cheers
