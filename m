Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DEE357EB8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 11:08:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGFmq3rhkz3bvN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 19:08:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PQeNTa9Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PQeNTa9Z; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGFmR2gZlz30Bp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 19:08:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGFmQ5mnmz9sTD;
 Thu,  8 Apr 2021 19:08:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617872902;
 bh=2iQ0KxKS3ScPyUXb+3w5OkbMsrgL2S49tAnm4lp8e5A=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=PQeNTa9Z7GQdU5rWcP9EymbkwpsAaOorjmNuPTROuQQgHawPX1iSK6Yqn5j7g4ddO
 7IA9WA5RPZKRRwSjVljTKhaSIkgmBl4vs43F0c36u7DEuWu/xLCJ1qkvz/ciZRCjcl
 YWzOVr2rx7BKPeT4ODwx+viHKWiobCEmiZutX6H/ouYKrdqUXxXmZWGm5P2Ytg3eZE
 w8rMnGGmdqt7kA3m9einvJvxYPKgTgc+SGuD2e31X7JkT6NHavE/YRdtq8pijwEIEg
 gdtwzlQIzBn+FF6z4ygu/r+60SYjyKsEg8wpTbDon0GDv2ulZLAQhAe4AsaR35Ufuy
 tjVTmOMobWGrA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Leonardo Bras <leobras.c@gmail.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey
 Kardashevskiy <aik@ozlabs.ru>, brking@linux.vnet.ibm.com
Subject: Re: [PATCH v2 1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes
 present in LoPAR
In-Reply-To: <eed000bfa26686f616b91a7ac5a54ff8e3f2cbd0.camel@gmail.com>
References: <20210407195613.131140-1-leobras.c@gmail.com>
 <87im4xe3pk.fsf@mpe.ellerman.id.au>
 <942acb9b23d87594d0b758cc0daf713be836f8e6.camel@gmail.com>
 <eed000bfa26686f616b91a7ac5a54ff8e3f2cbd0.camel@gmail.com>
Date: Thu, 08 Apr 2021 19:08:22 +1000
Message-ID: <87blapdtyx.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Leonardo Bras <leobras.c@gmail.com> writes:
> On Thu, 2021-04-08 at 03:20 -0300, Leonardo Bras wrote:
>> > > +#define QUERY_DDW_PGSIZE_4K	0x01
>> > > +#define QUERY_DDW_PGSIZE_64K	0x02
>> > > +#define QUERY_DDW_PGSIZE_16M	0x04
>> > > +#define QUERY_DDW_PGSIZE_32M	0x08
>> > > +#define QUERY_DDW_PGSIZE_64M	0x10
>> > > +#define QUERY_DDW_PGSIZE_128M	0x20
>> > > +#define QUERY_DDW_PGSIZE_256M	0x40
>> > > +#define QUERY_DDW_PGSIZE_16G	0x80
>> > 
>> > I'm not sure the #defines really gain us much vs just putting the
>> > literal values in the array below?
>> 
>> My v1 did not use the define approach, what do you think of that?
>> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210322190943.715368-1-leobras.c@gmail.com/
>> 
>> 
> (of course, it would be that without the pageshift defines also, using
> the __builtin_ctz() approach suggested by Alexey.)

Yeah I think I like that better.

cheers
