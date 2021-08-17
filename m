Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 667083EF10C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 19:46:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gpz3b2JGwz3bnK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 03:46:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Gpz354wdCz30C4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 03:45:53 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17HHiMVp024495;
 Tue, 17 Aug 2021 12:44:22 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17HHiKkS024494;
 Tue, 17 Aug 2021 12:44:20 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 17 Aug 2021 12:44:20 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] macintosh: no need to initilise statics to 0
Message-ID: <20210817174420.GG1583@gate.crashing.org>
References: <20210817115104.30057-1-wangborong@cdjrlc.com>
 <2105ef52-b736-cc18-def9-02ac174d1922@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2105ef52-b736-cc18-def9-02ac174d1922@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Jason Wang <wangborong@cdjrlc.com>, yukuai3@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 17, 2021 at 01:59:33PM +0200, Christophe Leroy wrote:
> 
> 
> Le 17/08/2021 à 13:51, Jason Wang a écrit :
> >Global static variables dont need to be initialised to 0. Because
> >the compiler will initilise them.
> 
> It is not the compiler, it is the Kernel. It is done here:
> 
> https://elixir.bootlin.com/linux/v5.14-rc6/source/arch/powerpc/kernel/early_32.c

This implements part of the C language: everything with static storage
duration (which includes all global objects, not just those marked
"static") is initialized.

> Among those 44 changes, only 2 are related to the commit's description.

Yeah.  Don't do that please :-/


Segher
