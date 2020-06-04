Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FAF1EEDB5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 00:28:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dL5Y2qLdzDqwr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 08:28:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=octaforge.org (client-ip=64.147.123.27;
 helo=wnew2-smtp.messagingengine.com; envelope-from=daniel@octaforge.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=octaforge.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=octaforge.org header.i=@octaforge.org
 header.a=rsa-sha256 header.s=fm3 header.b=HahTIaQ/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=WXJXKXY+; 
 dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dL3r2qQdzDqtp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 08:26:47 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id DAD042DA;
 Thu,  4 Jun 2020 18:26:44 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute7.internal (MEProxy); Thu, 04 Jun 2020 18:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=5Ng38xOvRHvf9fTa0aUIZD6HVbxY
 wrDC4S5AQaE8ML0=; b=HahTIaQ/e/ddIfHk+NZdwxi7I61owFLRWQd3hnkz601f
 PYcl93ah48wKG1cW8GRvXZjgXwkQHMxZqwnvi95yUI4z6mMIn+HpX0+j/amn+6ST
 /Z9bPFA/9kalQoD7NWlSw4e3+MJ0UjQq0zSYKJLt3/nz4inVRdGEcYOJrEUSHFME
 pWvRNsGw1PFt2NgPH4TY6/sqBJNBduUZx4dgdzfMgCeKkhJWcvW4O6N2pGT3bbdS
 b9cWlyGkJETO6mzuMtpLMkIEQIf1ItJVFix5l0cXSzF2mvJBYQe9YwrP1d+XgscP
 QwMuwY/24aLO5DviPmyfGhUl9dN1kRdOwzz7myjI1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5Ng38x
 OvRHvf9fTa0aUIZD6HVbxYwrDC4S5AQaE8ML0=; b=WXJXKXY+a2BuvzEKcM4e8p
 26lg47ZxHS9LOEux35u8qUudBW50CRqQatqRi75/OsS8yNF6kRAk98CPnmgUflW3
 YXxUxFIQQq5OMrIe94Ruojymk/tFtc3dS0Rfegc58k7uEAqX+0UxgP1AMENKT2Bk
 uFUBGUCP7HPuv5INO9R/dGa2QKRtj3CZS8kZobUsVzHU4pR035f3d09x7WjHhAOK
 YIPtVBygkoRFV5MLOQujsLJpWBOFQa3hpMI6Z0ppMBZcui5NKhUh3uOz15VLWxrp
 +FImS9yPi3gtVFUinVUMJGJe9AQnpz3Yt3DEAjHX2ldw7+X65ilAJUskXX1r5DyQ
 ==
X-ME-Sender: <xms:InXZXgMAOn7NY0DaJFJSod0huUSwmFpfeA2vY_VTbRXMyjXW5Qiiow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegvddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
 ihgvlhcumfholhgvshgrfdcuoegurghnihgvlhesohgtthgrfhhorhhgvgdrohhrgheqne
 cuggftrfgrthhtvghrnhepieevvddvjeehiedtvdelgfeuiefhgfetvdeuhfffteehuddu
 fffgudfhfffhleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepuggrnhhivghlsehotghtrghfohhrghgvrdhorhhg
X-ME-Proxy: <xmx:InXZXm_Pbr_80A4q0ygLlKddNiLMex-uM_snni_LhHqYjlTjNqjJEw>
 <xmx:InXZXnRkQIQeOg6RZpHWBaE-AbwIsklxtCidSZwf_eWbWIyyjb17hA>
 <xmx:InXZXotpfqF_7D1HPVbGrwoSwJE72_Q_vkzax80CUyLhEkfhsyhO2Q>
 <xmx:JHXZXmsTdwkHnElBHNb7a6YfNU-1g7EAETT6aHbFT6HuQ1OBoSaCguMWVbw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CD186C200A5; Thu,  4 Jun 2020 18:26:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-519-g0f677ba-fm-20200601.001-g0f677ba6
Mime-Version: 1.0
Message-Id: <4ca9d8f4-4d61-4e99-969c-03a99e4fd3cc@www.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2006042154060.8237@digraph.polyomino.org.uk>
References: <c821b608-f14f-4a68-bbec-b7b6c1d8bddc@www.fastmail.com>
 <alpine.DEB.2.21.2006012329420.11121@digraph.polyomino.org.uk>
 <b44b3aa7-f9cc-43e1-b2c4-0edb6ea06189@www.fastmail.com>
 <alpine.DEB.2.21.2006021334170.24059@digraph.polyomino.org.uk>
 <20200602142337.GS25173@kitsune.suse.cz>
 <3aeb6dfe-ae23-42f9-ac23-16be6b54a850@www.fastmail.com>
 <20200604171232.GG31009@gate.crashing.org>
 <20200604171844.GO1079@brightrain.aerifal.cx>
 <20200604173312.GI31009@gate.crashing.org>
 <a43aeb5d-3704-4540-969e-085790ff0477@www.fastmail.com>
 <20200604211009.GK31009@gate.crashing.org>
 <60fa8bd7-2439-4403-a0eb-166a2fb49a4b@www.fastmail.com>
 <alpine.DEB.2.21.2006042154060.8237@digraph.polyomino.org.uk>
Date: Fri, 05 Jun 2020 00:26:22 +0200
From: "Daniel Kolesa" <daniel@octaforge.org>
To: "Joseph Myers" <joseph@codesourcery.com>
Subject: Re: [musl] Re: ppc64le and 32-bit LE userland compatibility
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
Cc: Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org, eery@paperfox.es,
 musl@lists.openwall.com, Will Springer <skirmisher@protonmail.com>,
 Palmer Dabbelt via binutils <binutils@sourceware.org>,
 via libc-dev <libc-dev@lists.llvm.org>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 5, 2020, at 00:08, Joseph Myers wrote:
> On Thu, 4 Jun 2020, Daniel Kolesa wrote:
> 
> > The ELFv2 document specifies things like passing of quadruple precision 
> > floats. Indeed, VSX is needed there, but that's not a concern if you 
> > *don't* use quadruple precision floats.
> 
> My understanding is that the registers used for argument passing are all 
> ones that exactly correspond to the Vector registers in earlier 
> instruction set versions.  In other words, you could *in principle* 
> produce an object, or a whole libm shared library, that (a) passes or 
> receives _Float128 values in registers, (b) does not use any instructions 
> beyond those available with -mcpu=970, (c) would work as intended whether 
> executed on a 970 or on POWER8 and (d) when executed on POWER8, would 
> fully interoperate with objects receiving or passing _Float128 values and 
> compiled for POWER8 to use VSX instructions for that purpose.  GCC may not 
> support _Float128 for older processors, but that doesn't prevent you from 
> maintaining patches to add such support.  (But if you want to support 
> those 64-bit processors that don't have Vector registers at all, you 
> indeed can't use binary128 and interoperate with code using VSX for that 
> format in POWER8.)

There's a potential userbase with 64-bit BE processors from Freescale/NXP that don't have any AltiVec support, I believe they are still in production - I'd like to retain support for these targets, as well as older IBM processors. The userland generally also supports that, and we've had multiple requests for support of this kind of hardware.

And while implementing it with just VMX may be possible, most hardware running this ABI wouldn't have any support for quad precision FP, and would perform better with using just double-precision.

We're not a commercial project, so we're just trying to support users within the FOSS community; I definitely wouldn't mind having this be just an ABI variant parallel to the others. Using 64-bit long doubles also has the benefit of being the same ABI as musl, which would enable things such as gcompat to work.

Either way I'll think about it some more and possibly prepare an RFC port. I'm definitely willing to put in the work and later maintenance effort if that's what it takes to make it happen.

> 
> (Cf. how the Arm hard-float ABI variant works even on processors with 
> single-precision-only VFP, because such processors still have the 
> double-precision loads and stores although not double-precision 
> arithmetic.  When working on that ABI support in GCC some years ago, I 
> also made sure that GNU vector types corresponding to NEON vector types 
> were passed consistently for the hard-float ABI whether or not any vector 
> instructions were present - thus, avoiding depending on the machine modes 
> for those vector types because GCC could choose a different machine mode 
> depending on the instructions available.)
> 
> -- 
> Joseph S. Myers
> joseph@codesourcery.com
>

Daniel
