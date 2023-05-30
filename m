Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF017715C31
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 12:48:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVpyg17N0z3fDZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 20:48:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d+o7t46B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVpxp0HgWz3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 20:47:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d+o7t46B;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QVpxl6C6cz4x1R;
	Tue, 30 May 2023 20:47:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685443644;
	bh=G20+Sdm/98wI46f2WRdfsERiE5mRdZTpwi6+jvG8R1U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=d+o7t46BGfbpB2ob36lRdXwMjgQzcU5NBOtF/Kj7UJztuuPyk2IJwa73ehmTZJQZo
	 lvophwgIwGtC8ggYJcCw84/aiAJxtLUARSGeIkR/a/WeQWaJf4d5aL3btthULw/ymK
	 dUN3IYKTAdv1A9ZqJmKYbWoAUGf68BGtcBZmWCXtuZkI3i1CwSoWzqGU66PE9lgAtg
	 o0TyPjR/HLQXmG6vR4z6WibmSmBFnhzNC+sbSnk3pP8LwhuOSdCI4I/trcM/k8aBRr
	 dkab/MWQeszlLgVUVkCgRfpuf4j5ULMqcer+eONXtqEJqnh3qwntA9qAq2Tv7NJxnX
	 sKg7GkCAT7jfQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Greg KH <gregkh@linuxfoundation.org>, mirimmad@outlook.com
Subject: Re: [PATCH] powerpc: fix debugfs_create_dir error checking
In-Reply-To: <2023052835-oxidant-doily-404f@gregkh>
References: <CY5PR12MB64553EE96EBB3927311DB598C6459@CY5PR12MB6455.namprd12.prod.outlook.com>
 <2023052835-oxidant-doily-404f@gregkh>
Date: Tue, 30 May 2023 20:47:21 +1000
Message-ID: <87zg5mrt8m.fsf@mail.lhotse>
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
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Immad Mir <mirimmad17@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greg KH <gregkh@linuxfoundation.org> writes:
> On Sun, May 28, 2023 at 01:16:44PM +0530, mirimmad@outlook.com wrote:
>> From: Immad Mir <mirimmad17@gmail.com>
>> 
>> The debugfs_create_dir returns ERR_PTR incase of an error and the
>> correct way of checking it by using the IS_ERR inline function, and
>> not the simple null comparision. This patch fixes this.
>> 
>> Suggested-By: Ivan Orlov <ivan.orlov0322@gmail.com>
>> Signed-off-by: Immad Mir <mirimmad17@gmail.com>
>> ---
>>  arch/powerpc/platforms/powernv/opal-xscom.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
>> index 6b4eed2ef..262cd6fac 100644
>> --- a/arch/powerpc/platforms/powernv/opal-xscom.c
>> +++ b/arch/powerpc/platforms/powernv/opal-xscom.c
>> @@ -168,7 +168,7 @@ static int scom_debug_init_one(struct dentry *root, struct device_node *dn,
>>  	ent->path.size = strlen((char *)ent->path.data);
>> 
>>  	dir = debugfs_create_dir(ent->name, root);
>> -	if (!dir) {
>> +	if (IS_ERR(dir)) {
>>  		kfree(ent->path.data);
>>  		kfree(ent);
>>  		return -1;
>
> Why is this driver caring if debugfs is working or not at all?  It
> should just ignore the error and keep moving forward.

It's creating directories and then creating files in those directories.
So I think it makes sense that it checks that the directory was created
successfully. It doesn't check whether the files were created.

> And -1 is not a valid error number :(

It's EPERM :) - but yeah probably not really the right error in this
case.

Still I think this patch is an improvement so I'll plan to merge it.

cheers
