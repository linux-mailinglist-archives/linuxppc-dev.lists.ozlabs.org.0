Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFEB2B8597
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 21:29:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbvYp32dRzDqcT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 07:29:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gustavoars@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Tk2xsfB/; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbvWP5sPDzDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 07:27:45 +1100 (AEDT)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C80AA2145D;
 Wed, 18 Nov 2020 20:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605731262;
 bh=d7FWe1BlbjtKurhfO3KPp8dTCNr5OMgkoHGS+KpPmec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tk2xsfB/R6tOW3k/29KEexiOlVuxNA4v/ReKorLLX9HVJpkwTcxJ5gyP7oCRyajTz
 VEJpetjg7Oh8ynq42pA903K1njKQrWVsUF0aBbnglvCZWVzD4fciTRs9Nnsa2OTbRO
 dzlwfEBlF9MzzSKr9setF8IqPsLKUtMdLxaGn+uY=
Date: Wed, 18 Nov 2020 14:27:42 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 0/3] PPC: Fix -Wimplicit-fallthrough for clang
Message-ID: <20201118202742.GA15147@embeddedor>
References: <20201118000751.845172-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118000751.845172-1-ndesaulniers@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nick,

On Tue, Nov 17, 2020 at 04:07:48PM -0800, Nick Desaulniers wrote:
> While cleaning up the last few -Wimplicit-fallthrough warnings in tree
> for Clang, I noticed
> commit 6a9dc5fd6170d ("lib: Revert use of fallthrough pseudo-keyword in lib/")
> which seemed to undo a bunch of fixes in lib/ due to breakage in
> arch/powerpc/boot/ not including compiler_types.h.  We don't need
> compiler_types.h for the definition of `fallthrough`, simply
> compiler_attributes.h.  Include that, revert the revert to lib/, and fix
> the last remaining cases I observed for powernv_defconfig.

I've added the series to my -next tree, together with Miguel's
suggestions.

Thanks for the Acks and comments, Michael.

--
Gustavo
