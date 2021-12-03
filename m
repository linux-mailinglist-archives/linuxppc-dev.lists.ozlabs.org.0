Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C85A1466F05
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 02:12:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4vtZ4G3nz3c8M
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 12:12:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=j/t8FbUT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4vsw3Nysz2yJv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 12:11:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=j/t8FbUT; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J4vsv3CSNz4xbC;
 Fri,  3 Dec 2021 12:11:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1638493891;
 bh=+JylP2RVIbtJzYpK2ZtaZSsm+v7AMw7cQapVbRNSwI8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=j/t8FbUTVygIvVEoxzzZeVOIlusztuSn4HuxDqsS5CfLp5BE/rNBKoWcnGHmhPitv
 PzUTw22HhaYWs+WvRmGOXGuScXvgCT3wxz6PIV4ZAjlb8kRYnDCZKhmuQW3vM3TeSi
 nIz+9c9qz9/3zi1SF13P9qFNiJIWHQqMSGAQnj272Jkd/hMLVJQQTDguqSFB2aQmWj
 QZp81bpe2lrteGS8N190rWVOJU3dCiIKDgqeB16b+oM2pmF17lblSKI/ydd7qxTCNM
 kOsh7WJS7l225DTMkC6wTJh7ppHqwW1i1WX+A60L+imI6V/Xhbm2ecGQnWdX3d9ZDu
 CnBhtLuPtJOLA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: unmap memory regions in /memreserve node
In-Reply-To: <YaiRAD40xCK7u3Hl@FVFF77S0Q05N>
References: <20211124133347.3861391-1-calvinzhang.cool@gmail.com>
 <YaapE8oys5zQEdD5@robh.at.kernel.org> <YaiRAD40xCK7u3Hl@FVFF77S0Q05N>
Date: Fri, 03 Dec 2021 12:11:26 +1100
Message-ID: <874k7qpk5d.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Frank Rowand <frowand.list@gmail.com>,
 Calvin Zhang <calvinzhang.cool@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mark Rutland <mark.rutland@arm.com> writes:
> On Tue, Nov 30, 2021 at 04:43:31PM -0600, Rob Herring wrote:
>> +linuxppc-dev
 
Sorry missed this until now ...

>> On Wed, Nov 24, 2021 at 09:33:47PM +0800, Calvin Zhang wrote:
>> > Reserved memory regions in /memreserve node aren't and shouldn't
>> > be referenced elsewhere. So mark them no-map to skip direct mapping
>> > for them.
>> 
>> I suspect this has a high chance of breaking some platform. There's no 
>> rule a region can't be accessed.
>
> The subtlety is that the region shouldn't be explicitly accessed (e.g.
> modified),

I think "modified" is the key there, reserved means Linux doesn't use
the range for its own data, but may still read from whatever is in the
range.

On some platforms the initrd will be marked as reserved, which Linux
obviously needs to read from.

> but the OS is permitted to have the region mapped. In ePAPR this is
> described as:
>
>    This requirement is necessary because the client program is permitted to map
>    memory with storage attributes specified as not Write Through Required, not
>    Caching Inhibited, and Memory Coherence Required (i.e., WIMG = 0b001x), and
>    VLE=0 where supported. The client program may use large virtual pages that
>    contain reserved memory. However, the client program may not modify reserved
>    memory, so the boot program may perform accesses to reserved memory as Write
>    Through Required where conflicting values for this storage attribute are
>    architecturally permissible.
>
> Historically arm64 relied upon this for spin-table to work, and I *think* we
> might not need that any more I agree that there's a high chance this will break
> something (especially on 16K or 64K page size kernels), so I'd prefer to leave
> it as-is.

Yeah I agree. On powerpc we still use large pages for the linear mapping
(direct map), so reserved regions will be incidentally mapped as
described above.

> If someone requires no-map behaviour, they should use a /reserved-memory entry
> with a no-map property, which will work today and document their requirement
> explicitly.

+1.

cheers
