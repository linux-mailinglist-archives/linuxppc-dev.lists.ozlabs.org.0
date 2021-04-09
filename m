Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B32359E36
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 14:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGxds2pJfz3bsc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 22:05:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FGxdS4pb7z2yZ8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 22:04:43 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 139C2LKn009728;
 Fri, 9 Apr 2021 07:02:21 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 139C2KHA009727;
 Fri, 9 Apr 2021 07:02:20 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 9 Apr 2021 07:02:20 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/2] powerpc: make 'boot_text_mapped' static
Message-ID: <20210409120220.GE26583@gate.crashing.org>
References: <20210408011801.557004-1-yukuai3@huawei.com>
 <20210408011801.557004-3-yukuai3@huawei.com>
 <5b91cd3f-d171-f510-7dae-8cbabb13b23c@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b91cd3f-d171-f510-7dae-8cbabb13b23c@csgroup.eu>
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
Cc: Yu Kuai <yukuai3@huawei.com>, yi.zhang@huawei.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Apr 08, 2021 at 07:04:35AM +0200, Christophe Leroy wrote:
> Le 08/04/2021 à 03:18, Yu Kuai a écrit :
> >-int boot_text_mapped __force_data = 0;
> >+static int boot_text_mapped __force_data;
> 
> Are you sure the initialisation to 0 can be removed ? Usually 
> initialisation to 0 is not needed because not initialised variables go in 
> the BSS section which is zeroed at startup. But here the variable is 
> flagged with __force_data so it is not going in the BSS section.

Any non-automatic (i.e. function-scope, not static) variable is
initialised to 0.  See e.g. C11 6.7.9/10 (this has been like that since
times immemorial, C90 anyway).


Segher
