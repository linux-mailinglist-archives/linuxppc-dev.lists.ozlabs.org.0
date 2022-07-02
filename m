Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F7563F48
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 11:40:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZn9z0dj8z3bsk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 19:40:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qjVlZJuY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qjVlZJuY;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZn9G01Z0z3bdM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 19:40:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C99460AF8;
	Sat,  2 Jul 2022 09:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6E6C34114;
	Sat,  2 Jul 2022 09:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656754795;
	bh=sNB4SSev9GGBp702mzMS6UGh+tOd6kOa4UDTbCW0xXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qjVlZJuYdsPcA+gR+qKyRz4Ssc0rWw008xgaxYEVorFvWUrm+DAuEIHyRIAeoC4rT
	 rosc5GYX2ScJtXc5LspG8095kJSZeU3xXF2EYclkSgI5TY5kXlr+7gNzZzuclbb7BD
	 e4rr3mxXLExQrFO2xa1Jxm9F4/GiC+lWliXhf5rXFA27qvxJbvp581Cvob6ocCI0Tt
	 /XF4Vix2yitYy8XZldPmKjuqjopiKh61D0WWb+Lq3j6fmcMUhzBVWfZaFq1f0SD/lI
	 xMoz3B+ORU6oJY5+LfT+cf8wdFpuquf4uuAXdEeMCYkhiVpfSVUea+/qUwz/3ZOe0j
	 US4sd0E3DRoYA==
Received: by pali.im (Postfix)
	id 833EC777; Sat,  2 Jul 2022 11:39:52 +0200 (CEST)
Date: Sat, 2 Jul 2022 11:39:52 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Message-ID: <20220702093952.ir7ctqsianztocik@pali>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220524175955.GI25951@gate.crashing.org>
 <20220524181255.bmszzxmbwzv7zed7@pali>
 <20220524185247.GK25951@gate.crashing.org>
 <20220524191610.hnodzz2j7mlgthey@pali>
 <20220524195216.GL25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524195216.GL25951@gate.crashing.org>
User-Agent: NeoMutt/20180716
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday 24 May 2022 14:52:16 Segher Boessenkool wrote:
> On Tue, May 24, 2022 at 09:16:10PM +0200, Pali Rohár wrote:
> > On Tuesday 24 May 2022 13:52:47 Segher Boessenkool wrote:
> > > Aha.  Right, because this config forces -mspe it requires one of these
> > > CPUs.
> > > 
> > > You can use a powerpc-linux compiler instead, and everything will just
> > > work.  These CPUs are still supported, in all of GCC 9 .. GCC 12 :-)
> > 
> > Ok. I can use different "generic" powerpc compiler (It should work fine
> > as you said, as it has also -mcpu=8540 option). But I think that
> > compilation of kernel should be supported also by that gcc 8.5.0 e500
> > compiler.
> 
> That linuxspe compiler you mean.  Sure, why not, the more the merrier,
> as long as it doesn't get in the way of other stuff, I won't protest.
> 
> But please don't confuse people: you are talking about a
> powerpc-linuxspe compiler, not e500, which is supported just fine by
> current GCC trunk still, and does not have such limitations :-)
> 
> 
> Segher

I think the confusion is the calling "generic" or "stripped" compiler
without SPE support as e500 compiler.

The "true" e500 compiler has support for both both integer and floating
point ISA and not just subset or just one type.
