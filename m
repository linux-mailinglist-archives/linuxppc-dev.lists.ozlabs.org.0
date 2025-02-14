Return-Path: <linuxppc-dev+bounces-6196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED16A36096
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 15:37:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvZQY6fGMz30Yb;
	Sat, 15 Feb 2025 01:37:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739543861;
	cv=none; b=ft6U+hyxHX8bM17JQBrelawAjcvP4IRVTv+SCX3ON3cRy5P4ZRg7rIVniHpE6uwrSBjmLNTba0WbEmaY/eml6/rVwUeVuaZlpGNITOGwBd1Pl9tb2gZBauBJgOre0NnccGF2EFVGzmZI0yjc+zzPyqg64gOTv/Cj0RbErkiGbNFjVicHuLPHrxpnNqdkoJ3rrs8mYoxUtIDCeKgSOGomPjkXB+ZVAU/Gbt6ts3wJJ0eZaE2ZDP/Giebu0MQWZhQpZVn0alUDIREc92qn7jsiDl/83lCePH493nTkqY582mcnFIErorAwzkq2QwxTqoVWK2dBHLuefDof6iUtyzAuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739543861; c=relaxed/relaxed;
	bh=XX8/CFH+dQrmV8ZNySyD5IDDqoz1cxtcxwJul1+i4C8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kKe8peucAFeXX313pfQObAe1CHE2pOd2+nrCEHKJATIDHqA3PmeGb4VMJP8XLtC+JJ6MAAAOfV037Gb/EnA24hcxvQA6GhwzBpXIxy4kyq9JUDiwzfoO298JyvEkJ+6m7N8OoC3rbaNvULCOLx4JE3MzNWWiYdFaULG7c7kMhk9jwcNT4aHomsHzVSAJ6lIVoP30FwSOf72UZGCF+IctjSquqgHVfaRynv84NHmHb7ciqdmX4brZLdb2ttEeWdoO/Awa6wmcIGCv3ghWn7V0OG8x+x2HyJTAynDmBCyb/WWTPIY5BKMWbhoVrUN1PLp+QTIwxKKjdu6XjGq9q0B59w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FhkCsZ8S; dkim-atps=neutral; spf=none (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FhkCsZ8S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvZQW39RBz30XR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2025 01:37:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739543860; x=1771079860;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iP9rILo1pieoX7MujpuvZrfyhcl6FWNIG3xPCJe47D8=;
  b=FhkCsZ8SuhuFD5xsOKGWALpLhgJTKljRiUO9mlToBb6u0jZVE43AUi39
   UqsGrTOOI6bHLfcg17bQ5DVEVI7mzZz/z0+GFYzNewB1eyNftRn7eQMu2
   8Qsu8OHK5fqnGwYEfyLfP+eBA1dfdiUq7jGnQ2+9LbPWmfZjVe6BsQh2e
   MrVUYsuwvYhwWYhkiNAYgInGfM0Zu+MwldbCajHdEjGLBBGzRirX0p+s3
   nX6jjh/lCozZAHVAG1GJa+qJAfscg2FiYwXCqpQLhhoer4yypnDz9We0T
   sfNXtdssuDBQUvGMZq5P/+PoA43kSIMUKIYtBLBRKBxulOfozhEYMXtDR
   w==;
X-CSE-ConnectionGUID: V+j43grMQEmW9s7oVfI7Yw==
X-CSE-MsgGUID: xX88oHobSUuk4SilhgSgfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40157601"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40157601"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 06:37:36 -0800
X-CSE-ConnectionGUID: qH+p86lhRk6Y+78IEsYq6g==
X-CSE-MsgGUID: uOBG/QX5SeO3uRT0KYLYGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136699809"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.228])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 06:37:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 14 Feb 2025 16:37:30 +0200 (EET)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
    Karolina Stolarek <karolina.stolarek@oracle.com>, 
    LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
    Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
    Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH 3/4] PCI: shpchp: Cleanup logging and debug wrappers
In-Reply-To: <20250213220453.GA135512@bhelgaas>
Message-ID: <582c718e-568d-7f70-aef7-b0206600d3a3@linux.intel.com>
References: <20250213220453.GA135512@bhelgaas>
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
Content-Type: multipart/mixed; boundary="8323328-872026427-1739543850=:944"
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-872026427-1739543850=:944
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 13 Feb 2025, Bjorn Helgaas wrote:

> On Mon, Dec 16, 2024 at 06:10:11PM +0200, Ilpo J=C3=A4rvinen wrote:
> > The shpchp hotplug driver defines logging wrappers ctrl_*() and another
> > set of wrappers with generic names which are just duplicates of
> > existing generic printk() wrappers. Only the former are useful to
> > preserve as they handle the controller dereferencing (the latter are
> > also unused).
> >=20
> > The "shpchp_debug" module parameter is used to enable debug logging.
> > The generic ability to turn on/off debug prints dynamically covers this
> > usecase already so there is no need to module specific debug handling.
> > The ctrl_dbg() wrapper also uses a low-level pci_printk() despite
> > always using KERN_DEBUG level.
>=20
> I think it's great to get rid of the module param.  Can you include
> a hint about how users of shpchp_debug should now enable debug prints?
>=20
> The one I have in my notes is to set CONFIG_DYNAMIC_DEBUG=3Dy and boot
> with 'dyndbg=3D"file drivers/pci/* +p"'.

Sure, I'll add the info and split the change as you suggested below.

> > Convert ctrl_dbg() to use the pci_dbg() and remove "shpchp_debug" check
> > from it.
> >=20
> > Removing the non-ctrl variants of logging wrappers and "shpchp_debug"
> > module parameter as they are no longer used.
>=20
> > -#define dbg(format, arg...)=09=09=09=09=09=09\
> > -do {=09=09=09=09=09=09=09=09=09\
> > -=09if (shpchp_debug)=09=09=09=09=09=09\
> > -=09=09printk(KERN_DEBUG "%s: " format, MY_NAME, ## arg);=09\
> > -} while (0)
> > -#define err(format, arg...)=09=09=09=09=09=09\
> > -=09printk(KERN_ERR "%s: " format, MY_NAME, ## arg)
> > -#define info(format, arg...)=09=09=09=09=09=09\
> > -=09printk(KERN_INFO "%s: " format, MY_NAME, ## arg)
> > -#define warn(format, arg...)=09=09=09=09=09=09\
> > -=09printk(KERN_WARNING "%s: " format, MY_NAME, ## arg)
>=20
> The above are unused, aren't they?  Can we make a separate patch to
> remove these, for ease of describing and reviewing?

--=20
 i.

--8323328-872026427-1739543850=:944--

