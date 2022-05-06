Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79651D050
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 06:29:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvcz03PhBz3c8T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 14:29:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VRYLykty;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvcyN6svFz3bqd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 14:28:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VRYLykty; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KvcyM6Cjmz4xR1;
 Fri,  6 May 2022 14:28:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651811324;
 bh=kPmBrmNZRI4k4ASBVGcaxanjDSU0xGdjd9PCFOJYtKU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VRYLyktyEbBTVMln6AL6zD9QNUWfb4mauaOnmx31I2SGV10dKbGbEg4YMxgEoOd5u
 lBTYUprHkM36PGPopTZ0ExHzCGb+ANY9PTnv+Lwg5JlP8IWQ/yQkzeeeNIVbuyKUoE
 bRO1rTdA1wTizwM+sqaAg+Z0OtP6CmgpsXXCNuuXfn7gV7r7bLI4IvZh5XFsJ4U26i
 3bvZKOA9nMzWavUkkfRzwWNtbY8UqqvSvnFmbH4l35aC8Hk7272rJNiFHb/dRYOnWC
 4XYqVqSNO09Rv2/6rvNh5tVUshPJiQcczQ5VwHsoucl8OkuBWHLMLtmgVP6OBHy6Ww
 Ig7dnNUeJIY2A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Julia Lawall <julia.lawall@inria.fr>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] powerpc: fix typos in comments
In-Reply-To: <alpine.DEB.2.22.394.2205050949150.2425@hadrien>
References: <20220430185654.5855-1-Julia.Lawall@inria.fr>
 <CACPK8XdT3MNnArMhdz4X1GcSvXwnV9gLOrxJ8ZKRkT03LahW_A@mail.gmail.com>
 <alpine.DEB.2.22.394.2205050949150.2425@hadrien>
Date: Fri, 06 May 2022 14:28:39 +1000
Message-ID: <87o80bthc8.fsf@mpe.ellerman.id.au>
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
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Julia Lawall <julia.lawall@inria.fr> writes:
> On Thu, 5 May 2022, Joel Stanley wrote:
>> On Sat, 30 Apr 2022 at 18:58, Julia Lawall <Julia.Lawall@inria.fr> wrote:
>> > Various spelling mistakes in comments.
>> > Detected with the help of Coccinelle.
>> >
>> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>>
>> I read the patch and it appears that all of the corrections are good.
>> Thanks for sending it Julia.
>>
>> I'm not sure that one mega patch is the right way to go or not, so
>> I'll leave that to mpe.
>
> I tried some other options, but wasn't satisfied with any of them.  But
> just let me know if you want something else (by file? by subdirectory?)

This was fine, I've picked it up (in my next-test branch).

There were a few conflicts, but I fixed them up, and there would still
be a few conflicts even if it was split into multiple patches.

cheers
