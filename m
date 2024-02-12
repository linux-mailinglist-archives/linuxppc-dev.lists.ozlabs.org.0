Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 537BB851BEA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 18:47:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Qn7d69IQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYX2v1jN2z3dWK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 04:47:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Qn7d69IQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYX2B19Vcz3by2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 04:46:25 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A976F82856C3;
	Mon, 12 Feb 2024 11:46:23 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 4m1dOIpEEcEG; Mon, 12 Feb 2024 11:46:21 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B5810828593C;
	Mon, 12 Feb 2024 11:46:21 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B5810828593C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1707759981; bh=dP3ni/pBuaYMbgKKZOfnTXKO+C8/YiDwZ9BWBn4SGTU=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Qn7d69IQE98k/d9CxA3FYSAx2JjkV5tbruvxUvVuRIWbsQLlMAGXaNwYveZlnb90J
	 TTx0Pf60B7hXbHWJw4iSfTehcsy7jg+xS7I39lVjryLq6JzJg9mt6BxFE/zW8ppAQ/
	 s9gCNj2oEcJrD5zgPW2i5TQK8wEZ7RMky/M6cq1c=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id l-T0ObFjVjoh; Mon, 12 Feb 2024 11:46:21 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 6EF4582856C3;
	Mon, 12 Feb 2024 11:46:21 -0600 (CST)
Date: Mon, 12 Feb 2024 11:46:19 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <572013249.14851324.1707759979044.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20240212173043.GX19790@gate.crashing.org>
References: <995988479.14839534.1707756078600.JavaMail.zimbra@raptorengineeringinc.com> <20240212170207.GW19790@gate.crashing.org> <1251499652.14843228.1707757778984.JavaMail.zimbra@raptorengineeringinc.com> <20240212173043.GX19790@gate.crashing.org>
Subject: Re: [PATCH] powerpc: Add gpr1 and fpu save/restore functions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC121 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Add gpr1 and fpu save/restore functions
Thread-Index: vOwbaUaZS2PSzNnSfDUgCAdOJwCL8w==
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
> Sent: Monday, February 12, 2024 11:30:43 AM
> Subject: Re: [PATCH] powerpc: Add gpr1 and fpu save/restore functions
> 
> Long long time ago, linux-0.11 or something, it was discovered that some
> programmiing mistakes resulted in double-length divisions (64x64->64 on
> 32-bit systems, say).  Most architectures have no hardware support for
> that, x86 is one of those; so you need very expensive support routines
> to do that (_udivdi3 or _divdi3 in that case, ...ti3 on 64-bit archs).
> 
> So it was decided to not link to libgcc to avoid this.  But that means
> that all the extremely many other suppoort routines, more for some other
> archs, are also not there.  While it would have been much easier to just
> link to something that provides the _{u,}divdi3 symbol and then causes a
> forced linking error from that!
> 
> 
> Segher

Interesting, that make sense.

How should we proceed from the current situation?  Bringing in libgcc seems
like a fairly invasive change, should we merge this to fix the current bug
(cannot build ppc64 kernel in size-optimized mode) and start discussion on
bringing in libgcc as the long-term fix across multiple architectures?

My goal here is to not have to carry a downstream patch in perpetuity for
our embedded Linux firmware, which needs to be compiled in size-optimized
mode due to hardware Flash limitations.

Thanks!
