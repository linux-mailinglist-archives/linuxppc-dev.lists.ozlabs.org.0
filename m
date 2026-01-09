Return-Path: <linuxppc-dev+bounces-15453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFBFD086EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 11:08:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnctb2V8xz2xc8;
	Fri, 09 Jan 2026 21:08:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767953335;
	cv=none; b=SddDgBID0jb/EiFCUMikZNwXlQizxznVsp9GS32AkvlIWFs1kCZgowk9vs9VglUSsRyfB9c+4yywNY5mwj/ClrYC5ZohygkyD0ersrYAfeBNET2toJbySkHCPo1Pe410yniWqjm5dRyZqGLbmXBhKERyXG9dd6FkTkJ0ywqGiCnv+bq9wnHlqTZKYgQuE/X3BFZd/fJQUAzvy+tk4zd6YmBjWEynBIhCLvHsVwTtqUcBbRMsUzlE7Levr2GcE+j5cI8QNy/UtK6L9Hjg35FjGQGwb7nIU6Xnil8g0lZF8M6OizO8wdca9QqO9m/D0VHaPoc1BYB35amoY39UvH9dEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767953335; c=relaxed/relaxed;
	bh=wSpJdpCgwYI70QDx2H55GLcEmOq8lwxjbpazYvK7aFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjFk5UcmCzxUKPEakAURmtRTlc/mvz5Q+fhpmb2TylwN5aJ4pZE0hYRC8N8vaxUaPl60ANLPW1tu4eU4xhOJiLx/3PhLgNrOa+rGok2CIWub0ChKsDSYrkhzK5daiCdA3hfrvETIJrTY7dT1N8Idc5nthOhWqAfd4zBlpD2R9eJyk/I9brT+Ii0tmLJJYCzWvRJNFlXVe/6FJb2it3D5sA1lcofA8Cu1SROiYKQ2pBHBaXdJY/qycLrvr0hSQb+gqKg4sD7X8J8aTy/3Z5YRY0HL7ZKmtT7jC9NAdd8bJzWM/8pdTzaEo8h6dWp/Y2cWEvAndIkAPDn5cIKjih+6GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PtCmjrHJ; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PtCmjrHJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnctW5rflz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 21:08:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767953333; x=1799489333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wSpJdpCgwYI70QDx2H55GLcEmOq8lwxjbpazYvK7aFc=;
  b=PtCmjrHJ0bQhvis77FQKJC0wT+p5fUUPtzkssmBI010PuMEcOsNkqJN3
   sBMmOiOJthUQ0to6juU9IJtIHDjxqeswmSItKibahhZ+eTEur9W3gDXn8
   L22VDkoB/tHPBWHhlEPRfFaAMBYJUVRW0RXFTR+SivRtP8XtYttdSchAi
   sgQ+AXwEVFWzHWOVe0bpkKbSUB7VZ8z4V7ZRXuTf0uzRycVbycCozKCPk
   omdEhbao4SfHJCoFPAEl5c+S7V3/QSlV6tCKBhdaKSUyjdB4W3upV7FNp
   +E/sCtO5SrzvHqq2npSq3zEkGx4jmVm2fA5+SN05DMKXrAf2qc0tSy0XQ
   g==;
X-CSE-ConnectionGUID: Yy4XTlBZRseHTFeRfkPjeA==
X-CSE-MsgGUID: RkzfhXGsR1mtN0d4l4J17A==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69073305"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="69073305"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 02:08:46 -0800
X-CSE-ConnectionGUID: fau+vArzSbCFPShL6lag4g==
X-CSE-MsgGUID: jCJZ+NxqRlua/HZuD/aEDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="234624792"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 09 Jan 2026 02:08:42 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BD9F094; Fri, 09 Jan 2026 11:08:40 +0100 (CET)
Date: Fri, 9 Jan 2026 11:08:40 +0100
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
Message-ID: <20260109100840.GV2275908@black.igk.intel.com>
References: <20260109065746.GT2275908@black.igk.intel.com>
 <20260109081419.2746-1-atharvatiwarilinuxdev@gmail.com>
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
In-Reply-To: <20260109081419.2746-1-atharvatiwarilinuxdev@gmail.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 09, 2026 at 08:14:19AM +0000, Atharva Tiwari wrote:
> unfourtunatly the GRUB problem isint fixed, and the solution i see, is to
> wipe the drive which i cant do currently, because of my data

Okay but how do you then test the patch you keep sending several version if
you cannot boot to a new kernel?

