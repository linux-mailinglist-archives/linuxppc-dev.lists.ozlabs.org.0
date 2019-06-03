Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7833C21
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 01:50:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HsJC0KfJzDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 09:50:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HsGs44TKzDqH4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 09:49:41 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x53NnXcT016185;
 Mon, 3 Jun 2019 18:49:33 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x53NnWCZ016184;
 Mon, 3 Jun 2019 18:49:32 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 3 Jun 2019 18:49:32 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH kernel] prom_init: Fetch flatten device tree from the
 system firmware
Message-ID: <20190603234932.GR31586@gate.crashing.org>
References: <20190501034221.18437-1-aik@ozlabs.ru>
 <a62a8612-77f5-5c6b-a6a2-15f006051d5e@ozlabs.ru>
 <20190530193736.GC31586@gate.crashing.org>
 <43f037c57eed8ad2175470c940917dced947bb70.camel@kernel.crashing.org>
 <20190602232330.GN31586@gate.crashing.org>
 <7fc6cd5e-ddd6-4028-b4ef-7bdcd6db69d0@ozlabs.ru>
 <32063141651fd502c8ce94be19cb5c5330ce39bd.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32063141651fd502c8ce94be19cb5c5330ce39bd.camel@kernel.crashing.org>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 04, 2019 at 07:18:42AM +1000, Benjamin Herrenschmidt wrote:
> Yes we could make property fetching faster but mostly by creating a new
> bulk interface which is quite a bit of work, a new API, and will in
> practice not be used for anything other than creating the FDT. In that
> case, nothing will beat in performance having OF create the FDT itself
> based on its current tree.

And that will change the whole boot protocol, the interaction between OF
and its client, which is a much bigger change, not conceptually trivial
at all.  Copying all properties at once is, which is why I suggested it.

It would take away the opposition to your patch.


Segher
