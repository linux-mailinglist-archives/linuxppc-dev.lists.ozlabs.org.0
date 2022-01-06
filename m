Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFCE486B05
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 21:23:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVHpx4zDRz30Ll
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 07:23:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ROFMzrv+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ROFMzrv+; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVHpB0lBPz2xv0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 07:22:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 65BD0B80B9D;
 Thu,  6 Jan 2022 20:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AC0C36AE5;
 Thu,  6 Jan 2022 20:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641500540;
 bh=H4w3A6VByOUcCRld741J5OK7sU1s2CzEM5LVp56vXLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ROFMzrv+6dCJkgakWy1x0tKtpQEZeLZwmb8vgdylsG5UuUrLyceZIhDX6Eo1jaqhs
 VeT1tBwftWQh9ITd1qroECXvXoLzo59+NMQ/1CaxrOGupUkNQubcNKGyJuUzfwDX14
 iCfEH2d12MsiQlqgbe/gFa17sdnJqmKgt5qCLdZc4mCUmSuetDc7uQK0VPy3MFk1OM
 NMuIa+Qy3gmUhOIBr7HbPBTV75gkkYanLZxZn6iMgKbj7Ks4SrRNoWAQ26v/Cbk2bh
 BbtJoE4ZHcH8slqrirjXWPtG9Dhg5pXDPCLW6HnNT5PWMh1grHLjSyc2mBwdX6fpGP
 Xl1GF+V2A+UBg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 885DE40B92; Thu,  6 Jan 2022 17:22:17 -0300 (-03)
Date: Thu, 6 Jan 2022 17:22:17 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 1/2] tools/perf: Include global and local variants for
 p_stage_cyc sort key
Message-ID: <YddPeY7i3epm7HlN@kernel.org>
References: <20211203022038.48240-1-atrajeev@linux.vnet.ibm.com>
 <Ya91LXxp13Nz3JyC@kernel.org>
 <afd3af8c-a450-79b2-e678-e07766c5efd1@linux.ibm.com>
 <9FCC0543-29A8-455D-B2BC-299B332F45D2@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9FCC0543-29A8-455D-B2BC-299B332F45D2@linux.vnet.ibm.com>
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
Cc: maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>,
 linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 kajoljain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, Jan 06, 2022 at 04:21:05PM +0530, Athira Rajeev escreveu:
> 
> 
> > On 08-Dec-2021, at 9:21 AM, Nageswara Sastry <rnsastry@linux.ibm.com> wrote:
> > 
> > 
> > 
> > On 07/12/21 8:22 pm, Arnaldo Carvalho de Melo wrote:
> >> Em Fri, Dec 03, 2021 at 07:50:37AM +0530, Athira Rajeev escreveu:
> >>> Sort key p_stage_cyc is used to present the latency
> >>> cycles spend in pipeline stages. perf tool has local
> >>> p_stage_cyc sort key to display this info. There is no
> >>> global variant available for this sort key. local variant
> >>> shows latency in a sinlge sample, whereas, global value
> >>> will be useful to present the total latency (sum of
> >>> latencies) in the hist entry. It represents latency
> >>> number multiplied by the number of samples.
> >>> 
> >>> Add global (p_stage_cyc) and local variant
> >>> (local_p_stage_cyc) for this sort key. Use the
> >>> local_p_stage_cyc as default option for "mem" sort mode.
> >>> Also add this to list of dynamic sort keys and made the
> >>> "dynamic_headers" and "arch_specific_sort_keys" as static.
> >>> 
> >>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >>> Reported-by: Namhyung Kim <namhyung@kernel.org>
> >> I got this for v1, does it stand for v2?
> >> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> > 
> > 
> > Tested with v2 also.
> 
> Hi Arnaldo,
> 
> If this patchset looks fine to you, can you please consider pulling it.

Thanks, applied to perf/core, for 5.17.

- Arnaldo
