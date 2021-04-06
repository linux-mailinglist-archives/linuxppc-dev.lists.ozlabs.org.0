Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D66373559C7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 18:56:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFDFj68G8z3brc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 02:56:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=DoBHYqLn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.92; helo=alln-iport-5.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=DoBHYqLn; dkim-atps=neutral
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFDFH23Qvz2yYZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 02:56:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2543; q=dns/txt; s=iport;
 t=1617728179; x=1618937779;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cZx99TFaCLts0bYspySXDfTAZA7sX1ryp1fo4EAJaBw=;
 b=DoBHYqLnZsRDAmfcc0YbB5axhkshYEZLblpF49Z4Qdol3m+SeMem47aJ
 ijrazB5r3wfVjicpBqJ4rqwlf/2qwul1CwG84UmgHwQ5CEiNWoq5XH0tI
 G5g8RoNGe0zBaGFKcHVNmzO0tc+Miua9MVHLqrb2xiSu0zdRmH2XfpF1h I=;
X-IPAS-Result: =?us-ascii?q?A0AWAgAIkmxgmIMNJK1aHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?VKDeAE5lkYDkAwWilqBaAsBAQENAQE0BAEBhFACgXYCJTgTAgMBAQEDAgMBA?=
 =?us-ascii?q?QEBAQUBAQECAQYEFAEBAQEBAQEBaIVdhkUBBTo/EAsSBhUZPA0OBoMEgwirV?=
 =?us-ascii?q?HWBNIEBiB+BRCKBF41NJxyBSUKENT6DeYEGhTgEggRCAS0Qg3GQQo1gnCmDF?=
 =?us-ascii?q?YEmm0cyEKRhLbgRAgQGBQIWgWshgVszGggbFYMlTxkOjjiOUCEDZwIGCgEBA?=
 =?us-ascii?q?wmNRAEB?=
IronPort-HdrOrdr: A9a23:az4voqCHQftEAsTlHekR55DYdL4zR+YMi2QD/UoZc3NoW+afkN
 2jm+le+B/vkTAKWGwhn9foAtjkfVr385lp7Y4NeYqzRQWOghrLEKhO5ZbvqgeLJwTQ7ehYvJ
 0MT4FfD5nKAUF+nYLG5mCDYrId6f2m1IztuuvE1XdqSmhRGsJdxiN0EBySHEEzZCQuP/sEPa
 GR7MZGuDasEE5/Bq+GL0IIUOTZq9rAmIiOW347LiQ64wqDhy7A0tDHOiWfty1zbxp/hZE/7G
 PCjwv1ooKkvv3T8G6760bjq7JLhdDm1txPQPapt/FQADDthgG0Db4RPIG/gA==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,201,1613433600"; d="scan'208";a="693085054"
Received: from alln-core-1.cisco.com ([173.36.13.131])
 by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 06 Apr 2021 16:56:13 +0000
Received: from zorba ([10.24.14.212])
 by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 136GuAm7015894
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 6 Apr 2021 16:56:12 GMT
Date: Tue, 6 Apr 2021 09:56:10 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 00/20] Implement GENERIC_CMDLINE
Message-ID: <20210406165610.GV2469518@zorba>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
X-Outbound-SMTP-Client: 10.24.14.212, [10.24.14.212]
X-Outbound-Node: alln-core-1.cisco.com
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 devicetree@vger.kernel.org, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, sparclinux@vger.kernel.org,
 akpm@linux-foundation.org, will@kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 02, 2021 at 03:18:01PM +0000, Christophe Leroy wrote:
> The purpose of this series is to improve and enhance the
> handling of kernel boot arguments.
> 
> Current situation is that most if not all architectures are using
> similar options to do some manupulation on command line arguments:
> - Prepend built-in arguments in front of bootloader provided arguments
> - Append built-in arguments after bootloader provided arguments
> - Replace bootloader provided arguments by built-in arguments
> - Use built-in arguments when none is provided by bootloader.
> 
> On some architectures, all the options are possible. On other ones,
> only a subset are available.
> 
> The purpose of this series is to refactor and enhance the
> handling of kernel boot arguments so that every architecture can
> benefit from all possibilities.
> 
> It is first focussed on powerpc but also extends the capability
> for other arches.
> 
> The work has been focussed on minimising the churn in architectures
> by keeping the most commonly used namings.
> 
> Main changes in V4:
> - Included patch from Daniel to replace powerpc's strcpy() by strlcpy()
> - Using strlcpy() instead of zeroing first char + strlcat() (idea taken frm Daniel's series)
> - Reworked the convertion of EFI which was wrong in V3
> - Added "too long" command line handling
> - Changed cmdline macro into a function
> - Done a few fixes in arch (NIOS2, SH, ARM)
> - Taken comments into account (see individual responses for details)
> - Tested on powerpc, build tested on ARM64, X86_64.
> 

Why submit your changes ? My changes have been around for almost 10 years, and
are more widely used. Your changes are very new and unstable, but don't really
solve the needs of people using my series.

I've tried to work with you and I take comments from you, but yet you insist to
submit your own series.

I would suggest this isn't going to go anyplace unless we work together.

I can't really support your changes because, honestly, your changes are really
ugly and they just look more and more like my changes with every passing
iteration .. As the maturity of your changes continue they will just become my
change set.

I've been thru every iteration of these changes, and I see those attempts in
your changes. Everything different in your changes I've tried, and found not to
be useful, then it falls away in later iterations.

When you give me comments on something which I haven't tried I typically
incorporate it.

Daniel
