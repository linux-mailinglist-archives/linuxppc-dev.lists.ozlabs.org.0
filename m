Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F9A92687
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 16:22:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bx2x22BSzDqXl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 00:22:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BwwX6KrQzDqFB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 00:17:00 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7JEGjfs021854;
 Mon, 19 Aug 2019 09:16:45 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x7JEGjuS021851;
 Mon, 19 Aug 2019 09:16:45 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 19 Aug 2019 09:16:45 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v3 1/3] powerpc: rewrite LOAD_REG_IMMEDIATE() as an
 intelligent macro
Message-ID: <20190819141645.GI31406@gate.crashing.org>
References: <be2b971c89b1af30d680cedd14e99a83138ef40a.1566223054.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be2b971c89b1af30d680cedd14e99a83138ef40a.1566223054.git.christophe.leroy@c-s.fr>
User-Agent: Mutt/1.4.2.3i
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Mon, Aug 19, 2019 at 01:58:10PM +0000, Christophe Leroy wrote:
> +.macro __LOAD_REG_IMMEDIATE r, x
> +	.if (\x) >= 0x80000000 || (\x) < -0x80000000
> +		__LOAD_REG_IMMEDIATE_32 \r, (\x) >> 32
> +		sldi	\r, \r, 32
> +		.if (\x) & 0xffff0000 != 0
> +			oris \r, \r, (\x)@__AS_ATHIGH
> +		.endif
> +		.if (\x) & 0xffff != 0
> +			oris \r, \r, (\x)@l
> +		.endif
> +	.else
> +		__LOAD_REG_IMMEDIATE_32 \r, \x
> +	.endif
> +.endm

How did you test this?  That last "oris" should be "ori"?

Rest looks good :-)


Segher
