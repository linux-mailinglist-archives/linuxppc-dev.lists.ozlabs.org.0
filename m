Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A476128E5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 08:58:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0TDs1sfjz3cLh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 18:58:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AVoJ6u70;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=AVoJ6u70;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0TCs1QF3z30F7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 18:57:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1667116648;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=178+RG4MuNtb4HZnKiX1VUAAPE2kXkBwx40lWzXuik4=;
    b=AVoJ6u70Au9cNL93Sgn83HR24S/aAliOMNz8O3h2IEimtRvj8JQE/hBxiAY58dckkc
    DLguKJ1W1QiuPX4wrtpGFRkhMWZd2Di1n/SbikFblhAUal0PjtcR8qmMUa/2Wvz8wubw
    z4TuIw3Df+dNoqWlcD9CBGVxPZxhK2AUfNtxCYX8TZMF1ymabdnuQKU0Uf3zsf7UNMFw
    ZhGPYlf9hangN4wA/ak9uVu6BiHGfuT+TGfA9UX//ej195S+I9f19kFI8aaSmyQ6F+Vu
    DDwEhBXFHNh7T2irPAOYTIG4sOyPaMgEPefQkOZZbo/DXxdH+6AAcL8+hXDBmMwhgLHk
    lSAw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjdvwZnTEgQ417+J0BJqkWkgAfi"
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:8fd:c1ee:6a22:d99a]
    by smtp.strato.de (RZmta 48.2.1 AUTH)
    with ESMTPSA id e28afdy9U7vQDtO
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 30 Oct 2022 08:57:26 +0100 (CET)
Message-ID: <d906bcb4-e6f7-1268-b787-bd283a964b6f@xenosoft.de>
Date: Sun, 30 Oct 2022 08:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <87y1tfl1pt.fsf@mpe.ellerman.id.au>
 <BCDB3B67-48A1-45E6-806D-2501C7EA6D8C@xenosoft.de>
 <20221029153331.GI25951@gate.crashing.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <20221029153331.GI25951@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Darren Stevens <darren@stevens-zone.net>, Andrew Donnellan <ajd@linux.ibm.com>, npiggin@gmail.com, rmclure@linux.ibm.com, mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29 October 2022 at 5:33 pm, Segher Boessenkool wrote:
> On Mon, Oct 17, 2022 at 09:53:04AM +0200, Christian Zigotzky wrote:
>>> On 17. Oct 2022, at 02:43, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>> Previously BIG_ENDIAN && GENERIC_CPU would use -mcpu=power5, now it uses
>>> -mcpu=power4.
>> Maybe this is the issue. We will wait and not release the RC1 for testing because it is a risk for our testers to test these new kernels because of this issue.
>>
>> It is really important do not to rewrite code, that is well worked before.
>> Bugfixing and adding some new features is ok but rewriting of good code is expensive and doesn’t make any sense.
> It was just a bugfix, and a (partial) revert.
>
> 471d7ff8b51b says it removed ISA 2.00 support (original power4, "GP").
> Support for ISA 2.01 was retained it says.  That is power4+, "GQ", but
> also 970 (Apple G5).  That patch actually switched to ISA 2.02 though,
> unintendedly, and code generated for ISA 2.02 will not run on systems
> like 970, in principle.  It is just one uncommon instruction that is
> problematical, namely popcntb, because the kernel does not use floating
> point at all, so that is why we got away with it for so long (most code
> that does use fp will fall flat on its face in no time).  It still is a
> bug fix though!
>
> PA6T is ISA 2.04, it's not clear how this (bugfix, and revert!) change
> made code not run on PA6T anymore.  Smells a lot like something indirect
> (or triply indirect), a separate bug, something that was introduced in
> the last two years maybe, but I'll even bet it is something *exposed* in
> that time, a bug that has been here for longer!
>
>
> Segher
Unfortunately my FSL P5040 system is also affected.

-- Christian
