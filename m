Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EA8851ADA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 18:10:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=d7K7P9qi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYWDc23f8z3dWD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 04:10:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=d7K7P9qi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYWCs2JtBz3c2F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 04:09:45 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id BC30F82867D3;
	Mon, 12 Feb 2024 11:09:42 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id wxlVFlGaVxpb; Mon, 12 Feb 2024 11:09:41 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 6CABE8286982;
	Mon, 12 Feb 2024 11:09:41 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 6CABE8286982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1707757781; bh=WE/yDq7A07sd8ABxHqWetOoOmtEGf/kbIseMLWZG19U=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=d7K7P9qiIeAWYzy7sRiLkz7lq8K9DQb6lvWg6Ab92YxPWHvydvBVMf7h0OBhXq09m
	 JXrgRYE7VAA52/QW2eHcm0AmZqMzNTFt+faGAEAgkbxGxbjJVZR8tl8TrO6FADGHbw
	 eEyL8QEZVupYMMoJ9N7phagxGjCsFffM/CoYeoiE=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xNDphGNOpvFz; Mon, 12 Feb 2024 11:09:41 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 43F6182867D3;
	Mon, 12 Feb 2024 11:09:41 -0600 (CST)
Date: Mon, 12 Feb 2024 11:09:38 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <1251499652.14843228.1707757778984.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20240212170207.GW19790@gate.crashing.org>
References: <995988479.14839534.1707756078600.JavaMail.zimbra@raptorengineeringinc.com> <20240212170207.GW19790@gate.crashing.org>
Subject: Re: [PATCH] powerpc: Add gpr1 and fpu save/restore functions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC121 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Add gpr1 and fpu save/restore functions
Thread-Index: fE+jcXgubz2JQmXKqldH41JoHNKy5g==
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Segher Boessenkool" <segher@kernel.crashing.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Monday, February 12, 2024 11:02:07 AM
> Subject: Re: [PATCH] powerpc: Add gpr1 and fpu save/restore functions

> On Mon, Feb 12, 2024 at 10:41:18AM -0600, Timothy Pearson wrote:
>> Implement gpr1 and fpu save/restore functions per the ABI v2 documentation.
> 
> There is no "ABI v2".  This is the ELFv2 ABI, it is a name, it is not a
> version 2 of anything (in fact, it is version 1 everywhere).

Apologies, I wasn't precise on the name.

> The same functions are needed and used in other ABIs, too.
> 
> But, why do this patch?  You just need
> 
> +LIBGCC         := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> 
> +libs-y += $(LIBGCC)
> 
> and nothing more.  It is required for proper functioning of GCC to link
> with the libgcc support library.

There is existing code in the kernel right now to provide support functions for gpr0 and altivec save/restore.  I don't know the full story here, but at some point in the kernel's history it seems to have been decided to provide the helper functions in lieu of linking libgcc directly.  If this is incorrect, then I need to know that so I can rework the patch to enable libcc and remove the existing support functions.

Is there anyone on-list that knows more of the history and decision-making that went into the current state of the kernel here?

Thanks!
