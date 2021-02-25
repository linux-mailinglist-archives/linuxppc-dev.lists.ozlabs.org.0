Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D143252AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 16:47:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dmcc41wCdz3cxY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 02:47:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dmcbl3QRXz30Mk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 02:46:59 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 11PFijOl022792;
 Thu, 25 Feb 2021 09:44:45 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 11PFijTh022791;
 Thu, 25 Feb 2021 09:44:45 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 25 Feb 2021 09:44:44 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [RFC PATCH 5/8] poweprc/lib/quad: Provide macros for lq/stq
Message-ID: <20210225154444.GF28121@gate.crashing.org>
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-6-dja@axtens.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210225031006.1204774-6-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, llvmlinux@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 25, 2021 at 02:10:03PM +1100, Daniel Axtens wrote:
> +#define PPC_RAW_LQ(t, a, dq)		(0xe0000000 | ___PPC_RT(t) | ___PPC_RA(a) | (((dq) & 0xfff) << 3))

Please keep the operand order the same as for the assembler insns?  So
t,dq,a here.

It should be  ((dq) & 0x0fff) << 4)  .

> +#define PPC_RAW_STQ(t, a, ds)		(0xf8000002 | ___PPC_RT(t) | ___PPC_RA(a) | (((ds) & 0xfff) << 3))

And t,ds,a here.  (But it should use "s" instead of "t" preferably, and
use ___PPC_RS, because it is a source field, not a target).

It should be  ((ds) & 0x3fff) << 2)  as well.


Segher
