Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1980B8A696F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 13:11:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LTB6+F04;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJhFS6CL2z3vfZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 21:11:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LTB6+F04;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJhDl2KCzz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 21:11:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713265877;
	bh=ZM/Kn+8UkuIqH7dSUrgkALqX2sFZu1tAf9iAD/x7XuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LTB6+F04dq0c2A9vGjdft01NvBtN7BE1s7hBFglEQeOgGLMZ8lhGSvwhgamz3zdUw
	 3LOFOGAE8/69f5wjWDrFwFeywpUpkxUOsNTUPdSBqDxlizHom70fy+HGtKeWzbOmZE
	 8ubI3+yDLj3N/2MnNLCuoA4+Aq8ZuD2XB8lHJavB2F/v4AgKxIuU7J4aUnkE/18pi5
	 y2cVry8DRgTrqzpXW05YnuQ2MoPsb+3UECVYNA3zp20sf3yGFp6RARvbtTBUET+zd4
	 8qw/x/HqneNONDno8GHtmrjjMlSabWz9T+pHjLGZ/DGvvazDUjzYg3oKs5SvnFWbUD
	 T9duxh5ZTeljA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VJhDg5c14z4wd3;
	Tue, 16 Apr 2024 21:11:15 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org,
 kernel-janitors@vger.kernel.org, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [0/2] powerpc/powernv/vas: Adjustments for two function
 implementations
In-Reply-To: <ee6022b8-3aeb-4e6e-99f5-2668dd344e0a@web.de>
References: <7be66990-de9e-488b-ad6d-fafd1c7bb34c@web.de>
 <ee6022b8-3aeb-4e6e-99f5-2668dd344e0a@web.de>
Date: Tue, 16 Apr 2024 21:11:15 +1000
Message-ID: <87plupbm0c.fsf@mail.lhotse>
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Markus Elfring <Markus.Elfring@web.de> writes:
>> A few update suggestions were taken into account
>> from static source code analysis.
>>
>> Markus Elfring (2):
>
> I would appreciate a bit more information about the reasons
> why this patch series was rejected.
>
>
>>   One function call less in vas_window_alloc() after error detection
>
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1f1c21cf-c34c-418c-b00c-8e6474f12612@web.de/

It introduced a new goto and label to avoid a kfree(NULL) call, but
kfree() explicitly accepts NULL and handles it. So it complicates the
source code for no gain.

>>   Return directly after a failed kasprintf() in map_paste_region()
>
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/f46f04bc-613c-4e98-b602-4c5120556b09@web.de/

Basically the same reasoning. And it also changes the function from
having two return paths (success and error), to three.

cheers
