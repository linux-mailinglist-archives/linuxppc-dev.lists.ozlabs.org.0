Return-Path: <linuxppc-dev+bounces-3925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4C9EB935
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 19:20:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y76VZ3KXpz2yvh;
	Wed, 11 Dec 2024 05:20:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733854854;
	cv=none; b=EVYrdjim4vTnh2WZLdQiYylOIM8Q2Rgw67t9bz2SkEdTfSLLV1uc6h3ac+Iqpg2v75+NA1MlCXOb+AJBYNrXiWStTGZmKEnDVIkh1zbsuxmKJ3I7UQo9O6cLUAdqHA5Zvif0oflutL/nla7/zISCQZOiUsDx3r5ShRhjUcW6pZvkYfCUiHVItmEN/0J2MW0rTZYxqsd1iM7BzZ/K4PjdisqfXmUWskslIjxVvJt6TUtdYixi16ckT2fJRprF1ZGSlwd4IucW7O5slk05mztHHRbx6vRAFVRxWbsXg5cSrBJsB5AanhXBiMn2PvUIvnmrM3J6PRmLlxWa0oX/67r8hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733854854; c=relaxed/relaxed;
	bh=eK4GlBn6oLjIf2lO+aA7UPawj/3WzZ9ZOg56Ey1eZ18=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VmnUHc3MHVZM42o3+/z37MHXhZbPncGbVIa3hE9+1Iv5ixbeEaJxPNxlFxxrKwm+MwaQn4ptkEOKQAn4EUUNZS5Eq9DueGij+kqs+0OXricScrC8YigDX3Jd3boO8zzCE/57biDYhxAuTGJdzYERm9O/zCgmIfvWc/cOgRqNaUtJO7liR1CfTX7Q8QVeu9PJxOCyOp+e+7JD34OcxZXn6o0NNj2OJ8xnkRjqktB5+qsSFPLp+EOG9sEMkBtVEJGFGxndPTtYrWP0UXb8WGfSlVnHCu0/smsyhy0midWYTChKcuacwoc786JQpdtY0QnoOKrKy9E8ZbSW/sbKXGhV0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mGta4y4r; dkim-atps=neutral; spf=none (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mGta4y4r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Wed, 11 Dec 2024 05:20:50 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y76VV53bRz2ynr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 05:20:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733854851; x=1765390851;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bOl88BIrBVQcyS4UvrQpTwuyM5PF7qtNXyWSrImey1s=;
  b=mGta4y4rxHkgYapDxPUFnbc8imT5krXCDbaTRuOmqi1xJYNuEQAd5Q09
   J58xo6OuO6nz2lLM6Z+U4ShtYa8zOQzlcWW8uzHGdWWrWI25PVP8F/3BT
   bgREI1HNA2usz7nnjfvrDQtHvkf3VGO1IBELCG4UY7YQIJjX7NkmlVXqv
   +UnVJYNbVmN9PkiqvsDpKptyuW4UxLebmfoiP7nA2sD2L9dcBwPib1+/U
   lfKdoC4iV1zRlIMcWphS9LVtLMgvkF8kEPKydm3WUksLCA+kOOylv8dy5
   u4Cm1/QmbZbz6RHKjXsnrT4+BsfyDCu98d2IM+ntIKoTM27wD+ALNdpw5
   A==;
X-CSE-ConnectionGUID: uWWdWNv1Tu6+hcLycdY/WA==
X-CSE-MsgGUID: 4u98f+uATJ6laG9RX1ef9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="51626754"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="51626754"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 10:19:42 -0800
X-CSE-ConnectionGUID: V8DJcyq5QXmnIWhcgVU0TA==
X-CSE-MsgGUID: M4jpkmM9QUmVBhSJX0WQWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; 
   d="scan'208";a="99986249"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.56])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 10:19:39 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Dec 2024 20:19:36 +0200 (EET)
To: Bjorn Helgaas <bhelgaas@google.com>
cc: linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>, Lukas Wunner <lukas@wunner.de>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, 
    LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 0/8] PCI: Consolidate TLP Log reading and printing
In-Reply-To: <cb44bafe-a7ec-889b-5c1c-ee8ca6c540a0@linux.intel.com>
Message-ID: <38a03e53-789e-363a-c336-dc939161d7d7@linux.intel.com>
References: <20240913143632.5277-1-ilpo.jarvinen@linux.intel.com> <cb44bafe-a7ec-889b-5c1c-ee8ca6c540a0@linux.intel.com>
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
Content-Type: multipart/mixed; boundary="8323328-1421109454-1733854776=:905"
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1421109454-1733854776=:905
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 23 Oct 2024, Ilpo J=E4rvinen wrote:

> On Fri, 13 Sep 2024, Ilpo J=E4rvinen wrote:
>=20
> > This series has the remaining patches of the AER & DPC TLP Log handling
> > consolidation and now includes a few minor improvements to the earlier
> > accepted TLP Logging code.
> >=20
> > v6:
> > - Preserve "AER:"/"DPC:" prefix on the printed TLP line
> > - New patch to add "AER:" also  on other lines of the AER error dump
>=20
> Hi Bjorn,
>=20
> A small reminder this series exists.

Another reminder about this series. :-)

--=20
 i.

--8323328-1421109454-1733854776=:905--

