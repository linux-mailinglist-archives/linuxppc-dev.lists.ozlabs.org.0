Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD3539CEF8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:19:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FybCZ5LdSz3fpL
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:19:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb3W365mz30GS
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:23 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb3S67zcz9t1r; Sun,  6 Jun 2021 22:12:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, paulus@samba.org, benh@kernel.crashing.org,
 YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20210514071041.17432-1-yuehaibing@huawei.com>
References: <20210514071041.17432-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] powerpc/pseries/memhotplug: Remove unused inline
 function dlpar_memory_remove()
Message-Id: <162298131833.2353459.4514813747754717384.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:38 +1000
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

On Fri, 14 May 2021 15:10:41 +0800, YueHaibing wrote:
> dlpar_memory_remove() is never used, so can be removed.

Applied to powerpc/next.

[1/1] powerpc/pseries/memhotplug: Remove unused inline function dlpar_memory_remove()
      https://git.kernel.org/powerpc/c/9b373899e9606d252364191ce2b385043a8808bc

cheers
