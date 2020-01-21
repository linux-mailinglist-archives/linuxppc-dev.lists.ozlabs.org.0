Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7701437DF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 08:49:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4820zt1VZnzDqN5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 18:49:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4820y345C2zDqLd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 18:47:55 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00L7lP0w003538;
 Tue, 21 Jan 2020 01:47:25 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00L7lN5d003537;
 Tue, 21 Jan 2020 01:47:23 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 21 Jan 2020 01:47:23 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH -next] powerpc/maple: fix comparing pointer to 0
Message-ID: <20200121074723.GF3191@gate.crashing.org>
References: <20200121013153.9937-1-chenzhou10@huawei.com>
 <618f58cd46f0e4fd619cb2ee3c76665a28e30f4e.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <618f58cd46f0e4fd619cb2ee3c76665a28e30f4e.camel@perches.com>
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
Cc: Chen Zhou <chenzhou10@huawei.com>, linux-kernel@vger.kernel.org,
 nivedita@alum.mit.edu, paulus@samba.org, gregkh@linuxfoundation.org,
 tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, allison@lohutok.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 20, 2020 at 05:52:15PM -0800, Joe Perches wrote:
> On Tue, 2020-01-21 at 09:31 +0800, Chen Zhou wrote:
> > Fixes coccicheck warning:
> > ./arch/powerpc/platforms/maple/setup.c:232:15-16:
> > 	WARNING comparing pointer to 0
> 
> Does anyone have or use these powerpc maple boards anymore?
> 
> Maybe the whole codebase should just be deleted instead.

This is used for *all* non-Apple 970 systems (not running virtualized),
not just actual Maple.


Segher
