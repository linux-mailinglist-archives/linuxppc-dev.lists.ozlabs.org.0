Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C811EB0F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 23:31:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bSzD2699zDqGX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 07:31:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mentor.com (client-ip=68.232.129.153; helo=esa1.mentor.iphmx.com;
 envelope-from=joseph_myers@mentor.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codesourcery.com
X-Greylist: delayed 66 seconds by postgrey-1.36 at bilbo;
 Tue, 02 Jun 2020 07:29:42 AEST
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bSxL6zHszDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 07:29:42 +1000 (AEST)
IronPort-SDR: ugGxq9tLEuXou6ry2vohRq7vLrPPtERsqDpaIE7y0wu9cHVZdYW0TKY4P2v7sFFpUGuYk49pBV
 CHQp8QlYc7qqbIaefnfj+TZagQq203DSFCkMYsYbz9fHMpa6O3Fdh19wf3/Qu/EJfCaUPfiM4a
 evi12pL/b5YIDw2Eb2txLyOjxoQHGrb0JFvMWgWDvHZTxfYtP+flaffyY6R1CixibHm5hjaWT+
 lB7vO20eM6B7aO5X5dL+UbrNLGrZYkhXwJkcQmnEHGc2SBZ3/WRzM1fV/buaHPHFMy9JKeY492
 nVs=
X-IronPort-AV: E=Sophos;i="5.73,462,1583222400"; d="scan'208";a="51453112"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 01 Jun 2020 13:28:31 -0800
IronPort-SDR: X3wqRBOjgvm7c/zm4zKBTY1rA7GIi1HXUCovH5WnMZwEiR2Jem0uV2LVREHDT32pLSS+bIWQcZ
 Yosupy+bvzGhVbIEAsPSz0RjSpLg1T98kLq7AzE7gmAvgTEPqFj66rsqAzawnrtQRoIqtIIMJ9
 xEpe/jpahZgBYPPKAxhgohCTy5EZADAEtDeJWjuFgtVDHHxgY+scxBhSdrWqBO/3T6yYeJbd+W
 3GOvPi9zVM/tUWd/JOoEaLX9j/DHjFK12BXQQGx8Vhved8Mv4AmivzbdROEDwMX+Mk+yRdfv6Z
 2PQ=
Date: Mon, 1 Jun 2020 21:28:25 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Will Springer <skirmisher@protonmail.com>
Subject: Re: ppc64le and 32-bit LE userland compatibility
In-Reply-To: <2047231.C4sosBPzcN@sheen>
Message-ID: <alpine.DEB.2.21.2006012119010.11121@digraph.polyomino.org.uk>
References: <2047231.C4sosBPzcN@sheen>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
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
Cc: libc-alpha@sourceware.org, eery@paperfox.es, daniel@octaforge.org,
 musl@lists.openwall.com, binutils@sourceware.org, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 29 May 2020, Will Springer via Binutils wrote:

> Hey all, a couple of us over in #talos-workstation on freenode have been
> working on an effort to bring up a Linux PowerPC userland that runs in 32-bit
> little-endian mode, aka ppcle. As far as we can tell, no ABI has ever been
> designated for this (unless you count the patchset from a decade ago [1]), so
> it's pretty much uncharted territory as far as Linux is concerned. We want to
> sync up with libc and the relevant kernel folks to establish the best path
> forward.

As a general comment on the glibc side of things, if this is considered 
like a new port, and it probably is, the same principles that apply to new 
ports apply here.

There's a general discussion at 
<https://sourceware.org/glibc/wiki/NewPorts>, although much of that is 
only applicable when adding new CPU architecture support.  More specific 
points include that new 32-bit ports should default to 64-bit time and 
file offsets from the start, with no support for 32-bit time or offsets 
(meaning that if you want to use this with some kind of library call 
translation, the library call translation will need to deal with 
corresponding type size conversions).  And a new port should not be added 
that uses the IBM long double format.  You can use IEEE binary128 long 
double, possibly with an ABI similar to that used on powerpc64le, or can 
use long double = double, but should not support IBM long double, and 
preferably should only have one long double format rather than using the 
glibc support for building with different options resulting in functions 
for different long double formats being called.

-- 
Joseph S. Myers
joseph@codesourcery.com
