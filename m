Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941A355A88
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 19:39:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFFBj0STzz30Fb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 03:39:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=ggLx+4V4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.76; helo=rcdn-iport-5.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=ggLx+4V4; dkim-atps=neutral
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFFBF3hJmz2xfh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 03:38:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1449; q=dns/txt; s=iport;
 t=1617730725; x=1618940325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wHC75exw7z/XvWxaqurh75hAcW+P/hc1Ce2AN8KLAVE=;
 b=ggLx+4V4bavJCH3/HSDXdJ0f031+ZXu/aK9m+Bu+07Ktzqdc7oGRwcmN
 MF3qiGkvDX0Rmhk0jcjFe6EcSQ1cKHIUFwx7d6ypoimEBsIo2Djh9lrDj
 84Nti/hzxAyckgzcsesFxFsAG2+o6X7vvTa9GCgTuOTXBQUqYpCDm14Bk s=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3Ad70PFKyAZuY1VAyfgTLAKrPwkb1zdoIgy1?=
 =?us-ascii?q?knxilNYDZeG/b2q+mFmvMH2RjozBsQQmgng9CcOK+GKEmskKJdy48XILukQU?=
 =?us-ascii?q?3aqHKlRbsSj7fK7jX8F0TFnNJ1+rxnd8FFZeHYLV8/tsri5Rn9LtBI+qjizI?=
 =?us-ascii?q?mNpcPzi0hgVhtrbaYI1XYbNi++HldtTAdLQboVfaD82uN9qzCteWsaY62Abx?=
 =?us-ascii?q?FvY8H5q9LGj57gaxIdbiRG1CC1kTiq5LTmeiL34j4iVVp0rYsKwCzijxHz4L?=
 =?us-ascii?q?mlvrWdzBLRvlWjiah+qZ/G1sZJAtCKh4wuDgjUziysZIhnRtS5zVcInN0=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AGAAAsnGxg/4YNJK1aGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIE+BQEBAQELAYIqgU0BOY0XiTGQDYpcgXw?=
 =?us-ascii?q?LAQEBDQEBNAQBAYRQAoF2AiU0CQ4CAwEBDAEBBQEBAQIBBgRxE4VdhkUBBTo?=
 =?us-ascii?q?6BRALGC48GwaGDKtXdYE0gQGIH4FEIoEXAY1MJxyBSUKBE4MiPoo5BIJHghe?=
 =?us-ascii?q?gOZwpgxWBJptHMhCkYS24EQIEBgUCFoFUOoFZMxoIGxWDJU8ZDo4rFo5HIQN?=
 =?us-ascii?q?nAgYKAQEDCYw0XQEB?=
X-IronPort-AV: E=Sophos;i="5.82,201,1613433600"; d="scan'208";a="611888528"
Received: from alln-core-12.cisco.com ([173.36.13.134])
 by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 06 Apr 2021 17:38:39 +0000
Received: from zorba ([10.24.14.212])
 by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 136HcajD016593
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 6 Apr 2021 17:38:37 GMT
Date: Tue, 6 Apr 2021 10:38:36 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 19/20] mips: Convert to GENERIC_CMDLINE
Message-ID: <20210406173836.GW2469518@zorba>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
X-Outbound-SMTP-Client: 10.24.14.212, [10.24.14.212]
X-Outbound-Node: alln-core-12.cisco.com
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

On Fri, Apr 02, 2021 at 03:18:21PM +0000, Christophe Leroy wrote:
> -config CMDLINE_BOOL
> -	bool "Built-in kernel command line"
> -	help
> -	  For most systems, it is firmware or second stage bootloader that
> -	  by default specifies the kernel command line options.  However,
> -	  it might be necessary or advantageous to either override the
> -	  default kernel command line or add a few extra options to it.
> -	  For such cases, this option allows you to hardcode your own
> -	  command line options directly into the kernel.  For that, you
> -	  should choose 'Y' here, and fill in the extra boot arguments
> -	  in CONFIG_CMDLINE.
> -
> -	  The built-in options will be concatenated to the default command
> -	  line if CMDLINE_OVERRIDE is set to 'N'. Otherwise, the default
> -	  command line will be ignored and replaced by the built-in string.
> -
> -	  Most MIPS systems will normally expect 'N' here and rely upon
> -	  the command line from the firmware or the second-stage bootloader.
> -


See how you complained that I have CMDLINE_BOOL in my changed, and you think it
shouldn't exist.

Yet here mips has it, and you just deleted it with no feature parity in your
changes for this.

In my changes I tried to maintain as much feature parity as I could with the
architectures. I did the same huge conversion a long time ago you've done here to be sure all
platforms have the features needed.

Daniel
