Return-Path: <linuxppc-dev+bounces-9289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7150AD53D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 13:26:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHNdZ2Zdsz2yMt;
	Wed, 11 Jun 2025 21:26:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749641170;
	cv=none; b=CmWUPtsAYzi3yziiqRd73Fmt+btOTWJ66ZwovnXvTf+d+dHM0NWWWNHqlkg4n1cfJhCbNyYJIyyneWFiXEasQCMOnufRAKAp7Tlp2VHkXHOGdm1UoEgjQ3PpixDtHxjE0iyb30vlV/0ziBX2JcJINeDcVfeA+Pck97u7sm3qEVPjalE6wrKMOltAoBFGTB+pB40TLTlupJzUFMppSX07JGBwSLalBYdr3HltT2isEyTYmFn5H+G4A5R9IYXg67SAsR8GFZ5uV6ykfvtC4CJtdjkNZT+7H0D+L/GF9xyFQcRu/OOtRVd/ekWfad7tt55o1espUnY4KvlQEu2tKjzxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749641170; c=relaxed/relaxed;
	bh=8/Jds3HRbPgOCb4kMVLrITyl6wUVrXj3cxGub7+s0po=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DptswCPKzuMDmpJArJml6Q4ntD6EgDjW/FKPyfOU0jMnoqe0cCKG2LRNv53+gP9eSJdu88qKxLTvzWnmuz4e9CWJrdX3ZmErVUNj13y/l26eKFv2usNhbEAMucK2i2xJl/TX1sV67OfpacdKBh7aelPtUyxAcvAAGhj6Wtexqdm9sARd4hZDh8M/0cahvfjljtYFaqqQbIrjZgZ03ZV7cpSEPkGqdNsYso7haHma5GBzCTBAjSvmPOFhQiwxxE4Uupq9LMNnq3CgfMP3nb0/HsKIcPNW0Y54O02V8/GMp/EvIUdaN7u1cRWEj7UaZf57TfZ+XD9jzagFg/cEN7+4fA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CQ1WtC7P; dkim-atps=neutral; spf=none (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CQ1WtC7P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHNdX2dJ8z2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 21:26:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749641169; x=1781177169;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2GfVP3Z9YcDigzZONt06cS6x+4ldhMcMNo3koUPT450=;
  b=CQ1WtC7PhM6umWKM5Q7JSGjrhkcPD1uNLiZXJWMqGNsdS4zWhEb1idFz
   bwopKPrHk4a0nFYUr6Tpq6SK/JQqrRJ1U1esk3nO3+HDxkgLSqJpFmHie
   8BphNN6u8WLu6T/UB+v9FvLrlp9C0tpCSTGZyJV7UP9FVqWfZ9qjPVewX
   HUBIHE6zVIH+D3looXe7jGyTZQv8RGffzZa4hRUg7qH9KpDbrfQwSWKjF
   xbEBAzp04NKg2Pvzd/D/ddOMNk5xikcwnUVH3ZScWL7sQDCT4iLC/JB12
   q9zkI8Yh/+DwKDyqHAhb8BXivisQStl4GM7VLpkDdNyzz0IuBRWQDprLd
   w==;
X-CSE-ConnectionGUID: EhCiy1t9QUeZZ3enbt0JEA==
X-CSE-MsgGUID: /TQIztuKRaSyQNX2zFQadA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51772671"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51772671"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 04:26:07 -0700
X-CSE-ConnectionGUID: WDQ9oEjJQESrmQ9f+xgpmg==
X-CSE-MsgGUID: SgwegByST9mmtk0IF6lBKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="151950817"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.183])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 04:26:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Jun 2025 14:25:59 +0300 (EEST)
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 05/33] powerpc/powermac: remove unneeded tty includes
In-Reply-To: <20250611100319.186924-6-jirislaby@kernel.org>
Message-ID: <3bd8996c-b463-4b1d-cc45-2a84d47f6cd0@linux.intel.com>
References: <20250611100319.186924-1-jirislaby@kernel.org> <20250611100319.186924-6-jirislaby@kernel.org>
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
Content-Type: multipart/mixed; boundary="8323328-291572204-1749641159=:957"
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-291572204-1749641159=:957
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 11 Jun 2025, Jiri Slaby (SUSE) wrote:

> All these includes must have been cut & pasted. The code does not use
> any tty or vt functionality at all.
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/platforms/powermac/setup.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platf=
orms/powermac/setup.c
> index e119ced05d10..eb092f293113 100644
> --- a/arch/powerpc/platforms/powermac/setup.c
> +++ b/arch/powerpc/platforms/powermac/setup.c
> @@ -28,13 +28,11 @@
>  #include <linux/ptrace.h>
>  #include <linux/export.h>
>  #include <linux/user.h>
> -#include <linux/tty.h>
>  #include <linux/string.h>
>  #include <linux/delay.h>
>  #include <linux/ioport.h>
>  #include <linux/major.h>
>  #include <linux/initrd.h>
> -#include <linux/vt_kern.h>
>  #include <linux/console.h>
>  #include <linux/pci.h>
>  #include <linux/adb.h>

Seems true. I had to actually scan through the file as it does have some=20
console related setup.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-291572204-1749641159=:957--

