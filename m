Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 656792D0EE9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 12:25:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqLZK5pYNzDqWT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 22:24:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqLSJ4hhrzDqWM
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 22:19:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=K6WHIa2S; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CqLSF5L03z8tYl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Dec 2020 22:19:41 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CqLSF2PdHz9sWj; Mon,  7 Dec 2020 22:19:41 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=K6WHIa2S; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CqLSD65Whz9sW9
 for <linuxppc-dev@ozlabs.org>; Mon,  7 Dec 2020 22:19:40 +1100 (AEDT)
Received: from zn.tnic (p4fed31e1.dip0.t-ipconnect.de [79.237.49.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B320C1EC0426;
 Mon,  7 Dec 2020 12:19:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1607339977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=XYWwByMWitnTEsriHnMquiuoxbw9xmBiP+xQcZ42uX4=;
 b=K6WHIa2SoRS6q4VIUPe4HJd5VmZEJmehKXp5SsjskOBJvvF0eDYdwCSzDL0lo73Ak+6Exc
 7l0UqIk+eoklpvjoARYuh4z69Gnm0ppa8OvDSixAtY3bSIj8IApn/BvgOs7aOfBvUkZn3p
 rrAH7XqXww1P6eeoDudEnGhesjgXU1c=
Date: Mon, 7 Dec 2020 12:17:27 +0100
From: Borislav Petkov <bp@alien8.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] EDAC/mv64x60: Remove orphan mv64x60 driver
Message-ID: <20201207111727.GC20489@zn.tnic>
References: <20201207040253.628528-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201207040253.628528-1-mpe@ellerman.id.au>
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
Cc: tony.luck@intel.com, rric@kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, james.morse@arm.com, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 07, 2020 at 03:02:53PM +1100, Michael Ellerman wrote:
> The mv64x60 EDAC driver depends on CONFIG_MV64X60. But that symbol is
> not user-selectable, and the last code that selected it was removed
> with the C2K board support in 2018, see:
> 
>   92c8c16f3457 ("powerpc/embedded6xx: Remove C2K board support")
> 
> That means the driver is now dead code, so remove it.
> 
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  drivers/edac/Kconfig        |   7 -
>  drivers/edac/Makefile       |   1 -
>  drivers/edac/mv64x60_edac.c | 883 ------------------------------------
>  drivers/edac/mv64x60_edac.h | 114 -----
>  4 files changed, 1005 deletions(-)
>  delete mode 100644 drivers/edac/mv64x60_edac.c
>  delete mode 100644 drivers/edac/mv64x60_edac.h

Gladly taken and applied, thanks!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
