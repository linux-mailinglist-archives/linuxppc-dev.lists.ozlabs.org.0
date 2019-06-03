Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3F333C0A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 01:44:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hs8K5Z4KzDqX1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 09:44:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hs764P41zDqMB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 09:42:58 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x53NgnpS015961;
 Mon, 3 Jun 2019 18:42:49 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x53NglbP015960;
 Mon, 3 Jun 2019 18:42:47 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 3 Jun 2019 18:42:47 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] prom_init: Fetch flatten device tree from the
 system firmware
Message-ID: <20190603234247.GQ31586@gate.crashing.org>
References: <20190501034221.18437-1-aik@ozlabs.ru>
 <a62a8612-77f5-5c6b-a6a2-15f006051d5e@ozlabs.ru>
 <20190530193736.GC31586@gate.crashing.org>
 <43f037c57eed8ad2175470c940917dced947bb70.camel@kernel.crashing.org>
 <20190602232330.GN31586@gate.crashing.org>
 <7fc6cd5e-ddd6-4028-b4ef-7bdcd6db69d0@ozlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fc6cd5e-ddd6-4028-b4ef-7bdcd6db69d0@ozlabs.ru>
User-Agent: Mutt/1.4.2.3i
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, Jun 03, 2019 at 12:56:26PM +1000, Alexey Kardashevskiy wrote:
> On 03/06/2019 09:23, Segher Boessenkool wrote:
> >> So I go for the simple one and agree with Alexey's idea.
> > 
> > When dealing with a whole device tree you have to know about the various
> > dynamically generated nodes and props, and handle each appropriately.
> 
> The code I am changing fetches the device tree and build an fdt. What is
> that special knowledge in this context you are talking about?

Things like /options are dynamically generated.

I thought you would just be able to reuse some FDT parsing code to
implement my suggested new interface.  Maybe that was too optimistic.


Segher
