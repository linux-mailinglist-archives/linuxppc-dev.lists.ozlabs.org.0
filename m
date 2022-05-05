Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 256FB51C434
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 17:48:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvJ4b0kj0z3bvd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 01:47:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D/w2DFtL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D/w2DFtL; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvJ3v0fnlz3bkb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 01:47:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1D8361D26;
 Thu,  5 May 2022 15:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11773C385A4;
 Thu,  5 May 2022 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651765638;
 bh=OsCCpbFBNuB9FABr2gqpVPt+rLWcODshGiCu1ChNxg4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D/w2DFtLFXAKZgxP1PiEIDVsuEz4JGHf8vP4UCdjgweCRDmDWppcLf6FQETo3/Eb0
 kK9ggMq+YM0P/Hlax2FcWBrN/Gc/gPnZcg4Nrbl7hc7fa+2HqhTlrSl0U1JxFswmpz
 zX+Gd5/Pdo8TCrQ4sU432WKS5mlLS6QAYyUf+KoTZdzIUfLRYFBBia9JaQh02/LyaC
 BRiIby0mrI3461nxnYgbA2ejzHKReMLgoF9oL0aym5E7wCcaIFzz/LX9F+6R0PYIc9
 Eg8OVK9y8kGuOmS5CpfzT8VqQHTyT+sAgRqjzog6/FJAb2y+EY49PqNJt2AKt4o5YG
 wAEc8NyaXCeqA==
Received: by pali.im (Postfix)
 id 25E9F945; Thu,  5 May 2022 17:47:15 +0200 (CEST)
Date: Thu, 5 May 2022 17:47:15 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] powerpc/85xx: P2020: Add law_trgt_if property to PCIe DT
 nodes
Message-ID: <20220505154715.xujvyjvewsj6jcw7@pali>
References: <20220504180822.29782-1-pali@kernel.org>
 <CAL_JsqLKjd3zPssbTo=mBfoa6nV144k9TamStk-jO3QbunmSAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLKjd3zPssbTo=mBfoa6nV144k9TamStk-jO3QbunmSAw@mail.gmail.com>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 05 May 2022 10:40:09 Rob Herring wrote:
> On Wed, May 4, 2022 at 1:09 PM Pali Rohár <pali@kernel.org> wrote:
> >
> > DT law_trgt_if property defines Local Access Window Target Interface.
> 
> Documentation?

I was not able to find it :-( So the only documentation for me was the
source code and decoding how it works and how it is used.

> fsl,law-trgt-if would be the preferred form.
> 
> > Local Access Window Target Interface is used for identifying individual
> > peripheral and mapping its memory to CPU. Interface id is defined by
> > hardware itself.
> 
> Normally, we avoid instance indices like this, but if it is more than
> just documentation convention maybe that's fine.
> 
> Rob

It is id defined by HW. Software needs to know how to pair DT node with
address range defined in "ranges" to the correct HW PCIe controller.
