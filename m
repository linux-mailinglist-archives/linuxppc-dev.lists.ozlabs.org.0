Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 195414871E7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 05:56:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVWCS0LSjz3bbN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 15:56:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dxzQHmNi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVWBk3TbYz2ynD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 15:55:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dxzQHmNi; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JVWBf5zFXz4xPt;
 Fri,  7 Jan 2022 15:55:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1641531357;
 bh=+0gt3Ce/FGhwyld+iB75eE7kUGD74gyF9fLmCmmqJI0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dxzQHmNiOmvWH1t16AItMd6p2d3tqG+A+i+kTTwCUtjXndn/8t9HVsubSR2LYK9eq
 qLV+AKENtXbVxF82SjKPi5H6auA5H+E4xy6aiXfHuirtVyc7Qhxg+wabbGX3nLq2I+
 EVwFipTHBcl1/0TSEOGQGu0eMTP1XgIOY5vXGnkyOyrZB/q+fnCh70MZQMo3GoAc8U
 IN5HuWy0bik/ia7uIcPDYvlI3PUdoNflPOt4Fs8Jm6ZUFT+FCtexoWndZbvp/N+ycV
 DPSDznKiugLXkGclPgPiKw9E5UlaFcBlFWMybBsKimfWKwiQ3hmOKf+nRWyw2oAdgE
 Y2f4UI+/F3KVw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>, Neal Gompa <ngompa13@gmail.com>
Subject: Re: [PATCH] fs: btrfs: Disable BTRFS on platforms having 256K pages
In-Reply-To: <db88497c-ea17-27ca-6158-2a987acb7a1c@gmx.com>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
 <6c7a6762-6bec-842b-70b4-4a53297687d1@gmx.com>
 <CAEg-Je9UJDJ=hvLLqQDsHijWnxh1Z1CwaLKCFm+-bLTfCFingg@mail.gmail.com>
 <db88497c-ea17-27ca-6158-2a987acb7a1c@gmx.com>
Date: Fri, 07 Jan 2022 15:55:51 +1100
Message-ID: <87bl0o2lgo.fsf@mpe.ellerman.id.au>
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
Cc: linux-hexagon@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Josef Bacik <josef@toxicpanda.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 linuxppc-dev@lists.ozlabs.org, Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Qu Wenruo <quwenruo.btrfs@gmx.com> writes:
> On 2022/1/7 00:31, Neal Gompa wrote:
>> On Wed, Jan 5, 2022 at 7:05 AM Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
>>>
>>> Hi Christophe,
>>>
>>> I'm recently enhancing the subpage support for btrfs, and my current
>>> branch should solve the problem for btrfs to support larger page sizes.
>>>
>>> But unfortunately my current test environment can only provide page size
>>> with 64K or 4K, no 16K or 128K/256K support.
>>>
>>> Mind to test my new branch on 128K page size systems?
>>> (256K page size support is still lacking though, which will be addressed
>>> in the future)
>>>
>>> https://github.com/adam900710/linux/tree/metadata_subpage_switch
>>>
>>
>> The Linux Asahi folks have a 16K page environment (M1 Macs)...
>
> Su Yue kindly helped me testing 16K page size, and it's pretty OK there.
>
> So I'm not that concerned.
>
> It's 128K page size that I'm a little concerned, and I have not machine
> supporting that large page size to do the test.

Did Christophe say he had a 128K system to test on?

In mainline powerpc only supports 4K/16K/64K/256K.

AFAIK there's no arch with 128K page size support, but that's only based
on some grepping, maybe it's hidden somewhere.

cheers
