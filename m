Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F7F44DB4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 18:54:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hqq9c3B64z2yp5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 04:54:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cCjPGJsb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cCjPGJsb; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hqq900jgVz2xDS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Nov 2021 04:54:11 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75A8661354;
 Thu, 11 Nov 2021 17:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636653249;
 bh=VGdrCbIT+aEVXGIz48W9CinquTZXlgiRl/gO9zbM9iY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cCjPGJsbkRfPSkXGPZc3FvP1NVlG6b9On0bH3PhEIaqU0lGJtwBE0IC5vPJXvy6bH
 EoV3HMzsa1GdPn+x/2gbqLdZFzU0h76yzkqO4ZqszbepWa+n31iVjPyFWbFkXMS3fI
 griUA1us8LEXe2BhKB5W0of9mHlwchzelvLE1XajdRpRd1zGF5i1RH9prEfUoOisId
 eV4++HxjL8zM0PCksPwrN2kgsqf16Xn/sgMixCP+7Wu4JADbgoMKsBjUmr/KNpFip1
 kJbGmyR6r/DskdvikqGmdklYf3Q9o6aXnRb7mX5mVV2cvTaYxu3EtoLYDBXRob1OkF
 M4iLqafJgUKAA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id CAB8F410A1; Thu, 11 Nov 2021 14:54:06 -0300 (-03)
Date: Thu, 11 Nov 2021 14:54:06 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: "Paul A. Clarke" <pc@us.ibm.com>
Subject: Re: [PATCH v3] perf vendor events power10: Add metric events json
 file for power10 platform
Message-ID: <YY1Yvt1ElJjeC48b@kernel.org>
References: <20211108060010.177517-1-kjain@linux.ibm.com>
 <20211108144702.GB12060@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108144702.GB12060@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
X-Url: http://acmel.wordpress.com
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 atrajeev@linux.vnet.ibm.com, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Nov 08, 2021 at 08:47:02AM -0600, Paul A. Clarke escreveu:
> On Mon, Nov 08, 2021 at 11:30:10AM +0530, Kajol Jain wrote:
> > Add pmu metric json file for power10 platform.
> > 
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> > ---
> > Changelog
> > v2 -> v3:
> > - Did nit changes in BriefDescription as suggested
> >   by Paul A. Clarke and Michael Ellermen
> 
> LGTM.
> 
> Reviewed-by: Paul A. Clarke <pc@us.ibm.com>

Thanks, applied.

- Arnaldo

