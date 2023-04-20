Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 344526E95CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 15:24:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2JKt07LCz3fSR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 23:24:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dfs3YDhN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=mika.westerberg@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dfs3YDhN;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2JJy6qzzz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 23:24:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681997043; x=1713533043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4eXHBNoWZ5C9eV7iYDdSPHHBQ/JfwKX3mi1xRWHKRXU=;
  b=dfs3YDhN2o9Wq7yA/2X9X12IdY+qZW/w8l/VRk7ztFZ/eLzYVR8MJdDH
   Uyw9L+dPchoiRBC+6MdR7WBvwRUS6ePVUkwaU8xcSapiXql6VZeqeGU5T
   Pj8EN7NXnXGbB9di4a8ZZ8JtjnuEXRCuqfNKpzeaSM3qe14Rr9A5As62g
   AnZ7naHqVTpRRxKFfvvfTYX+YPEsuB+dLPAYmjZkxVKa/m+nu/Jp9FTp1
   7GMk2QwY63uq2ez8ECTEULxdzPU0MCYWfkocduFYppSFUyb3XCYEM+vAD
   uX/43mgZMKOAuxCH5ryNCeCJ0dge50ORbXhg/cnmz/cce5w4Qa8bG/ZHJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="344484513"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="344484513"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 06:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756505113"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="756505113"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 20 Apr 2023 06:23:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 3C0261670; Thu, 20 Apr 2023 16:23:59 +0300 (EEST)
Date: Thu, 20 Apr 2023 16:23:59 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v3 2/4] PCI/AER: Factor out interrupt toggling into
 helpers
Message-ID: <20230420132359.GQ66750@black.fi.intel.com>
References: <20230420125941.333675-1-kai.heng.feng@canonical.com>
 <20230420125941.333675-2-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230420125941.333675-2-kai.heng.feng@canonical.com>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 20, 2023 at 08:59:38PM +0800, Kai-Heng Feng wrote:
> There are many places that enable and disable AER interrput, so move
> them into helpers.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
