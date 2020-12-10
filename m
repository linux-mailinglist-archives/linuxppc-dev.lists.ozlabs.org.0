Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ABD2D5EE5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 16:03:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsHGt3pHKzDqK3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 02:03:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBYK2pdSzDqgM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBYH5WwXz9shq; Thu, 10 Dec 2020 22:30:27 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Youling Tang <tangyouling@loongson.cn>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <1606460857-2723-1-git-send-email-tangyouling@loongson.cn>
References: <1606460857-2723-1-git-send-email-tangyouling@loongson.cn>
Subject: Re: [PATCH] powerpc: Use common STABS_DEBUG and DWARF_DEBUG and
 ELF_DETAILS macro
Message-Id: <160756605971.1313423.7998345002974297044.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:27 +1100 (AEDT)
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

On Fri, 27 Nov 2020 15:07:37 +0800, Youling Tang wrote:
> Use the common STABS_DEBUG and DWARF_DEBUG and ELF_DETAILS macro rule for
> the linker script in an effort.

Applied to powerpc/next.

[1/1] powerpc: Use common STABS_DEBUG and DWARF_DEBUG and ELF_DETAILS macro
      https://git.kernel.org/powerpc/c/a21df7a1d6ca9bd387a17841863a99431c4aa730

cheers
