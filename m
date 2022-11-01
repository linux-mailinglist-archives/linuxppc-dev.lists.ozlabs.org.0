Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7099A6154DE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 23:20:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N24Fz2TTvz3cQk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 09:20:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q1jxn5yU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q1jxn5yU;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N24F11NYxz2xGn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 09:19:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5D646B81F88;
	Tue,  1 Nov 2022 22:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D4EC433C1;
	Tue,  1 Nov 2022 22:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667341152;
	bh=v73XKO2dv2pQM4fjAlceJjzyyZMYGzwj0m0kkoHnX+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1jxn5yUzPeL4LWxwxAZASOqIIgRdDe9758utQluhnfNNyDSOfZu8ClF1k36FvoBA
	 AYwU/qVpCCtDIAeDXetD+7ab0keCb2OJhuZJ5+B+jUwPmb9xdWa45bgKzt1PkhnTzn
	 cXxVOuL208rThnbGHCJYalTQXS1R8Pp5Ll1r2zl9+6f9wPiuw7VxtkReUXpGmzg9fQ
	 05+C6BwXSdgHrh8mNWhvgMC7RaXn2fPihP6MRQ52QRpfOPHYl21b10B/eBGRm5RfGE
	 sIv7TFs7yR0K04zVXebQjfu76KvMh4d+q2KX+B8NuktGdK98j3NNm1FWNc3xho721l
	 foIiJryaFhtfw==
Received: by pali.im (Postfix)
	id 2C3AB7F8; Tue,  1 Nov 2022 23:19:09 +0100 (CET)
Date: Tue, 1 Nov 2022 23:19:09 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/fsl-pci: Choose PCI host bridge with alias pci0
 as the primary
Message-ID: <20221101221909.3u5ateevc7ka2ysv@pali>
References: <20220820123327.20551-1-pali@kernel.org>
 <20221009110808.agfixtgneshui47o@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221009110808.agfixtgneshui47o@pali>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello! I would like to remind this patch.

On Sunday 09 October 2022 13:08:08 Pali Rohár wrote:
> Hello! Any opinion on this patch?
> 
> On Saturday 20 August 2022 14:33:27 Pali Rohár wrote:
> > If there's no PCI host bridge with ISA then check for PCI host bridge with
> > alias "pci0" (first PCI host bridge) and if it exists then choose it as the
> > primary PCI host bridge.
> > 
> > This makes choice of primary PCI host bridge more stable across boots and
> > updates as the last fallback candidate for primary PCI host bridge (if
> > there is no choice) is selected arbitrary.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >  arch/powerpc/sysdev/fsl_pci.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
> > index 1011cfea2e32..e4b703943dd3 100644
> > --- a/arch/powerpc/sysdev/fsl_pci.c
> > +++ b/arch/powerpc/sysdev/fsl_pci.c
> > @@ -1125,6 +1125,19 @@ void __init fsl_pci_assign_primary(void)
> >  			return;
> >  	}
> >  
> > +	/*
> > +	 * If there's no PCI host bridge with ISA then check for
> > +	 * PCI host bridge with alias "pci0" (first PCI host bridge).
> > +	 */
> > +	np = of_find_node_by_path("pci0");
> > +	if (np && of_match_node(pci_ids, np) && of_device_is_available(np)) {
> > +		fsl_pci_primary = np;
> > +		of_node_put(np);
> > +		return;
> > +	}
> > +	if (np)
> > +		of_node_put(np);
> > +
> >  	/*
> >  	 * If there's no PCI host bridge with ISA, arbitrarily
> >  	 * designate one as primary.  This can go away once
> > -- 
> > 2.20.1
> > 
