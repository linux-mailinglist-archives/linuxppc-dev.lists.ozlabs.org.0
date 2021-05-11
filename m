Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E3D37AFE8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 22:03:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ffpkv2ZqXz30Dv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 06:03:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FfpkT3TvBz2yWN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 06:02:56 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14BJviIP005859;
 Tue, 11 May 2021 14:57:44 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 14BJvg80005856;
 Tue, 11 May 2021 14:57:42 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 11 May 2021 14:57:42 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/2] =?utf-8?Q?powerpc=2Fsst?=
 =?utf-8?Q?ep=3A_Add_emulation_support_for_=E2=80=98setb?=
 =?utf-8?B?4oCZ?= instruction
Message-ID: <20210511195742.GP10366@gate.crashing.org>
References: <cover.1620727160.git.sathvika@linux.vnet.ibm.com>
 <7b735b0c898da0db2af8628a64df2f5114596f22.1620727160.git.sathvika@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b735b0c898da0db2af8628a64df2f5114596f22.1620727160.git.sathvika@linux.vnet.ibm.com>
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
Cc: naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 11, 2021 at 07:18:32AM -0500, Sathvika Vasireddy wrote:
> This adds emulation support for the following instruction:
>    * Set Boolean (setb)
> 
> Signed-off-by: Sathvika Vasireddy <sathvika@linux.vnet.ibm.com>

This looks fine to me, thanks!

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
