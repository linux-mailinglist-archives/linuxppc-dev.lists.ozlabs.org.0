Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 896861AA482
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 15:33:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492Nbz55CyzDqCg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 23:33:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm3 header.b=SQBfc25h; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=qZedNMIy; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492N990VgGzDqF5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 23:13:57 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3C6DC5C011D;
 Wed, 15 Apr 2020 09:13:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 15 Apr 2020 09:13:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=R5DDhffXQ4HNZNdKHxLRNVxw0bf
 rgtuzb49JyEFNPaY=; b=SQBfc25hT0VnStrlZmQKaRSiVfWQ/HMBWyrE45IyxRK
 cDzIf+7JGI/j+CL8ckGeQbWFUs8RftbdJ2dKRUW0mmZNEdlgqNKBPu/z2jU+O+pF
 03DXKc8Ok1Nghut57PJ0TYCxuF6rDyd1KLD28O7mKTnsRM2B4JX7KEYf3VJm1Hr4
 k8P0U0gWPVl39X82D45WCbTY3Atcz4bVsBLSWGwuXM+mF/s0CPn9Bgf7BfzV+X3o
 A7QijfrgcP+4u/7hOeqkJsz15PWW4le5pcQSUC7A45PProy7YF4lw08bIF3lFmCz
 zmXbD/QDOWvopqjdJ9WNRYPLanMncEPqhZQMsb5SlVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=R5DDhf
 fXQ4HNZNdKHxLRNVxw0bfrgtuzb49JyEFNPaY=; b=qZedNMIyM4KLWlugpzrpoQ
 gaa0566O0W/FOiXwwaAL8PHrR8Kp+uQUZu0QWfhpSbxzLaUAU79sOhHaz6bAwz/k
 clOA7Y+EMDpnFpETKppv2ZX/rOUmnLnvZlI5CoEEDK2ufsUSkCn97Beg20i6QlfK
 YDi05EddgxWZWoCuVC9NnzfNSa8WP+wWT98lKTFiCEddx227j24Cfk6Hqtg44HU5
 y0kAQXzu4joSBuTWHrIwis71vujRoyjji9J5bCWt3rYfG8FNcgYlSpCWhlr3eDdQ
 03iQETxy1xStZl3DlHiB/agwxe4PikolRlLZSlmL+8Oo3TElzDwBMD91e3bMJ+UQ
 ==
X-ME-Sender: <xms:kQiXXsDbLISuG3tCaXjUu-xJXB03dACA6GhKnS9ctzOt7R-jB16r8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeefgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
 dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
 ucfkphepkeefrdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:kQiXXjwah7hiBsy9IPdR2VTfVHZDhB0JwLdQpiNF1j0_8xDVGXxZ2w>
 <xmx:kQiXXhSz-wJqMNik0o07tVPETyz8xA_XLdMAA7Mv4oTUr-t-aE97Gg>
 <xmx:kQiXXq8tyAomBLhYlUtbFJT-qBCBpp8RlBjhLU6CyxrtpF52CNoOeg>
 <xmx:kgiXXkOIentU8k2lW-IYffsKh8-cPEeAoh0HXMc3gWKs76QJTjN6bQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 631983280067;
 Wed, 15 Apr 2020 09:13:53 -0400 (EDT)
Date: Wed, 15 Apr 2020 15:13:51 +0200
From: Greg KH <greg@kroah.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH 4.19] powerpc/powernv/idle: Restore AMR/UAMOR/AMOR after
 idle
Message-ID: <20200415131351.GB3439691@kroah.com>
References: <20200415124005.26920-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415124005.26920-1-ajd@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 15, 2020 at 10:40:05PM +1000, Andrew Donnellan wrote:
> From: Michael Ellerman <mpe@ellerman.id.au>
> 
> commit 53a712bae5dd919521a58d7bad773b949358add0 upstream.
> 
> In order to implement KUAP (Kernel Userspace Access Protection) on
> Power9 we will be using the AMR, and therefore indirectly the
> UAMOR/AMOR.
> 
> So save/restore these regs in the idle code.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> [ajd: Backport to 4.19 tree, CVE-2020-11669]
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  arch/powerpc/kernel/idle_book3s.S | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)

This and the 4.14 patch now queued up, thanks.

greg k-h
