Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF5A2DFB9F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 12:42:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzyJK4l9bzDqQX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 22:42:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzxRB41M7zDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 22:03:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CzxR95HsHz9sVn; Mon, 21 Dec 2020 22:03:33 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "xiakaixu1987@gmail.com" <xiakaixu1987@gmail.com>, paulus@ozlabs.org
In-Reply-To: <1604730382-5810-1-git-send-email-kaixuxia@tencent.com>
References: <1604730382-5810-1-git-send-email-kaixuxia@tencent.com>
Subject: Re: [PATCH] KVM: PPC: Book3S: Assign boolean values to a bool variable
Message-Id: <160854857711.1696279.4751962341706112640.b4-ty@ellerman.id.au>
Date: Mon, 21 Dec 2020 22:03:33 +1100 (AEDT)
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
Cc: Kaixu Xia <kaixuxia@tencent.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 7 Nov 2020 14:26:22 +0800, xiakaixu1987@gmail.com wrote:
> Fix the following coccinelle warnings:
> 
> ./arch/powerpc/kvm/book3s_xics.c:476:3-15: WARNING: Assignment of 0/1 to bool variable
> ./arch/powerpc/kvm/book3s_xics.c:504:3-15: WARNING: Assignment of 0/1 to bool variable

Applied to powerpc/next.

[1/1] KVM: PPC: Book3S: Assign boolean values to a bool variable
      https://git.kernel.org/powerpc/c/13751f8747519fe3bdc738fa6d802fbd94a85ac4

cheers
