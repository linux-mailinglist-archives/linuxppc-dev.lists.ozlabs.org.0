Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA7B53320A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:54:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L74fc2Swjz3cDs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 05:54:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L74fD2gMzz3bcW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 05:54:27 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 24OJqGUX030520;
 Tue, 24 May 2022 14:52:16 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 24OJqGgw030519;
 Tue, 24 May 2022 14:52:16 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 24 May 2022 14:52:16 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Message-ID: <20220524195216.GL25951@gate.crashing.org>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220524175955.GI25951@gate.crashing.org>
 <20220524181255.bmszzxmbwzv7zed7@pali>
 <20220524185247.GK25951@gate.crashing.org>
 <20220524191610.hnodzz2j7mlgthey@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524191610.hnodzz2j7mlgthey@pali>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 09:16:10PM +0200, Pali Rohár wrote:
> On Tuesday 24 May 2022 13:52:47 Segher Boessenkool wrote:
> > Aha.  Right, because this config forces -mspe it requires one of these
> > CPUs.
> > 
> > You can use a powerpc-linux compiler instead, and everything will just
> > work.  These CPUs are still supported, in all of GCC 9 .. GCC 12 :-)
> 
> Ok. I can use different "generic" powerpc compiler (It should work fine
> as you said, as it has also -mcpu=8540 option). But I think that
> compilation of kernel should be supported also by that gcc 8.5.0 e500
> compiler.

That linuxspe compiler you mean.  Sure, why not, the more the merrier,
as long as it doesn't get in the way of other stuff, I won't protest.

But please don't confuse people: you are talking about a
powerpc-linuxspe compiler, not e500, which is supported just fine by
current GCC trunk still, and does not have such limitations :-)


Segher
