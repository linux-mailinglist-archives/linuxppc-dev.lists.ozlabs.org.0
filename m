Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E4B5A2116
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 08:46:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDVj862wdz3c6S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 16:46:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q+KGV/yc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDVhY48B7z30DP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 16:45:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q+KGV/yc;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MDVhQ0WRSz4x1G;
	Fri, 26 Aug 2022 16:45:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661496326;
	bh=YdTNamzH/TUdshV3Q5FUH2pPsMLKLln71bBuYe/qFtg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q+KGV/ycNrADBH4LtYQiCFy43yiKKEdbNSPJ8gHUbo6GGHkxFOpbzE4TJrCaqmC13
	 H7bYhRtpxdEHnQek3eNQvEQS32ymT4MpgrpavEL6E7osVTmjdCft6H3FUun39BKdx8
	 2rHMmRAn/VK7geoGcLglOYyhbY2Da6d+AFDF0jRyhiT5kaPGUdYCPdps7NzCBrZHn6
	 LGP5H0MBWF8m/8dSsnAQcep41RnVDhIr9X4QPIiyJuKRjqucVLzM34cMkRBxlA1kAu
	 wuNTp59e8G3u11QNGCic8wcE9hmDAQYnlCFx9vQ5f2wyJKi+B59XpDbcVSMKL3kr/e
	 QQGJA81xbruHQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Remove myself as EEH maintainer
In-Reply-To: <20220825200310.GA2869783@bhelgaas>
References: <20220825200310.GA2869783@bhelgaas>
Date: Fri, 26 Aug 2022 16:45:22 +1000
Message-ID: <87tu5zjyf1.fsf@mpe.ellerman.id.au>
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bjorn Helgaas <helgaas@kernel.org> writes:
> On Sat, Aug 20, 2022 at 10:17:41AM +1000, Michael Ellerman wrote:
>> Bjorn Helgaas <helgaas@kernel.org> writes:
>> > On Sat, Aug 06, 2022 at 06:53:01PM +1000, Russell Currey wrote:
>> >> I haven't touched EEH in a long time I don't have much knowledge of the
>> >> subsystem at this point either, so it's misleading to have me as a
>> >> maintainer.
>> >> 
>> >> I remain grateful to Oliver for picking up my slack over the years.
>> >> 
>> >> Signed-off-by: Russell Currey <ruscur@russell.cc>
>> >> ---
>> >>  MAINTAINERS | 1 -
>> >>  1 file changed, 1 deletion(-)
>> >> 
>> >> diff --git a/MAINTAINERS b/MAINTAINERS
>> >> index a9f77648c107..dfe6081fa0b3 100644
>> >> --- a/MAINTAINERS
>> >> +++ b/MAINTAINERS
>> >> @@ -15639,7 +15639,6 @@ F:	drivers/pci/endpoint/
>> >>  F:	tools/pci/
>> >>  
>> >>  PCI ENHANCED ERROR HANDLING (EEH) FOR POWERPC
>> >> -M:	Russell Currey <ruscur@russell.cc>
>> >>  M:	Oliver O'Halloran <oohall@gmail.com>
>> >>  L:	linuxppc-dev@lists.ozlabs.org
>> >>  S:	Supported
>> >
>> > I was thinking along these lines, but if you want to take this,
>> > Michael, I'll drop it:
>> 
>> Hi Bjorn,
>> 
>> I was hoping one of the protagonists would send a patch :), but that
>> looks perfect.
>
> Waiting for that patch would have been the *smart* thing to do, but I
> added your ack and put it on for-linus for v6.0.  Thanks!

:) Thanks.

cheers
