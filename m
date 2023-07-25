Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968B376232A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 22:18:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=ajkMW1Pb;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=ZO9RvjKM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9Sz920K1z3cG1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 06:18:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa1 header.b=ajkMW1Pb;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed1 header.b=ZO9RvjKM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mailrelay2-1.pub.mailoutpod2-cph3.one.com (client-ip=2a02:2350:5:401::1; helo=mailrelay2-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 11725 seconds by postgrey-1.37 at boromir; Wed, 26 Jul 2023 06:17:46 AEST
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9Sy25z8Vz3bcS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 06:17:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=sduBUGWe44xQWwq5ehD9FZfNDPxgCDY8mIHiqy0iMz0=;
	b=ajkMW1PbXV5ZNeCv6fGQDs8eCTKwm7tceSP+u4iKBg3fNgHNE5tV7E89uNWKbRZqpuCxzKkrJawHl
	 yZU3If0GP8ob2d0p3XB9VXvIVdrDkRxKoyhDrBpdtFTi2zket7AWCHMsbEuLLBJi/9yY2Ms/6kaMSb
	 iIi3sHzlOuMqcdRacGOcZ+YQvG7FbiE4V3usqsPR+psnzErUFIVQ3mKBQQytHSMsCIerdLp87Ap4Td
	 Vja0V543JkCFspeWF/652AuyFvyEPdg4xrxTvwa7zXia8h2N/jKULJp2EGJnNzeCPQWNt63WGu6VO2
	 OXhW0cGJGqGY4httMvwl2WXUcaj7i9A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=sduBUGWe44xQWwq5ehD9FZfNDPxgCDY8mIHiqy0iMz0=;
	b=ZO9RvjKMywyAQZYeVC+Ms4lsmJ/5kmXCirU8i8gP9NL5789egvdahQABh7frEO38MtS2NdXXsBrUx
	 QTBqrcmBA==
X-HalOne-ID: d70c573f-2b0c-11ee-880d-5ba399456a4a
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay2 (Halon) with ESMTPSA
	id d70c573f-2b0c-11ee-880d-5ba399456a4a;
	Tue, 25 Jul 2023 17:01:05 +0000 (UTC)
Date: Tue, 25 Jul 2023 19:01:04 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: linux@treblig.org
Subject: Re: [PATCH] powerpc: Use shared font data
Message-ID: <20230725170104.GA838289@ravnborg.org>
References: <20230725000141.165985-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725000141.165985-1-linux@treblig.org>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi David,

On Tue, Jul 25, 2023 at 01:01:41AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> PowerPC has a 'btext' font used for the console which is almost identical
> to the shared font_sun8x16, so use it rather than duplicating the data.
> 
> They were actually identical until about a decade ago when
>    commit bcfbeecea11c ("drivers: console: font_: Change a glyph from
>                         "broken bar" to "vertical line"")
> 
> which changed the | in the shared font to be a solid
> bar rather than a broken bar.  That's the only difference.
> 
> This was originally spotted by PMD which noticed that sparc does
> the same thing with the same data, and they also share a bunch
> of functions to manipulate the data.  I've previously posted a near
> identical patch for sparc.
> 
> One difference I notice in PowerPC is that there are a bunch of compile
> options for the .c files for the early code to avoid a bunch of security
> compilation features;  it's not clear to me if this is a problem for
> this font data.
> 
> Tested very lightly with a boot without FS in qemu.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Yep, looks very similar to sparc, so

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
