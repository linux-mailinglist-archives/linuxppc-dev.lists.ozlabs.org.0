Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B961EB29D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 02:15:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bXcc5Vk9zDqDy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 10:15:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=octaforge.org (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=daniel@octaforge.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=octaforge.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=octaforge.org header.i=@octaforge.org
 header.a=rsa-sha256 header.s=fm3 header.b=rHnySAIZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ZF+rhq6c; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bXb36kWRzDqCh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 10:14:07 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 1E9775C00E3;
 Mon,  1 Jun 2020 20:14:05 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Mon, 01 Jun 2020 20:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=u7nl6vCiYmoe/TaULzhjnyR/8bgF
 vCihC/qqz7J1IG0=; b=rHnySAIZZnzm8CnRGHPTDQTcDtBSy83DWZ+OqD627PIs
 8qqliS6lj4QkM4iP6T8Aa+c8hTe6jIjKU5Kotkd2yVoYr1mRTFjZj7T63TeyNVu1
 qoiJ2otSdIbwE3fECOkfC6doSAuryqcFkYtzNR4Sgr7o/bN8ioEIzLRtuBfKE7IC
 uh63HzZ4qtWADR46icQ934E1xLuR2P8mC9N7mbvepLW0I+RB6/pTPFPBQWSSpKQ5
 JtoyFKU81X+/hCdAVVI4+8nF2wInX7qtLJDdm/X/4fJ5uMlZxpOb2+rMjg7At9hv
 oLuMUNs/px5S9BQkEaYdGy+5yfKH5fZcWUwVlP1llg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=u7nl6v
 CiYmoe/TaULzhjnyR/8bgFvCihC/qqz7J1IG0=; b=ZF+rhq6cBrn2A1lwDdQgv6
 0ai//rRpOEYvqDRA+IxtaHQTnn62WjP7FZGQoXiLs24yW1DGio9zhQ1eH1vJbIZy
 tjLmWIIrZQtsEnzPPl+dON3vYFNVW+uJ1I5lWYEXlLXUF93INxJVkhC69k0akw/d
 aY/QSC5YAysxVgseyeVxRS4Y7A9p1LXjkaUsrvwwAIzsujsRKY3QMtR5Mv8lRHiA
 80fdEVX7v4HuwLWo+FM8cCQeurhQPn7g74UcsRL3kk12v1j2Oopz4SHhILjtw/Kz
 Qp1N+jW/5rK6xTGJ9sfpnYFK++c9SuBCw9/3l4eHBRUf7J46u9ukkKHkkq0p8tWw
 ==
X-ME-Sender: <xms:zJnVXvHLBGzjZ51HBaBOVmfE9OpPrJ_BLFjbMLH8G8xE1BxkyxpsVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
 ihgvlhcumfholhgvshgrfdcuoegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgheqne
 cuggftrfgrthhtvghrnhepieevvddvjeehiedtvdelgfeuiefhgfetvdeuhfffteehuddu
 fffgudfhfffhleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepuggrnhhivghlsehotghtrghfohhrghgvrdhorhhg
X-ME-Proxy: <xmx:zJnVXsV3Z5UiyqDnQeYBDCHUBTkpaXpnQ4DZvmhIMEaviDbxbnXjig>
 <xmx:zJnVXhJVpcnHYjcxJbJx4S9DXQgTGrCkJNsXo6QMQ_Bw_MTD-S4GSw>
 <xmx:zJnVXtHQTrMcbnLZjImFDbz5UoF61x_wym5TyjoN4nxqXRQ_xx6xtA>
 <xmx:zZnVXrxXtlErwCWNfagVvEZkba1oCnwedgOCK48hU_O16bQcTuXsyw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C9445C200A4; Mon,  1 Jun 2020 20:14:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <8d6bf678-7fbc-4f4e-94c1-6e33da091f04@www.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2006012351270.11121@digraph.polyomino.org.uk>
References: <2047231.C4sosBPzcN@sheen>
 <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
 <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <alpine.DEB.2.21.2006012351270.11121@digraph.polyomino.org.uk>
Date: Tue, 02 Jun 2020 02:13:44 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Joseph Myers" <joseph@codesourcery.com>
Subject: Re: ppc64le and 32-bit LE userland compatibility
Content-Type: text/plain
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, musl@lists.openwall.com,
 Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 2, 2020, at 01:55, Joseph Myers wrote:
> On Mon, 1 Jun 2020, Joseph Myers wrote:
> 
> > The minimum supported architecture for powerpc64le (POWER8) has VSX.  My 
> > understanding was that the suggestion was for 32-bit userspace to run 
> > under powerpc64le kernels running on POWER8 or later, meaning that such a 
> > 32-bit LE port, and any ABI designed for such a port, can assume VSX is 
> > available.  Or does VSX not work, at the hardware level, for 32-bit 
> > POWER8?  (In which case you could pick another ABI for binary128 argument 
> > passing and return.)
> 
> In fact, my understanding is that the ABI for passing binary128 values in 
> vector registers is perfectly implementable for processors with just VMX 
> (AltiVec) and not VSX.  So if you do want to support binary128 for a new 
> ABI for either 32-bit LE or 32-bit or 64-bit BE, you don't need to require 
> VSX for that ABI, you just need to change any GCC requirement for VSX for 
> binary128 to allow it with VMX when building for your new ABI.

Which still doesn't help us even if true, since we plan to support hardware that doesn't have any kind of vector functionality in the first place (PowerPC G3/G4, and for the ELFv2 64-bit BE port, the minimum for binary packages is 970/G5 which does have AltiVec, but it is also supported to build your userland from source without this, for e.g. POWER5 machines, or e5500 SoCs)

> 
> -- 
> Joseph S. Myers
> joseph@codesourcery.com
>
