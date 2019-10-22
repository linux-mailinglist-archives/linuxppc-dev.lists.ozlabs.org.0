Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35694DFD8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 08:12:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y37T0rgLzDqGZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 17:12:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="jllfTYq5"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="psnkUvwf"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y34h2ZSvzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 17:09:39 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 124FD632;
 Tue, 22 Oct 2019 02:09:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 22 Oct 2019 02:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm3; bh=
 37N8R/c1daVkpVFsLRhPMyEoOTrHqdcJ1p5ZyAjfOyA=; b=jllfTYq5VX6t3uau
 GADfsvuhgZeG3/k2fCRvCurpWvdFZjn5fJp4oqwnF4GDlCaU4G1UWqBxCpEgkgK0
 22CsuhzXB/K3XcxyOEqqdHYgur6s0SjIHfsowtk9V79skXVX9EJitakS0uql+iG0
 hSnIs7L+yPKXErqugDWDYI9srd7hh/3T6NrBus60MMVr1fJ1qZjpBdtjS+Bdrk40
 iXxZ6CTsQ0hsqbM4SwV2RtEK4g6W4whBte/VF9OLtMD5oM8g7tkwZlnSjPYGGavC
 bOWC0xPTm1/dBrocxQH7PRc+m+QU2KOxl2ANg3jVCv4X3wfjmc8DtDXWRQhoOh6G
 UUAN1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=37N8R/c1daVkpVFsLRhPMyEoOTrHqdcJ1p5ZyAjfO
 yA=; b=psnkUvwf0ArkFmSM3t2gk5gR7OaH1VHJVxkVDB0KK+MG7AbvSTv0nCQUO
 NibFg/Q4NkPOpnSdRQfE4GcUbr/jz1BdUplCvzY/D16qZc06jmHKQTv3qbArwPPl
 WFbWyMJtAiXFGACXaCllDBqvHXLsyIl7nUbEq5uXBoA00L/nKBbMEIqgaHU3Z6Sd
 GIprMthWZsFW2qhP7uDZznQemgpaXkdCNiwuiMvCqM3GAkwem8UUZIXkNjzUksaq
 Jz9Yc24W4q6aiSmWKZekaaYUx+KjFEXEnB0mLuxMbIKA4lbFLHhhBnshm5iK7igx
 wLRTHUFM8Lpe7gEgmikuY9AldIGZQ==
X-ME-Sender: <xms:IJ2uXcCzkdFnoew5tQ5Elbjnf49e8GKFRrluUJqUFdfY5L2b3IwGcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeeigddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludehmdenucfjughrpefkuf
 fhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
 rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrd
 ekvddruddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghl
 lhdrtggtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:IJ2uXa31Mhmm6LHITtqgwaXUbU1fNiGOI5ucfiyudKdbR34HOqRxYQ>
 <xmx:IJ2uXSUS5xPFefMa_jLUOhaj5oT4pAXFot3ySENtpmhWadRjfT9QqQ>
 <xmx:IJ2uXUmXX7wC-hvS7cE_JCQmINdjJp93-JoFeUn51fm2pIgg_R10YA>
 <xmx:IJ2uXQhQ0WJgGQ00K0MyM61eiSjDGQnfW7ap3_niSg819_eOwLtMhg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id E22C48005A;
 Tue, 22 Oct 2019 02:09:34 -0400 (EDT)
Message-ID: <d62c59093122e8cd8fd5f25b2e8a50f3a28a44c3.camel@russell.cc>
Subject: Re: [PATCH] powerpc/64s/exception: Fix kaup -> kuap typo
From: Russell Currey <ruscur@russell.cc>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 22 Oct 2019 17:09:31 +1100
In-Reply-To: <20191022060603.24101-1-ajd@linux.ibm.com>
References: <20191022060603.24101-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1 
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-10-22 at 17:06 +1100, Andrew Donnellan wrote:
> It's KUAP, not KAUP. Fix typo in INT_COMMON macro.
> 
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Akced-by: Russell Currey <ruscur@russell.cc>

