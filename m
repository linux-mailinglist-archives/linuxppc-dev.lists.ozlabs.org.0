Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4232C40FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 14:17:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch1f11zYDzDqDs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 00:17:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgztW5cMKzDqWr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:58:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzsx31zPz9sVs; Wed, 25 Nov 2020 22:57:57 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Youling Tang <tangyouling@loongson.cn>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <1604487550-20040-1-git-send-email-tangyouling@loongson.cn>
References: <1604487550-20040-1-git-send-email-tangyouling@loongson.cn>
Subject: Re: [PATCH] powerpc: Use the common INIT_DATA_SECTION macro in
 vmlinux.lds.S
Message-Id: <160630540225.2174375.6381548076973269685.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:57:57 +1100 (AEDT)
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

On Wed, 4 Nov 2020 18:59:10 +0800, Youling Tang wrote:
> Use the common INIT_DATA_SECTION rule for the linker script in an effort
> to regularize the linker script.

Applied to powerpc/next.

[1/1] powerpc: Use the common INIT_DATA_SECTION macro in vmlinux.lds.S
      https://git.kernel.org/powerpc/c/fdcfeaba38e5b183045f5b079af94f97658eabe6

cheers
