Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFECD2D0254
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 10:51:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CphY065h3zDqnD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 20:51:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kroah.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=greg@kroah.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256
 header.s=fm2 header.b=BClCqPrm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kcy9TmkF; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CphVq4KMjzDqNR
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 20:49:32 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 306615C0174;
 Sun,  6 Dec 2020 04:49:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 06 Dec 2020 04:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Es1Q0eP0V2RUbWXDDzXmKGvBLVV
 rVtGdWx6WIbwME1g=; b=BClCqPrmifs0QL/Wl7bfFQmqp+THU3h7SPH7jKChWRw
 8JrHqhyjUPWjw68hKash931RViSnJIZmCx3y6x9VEWTKqEd0DPbV/tp8HPy5U34Y
 eKTiD90TVIZh+uX4ia7oeiBZAcgyivboZvOI+wv9lFIba2mDB5iwT/HnpJVVllmg
 MfVmHEfddUYren9lIeyZta8DjktV5N2V5KCl/VX6CrlGhnmMwkx442uECOIS1mto
 ep8o1ZNIsIqzXhFMgTJiWc0yX4VkeTF70j66O2BBP+2ooRqxIFBVpo5l04YP69kD
 7Hz9059Py4AKDTxgCaM10tM8lTv05YIRikVAzZPeeHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Es1Q0e
 P0V2RUbWXDDzXmKGvBLVVrVtGdWx6WIbwME1g=; b=kcy9TmkFmuRKIbMj5+Sv8O
 ebB2lwSC7sbTgviB9hsM/SkMjn2HqRjbMQDriRs/caRPm77dUx3ZnorLv9Qjqgcu
 Ngibe9/8Ictjnr3jOkPGIwAP9qIlls80FC/qEFS5vlDJeVPNQWbmqzKEQj9FN2+u
 8pqjrKFmpHx3x32QzLo36mm+Wn88+Gp6kiVs5DFbQLdvZnIQ7dchI4JTqYrqcNQu
 SG0noOTIDFc7IKcRkO2F7DIXnIjQT7BhDOltfjfVPpdRweR6ulPnIZwgJ8yNgRZc
 HaybS6jtGEV2If+y/UMB4JUxCX6cuytienk4JW0SLcNpVqoNfj/yyJ0f+NB8hh8Q
 ==
X-ME-Sender: <xms:KKnMX07VieEafi04Ey6ppLFr31aDZcBbKUaI5Up6wuJS1EJgR4cuUA>
 <xme:KKnMX14CMm2LDjeQLRVIcHliI3-5kC-wS76wvPRpLBQ0F_nyJiAnzsiOZksu6Qiwb
 f-m845m8L-psg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
 rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:KKnMXzfOcxYgd_QMt6Z5fItOA0vZSoLXa6FxH7P3qshHAk15Fg157A>
 <xmx:KKnMX5KjK6wq3f5WOm-n8HAdo3ZeSzV3MMtPtACGWaDAyr2DNru-sw>
 <xmx:KKnMX4KVZSaXWx0IYB7xKf7VhKaT5sfphVcR-BLsVdiyuAEYfRzXAw>
 <xmx:KanMX9GXwV_bR_7p30rx9wY7B2nClBoM-5J7vit_IudNtgXNOOQ7vg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 511AD24005A;
 Sun,  6 Dec 2020 04:49:28 -0500 (EST)
Date: Sun, 6 Dec 2020 10:50:41 +0100
From: Greg KH <greg@kroah.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Stop exporting __clear_user which is now inlined.
Message-ID: <X8ypcZnTF3U3aCxD@kroah.com>
References: <20201204232807.31887-1-msuchanek@suse.de>
 <87y2ictt80.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y2ictt80.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Michal Suchanek <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 05, 2020 at 09:58:23PM +1100, Michael Ellerman wrote:
> Michal Suchanek <msuchanek@suse.de> writes:
> > Stable commit 452e2a83ea23 ("powerpc: Fix __clear_user() with KUAP
> > enabled") redefines __clear_user as inline function but does not remove
> > the export.
> >
> > Fixes: 452e2a83ea23 ("powerpc: Fix __clear_user() with KUAP enabled")
> >
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> >  arch/powerpc/lib/ppc_ksyms.c | 1 -
> >  1 file changed, 1 deletion(-)
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Now applied, thanks.

greg k-h
