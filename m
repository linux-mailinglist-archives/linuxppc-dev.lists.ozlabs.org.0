Return-Path: <linuxppc-dev+bounces-16001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6ED3AFD6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 17:00:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvwCD6jgSz3bZm;
	Tue, 20 Jan 2026 03:00:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768838408;
	cv=none; b=QXM1bEtPEd0e7OLQzE8gA1algHnj/g9c8FNxVKA3VCEar3OEJsQHqBObdNXfTJr1KvzuQDRnjXsOo+KLL1qcArwMTHoKcd3ZKyXRw27akif1cUJzIR3ULNRoiTSIVVDU3lEoulMlA9o7vvB7sMsq90N7ocUcQS2Y21iFovCvbqQiP22MKxti1/RphffXc3gfSvwBaFJOkQJUwUceDd1efRpakUdNBxZMjbkgjtWnRko9YNz054YKdP9Pmo0dFxhvTvG3YSVvQ8eYZbR2HwDwAEPAwuZ+zwSSxy/To7LxVkNrNKjbKuSvIN42yWlqdgHO4g2KIhjzIl5bQYisfW4ZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768838408; c=relaxed/relaxed;
	bh=rpLshc4Np7GHWTl6wPgZzTCJsyJesB0KJNO/yiUnE8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mM+DyZ793AgHVgaDqERb3eDyEUryRJ/RhYldvymTra79x9ais72TlrScVf4z1fvtaGrJbaf20eTZYtY+IP4E9bBhQ8c7eyeac4xB8J04TWz+OIdngNuRQt96+D1R6tBrz0J18SChkZ8Bsv7EfUSM6FGovgX/m+X/gVXM7DdsZPykOuvbKzb5jCbdhhec91kP5DypkOhLH2qPdO7DDS55hjtk5JuQdpibOAXpdrAQtMR7z+0WmhIP+Ot7+VjZd0kmI3oSC2jHZg5GVH87RCzqLvqSy3oirFQ6tS+XkkZaQdmkamrpquKFv7aDT8wxvnzR0h3GuKi2IsIokWi/abBv8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M0DUMjd3; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M0DUMjd3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvwCB3Ksrz2xT4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 03:00:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768838407; x=1800374407;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Yyv3m0ULnW37JqDe3o4/cJ3o5zdP90I/r40PxaOIQdI=;
  b=M0DUMjd3acCH5Xc4Sill2MA5m70qi8te4jeLyOfVlKAUujFPClJeREgP
   4EvE5qmgXeBJqKCVn6asQcvl5ebXz2QJPiWaNPRdnsdcVsu4GD2flgveE
   wGG9Dsn4uSvDySKO6WyEfypwxkvlW4+OooGTGeWxs2tgPKGBF2/a5s+Im
   6PjcHtDpCXO9Hj57Pgc31xGCfp1+SSJGFDX1unQJFa9x+TLSFvksrzUIA
   Zq1C1wxGrkiMnEbjfnmJXF/lxsgh+VEa0ETqM1xB0lqgDt0sEsHc5olC2
   XFZtk7yVyF+gso7aPXKrXOkzYumx2exbkGEY/64FxEmmWg/gIl0IpFlnx
   w==;
X-CSE-ConnectionGUID: 7Ov24/m8S1KV+sHmfRvmEA==
X-CSE-MsgGUID: PJQI26TwRcalja0dMQf5cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80772362"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="80772362"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:00:02 -0800
X-CSE-ConnectionGUID: fn69LaQYSYWVbojmE0QC8g==
X-CSE-MsgGUID: zz9FJ/hMTSe0YLohU0G/fw==
X-ExtLoop1: 1
Received: from cjhill-mobl.amr.corp.intel.com (HELO [10.125.111.233]) ([10.125.111.233])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:00:01 -0800
Message-ID: <20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
Date: Mon, 19 Jan 2026 08:00:00 -0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Fix bugs and performance of kstack offset
 randomisation
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20260119130122.1283821-1-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/19/26 05:01, Ryan Roberts wrote:
> x86 (AWS Sapphire Rapids):
> +-----------------+--------------+-------------+---------------+
> | Benchmark       | Result Class |   v6.18-rc5 | per-task-prng |
> |                 |              | rndstack-on |               |
> |                 |              |             |               |
> +=================+==============+=============+===============+
> | syscall/getpid  | mean (ns)    |  (R) 13.32% |     (R) 4.60% |
> |                 | p99 (ns)     |  (R) 13.38% |    (R) 18.08% |
> |                 | p99.9 (ns)   |      16.26% |    (R) 19.38% |

Like you noted, this is surprising. This would be a good thing to make
sure it goes in very early after -rc1 and gets plenty of wide testing.

But I don't see any problems with the approach, and the move to common
code looks like a big win as well:

Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

