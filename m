Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5E16E90F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 12:51:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2DwR1Dz2z3fTn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 20:51:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pun8GlzU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=mika.westerberg@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pun8GlzU;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2Dvb2T8pz3chl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 20:50:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681987819; x=1713523819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KmE64Zj6fg+JjmPyFrX4JWdvnkdBVGIAbEnhh9TTANI=;
  b=Pun8GlzUevWjchaKUskD/wvJZUuW4LrLH4uU1sfgODdKF5P2f7h1CRnk
   l6bZ7x3zcF+fBb3IT8f4KvWdCCqc/CiBt/Y8BB9qgc2/Ip0IBv/Qa6acb
   8f+0/AG0PvlgBxKMzS2kwXJuevGIGcXXzzPza/xZnreZ7CfYA66V+QiTy
   /ajUDUw2P04iJBFwhYI690tABA7UJyDMK+dVI3M4uXCRTEvkG11dEz6T0
   o2zWIPJ7uTyPnczsOEj2u6B9dmS6gnXeYD5F95qEUC/B04B4/wiWdvMUR
   QUqhuS52EieXTkv14AV08Kf7KQHYa7GwjPSyCwjVyUVWQ/DBHSaqYGQmx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373596344"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="373596344"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 03:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="803299501"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="803299501"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2023 03:50:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A04B721E7; Thu, 20 Apr 2023 13:50:13 +0300 (EEST)
Date: Thu, 20 Apr 2023 13:50:13 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2 3/4] PCI/AER: Disable AER interrupt on suspend
Message-ID: <20230420105013.GN66750@black.fi.intel.com>
References: <20230420015830.309845-1-kai.heng.feng@canonical.com>
 <20230420015830.309845-3-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230420015830.309845-3-kai.heng.feng@canonical.com>
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

On Thu, Apr 20, 2023 at 09:58:29AM +0800, Kai-Heng Feng wrote:
> PCIe service that shares IRQ with PME may cause spurious wakeup on
> system suspend.
> 
> PCIe Base Spec 5.0, section 5.2 "Link State Power Management" states
> that TLP and DLLP transmission is disabled for a Link in L2/L3 Ready
> (D3hot), L2 (D3cold with aux power) and L3 (D3cold), so we don't lose
> much here to disable AER during system suspend.
> 
> This is very similar to previous attempts to suspend AER and DPC [1],
> but with a different reason.
> 
> [1] https://lore.kernel.org/linux-pci/20220408153159.106741-1-kai.heng.feng@canonical.com/
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
