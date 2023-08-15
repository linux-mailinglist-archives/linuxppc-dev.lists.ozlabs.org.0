Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F3B77CB52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 12:48:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CCuxRFwI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ7KH3Mgyz3cN8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 20:48:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CCuxRFwI;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ7JQ4WXwz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 20:47:34 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RQ7JQ41XTz4wxW; Tue, 15 Aug 2023 20:47:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692096454;
	bh=hLLmaIjm1zxvSzRjXXMlW/6v8jDnhM2ktZF4GfK2WGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CCuxRFwIt0VPM66KpgExYZZRbomwCj//lHkpwUshLSbrgGmbrSGiSEd08Y1AdJELO
	 bji9dfrtvXmFgGgE3rDMP+kCgx6Ab8xZ+T9Gft6YaTKFaEoR0mapeW7q+PwWmiZfpw
	 GY7Sdh9zgpVdvAbWlBnb1cCmpf7opKNJUzstAvwP8ZLPnhzwCkG233zhyZGbMVRWFR
	 1vth8D6dNEckeKByBXTqgZ7F0cMH9+4mDZarHOQjAQxEu/lhlU0J7VLlxRkwOm++Py
	 wcvcLSH2GM/ePflPoKkK+IJXe9HY8PCDy3ow9lBZZbLe7YRnELn/OkJiYYCnFlpbNe
	 zmsiTGwVQ2tNA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RQ7JQ3Dq5z4wZs;
	Tue, 15 Aug 2023 20:47:34 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Stanley <joel@jms.id.au>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Subject: Re: [PATCH v2] powernv/opal-prd: Silence memcpy() run-time false
 positive warnings
In-Reply-To: <CACPK8XdP5keaUsP3cNY601P=uhDU_jj47rhies5QOojbU5ZSAw@mail.gmail.com>
References: <168870663097.1448934.17365533203887616941.stgit@jupiter>
 <CACPK8XdP5keaUsP3cNY601P=uhDU_jj47rhies5QOojbU5ZSAw@mail.gmail.com>
Date: Tue, 15 Aug 2023 20:47:34 +1000
Message-ID: <87r0o4d1kp.fsf@mail.lhotse>
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>, Jordan Niethe <jniethe5@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> writes:
> On Fri, 7 Jul 2023 at 05:11, Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
>>
>> opal_prd_msg_notifier extracts the opal prd message size from the message
>> header and uses it for allocating opal_prd_msg_queue_item that includes
>> the correct message size to be copied. However, while running under
>> CONFIG_FORTIFY_SOURCE=y, it triggers following run-time warning:
>>
>> [ 6458.234352] memcpy: detected field-spanning write (size 32) of single field "&item->msg" at arch/powerpc/platforms/powernv/opal-prd.c:355 (size 4)
>> [ 6458.234390] WARNING: CPU: 9 PID: 660 at arch/powerpc/platforms/powernv/opal-prd.c:355 opal_prd_msg_notifier+0x174/0x188 [opal_prd]
>> [...]
>> [ 6458.234709] NIP [c00800000e0c0e6c] opal_prd_msg_notifier+0x174/0x188 [opal_prd]
>> [ 6458.234723] LR [c00800000e0c0e68] opal_prd_msg_notifier+0x170/0x188 [opal_prd]
>> [ 6458.234736] Call Trace:
>> [ 6458.234742] [c0000002acb23c10] [c00800000e0c0e68] opal_prd_msg_notifier+0x170/0x188 [opal_prd] (unreliable)
>> [ 6458.234759] [c0000002acb23ca0] [c00000000019ccc0] notifier_call_chain+0xc0/0x1b0
>> [ 6458.234774] [c0000002acb23d00] [c00000000019ceac] atomic_notifier_call_chain+0x2c/0x40
>> [ 6458.234788] [c0000002acb23d20] [c0000000000d69b4] opal_message_notify+0xf4/0x2c0
>> [...]
>>
>> Split the copy to avoid false positive run-time warning.
>>
>> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>
> I hit this on a box running the Ubuntu 6.2.0-27-generic kernel.
>
> Do we plan on merging this fix?

I thought it was papering over the issue rather than fixing the root
cause.

I'll send a new version, as soon as I can work out how to trigger that
code path.

cheers
