Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF6851C6C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 19:07:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=IZ2FbHp7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYXVn2Tmnz3dWn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 05:07:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=IZ2FbHp7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYXV43Vvvz3c9N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 05:07:08 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4F84F82855B4;
	Mon, 12 Feb 2024 12:07:06 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id xjbCbFK-_lGi; Mon, 12 Feb 2024 12:07:05 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 8CC0782855B7;
	Mon, 12 Feb 2024 12:07:05 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8CC0782855B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1707761225; bh=wKDNFNAJLI5fbiUxIW+U9M2gzdpHH5liNgkoL1ILJb0=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=IZ2FbHp74Tk3DHrK4ozIt5+6xICTWMIpsgdia5fUhETYkkNM6tJboZe4y7441Rjbu
	 KCHaZs4LcDBG9SYagO6bYm8hVyKu511yhzAXRPeZp2GOPfO1EYLd2kcyM1WNEG+FfW
	 YFKsCsOodvF6T7BLXRLz977j/Kxb8Tk/CBHdzYtk=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mA0ySOOLb0uJ; Mon, 12 Feb 2024 12:07:05 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 63E5B82855B4;
	Mon, 12 Feb 2024 12:07:05 -0600 (CST)
Date: Mon, 12 Feb 2024 12:07:03 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <1119220086.14855806.1707761223318.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20240212175906.GY19790@gate.crashing.org>
References: <995988479.14839534.1707756078600.JavaMail.zimbra@raptorengineeringinc.com> <20240212170207.GW19790@gate.crashing.org> <1251499652.14843228.1707757778984.JavaMail.zimbra@raptorengineeringinc.com> <20240212173043.GX19790@gate.crashing.org> <572013249.14851324.1707759979044.JavaMail.zimbra@raptorengineeringinc.com> <20240212175906.GY19790@gate.crashing.org>
Subject: Re: [PATCH] powerpc: Add gpr1 and fpu save/restore functions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC121 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Add gpr1 and fpu save/restore functions
Thread-Index: gvUNvf1MPOO35DemMMhwl7DNPKVJ7g==
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
> Sent: Monday, February 12, 2024 11:59:06 AM
> Subject: Re: [PATCH] powerpc: Add gpr1 and fpu save/restore functions

> On Mon, Feb 12, 2024 at 11:46:19AM -0600, Timothy Pearson wrote:
>> Interesting, that make sense.
>> 
>> How should we proceed from the current situation?  Bringing in libgcc seems
>> like a fairly invasive change,
> 
> I have done it for *all* architectures some ten years ago.  Never found
> any problem.

That makes sense, what I mean by invasive is that we'd need buy-in from the other
maintainers across all of the affected architectures.  Is that likely to occur?

>> should we merge this to fix the current bug
>> (cannot build ppc64 kernel in size-optimized mode) and start discussion on
>> bringing in libgcc as the long-term fix across multiple architectures?
>> 
>> My goal here is to not have to carry a downstream patch in perpetuity for
>> our embedded Linux firmware, which needs to be compiled in size-optimized
>> mode due to hardware Flash limitations.
> 
> There are better options than -Os, fwiw.  Some --param's give smaller
> *and* faster kernels.  What exactly is best is heavily arch-dependent
> though (as well as dependent on the application code, the kernel code in
> this case) :-(

I've been through this a few times, and -Os is the only option that makes
things (just barely) fit unfortunately.
