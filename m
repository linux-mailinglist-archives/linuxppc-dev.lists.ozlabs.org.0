Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF0D334167
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 16:22:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwbRR2VdDz3clg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 02:22:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DwbR65c6fz30Nh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 02:22:10 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 12AFJmiu027897;
 Wed, 10 Mar 2021 09:19:58 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 12AFJlaQ027894;
 Wed, 10 Mar 2021 09:19:47 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 10 Mar 2021 09:19:47 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH V2 2/2] powerpc/perf: Add platform specific
 check_attr_config
Message-ID: <20210310151947.GJ29191@gate.crashing.org>
References: <20210226065025.1254973-1-maddy@linux.ibm.com>
 <20210226065025.1254973-2-maddy@linux.ibm.com>
 <dde47591-db00-4c4f-ed24-a8ab5a7a4c6a@ozlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dde47591-db00-4c4f-ed24-a8ab5a7a4c6a@ozlabs.ru>
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 11, 2021 at 12:16:25AM +1100, Alexey Kardashevskiy wrote:
> On 26/02/2021 17:50, Madhavan Srinivasan wrote:
> >+int isa3_X_check_attr_config(struct perf_event *ev)
> 
> "isa300" is used everywhere else to refer to ISA 3.00.

And that itself is a misspelling, there is nothing called "ISA 3.00" (it
is called "ISA 3.0").


Segher
