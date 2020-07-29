Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F7A2320F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 16:52:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGxNd6xlWzDqf4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 00:52:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BGxKG5PcNzDqX3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 00:49:54 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 06TEnogx007443;
 Wed, 29 Jul 2020 09:49:50 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 06TEnnwb007440;
 Wed, 29 Jul 2020 09:49:49 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 29 Jul 2020 09:49:49 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Vladis Dronov <vdronov@redhat.com>
Subject: Re: [PATCH] powerpc: fix function annotations to avoid section
 mismatch warnings with gcc-10
Message-ID: <20200729144949.GF17447@gate.crashing.org>
References: <20200729133741.62789-1-vdronov@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729133741.62789-1-vdronov@redhat.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 29, 2020 at 03:37:41PM +0200, Vladis Dronov wrote:
> Certain warnings are emitted for powerpc code when building with a gcc-10
> toolset:
> 
>     WARNING: modpost: vmlinux.o(.text.unlikely+0x377c): Section mismatch in
>     reference from the function remove_pmd_table() to the function
>     .meminit.text:split_kernel_mapping()
>     The function remove_pmd_table() references
>     the function __meminit split_kernel_mapping().
>     This is often because remove_pmd_table lacks a __meminit
>     annotation or the annotation of split_kernel_mapping is wrong.
> 
> Add the appropriate __init and __meminit annotations to make modpost not
> complain. In all the cases there are just a single callsite from another
> __init or __meminit function:
> 
> __meminit remove_pagetable() -> remove_pud_table() -> remove_pmd_table()
> __init prom_init() -> setup_secure_guest()
> __init xive_spapr_init() -> xive_spapr_disabled()

So what changed?  These functions were inlined with older compilers, but
not anymore?


Segher
