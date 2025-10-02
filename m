Return-Path: <linuxppc-dev+bounces-12643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF37BB5835
	for <lists+linuxppc-dev@lfdr.de>; Thu, 02 Oct 2025 23:56:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cd5GZ5WPwz3cjQ;
	Fri,  3 Oct 2025 07:56:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759442182;
	cv=none; b=LgHHBOq7Iqf9cP8o8iZZIhesJu60Ak7GU3NoOALfWetIdyf/y8qLDKok7ZTLMOoBs+OgWJ+9QWFkUryNWHWP3wUaABYTswp2CHuRmaPQ8hXndNHXkyOaSXPAqsAl83kFveenOVkwLDhoghCn/701kbFoZt0iEQyYHXIy2MhqNnp2Vy6JlRSdZmSkaxgx3e5gjMnFMpBzblbrnT+3nBFJreuTx/0kJbUnvPQPga0cC0GuCePos8DeVVLsYkv/IKx/eja9x7UDp9tOYbcl9++svlOnueLwEpj2StuENGOvTqHrFn+LkxmKYDNWLGp6Xk+tb8QdnOYrdHZNDp7QVWIgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759442182; c=relaxed/relaxed;
	bh=4URfMCjZBE+uYUYh0zzTJhZAiwjJYSbE6jjseJjLzvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqR5XMakGTDxo3dxh8KYUDOqkFVpNf5tG3dPyZOiorL3c/EPYT0dJ/pwybIPpLVQwAqpY3p1ha1iXHjUn+r74ujxUuFN3ioGB5D5VxqW4H8D7AA7aRRjda75GNjnZSloER1HQaE/S+Hr5WYxCBwos8M3LipLpp1wBvxCcu4Ap+AxAEsbLDAXSTkQY08jQJ0YYhv8bn8eRTpI76cpZVDjate9e+qt9K8CNIkSqtdk9XNTXww957WJ1ZuebJGzhNg4UTBdPSjnvJBEKGTYlLEp1mG660LmPe/Cno7CEplktah8Tw5WJBwnwlIRRaK0PbLejh+dvh6RasRJ2EiOClI1Jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gQSlWtsB; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gQSlWtsB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 03 Oct 2025 07:56:19 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cd5GW33gDz3chb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Oct 2025 07:56:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759442180; x=1790978180;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JDcRs6+zRQiNrOxwCHsp7I1LN2ceT5/4riCi9udQYGY=;
  b=gQSlWtsBZw0QTdwdqJdgt1HuUXbrBDwRMEE2yw62HGxARXEzGDkmuwLV
   66X3nc0BeeQ0UKUB5ijFA1TsNtgKyAbnrkSqSeRk4PQjeDUPw1BgHZY6n
   8CG6EG7HDcB/XVOL03WsUd/N6BQozp1KPwHe/H16p78QqyA1ni1gi9QlV
   Ffblw6qMlcZEGJ7uThy71aAhdUAqIiuJRnypnomccpEFNgAyf+0UH54yq
   8TchzWs6oyebEKy622hANmvM6amv5JN/BO4kh96UopIVdty3ipaihGQvD
   XVK/HJ113SjGxsEgMwNm7sGe2jJkUpI8Pj0QbQWzlUotahfEmm4lgzxXM
   g==;
X-CSE-ConnectionGUID: oCpugejfQvmA/l/nV/Jyxw==
X-CSE-MsgGUID: ipWGqxOIQy286w9ZhPQdxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61835600"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="61835600"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 14:55:08 -0700
X-CSE-ConnectionGUID: oTa4cDHKSSux9ZIhphlFgg==
X-CSE-MsgGUID: rGMAOhdQS4+8ii9/PYoYzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="184341681"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [10.125.109.249]) ([10.125.109.249])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 14:55:08 -0700
Message-ID: <a2be781f-96b5-47d1-81fa-b20395ca293a@intel.com>
Date: Thu, 2 Oct 2025 14:55:07 -0700
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
Subject: Re: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command line
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>
Cc: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Rob Herring
 <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pratyush Brahma <quic_pbrahma@quicinc.com>,
 Tomas Mudrunka <tomas.mudrunka@gmail.com>,
 Sean Anderson <sean.anderson@seco.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>,
 Ruslan Ruslichenko <rruslich@cisco.com>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-7-danielwa@cisco.com>
 <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com> <aN7n_5oiPjk-dCyJ@goliath>
 <c8b65db3-a6cf-479d-9a83-23cbc62db1ef@intel.com> <aN7vKgcUeQgCFglQ@goliath>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <aN7vKgcUeQgCFglQ@goliath>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10/2/25 14:31, Daniel Walker (danielwa) wrote:
...
>> BTW, your series looks like a *really* good idea. Please don't let it
>> die. But you might want to trim it down a bit. I'd probably remove the
>> tests and the 'insert-sys-cert' changes to make it more approachable to
>> folks.
> 
> Since x86 is asking for it I think it would trim it down to just
> what is needed for x86. If I don't trim down the architectures it
> ropes in too many people anyway.

That's not a bad idea. Or, even if you can pick two amenable
architectures to start with it will make it really obvious that this is
useful. Two architectures means a *lot*, IMNHO. Two is a billion times
better than one.

> The biggest issue is that libstub would need to be modified, but
> I've never had any luck getting the libstub maintainer to review
> anything. I suspect he would ignore private email too, particularly
> from people he's doesn't know.

Are you talking about Ard?

	EXTENSIBLE FIRMWARE INTERFACE (EFI)
	M:      Ard Biesheuvel <ardb@kernel.org>
	L:      linux-efi@vger.kernel.org
	S:      Maintained
	...
	F:      drivers/firmware/efi/
	F:      include/linux/efi*.h

He's a pretty nice guy and has been active in this thread, so I'm kinda
surprised to hear you're having a hard time there. I'd just try asking
nicely. I'm pretty sure he's "ardb" on the usual IRC networks. IRC is a
great alternative when you're having problems getting your emails seen
in the normal email flood.

BTW, reading the changelog for libstub, it wasn't clear to me that
changes there were _required_ for the series to go forward. For
instance, is the x86 patch useful without libstub changes?

