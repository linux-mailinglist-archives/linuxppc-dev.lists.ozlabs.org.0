Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E98783AC19A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 05:51:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lMc46f5z3c5s
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 13:51:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lMD5VQ5z3bsl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 13:50:47 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5lMB30ZWz9sCD; Fri, 18 Jun 2021 13:50:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <3e5b63bb3daab54a1eb9c20221c2e9528c4db9b3.1622883330.git.christophe.leroy@csgroup.eu>
References: <3e5b63bb3daab54a1eb9c20221c2e9528c4db9b3.1622883330.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/mem: Add back missing header to fix 'no previous
 prototype' error
Message-Id: <162398820924.1362017.13365422518831928702.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:50:09 +1000
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

On Sat, 5 Jun 2021 08:56:09 +0000 (UTC), Christophe Leroy wrote:
> Commit b26e8f27253a ("powerpc/mem: Move cache flushing functions into
> mm/cacheflush.c") removed asm/sparsemem.h which is required when
> CONFIG_MEMORY_HOTPLUG is selected to get the declaration of
> create_section_mapping().
> 
> Add it back.

Applied to powerpc/fixes.

[1/1] powerpc/mem: Add back missing header to fix 'no previous prototype' error
      https://git.kernel.org/powerpc/c/8e11d62e2e8769fe29d1ae98b44b23c7233eb8a2

cheers
