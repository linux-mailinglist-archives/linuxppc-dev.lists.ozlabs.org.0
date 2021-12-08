Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 255CD46CA4F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 02:52:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J80Xk0K6nz2yxW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 12:52:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm3 header.b=M8vaJWVE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=b0bcdild;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm3 header.b=M8vaJWVE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=b0bcdild; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J80Ww5RC9z2yZx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 12:51:40 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 672DD5C01C1;
 Tue,  7 Dec 2021 20:51:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 07 Dec 2021 20:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:in-reply-to:references
 :content-type:date:mime-version:content-transfer-encoding; s=
 fm3; bh=KXxQxvJi5hLHGPEgEvHaIr8Gi/xSJXFASbh3p1HBoFg=; b=M8vaJWVE
 Aj8Eke8V7afQ4XG3uyZ47Ey5sd/ZOYJ1UHalQY6WwuJ16makLx5v2lKrW+BST0Uv
 NTZiCWYom2Z1czTN8cBmkRp1CFCRBgf3N2hBWwd2VcczcRPGtkpY3jMBdRBAh1pI
 ZM47ok5xSR4XlN10HUcI/YugOxHRSftcfc1FvWo6ACT0oMUQCCLwGUjXQUrWNXhX
 N+OYZWFR6uuC3N7fvnZTyjNKI7M9iuk/y2aWMbWv+oV/qpzMze5m0DTnjhd6eLaj
 CBd06t75ulzZBUWD3YUJJJIXmxkrlpipBbfKEboTbeZwQtaDAb2dsc7FTVGpvYhS
 2+EXp8ULZfQCRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=KXxQxvJi5hLHGPEgEvHaIr8Gi/xSJXFASbh3p1HBo
 Fg=; b=b0bcdildhfUIiW0DEDyFGcgMloIB/+QUh4l3Z92u0rG01LuR1fTHtECsk
 auaUoOryTneFBQlywawCwCo2wJCFIjFAnxsSgrC7MilN+r3+rMAKQsek4l67Rype
 tdwDkoiqctTtarCjcJIN0Zwe8Il7BvINWc/8YOwFnv6P3Tk7+mw+4Z1Lr5vit1kE
 3hSrmaYppjMAwKHDzkfdiKQQ9Ksq2ggAhXDmN8RgBfXIeVYjMq77EOuKC5K5SsSc
 CLnBjbgPb0wBw4H3CMVf/85i7IRIZpFrGeiZIVzmNpcR4Mwn01fgTTvPmU/981eg
 PY+EqBRN51VI767nU9fcLrfbUSDWw==
X-ME-Sender: <xms:pg-wYcCs-dT9mvD4PqQFHq8rSugRt2ptQXJIiSEJUSSKquAGONb7hg>
 <xme:pg-wYegpeQhKDweIc_r7xgvZ9QmHKvhBTEjUzsZhkWEBktYGdaZ3bbaTKiFtKy0DV
 pmb2hCxKvVV49LECQ>
X-ME-Received: <xmr:pg-wYfmffUDY1bHGqPMdUZolAcS6p0BK7qPpTVjKLlwhzK5C4f2jG-aTkVBz7dF7n3O2e1d6FA9DT7RzxlzJSlabUg_qJCgxV4CrfAlr57z_b-2bcYoE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeejgddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdduhedmnecujfgurhepkffuhffvjghftgffgggfgfesthekredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecuggftrfgrthhtvghrnhephfduleeuffdvhfehhedtkeehhfefkedt
 vdeuueekteefffdttdetgfeiveehfeegnecuffhomhgrihhnpehgihhthhhusgdrtghomh
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhs
 tghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:pg-wYSw_pv89zL6eLWn8PJaNXXQiK11j1yW9YL2n29ws2ZoJ0hwZpA>
 <xmx:pg-wYRQyXtcj8cABZZfgYeWz8w2bCSGa69Yk0JON6FjHr3GZjly7dw>
 <xmx:pg-wYdbmb1dEeo-hhFLSVFvtV7a9gIcq8OSAvt_NAw1WwZcu4vmEBQ>
 <xmx:pw-wYaJIXW14n8IE2qPDr00lz3kRb5dcTT75mMGFSZ3P6nUg4apWSg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Dec 2021 20:51:32 -0500 (EST)
Message-ID: <25d35b916e87ed7a71ebc6528259e2f0ed390cb2.camel@russell.cc>
Subject: Re: [PATCH] powerpc/module_64: Fix livepatching for RO modules
From: Russell Currey <ruscur@russell.cc>
To: Joe Lawrence <joe.lawrence@redhat.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <d9d9ef2d-4aaa-7d8b-d15e-0452a355c5cf@redhat.com>
References: <20211123081520.18843-1-ruscur@russell.cc>
 <d9d9ef2d-4aaa-7d8b-d15e-0452a355c5cf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Dec 2021 11:51:27 +1000
MIME-Version: 1.0
User-Agent: Evolution 3.42.2 
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
Cc: live-patching@vger.kernel.org, jniethe5@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2021-12-07 at 09:44 -0500, Joe Lawrence wrote:
> On 11/23/21 3:15 AM, Russell Currey wrote:
> 
> [[ cc += livepatching list ]]
> 
> Hi Russell,
> 
> Thanks for writing a minimal fix for stable / backporting.  As I
> mentioned on the github issue [1], this avoided the crashes I
> reported
> here and over on kpatch github [2].  I wasn't sure if this is the
> final
> version for stable, but feel free to add my:
> 
> Tested-by: Joe Lawrence <joe.lawrence@redhat.com>

Thanks Joe, as per the discussions on GitHub I think we're fine to use
this patch for a fix for stable (unless there's new issues found or
additional community feedback etc).

> 
> [1] https://github.com/linuxppc/issues/issues/375
> [2] https://github.com/dynup/kpatch/issues/1228
> 

