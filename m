Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DD63D259
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:47:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZB41w7Qz3gt7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:47:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYtf4LDBz3fPc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:34:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYtf30w7z4xvh;
	Wed, 30 Nov 2022 20:34:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: joel@jms.id.au, npiggin@gmail.com, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, mpe@ellerman.id.au, ruanjinjie <ruanjinjie@huawei.com>, Julia.Lawall@inria.fr, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221019063414.3758087-1-ruanjinjie@huawei.com>
References: <20221019063414.3758087-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH -next v2] powerpc/mpic_msgr: fix cast removes address space of expression warnings
Message-Id: <166980024887.3017288.841160634700021311.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:24:08 +1100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 19 Oct 2022 14:34:14 +0800, ruanjinjie wrote:
> When build Linux kernel, encounter the following warnings:
> 
> ./arch/powerpc/sysdev/mpic_msgr.c:230:38: warning: cast removes address space '__iomem' of expression
> ./arch/powerpc/sysdev/mpic_msgr.c:230:27: warning: incorrect type in assignment (different address spaces)
> 
> The data type of msgr->mer and msgr->base are 'u32 __iomem *', but
> converted to 'u32 *' and 'u8 *' directly and cause above warnings, now
> instead of using a type cast, change the size of the pointer offset to fix
> these warnings.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/mpic_msgr: fix cast removes address space of expression warnings
      https://git.kernel.org/powerpc/c/16a3f41ff3322830683d3ccc14d77736829c61bf

cheers
