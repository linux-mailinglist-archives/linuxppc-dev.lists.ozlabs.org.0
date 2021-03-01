Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFCE3294F8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 23:37:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqFWg1pBtz3d6D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 09:37:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DqFSF4Ntzz3cQq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 09:34:36 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 121MVAHn003883;
 Mon, 1 Mar 2021 16:31:10 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 121MV9DG003882;
 Mon, 1 Mar 2021 16:31:09 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 1 Mar 2021 16:31:09 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v1 01/15] powerpc/uaccess: Remove __get_user_allowed() and
 unsafe_op_wrap()
Message-ID: <20210301223108.GE29191@gate.crashing.org>
References: <cover.1614275314.git.christophe.leroy@csgroup.eu>
 <e0538c71167bd90224a8727fea9ed5b75612e2d7.1614275314.git.christophe.leroy@csgroup.eu>
 <87im6ao7ld.fsf@dja-thinkpad.axtens.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87im6ao7ld.fsf@dja-thinkpad.axtens.net>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 02, 2021 at 09:02:54AM +1100, Daniel Axtens wrote:
> Checkpatch does have one check that is relevant:
> 
> CHECK: Macro argument reuse 'p' - possible side-effects?
> #36: FILE: arch/powerpc/include/asm/uaccess.h:482:
> +#define unsafe_get_user(x, p, e) do {					\
> +	if (unlikely(__get_user_nocheck((x), (p), sizeof(*(p)), false)))\
> +		goto e;							\
> +} while (0)

sizeof (of something other than a VLA) does not evaluate its operand.
The checkpatch warning is incorrect (well, it does say "possible" --
it just didn't find a possible problem here).

You can write
  bla = sizeof *p++;
and p is *not* incremented.


Segher
