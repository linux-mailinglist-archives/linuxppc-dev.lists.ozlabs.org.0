Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 679401FCE3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 02:47:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454CRq6k0PzDqYb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 10:47:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="RGfeY+Ei"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mdw7NRqi"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454CQQ30fHzDqW6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 10:45:49 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7FE4724A04;
 Wed, 15 May 2019 20:45:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 15 May 2019 20:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 /YDwV085UjKZA654xSuAgfTo7pQrWZK+OmBr0uozDO4=; b=RGfeY+EiBORowX+x
 fZ3ggqIZCKtXuNYod/r2SDB4qJDPyyOCWCHr0Qm+m6fHo1yuoHmsmTSLZA5AC+3X
 JfbNZ9/gJqdI3UwEwpWU/qw6OVGBo3ioz/lY19JZK/9PUATu17WV1hcH2z+sOolK
 sIYbcHvmTyiD0CsUxjlTVFlFJSJxf9foMgso9LRd6CkRTKvBgBKJd8PLVRpTBHOh
 l8MKfX17lAlswKzwbyklTG4e+cJrbXKmUi1BvVaKIz0jZMapQ4rCtXjZrn32Rmmc
 er5xe3vcjTDPdbB4rkLNQ8s2mvnwfHRLi09jN7f3BaJKmuOKQh8og4O+cW2t50Td
 it9naQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=/YDwV085UjKZA654xSuAgfTo7pQrWZK+OmBr0uozD
 O4=; b=mdw7NRqi//BnmrLVPqOsqIUQnvA8K9ze9zngTw+f/d7bI52iWGnYS003k
 edrwaXlbJFXDyOMdzdtFjlWSXFaxbo332Qx7t2G2o7CDyECFbx+sj4B513YLw0cc
 9nj4rzZQ/Zdn9URf/ZXQcjGwFmWPoElEsbqjVGwveqE9JXNiqic8CxUyTWNR0NQh
 MTYmNhXkvo6l/4xT5KcyySG3cKeh5u4x1djyoAiX9wt5P9gtBAhR1/yWK6AlCkJ2
 9l4xneByCsjD8t/QqFfG2U7bqZJsmdFA31aNLP6pSm/gwzC7vNRfGM3q57WoDGIM
 C5/gRLeN1DwSbFPqs6/NW9U1RqMXw==
X-ME-Sender: <xms:trLcXL5poaWAJ3q6av9QInxQHzf_SgjgEHHYWL6CRGj95v9fSMLG-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleelgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdeftddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrddutdenucfrrghrrghmpehmrghi
 lhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttgenucevlhhushhtvghrufhiii
 gvpedt
X-ME-Proxy: <xmx:trLcXNOmjYucloM0dQhuEmMako5XpIAGq9kVx0HJ5vBjVAEPMMbuQg>
 <xmx:trLcXFOjtIKPmq80i0-W1BMSQQ9tlPtojykfy2dNvwZsz3uSzMgwlg>
 <xmx:trLcXN-7vVTODAJWWgFbcd3ZfEyFBuzfHKjhe4BRnMy3-AbiaoxfHw>
 <xmx:ubLcXCvkVV73be6OtnXVweUb8T_ptLOFA2_UnDL4jcEBVCZecgMMKA>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A6BF10379;
 Wed, 15 May 2019 20:45:41 -0400 (EDT)
Message-ID: <32e6c2b8e1bfbe931641d3f0a9caca6204b54319.camel@russell.cc>
Subject: Re: [PATCH] powerpc/mm/book3s64: Implement STRICT_MODULE_RWX
From: Russell Currey <ruscur@russell.cc>
To: Christoph Hellwig <hch@infradead.org>
Date: Thu, 16 May 2019 10:45:38 +1000
In-Reply-To: <20190515064111.GA15778@infradead.org>
References: <20190515013000.16085-1-ruscur@russell.cc>
 <20190515064111.GA15778@infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-05-14 at 23:41 -0700, Christoph Hellwig wrote:
> > + * This program is free software; you can redistribute it and/or
> > modify it
> > + * under the terms of the GNU General Public License as published
> > by the
> > + * Free Software Foundation; either version 2 of the License, or
> > (at your
> > + * option) any later version.
> 
> This license boilerplate should not be added together with an SPDX
> tag.
> 
> > +// we need this to have a single pointer to pass into
> > apply_to_page_range()
> 
> Please use normal /* - */ style comments.

I was under the impression they're allowed (in powerpc at least, if not
the wider kernel nowadays) but happy to defer on this.

