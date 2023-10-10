Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF677BF916
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 12:59:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WxWDiLzj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Xwh3KqDz3vXN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 21:59:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WxWDiLzj;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4Xvp4y0Kz3bw8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 21:59:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1696935541;
	bh=oyYtN7W9I8/yfOlknnT+Z44tWQsIqhu9eaFgKki5b+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WxWDiLzjX5PaRRl8TRrto/hFcE+9JBUccm17gOdW+jVz4ziS9Yxa8jd7+BqHtH4pG
	 +StjhgXcHx/XWLS3yy3zOSs0JtHwBXVAxep3mEs1RjJsF2khIzyVjrf25D+v8brOp9
	 JuutVUNFlghppl6dAe5m4SF1M3p7kj+bncItUbef9h/yq43GoWS/8MkNJevYfA2UTF
	 4dvfsqf62ZLGDZxBGOaQNP9p+bkKiY2K0EQtqONWad0Gwa2vXSZRpwJT4VmLgZYvZG
	 KvmbfaTJEUqZo9zgt885kVIQf2wj1W7mtk6PfmklROkPV13T477GdS7viG5I2cn0H8
	 DEwEqH3V+rnfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S4Xvm6z6nz4xPY;
	Tue, 10 Oct 2023 21:59:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Eddie James <eajames@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: KUEP broken on FSP2?
In-Reply-To: <4fd21fd5-6da9-271f-4827-c6ce48af16e1@linux.ibm.com>
References: <fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com>
 <87a5ssrl9c.fsf@mail.lhotse>
 <4fd21fd5-6da9-271f-4827-c6ce48af16e1@linux.ibm.com>
Date: Tue, 10 Oct 2023 21:59:00 +1100
Message-ID: <87zg0qrbez.fsf@mail.lhotse>
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
Cc: paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eddie James <eajames@linux.ibm.com> writes:
> On 10/9/23 08:14, Michael Ellerman wrote:
>> Eddie James <eajames@linux.ibm.com> writes:
>>> Hi,
>>>
>>> I'm attempting to run linux 6.1 on my FSP2, but my kernel crashes
>>> attempting to get into userspace. The init script works, but the first
>>> binary (mount) I run results in oops. Can anyone help me to debug this
>>> further or suggest anything?
>> Hi Eddie,
>>
>> It looks like breakage in syscall_exit_finish.
>> Can you test this? Patch is against v6.1.
>
>
> That worked! Perfect. Thank you very much! Will you send it upstream?

Great, thanks for testing. Yeah I'll send a patch.

cheers
