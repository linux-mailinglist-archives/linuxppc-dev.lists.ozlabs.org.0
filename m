Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE19F5A776D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 09:23:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHbHg4sS1z3c1N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 17:23:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OXOVQQmo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHbH01Y2Dz2xJ9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 17:22:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OXOVQQmo;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHbGq5FVgz4xG6;
	Wed, 31 Aug 2022 17:22:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661930552;
	bh=WKkkQRG6bf9R7KZ/zDCU6xhALT0ZrJhryQ3qstr4wgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OXOVQQmoDSeeEcD48crP47K3BNbJY4Uviw8tglh6zCYmC+OOdxku5P55VfDPf8KFV
	 pQxW1oevMEULJVLrLGqrJkLD4u8+Bh4I36NANKY1J0kve8uyeJztIqCyZY7J+gCUFJ
	 HpTA3KYAKcucUhKq3zMRUW/k9eWwL9p24AZDN/z4alx67ITDE4zCPY4NZKe8KE82H3
	 uaK3YwWDSv7mUHiPtMF6tBBXsRXykTPW8XZnyu3O5bpmGX0g2WiMEIkFn+lW5g9I6V
	 5kIxQPXE4kOD1bJiSm4jg3C0c8sZNUfk0wSW1M9j8ZDXsbchhGE3T04xLkeopR4L4C
	 Y/tNqlozJU5cQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Sathvika Vasireddy
 <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 02/16] powerpc: override __ALIGN() and __ALIGN_STR()
 macros
In-Reply-To: <CMJW5375AS4G.3VZ0XK6D3OZ9O@bobo>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-3-sv@linux.ibm.com>
 <CMJW5375AS4G.3VZ0XK6D3OZ9O@bobo>
Date: Wed, 31 Aug 2022 17:22:25 +1000
Message-ID: <878rn4vpvy.fsf@mpe.ellerman.id.au>
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Mon Aug 29, 2022 at 3:52 PM AEST, Sathvika Vasireddy wrote:
>> Powerpc instructions must be word-aligned. Currently,
>> there is an alignment of 16 bytes (by default), and it is
>> much more than what is required for powerpc (4 bytes).
>>
>> The default expansion of __ALIGN() macro is:
>> #define __ALIGN       .align 4,0x90
>>
>> Since Powerpc Linux does not require a 16 byte alignment,
>> override __ALIGN() and __ALIGN_STR() macros to use required
>> 4 byte alignment.
>
> Alignment can be desirable beyond the minimum requirement, for
> example 16 byte alignment for functions could be helpful for
> instruction fetch. So it should be explained why possible
> benefits of the larger alignment are not worth it.

Using ".align 2" matches what our existing _GLOBAL macro does. So this
change basically just propagates that existing alignment into this new
macro, which is used for similar purposes.

So if we want to increase the alignment we should do that explicitly,
and update _GLOBAL at the same time.

The change log should probably just say ~= "use the same alignment as
the existing _GLOBAL macro".

What's more important, but not mentioned in the change log, is that we
don't want to pad with 0x90, because repeated 0x90s are not a nop or
trap on powerpc.

cheers
