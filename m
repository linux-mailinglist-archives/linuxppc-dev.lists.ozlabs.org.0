Return-Path: <linuxppc-dev+bounces-6199-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E970A3629C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 17:03:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvcKs466Gz3blK;
	Sat, 15 Feb 2025 03:03:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739549025;
	cv=none; b=MYeXwpkJ13C8bvvO2FZ7QVlHFaisx7S2MUnOUhGZHsgUYIF93O78JjbHedd+Q2Q2RCTqpghGCj2MW4roYtnyMMlQxhc6LIhMH6lT1cQPsX3YWWc0T1H1ncz05xKjdIw9zFFdEm6S82ge8WsZq35l3dN0yP0luq5KVeqQRriovCgvaKs33Cdllre8uk7wIjfUtpIr2PvfZshL6UW8Qurtqsc5tUqRCrA8IUxyDKIQoMPWl1S0Wp6Z6gZgrzrffE1hYOZWU6r81lT3y+L+awKSuY8862+56XppVDe2gKMTALRbE+5FT+obEH855G7wxY34RlOQ5v8yNxkdOGzViJ638Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739549025; c=relaxed/relaxed;
	bh=bVV6Yqwz8Zd7X6yRbEIg2xqMr8X36ewYNCrt1k2ZVR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+98RwZ006YJs3TMUh/TrcYqCByuaNXyySpm5bljYNbq2kCG7Nd0G3A2B9V5AzV+w826QjuJDJ3baNTQJbJQDyhOIVJzT8xwp0Os+w3T3I/LkBlC7NWE2ot8VpHgSlDNm0HwpmVP/XaPE5/kwRJcOvgzZxjiMBj3I32RBgZUUWiqmppr4EaBlfIxpUafyMcEZ9CKXC14OKzv74yQaghx2om1G9mZOVDGTo7CAAd7rh/Q8Ak/WFhGUaE8vyNG/dQiJ3dLy14YXR4OIWB9FEXX8WzPMDi55WhBkmnF5PgUumndHB7oPfdQ/6599/pNwUq4AWQJVECnTaGEkQlkS1Q3jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d05cyyPJ; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d05cyyPJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Sat, 15 Feb 2025 03:03:39 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvcKl4JwQz3blH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 03:03:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739549020; x=1771085020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BP0F6Q1wNrUjUl3+JXUo0rphKo1JR7S7n/NVPl/WTLQ=;
  b=d05cyyPJIaJB9vKTwOfNv9PIGMki3mWDNuOTpJkPPcc2CEkmI4PR97g3
   kbWBAK4JNNgi/i/s3LTCbaZnL3UArULm9F2KMqQOWE1b3rH/zHJtkGpQ1
   wlpG8yJFAWHhexZjyCyQI+iOD0D9gRE20YwIftNRCjOUp5XSLLkMQoaxl
   9fsMpzX8PoHjoPZDoQ+xvKjDKO/aNMR9z13kmX/VE/MsdSMpb02wcKY8e
   kMrsrnPS5lsLVLMqm0iV6cNFhNxvPumkRS9zeENIzNHHjK1BGg8fCngid
   3/EltmfMBQDXywZTaa/x1nYB2J78wqiSGKQmh3jsfR2TgEMi912lBSEBv
   A==;
X-CSE-ConnectionGUID: 4DZ/zh+FTBymt0IG7gN4JQ==
X-CSE-MsgGUID: 0xA0ipOyR26wMTux1ZKXgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="27902470"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="27902470"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 08:01:30 -0800
X-CSE-ConnectionGUID: +xTXFr+5SXO11Fa5Mdq1nw==
X-CSE-MsgGUID: uC30yGarSOyVHPzD+Hscrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="114132370"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 08:01:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tiy7q-0000000BXQx-1JPb;
	Fri, 14 Feb 2025 18:01:10 +0200
Date: Fri, 14 Feb 2025 18:01:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Tamir Duberstein <tamird@gmail.com>,
	Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 0/2] printf: convert self-test to KUnit
Message-ID: <Z69oxhkUzTfJ6YKi@smile.fi.intel.com>
References: <20250210-printf-kunit-convert-v3-0-ee6ac5500f5e@gmail.com>
 <Z69isDf_6Vy8gGcS@pathway.suse.cz>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z69isDf_6Vy8gGcS@pathway.suse.cz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 14, 2025 at 04:35:12PM +0100, Petr Mladek wrote:
> On Mon 2025-02-10 13:23:21, Tamir Duberstein wrote:
> > This is one of just 3 remaining "Test Module" kselftests (the others
> > being bitmap and scanf), the rest having been converted to KUnit.
> > 
> > I tested this using:
> > 
> > $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf
> > 
> > I have also sent out a series converting scanf[0].
> > 
> > Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]
> > 
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> 
> I have just quickly tested this before leaving for a week.
> And I am fine with the result.

Seems reasonable to me. But I want a consensus with Rasmus.

-- 
With Best Regards,
Andy Shevchenko



