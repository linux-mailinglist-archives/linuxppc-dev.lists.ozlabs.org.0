Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CE63639ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:04:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtVf1b9pz3cNN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:04:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVJ5NG0z30FD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:08 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVJ3l0Wz9vDw; Mon, 19 Apr 2021 14:04:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, jniethe5@gmail.com,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <0c3d5cb8a4dfdf6ca1b8aeb385c01470d6628d55.1617283827.git.christophe.leroy@csgroup.eu>
References: <0c3d5cb8a4dfdf6ca1b8aeb385c01470d6628d55.1617283827.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] powerpc/modules: Load modules closer to kernel text
Message-Id: <161880478975.1398509.1364784415611338894.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:49 +1000
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

On Thu, 1 Apr 2021 13:30:41 +0000 (UTC), Christophe Leroy wrote:
> On book3s/32, when STRICT_KERNEL_RWX is selected, modules are
> allocated on the segment just before kernel text, ie on the
> 0xb0000000-0xbfffffff when PAGE_OFFSET is 0xc0000000.
> 
> On the 8xx, TASK_SIZE is 0x80000000. The space between TASK_SIZE and
> PAGE_OFFSET is not used and could be used for modules.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/modules: Load modules closer to kernel text
      https://git.kernel.org/powerpc/c/2ec13df167040cd153c25c4d96d0ffc573ac4c40
[2/3] powerpc/8xx: Define a MODULE area below kernel text
      https://git.kernel.org/powerpc/c/9132a2e82adc6e5a1c7c7385df3bfb25576bdd80
[3/3] powerpc/32s: Define a MODULE area below kernel text all the time
      https://git.kernel.org/powerpc/c/80edc68e0479bafdc4869ec3351e42316b824596

cheers
