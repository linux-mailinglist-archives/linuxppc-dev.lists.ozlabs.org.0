Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D4407A36
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Sep 2021 21:10:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H6Mkl4kfBz2yyl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Sep 2021 05:10:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TvryW/tW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TvryW/tW; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H6Mk300lQz2yJJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Sep 2021 05:09:30 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 589EE610A3;
 Sat, 11 Sep 2021 19:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631387367;
 bh=MF42YbZBgwTYjRBQBamaFsBEIo0do1nPUzzz7HHFc9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TvryW/tWuHrwFGhnauTlHeKULUUpGnvvChQOB/DS8wK71z6KBM9LfA9Q5mvMhrXLs
 7F0Ww6JWLcPSuUOib8/Q+ViWfUswVLnBln77X+kv7TXUJNVs2snI5dRCofhxJLpsmZ
 jJZMaqXIeb38dc1s+uMit9lMrPNNE3/y0PPXyMyVDb+D5mHoMLl7B7n5Rgl/i3qcAO
 WrgVShin9VnniDWEn5B3yo+/6H0YaMLj43EvdaH69GrohlG39h46+/USgunjT9yj0V
 glIfE0KTR4FGW5hHOSB0HwNWQkCCvXUddpOOIYo7FlofkOMV3HrVPbfEO63l7NND87
 1EMAVdLK9B5lQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 66FAE4038F; Sat, 11 Sep 2021 16:09:24 -0300 (-03)
Date: Sat, 11 Sep 2021 16:09:24 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] powerpc/perf: Add instruction and data address
 registers to extended regs
Message-ID: <YTz+5JxjH45ER5N1@kernel.org>
References: <1624200360-1429-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <bd5a9388-483d-91ca-b371-ab92ae4c08bc@linux.ibm.com>
 <BAA2B1EE-36BA-495A-B507-EC3C996199D8@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BAA2B1EE-36BA-495A-B507-EC3C996199D8@linux.vnet.ibm.com>
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, rnsastry@linux.ibm.com,
 kajoljain <kjain@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Sep 06, 2021 at 08:13:13AM +0530, Athira Rajeev escreveu:
> 
> 
> > On 02-Sep-2021, at 1:04 PM, kajoljain <kjain@linux.ibm.com> wrote:
> > 
> > 
> > 
> > On 6/20/21 8:15 PM, Athira Rajeev wrote:
> >> Patch set adds PMU registers namely Sampled Instruction Address Register
> >> (SIAR) and Sampled Data Address Register (SDAR) as part of extended regs
> >> in PowerPC. These registers provides the instruction/data address and
> >> adding these to extended regs helps in debug purposes.
> >> 
> >> Patch 1/2 adds SIAR and SDAR as part of the extended regs mask.
> >> Patch 2/2 includes perf tools side changes to add the SPRs to
> >> sample_reg_mask to use with -I? option.
> >> 
> >> Athira Rajeev (2):
> >>  powerpc/perf: Expose instruction and data address registers as part of
> >>    extended regs
> >>  tools/perf: Add perf tools support to expose instruction and data
> >>    address registers as part of extended regs
> >> 
> > 
> > Patchset looks good to me.
> > 
> > Reviewed-By: kajol Jain<kjain@linux.ibm.com>
> 
> Hi Arnaldo,
> 
> Requesting for your review on this patchset.

So, this touches the kernel, usually I get a patchkit when the kernel
bits landed, is that the case by now?

- Arnaldo

> 
> Thanks
> Athira
> > 
> > Thanks,
> > Kajol Jain
> > 
> >> arch/powerpc/include/uapi/asm/perf_regs.h       | 12 +++++++-----
> >> arch/powerpc/perf/perf_regs.c                   |  4 ++++
> >> tools/arch/powerpc/include/uapi/asm/perf_regs.h | 12 +++++++-----
> >> tools/perf/arch/powerpc/include/perf_regs.h     |  2 ++
> >> tools/perf/arch/powerpc/util/perf_regs.c        |  2 ++
> >> 5 files changed, 22 insertions(+), 10 deletions(-)

-- 

- Arnaldo
