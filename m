Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D49944524D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 12:37:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlM7m3p1rz30Hr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 22:37:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HlM7G6BMHz2xtW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 22:37:13 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1A4BXrIY010918;
 Thu, 4 Nov 2021 06:33:53 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 1A4BXpu3010915;
 Thu, 4 Nov 2021 06:33:51 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 4 Nov 2021 06:33:51 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] powerpc: use swap() to make code cleaner
Message-ID: <20211104113351.GK614@gate.crashing.org>
References: <20211104061709.1505592-1-yang.guang5@zte.com.cn>
 <20211104210637.3c424bcc@elm.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104210637.3c424bcc@elm.ozlabs.ibm.com>
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
Cc: sxwjean@gmail.com, aneesh.kumar@linux.ibm.com,
 Zeal Robot <zealci@zte.com.cn>, davidcomponentone@gmail.com,
 linux-kernel@vger.kernel.org, nathan@kernel.org, yang.guang5@zte.com.cn,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 04, 2021 at 09:06:56PM +1100, Stephen Rothwell wrote:
> On Thu,  4 Nov 2021 14:17:09 +0800 davidcomponentone@gmail.com wrote:
> > From: Yang Guang <yang.guang5@zte.com.cn>
> > 
> > Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
> > opencoding it.
> 
> So if swap() is in the above include file, then you should include it.

It is included from kernel.h already (which is included from delay.h).


Segher
