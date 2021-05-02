Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA2A370E97
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 20:43:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYFPP0TWPz30HP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 04:43:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FYFP31xjXz2yhk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 04:43:34 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 142IbL6B028576;
 Sun, 2 May 2021 13:37:21 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 142IbKUo028575;
 Sun, 2 May 2021 13:37:20 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sun, 2 May 2021 13:37:19 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210502183719.GG10366@gate.crashing.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Miguel Ojeda <ojeda@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 02, 2021 at 12:15:38AM +0900, Masahiro Yamada wrote:
> The current minimum GCC version is 4.9 except ARCH=arm64 requiring
> GCC 5.1.
> 
> When we discussed last time, we agreed to raise the minimum GCC version
> to 5.1 globally. [1]
> 
> I'd like to propose GCC 5.2 to clean up arch/powerpc/Kconfig as well.

Both of these are GCC version 5.  GCC 5.1 is the first release of that,
GCC 5.2 the second, etc.  Everyone should always use an as new release
as practical, since many bugs will be fixed, and nothing else changed.

See <https://gcc.gnu.org/develop.html#num_scheme>.

So, this means everyone using GCC 5 should be using the GCC 5.5 release!

If there is something about 5.1 that makes it produce bad kernels on
some arch, make that arch's Makefile complain?  Same with binutils etc.


Segher
