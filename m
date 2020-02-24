Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E0F16AA41
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 16:37:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48R5mJ4pHlzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 02:37:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R5k75tjQzDqDt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 02:34:15 +1100 (AEDT)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 01OFY1FI026951
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 24 Feb 2020 09:34:04 -0600
Message-ID: <2df70550695143a9b62c0146e8e3e17ac91c1863.camel@kernel.crashing.org>
Subject: Re: vdso function descriptors (VDS64_HAS_DESCRIPTORS)?
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joe Lawrence <joe.lawrence@redhat.com>, Segher Boessenkool
 <segher@kernel.crashing.org>
Date: Tue, 25 Feb 2020 02:34:00 +1100
In-Reply-To: <885be270-7af8-490d-302c-270a6db94ffe@redhat.com>
References: <20200217160852.GA9557@redhat.com>
 <20200223000715.GW22482@gate.crashing.org>
 <587a0a1765ba1264b92044f7b1f9937eb40731f1.camel@kernel.crashing.org>
 <885be270-7af8-490d-302c-270a6db94ffe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-02-24 at 10:20 -0500, Joe Lawrence wrote:
> On
> > I don't remember why :-) I think I didn't want to mess with the OPD
> > fixup in glibc back then.
> > 
> 
> Does it make sense to just drop the unused VDS64_HAS_DESCRIPTORS code
> then?

I'd think so yes.

Cheers,
Ben.

