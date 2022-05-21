Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0834A52FEA5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 19:52:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L5B583Jshz3c9J
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 May 2022 03:52:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jyhKAyJ1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jyhKAyJ1; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L5B4V0wDDz3bbs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 May 2022 03:52:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81CC360DBC;
 Sat, 21 May 2022 17:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0285C385AA;
 Sat, 21 May 2022 17:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653155522;
 bh=2/n5JrWpmpYECdth3FvUmQTIKjToGNXS/pFJfIMr7TM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jyhKAyJ1frcVMhe5DThh7+fUVFF8xPhcEnysuil2FUP4NZmN3QSD1Fq2EzWE4AXzi
 BQEV0l27ESNI+qS3/+Eg+CXjukc6bnQfEwU9bD3eqtzOHOPZDXlaCcD9AtEQnvspV9
 jeeAQY/bm2h8TVoGUgTpqSfnUbKeXBOXsStigHlH1atyk0BmgoS1s2bpmCYYiTpBUz
 uT2/aVqLVk0uf/5qYblrAQTywgfPkGDQvFadfnTzoc3shg1vefickSbSPBbvFcrmyC
 NpWKB23cIQZ+VXUl9dn5Sroi1s4qAlgSfBNb8RDNWVoNJbqPljBKD+RMGAox6ADXKE
 9smBsYMcbjcXw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 65407400B1; Sat, 21 May 2022 14:52:00 -0300 (-03)
Date: Sat, 21 May 2022 14:52:00 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] tools/perf/tests: Fix session topology test to skip
 the test in guest environment
Message-ID: <YokmwM4weyhr9G7u@kernel.org>
References: <20220511114959.84002-1-atrajeev@linux.vnet.ibm.com>
 <151b1538daf92259702242dbf734230aea3199fe.camel@linux.vnet.ibm.com>
 <CAP-5=fVAfjUHvhLF2E2UZo+BwneSex0GV5BgbHAV6bvdUxj_9w@mail.gmail.com>
 <BD2D6432-8327-4090-958A-71573169E9AA@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BD2D6432-8327-4090-958A-71573169E9AA@linux.vnet.ibm.com>
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.vnet.ibm.com,
 Nageswara Sastry <rnsastry@linux.ibm.com>, linux-perf-users@vger.kernel.org,
 Jiri Olsa <jolsa@kernel.org>, kjain@linux.ibm.com,
 Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Sat, May 21, 2022 at 10:16:59AM +0530, Athira Rajeev escreveu:
> > On 14-May-2022, at 12:03 AM, Ian Rogers <irogers@google.com> wrote:
> > On Thu, May 12, 2022 at 11:18 PM Disha Goel <disgoel@linux.vnet.ibm.com> wrote:
> >> Tested the patch on powerpc and powernv, session topology test works fine with the patch.
> >> Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>

> > Acked-by: Ian Rogers <irogers@google.com>
 
> Thanks all for the review.

Thanks, applied.

- Arnaldo

