Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD16B4EE48D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 01:13:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTzcm3r7xz300K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 10:13:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KTzcH2Xbdz2xY0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Apr 2022 10:13:02 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 22VN9xvA024790;
 Thu, 31 Mar 2022 18:09:59 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 22VN9wEn024789;
 Thu, 31 Mar 2022 18:09:58 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 31 Mar 2022 18:09:58 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Murilo Opsfelder =?iso-8859-1?Q?Ara=FAjo?= <mopsfelder@gmail.com>
Subject: Re: [PATCH] powerpc/boot: Build wrapper for an appropriate CPU
Message-ID: <20220331230958.GA614@gate.crashing.org>
References: <20220330112437.540214-1-joel@jms.id.au>
 <815770fb-3247-baab-f8ca-eed7b99213d1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <815770fb-3247-baab-f8ca-eed7b99213d1@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 30, 2022 at 11:05:19PM -0300, Murilo Opsfelder Araújo wrote:
> I think it was a fortunate coincidence that the default cpu type of your 
> gcc is
> compatible with your system.  If the distro gcc moves its default to a 
> newer cpu
> type than your system, this bug would happen again.

Indeed.  But why would you use a GCC from a distro that requires p10
when you target something older?

> The command "gcc -v |& grep with-cpu" will show you the default cpu type 
> for 32
> and 64-bit that gcc was configured.

Only if it was configured with --with-cpu*.  Most people do not.  If
someone builds compilers with non-default defaults like this, they had
better communicate that clearly to all their users, to avoid confusion
and disappointments.

There should be some easy way to show this default with GCC, but there
currently is none.  I'll see what I can do (just to make my own life
easier, we frequently get bug reports from people who use a different
-mcpu= than what they think they do :-) )


Segher
