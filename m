Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C378C8A0984
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 09:17:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MkzPdBdB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFWHM42pdz3vjs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 17:17:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MkzPdBdB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFWGF72p4z3vcC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 17:16:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712819798; x=1744355798;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1xYOPTuqtpTLVmhwlopOxLtF8xWMfDY79SUp6Zprkhs=;
  b=MkzPdBdB3NxuwVQ6nGHjpdq6X8byemltSKc4uJuoXmrl4cOfSNHVGKwN
   BuUFzgWgiCc/2zd7R8gl1c0GxmxgMTtQCkYTecV3Kr/Z/nLbvKWw6Inp/
   5t9USO34S1555GAeWaYxtqnHGy1sqJv9j4e9XKp1IlD0ev7PetfHiBDXa
   Ko/NsSnLbBUEA/WCvQEva6zjFWC6qu4Ybpo5BwmV+d9hw/N9xMHH7Sxtj
   gvdD+/Kx4OqNQ/jseUo9NwCBE8VAg2uWoL+G56vGLcubML/W32ZOMc7a8
   nbz3YmSSQRo6T26h/tL3R8GF7xYF6VeN2XTdIl+SLzsrJAsKZaZenDgbh
   Q==;
X-CSE-ConnectionGUID: v+zrGy7VRimRybu8JPUQCQ==
X-CSE-MsgGUID: 9s41envOQmSs0+TrE4eSpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33614641"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="33614641"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 00:16:33 -0700
X-CSE-ConnectionGUID: 9K0+1AyfRha/RGU+uETIcQ==
X-CSE-MsgGUID: gRrxQhn1TSy0zaj59tdxaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20894302"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.251.215.66])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 00:16:20 -0700
Message-ID: <c9f382b2-cd96-4ee3-ad68-95381d9e09c0@intel.com>
Date: Thu, 11 Apr 2024 10:16:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bug: Fix no-return-statement warning with !CONFIG_BUG
To: Arnd Bergmann <arnd@arndb.de>
References: <20240410153212.127477-1-adrian.hunter@intel.com>
 <87be83da-6102-483d-b1dc-a77eecc9f780@app.fastmail.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <87be83da-6102-483d-b1dc-a77eecc9f780@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-s390@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/04/24 10:04, Arnd Bergmann wrote:
> On Wed, Apr 10, 2024, at 17:32, Adrian Hunter wrote:
>> BUG() does not return, and arch implementations of BUG() use unreachable()
>> or other non-returning code. However with !CONFIG_BUG, the default
>> implementation is often used instead, and that does not do that. x86 always
>> uses its own implementation, but powerpc with !CONFIG_BUG gives a build
>> error:
>>
>>   kernel/time/timekeeping.c: In function ‘timekeeping_debug_get_ns’:
>>   kernel/time/timekeeping.c:286:1: error: no return statement in function
>>   returning non-void [-Werror=return-type]
>>
>> Add unreachable() to default !CONFIG_BUG BUG() implementation.
> 
> I'm a bit worried about this patch, since we have had problems
> with unreachable() inside of BUG() in the past, and as far as I
> can remember, the current version was the only one that
> actually did the right thing on all compilers.
> 
> One problem with an unreachable() annotation here is that if
> a compiler misanalyses the endless loop, it can decide to
> throw out the entire code path leading up to it and just
> run into undefined behavior instead of printing a BUG()
> message.
> 
> Do you know which compiler version show the warning above?

Original report has a list

	https://lore.kernel.org/all/CA+G9fYvjdZCW=7ZGxS6A_3bysjQ56YF7S-+PNLQ_8a4DKh1Bhg@mail.gmail.com/

