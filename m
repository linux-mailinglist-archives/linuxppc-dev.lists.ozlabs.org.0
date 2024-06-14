Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4FB908AD8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 13:32:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aw3js9TR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0xw83Zs4z3cZ6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 21:32:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aw3js9TR;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0xvS1yRZz30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 21:32:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1718364725;
	bh=5tNu3JO7F59DfFGw1n42UeUGBbjV9MvLJ3EG+sLnfn4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aw3js9TR6y8CLPcEq5EDqVUG+1n5/wlTcwRiLocJdnAvs4PMrUogNcuF1Az61vEsk
	 Hu2p7q5U+zbqkDZcBlpN5JaCpkzwOnU8LS+EtsKZjo7fo1kUHwa89uU1MJPCIr3IOX
	 08VlyMzLeU28nZtJGCtCStkB1lIblUkFB8FkWNMzJhA2oYp+DZ6l6ODqgC4fWAUhIJ
	 LhznFFLrop5JRH57EJVMOfF8dyxf5oh0Pkw8w4wLMiOv1gsafxZkSS5iBUzr3wdwLp
	 gKPCfRz2OVQKO0murUWm4qXUkWZXGkp9CWqch5NmastDbP8CMkv4hct/tz7SIZvNGB
	 3AiiCOc5DXSGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W0xvS6TNvz4wcC;
	Fri, 14 Jun 2024 21:32:04 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Please backport 2d43cc701b96 to v6.9 and v6.6
In-Reply-To: <2024061411-hypertext-saline-afb4@gregkh>
References: <87wmmsnelx.fsf@mail.lhotse>
 <2024061411-hypertext-saline-afb4@gregkh>
Date: Fri, 14 Jun 2024 21:32:04 +1000
Message-ID: <87tthvoj4b.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg KH <gregkh@linuxfoundation.org> writes:
> On Fri, Jun 14, 2024 at 05:54:50PM +1000, Michael Ellerman wrote:
>> Hi stable team,
>> 
>> Can you please backport:
>>   2d43cc701b96 ("powerpc/uaccess: Fix build errors seen with GCC 13/14")
>> 
>> To v6.9 and v6.6.
>> 
>> It was marked for backporting, but hasn't been picked up AFAICS. I'm not
>> sure if it clashed with the asm_goto_output changes or something. But it
>> backports cleanly to the current stable branches.
>
> It's still in my "to get to queue" along with about 150+ other patches
> that were tagged for stable inclusion.  It's in good company, I'll get
> to it after this current round of -rc releases is out.

Thanks.

I also just sent three backports for that commit for v5.10, v5.15 and v6.1.

cheers
