Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C652D5CDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 15:07:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsG2H3cH1zDqLh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 01:07:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBY42ZJBzDqlD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBY3032Sz9sf8; Thu, 10 Dec 2020 22:30:14 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Bill Wendling <morbo@google.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201017000151.150788-1-morbo@google.com>
References: <20201017000151.150788-1-morbo@google.com>
Subject: Re: [PATCH] powerpc/boot: move the .got section to after the .dynamic
 section
Message-Id: <160756604657.1313423.963415942594743149.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:14 +1100 (AEDT)
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
Cc: Paul Mackerras <paulus@samba.org>, Fangrui Song <maskray@google.com>,
 Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Oct 2020 17:01:51 -0700, Bill Wendling wrote:
> Both .dynamic and .got are RELRO sections and should be placed together,
> and LLD emits an error:
> 
>   ld.lld: error: section: .got is not contiguous with other relro sections
> 
> Place them together to avoid this.

Applied to powerpc/next.

[1/1] powerpc/boot: Move the .got section to after the .dynamic section
      https://git.kernel.org/powerpc/c/a538d184e3f0e3b5f800c5ab148e83bb5cdd0133

cheers
