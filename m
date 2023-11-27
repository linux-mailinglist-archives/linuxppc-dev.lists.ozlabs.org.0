Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD27FA38A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 15:52:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=crQCcXv6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf7px6VXFz3cjf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 01:52:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=crQCcXv6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sf7p31hfCz3cLN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 01:51:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 97A05CE1312;
	Mon, 27 Nov 2023 14:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2814DC433C8;
	Mon, 27 Nov 2023 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701096686;
	bh=DbMJ84gGLWhKNcAEejc7+WDGOGaKaXiOwyDIz2GZNzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=crQCcXv6GxiJfsYXIrpMzBsXIAO2QE+D7SDlD9Be05MP+8d+OGEsQCIsvzqoUjGg1
	 kDcuDY5nGObGjUWKCpQ0+FT5aYIHu1S6OC4fuQay8eNxCgiRLSys8iUfLWAz5M8mzw
	 S31AAtg63HYCMuLIwbla64xPRrx5g3Daty9kWnxVys3rKiYpQz9XJ15veZv+06bokP
	 iAm7NHjhnSWrP4fuP6Vn5WgFJQCwTYJfdja1vd0alTCzlzylwg1Tx8AE3Hy+rgRZgx
	 7/9RoGofOV61ARmxEfe432pMZXG3FNXV1+GLVjGcxV1eIkQS6hTzcRZXLgzb5hYif2
	 G7HPzZJRO2gBw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 085AA40094; Mon, 27 Nov 2023 11:51:23 -0300 (-03)
Date: Mon, 27 Nov 2023 11:51:23 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: James Clark <james.clark@arm.com>
Subject: Re: [PATCH V4] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
Message-ID: <ZWSs6zn1NqWqzoyC@kernel.org>
References: <20231123160232.94253-1-atrajeev@linux.vnet.ibm.com>
 <e8143e4d-d3ca-88c5-f1c8-b79f70ee5ffa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8143e4d-d3ca-88c5-f1c8-b79f70ee5ffa@arm.com>
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Nov 27, 2023 at 11:12:57AM +0000, James Clark escreveu:
> On 23/11/2023 16:02, Athira Rajeev wrote:
> > Add rule in new Makefile "tests/Makefile.tests" for running
> > shellcheck on shell test scripts. This automates below shellcheck
> > into the build.

> Seems to work really well. I also tested it on Ubuntu, and checked
> NO_SHELLCHECK, cleaning and with and without shellcheck installed etc.
 
> Reviewed-by: James Clark <james.clark@arm.com>

Tested on Fedora 38, works as advertised, applied.
 
- Arnaldo
