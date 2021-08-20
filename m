Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FFF3F2C31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 14:34:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Grh0c4ztgz3cXb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 22:34:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mtQUVDWV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mtQUVDWV; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Grgzy2thZz306d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 22:34:05 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Grgzv3Qhxz9sWq;
 Fri, 20 Aug 2021 22:34:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629462845;
 bh=RvSoZj9qGbuGPBLusBDgZESowYHwhMMiBJyC8aIMk60=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mtQUVDWVN21fl7CB8Gv+bXzF4FyNyW44mL2BYz7qsbt/eYeNT69e584cR6zMVbxqO
 ynl5XZWnLQ45izhHFGBbzG1riwSDXF5HxR7P6MYnAHHiOX2/bE53XIUnaRqRJMDFAm
 P8zAFSBs7KWapWa9nTnuKg/KNnO3bZ2mOUawCw+CDy+9UnJXlCv1wJXqDWlnNolPaB
 rXl1Ck3kKrE+EXgUNuoH0szMYFn4EqkJTs0hQNEXiHpEp16L82OBAnWkCq19clUSEG
 6/9GTOU9oqC5kGb9R5dOO/Mh4wDbKHUsiboA1eolxLil/INGfzViLXj4lvJnbxaRGw
 0qe92o3jgy8cw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, Xianting Tian
 <xianting.tian@linux.alibaba.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, amit@kernel.org, arnd@arndb.de, osandov@fb.com
Subject: Re: [PATCH v8 2/3] tty: hvc: pass DMA capable memory to put_chars()
In-Reply-To: <87pmu8ehkk.fsf@linkitivity.dja.id.au>
References: <20210818082122.166881-1-xianting.tian@linux.alibaba.com>
 <20210818082122.166881-3-xianting.tian@linux.alibaba.com>
 <87pmu8ehkk.fsf@linkitivity.dja.id.au>
Date: Fri, 20 Aug 2021 22:34:02 +1000
Message-ID: <87pmu8cn2d.fsf@mpe.ellerman.id.au>
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
Cc: Xianting Tian <xianting.tian@linux.alibaba.com>,
 shile.zhang@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Xianting Tian <xianting.tian@linux.alibaba.com> writes:
>
>> As well known, hvc backend driver(eg, virtio-console) can register its
>> operations to hvc framework. The operations can contain put_chars(),
>> get_chars() and so on.
>>
>> Some hvc backend may do dma in its operations. eg, put_chars() of
>> virtio-console. But in the code of hvc framework, it may pass DMA
>> incapable memory to put_chars() under a specific configuration, which
>> is explained in commit c4baad5029(virtio-console: avoid DMA from stack):
>
> We could also run into issues on powerpc where Andrew is working on
> adding vmap-stack but the opal hvc driver assumes that it is passed a
> buffer which is not in vmalloc space but in the linear mapping.

The right fix for that is our code that calls opal has to be careful
that it's not passing vmalloc addresses.

We have many cases where we pass stack variables to opal, they'll all
have to be fixed to pass the underlying phyiscal/linear map address. The
opal hvc code will just be one more case of that.

cheers
