Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A11E1D78D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 14:42:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QdvB22gdzDqH4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 22:42:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qdrq0L1lzDqck
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 22:40:10 +1000 (AEST)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 04ICdm4v019140
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 18 May 2020 07:39:52 -0500
Message-ID: <906228e89ae11cad241f78ac74142d030f3ab16e.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 18 May 2020 22:39:47 +1000
In-Reply-To: <CACvgo52Qws2VF0Bui-V3VdL5CFLsean9H=shLBi5H2S2fvjFSA@mail.gmail.com>
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <9b0db95949b973c682b449906573e7b28c6113ef.camel@kernel.crashing.org>
 <CACvgo52Qws2VF0Bui-V3VdL5CFLsean9H=shLBi5H2S2fvjFSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Antonino Daplas <adaplas@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-05-18 at 12:00 +0100, Emil Velikov wrote:
> I believe you reported issues due to different page size for the CPU/GPU.
> Have you tried nouveau recently, there has been a handful of patches
> on the topic since your report.
> 
> Alternatively, it would make sense you rebase, cleanup and merge your patch.

That was a problem for the G5s. There were other issues for more
ancient machines with older nVidia GPUs. Additionally a lot of those
Apple machines don't have a BIOS ROM to get the various tables from.

At this stage unfortunately I don't have access to most of that HW to
test with anymore. I do have one G5 I might be able to dig out of my
basement this week to try out.

In any case, digging out that patch should be useful as powerpc64 is
still 64k pages :)

Cheers,
Ben.

