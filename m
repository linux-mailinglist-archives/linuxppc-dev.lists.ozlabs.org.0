Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A774B6617
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 16:29:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YMnD4XygzF3S0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 00:29:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YMDV253rzDrgF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 00:04:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Z2MY+PcE"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46YMDF51tFz9sNk;
 Thu, 19 Sep 2019 00:04:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568815472;
 bh=OtjuN7b/JN32k8kTJz7+0zZjBH9OAYcEhMOUPbHgnfk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Z2MY+PcEhO6O1VNORO4MD+IYzWGkjYpSASQ3suWSOb3YeWqAXdkom3LG5G5DkX1hv
 i0dCuJ6WXJ/yMQSyCKpIqcOr12myYDgrSBeut9jjRymem3H7v/oI9dmM4df5LS73MS
 8HBl2kd5nfV5JTNNJzC6JUZOJJjPXua6NID6AfmmRLAicvWWe5SVnvtdyJtIfD7pwm
 vgi/aZSJWohpFUz6D+qQV03zpP+h+M8kU5Q7NR7B8TQofTwqX2qxCPEbQY/WdFHbSV
 9JolaenYcNvK61MU8QII+zn6WujxiF2t0Di757vJ+O7dRGQ0GIspq2tSuxLelx2Oad
 B2HEq0VM8ypcw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Suraj Jitindar
 Singh <sjitindarsingh@gmail.com>
Subject: Re: [PATCH] powerpc: Add barrier_nospec to raw_copy_in_user()
In-Reply-To: <20190821153656.57fabe9c@kitsune.suse.cz>
References: <20190306011038.16449-1-sjitindarsingh@gmail.com>
 <20190821153656.57fabe9c@kitsune.suse.cz>
Date: Thu, 19 Sep 2019 00:04:27 +1000
Message-ID: <87o8zhvgyc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Wed,  6 Mar 2019 12:10:38 +1100
> Suraj Jitindar Singh <sjitindarsingh@gmail.com> wrote:
>
>> Commit ddf35cf3764b ("powerpc: Use barrier_nospec in copy_from_user()")
>> Added barrier_nospec before loading from user-controller pointers.
>> The intention was to order the load from the potentially user-controlled
>> pointer vs a previous branch based on an access_ok() check or similar.
>>=20
>> In order to achieve the same result, add a barrier_nospec to the
>> raw_copy_in_user() function before loading from such a user-controlled
>> pointer.
>>=20
>> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
>> ---
>>  arch/powerpc/include/asm/uaccess.h | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/a=
sm/uaccess.h
>> index e3a731793ea2..bb615592d5bb 100644
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -306,6 +306,7 @@ extern unsigned long __copy_tofrom_user(void __user =
*to,
>>  static inline unsigned long
>>  raw_copy_in_user(void __user *to, const void __user *from, unsigned lon=
g n)
>>  {
>> +	barrier_nospec();
>>  	return __copy_tofrom_user(to, from, n);
>>  }
>>  #endif /* __powerpc64__ */
>
> Hello,
>
> AFAICT this is not needed. The data cannot be used in the kernel without
> subsequent copy_from_user which already has the nospec barrier.

Suraj did talk to me about this before sending the patch. My memory is
that he came up with a scenario where it was at least theoretically
useful, but he didn't mention that in the change log. He was working on
nested KVM at the time.

I've now forgotten, and he's moved on to other things so probably won't
remember either, if he's even checking his mail :/

cheers
