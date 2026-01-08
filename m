Return-Path: <linuxppc-dev+bounces-15417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6956ED026F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 12:37:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dn2tx4PC5z2yGl;
	Thu, 08 Jan 2026 22:37:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767872233;
	cv=none; b=CqmKAfp4GCcgIgHOIyW9exyNHHXUsBharAyUvqRfQvLZpzgn42qUqv8bF/2dQEcOpW43dSoIMAUojBoZOIWVTjZg0jhG/lgVVe95DxrdMRVf7V9n96hPgIXfGs8nAhUoEm5KlqdHR4ZBCBcJs9xc6/I5jm9CMKSzbAE4zXaSJJTMCeLXOQ/mu29U4mtt2D9CDbLgVqnwH7EdPot1Z+6dM4/iNB6x+ej3wHLfVvkJZgAdWZH/D168bqcdgJv1tDOug3lQ9sAf8LRjMBpilMfMd8FAHkI7/zeF7HQ+zVgTAowNdsS0Q0326L39YzKFFfuxXYEz1FFFM46jGEAOZ7Y/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767872233; c=relaxed/relaxed;
	bh=jzdYEgrzzEHAbsKGK1TfXPqFuiXDJDpoPhLR/Fd2ZG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LsqWwgVeV/CH8QMOBdXyfgnmh/ZZLVroqPRUKuTCvow1FhOKvNt+iaSl9if3fJCib4QkgJGUveyVv3EkiLC4CBPxor0qHhjh7zl9CMfdfzv4SFzL6EGAVeOoMua5fzC4w0H6VrnUI9lW1NukQRbw+XIc5vecF1MA5nhxZ9WZ0V4aCpsOIxb9LpD+hkI7/FnHoeiBI0e0oSjE8dQ3hNjGC1AkA/gPaHleH1jT4q2/Kt0KNHQ26EyIcu2wRurClu0xiTujl0GWvm/pDU82WGchmOJI5fTaN/i8k0TMNhuzN3zbaiChIkt9bfWR/0hGopgVr2EEV+98LTICN4C+taFU9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jmq2fw5P; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jmq2fw5P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dn2tt3Kqwz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 22:37:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767872230; x=1799408230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jzdYEgrzzEHAbsKGK1TfXPqFuiXDJDpoPhLR/Fd2ZG4=;
  b=Jmq2fw5P6tpUJWn2VEazpNW1N1DR7FYdimnbeYY8+ZOn6kpssG7jgoGm
   64Lufwc/HdKIOqV4iDJu5egTXTWY90t/PX7ZS+VFIzdT7H3uGoTzz+RC5
   xGT55IvNqwsOinFsaK6w1cjZW3J+rOiNHPITcqZuGJZX7efVI1wCKA9X4
   u/RxeFELnOak9WODmyQwrHnRqZsMM8jp/nw3/G7kwRi97cxkVMW1GCD9D
   OMYt6u6Bv3wz83uT0APdICawEPie4R36IMDikjy1fuJsQMoNmIOdaRa9b
   8wO+a1m/J3b3XfYjX3koZFWDRTQw75Wp8Ah7kDuQnRngKYMZqsa9aK7mK
   A==;
X-CSE-ConnectionGUID: 7MGuo5bJTj6uMD8GYs5brQ==
X-CSE-MsgGUID: juqY5atbQdW6MF5hU09QWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="79547985"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="79547985"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 03:37:06 -0800
X-CSE-ConnectionGUID: S2N2NM28S9ikmBT4twszjA==
X-CSE-MsgGUID: 1TBz1duORRyaggZDd90VpA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jan 2026 03:37:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6C40898; Thu, 08 Jan 2026 12:37:01 +0100 (CET)
Date: Thu, 8 Jan 2026 12:37:01 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: YehezkelShB@gmail.com, andreas.noever@gmail.com, bhelgaas@google.com,
	bp@alien8.de, dave.hansen@linux.intel.com,
	feng.tang@linux.alibaba.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	lukas@wunner.de, mahesh@linux.ibm.com, mingo@redhat.com,
	oohall@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com,
	tglx@linutronix.de, westeri@kernel.org, x86@kernel.org
Subject: Re: [PATCH v4] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Message-ID: <20260108113701.GR2275908@black.igk.intel.com>
References: <20260108095303.GQ2275908@black.igk.intel.com>
 <20260108103358.3412-1-atharvatiwarilinuxdev@gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260108103358.3412-1-atharvatiwarilinuxdev@gmail.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 08, 2026 at 10:33:58AM +0000, Atharva Tiwari wrote:
> I am using a SD-card reader in the thunderbolt port (usb-c)

Okay, so regular USB 3.x device not a USB4/TB.

> Unfoutunatly my linux install got bricked because of macOS update,
> so i cant provide dmesg, but i have lspci saved on macOS:

I saw that in the bugzilla too but it is missing the capabilities (that's
why I asked 'sudo lspci -vv' output so it also dumps the capabilities and
hopefully sheds some light why the AER message flood happens).

