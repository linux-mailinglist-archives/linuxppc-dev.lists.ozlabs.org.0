Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD723644D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 15:35:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP79z3p4Nz2yZC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 23:35:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FP79f4jxbz2xYd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 23:35:33 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 13JDWABR028210;
 Mon, 19 Apr 2021 08:32:10 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 13JDW9tI028209;
 Mon, 19 Apr 2021 08:32:09 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 19 Apr 2021 08:32:09 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 2/2] powerpc: add ALTIVEC support to lib/ when PPC_FPU not
 set
Message-ID: <20210419133209.GR26583@gate.crashing.org>
References: <20210418201726.32130-1-rdunlap@infradead.org>
 <20210418201726.32130-2-rdunlap@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210418201726.32130-2-rdunlap@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Sun, Apr 18, 2021 at 01:17:26PM -0700, Randy Dunlap wrote:
> Add ldstfp.o to the Makefile for CONFIG_ALTIVEC and add
> externs for get_vr() and put_vr() in lib/sstep.c to fix the
> build errors.

>  obj-$(CONFIG_PPC_FPU)	+= ldstfp.o
> +obj-$(CONFIG_ALTIVEC)	+= ldstfp.o

It is probably a good idea to split ldstfp.S into two, one for each of
the two configuration options?


Segher
