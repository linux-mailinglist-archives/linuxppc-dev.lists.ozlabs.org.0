Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF22C40E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 14:07:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch1QB0DH1zDqdL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 00:07:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgztM47LwzDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:58:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzt11Fb0z9sWH; Wed, 25 Nov 2020 22:58:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: ajd@linux.ibm.com, paulus@samba.org, fbarrat@linux.ibm.com,
 mpe@ellerman.id.au, "xiakaixu1987@gmail.com" <xiakaixu1987@gmail.com>,
 benh@kernel.crashing.org
In-Reply-To: <1605007170-22171-1-git-send-email-kaixuxia@tencent.com>
References: <1605007170-22171-1-git-send-email-kaixuxia@tencent.com>
Subject: Re: [PATCH] powerpc/powernv/sriov: fix unsigned int win compared to
 less than zero
Message-Id: <160630540323.2174375.1396661836713301035.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:58:00 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, Kaixu Xia <kaixuxia@tencent.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 10 Nov 2020 19:19:30 +0800, xiakaixu1987@gmail.com wrote:
> Fix coccicheck warning:
> 
> ./arch/powerpc/platforms/powernv/pci-sriov.c:443:7-10: WARNING: Unsigned expression compared with zero: win < 0
> ./arch/powerpc/platforms/powernv/pci-sriov.c:462:7-10: WARNING: Unsigned expression compared with zero: win < 0

Applied to powerpc/next.

[1/1] powerpc/powernv/sriov: fix unsigned int win compared to less than zero
      https://git.kernel.org/powerpc/c/027717a45ca251a7ba67a63db359994836962cd2

cheers
