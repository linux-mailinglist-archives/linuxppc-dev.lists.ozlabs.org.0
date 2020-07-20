Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17597225C9D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 12:27:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9Hw73nxdzDqZn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 20:27:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jikos@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=l67PkE/R; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9Ht246K3zDqGp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 20:25:14 +1000 (AEST)
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2271720773;
 Mon, 20 Jul 2020 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595240711;
 bh=0yBRtrgV0oqduFYbAUYHsxtbhEuVwVxiP2Pd1Cr8R58=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=l67PkE/RzLWY5IkeqGPvMecT7x4zFXpW12kIP45RZ86WvEb1Sn2xYUErgiyS7zR9z
 iM2UJUxFBVI/8PD3ncVI0Mai9Pu8CnDc5m7WdPOC/BneNLu8+xOGjjEPpmJ4VYRApH
 9NNGRJbatWfF0q4no1fNxX30JZtn0YsjBF4Qjuuc=
Date: Mon, 20 Jul 2020 12:25:08 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH] HID: udraw-ps3: Replace HTTP links with HTTPS ones
In-Reply-To: <c1ce6d1eaeed9e239742c12f4f82c84ad3f36fd4.camel@hadess.net>
Message-ID: <nycvar.YFH.7.76.2007201225020.23768@cbobk.fhfr.pm>
References: <20200718103344.3407-1-grandmaster@al2klimov.de>
 <c1ce6d1eaeed9e239742c12f4f82c84ad3f36fd4.camel@hadess.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-kernel@vger.kernel.org, benjamin.tissoires@redhat.com,
 paulus@samba.org, "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 18 Jul 2020, Bastien Nocera wrote:

> > Rationale:
> > Reduces attack surface on kernel devs opening the links for MITM
> > as HTTPS traffic is much harder to manipulate.
> > 
> > Deterministic algorithm:
> > For each file:
> >   If not .svg:
> >     For each line:
> >       If doesn't contain `\bxmlns\b`:
> >         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> > 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
> >             If both the HTTP and HTTPS versions
> >             return 200 OK and serve the same content:
> >               Replace HTTP with HTTPS.
> > 
> > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> 
> Looks good!
> 
> Acked-by: Bastien Nocera <hadess@hadess.net>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

