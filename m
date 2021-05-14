Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D763808E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 13:50:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhRg91zkQz307k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 21:50:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FhRfm49Dwz2xfn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 21:50:23 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14EBmDhI029374;
 Fri, 14 May 2021 06:48:14 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 14EBmDxj029373;
 Fri, 14 May 2021 06:48:13 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 14 May 2021 06:48:13 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v2 05/13] powerpc: use linux/unaligned/le_struct.h on LE
 power7
Message-ID: <20210514114813.GJ10366@gate.crashing.org>
References: <20210514100106.3404011-1-arnd@kernel.org>
 <20210514100106.3404011-6-arnd@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514100106.3404011-6-arnd@kernel.org>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Fri, May 14, 2021 at 12:00:53PM +0200, Arnd Bergmann wrote:
> Little-endian POWER7 kernels disable
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS because that is not supported on
> the hardware, but the kernel still uses direct load/store for explicti
> get_unaligned()/put_unaligned().
> 
> I assume this is a mistake that leads to power7 having to trap and fix
> up all these unaligned accesses at a noticeable performance cost.
> 
> The fix is completely trivial, just remove the file and use the
> generic version that gets it right.

LE p7 isn't supported (it requires special firmware), and no one uses it
anymore, also not for development.  It was used for powerpc64le-linux
development before p8 was widely available.


Segher
