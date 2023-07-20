Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B72275A3DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 03:24:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5w2F4MvYz3c37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 11:24:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=chengzhihao1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5w1l1NJ5z2yGQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 11:23:38 +1000 (AEST)
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4R5vyn1WCBzLnrV;
	Thu, 20 Jul 2023 09:21:05 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 09:23:31 +0800
Subject: Re: [RFC PATCH 05/21] ubifs: Pass worst-case buffer size to
 compression routines
To: Ard Biesheuvel <ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
 <20230718125847.3869700-6-ardb@kernel.org>
 <20230718223813.GC1005@sol.localdomain>
 <CAMj1kXE1fND2h8ts6Xtfn19wkt=vAnj1TumxvoBCuEn7z3V4Aw@mail.gmail.com>
 <3330004f-acac-81b4-e382-a17221a0a128@huawei.com>
 <CAMj1kXGq=WiJXsQG6R0jEFYu_Mdom_KY+DE=NGqVSF6QmqhKeA@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <4fc9930e-152b-1de1-9532-d1eefa6c277c@huawei.com>
Date: Thu, 20 Jul 2023 09:23:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGq=WiJXsQG6R0jEFYu_Mdom_KY+DE=NGqVSF6QmqhKeA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>, qat-linux@intel.com, Eric Biggers <ebiggers@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <keescook@chromium.org>, linux-block@vger.kernel.org, Nick Terrell <terrelln@fb.com>, Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

在 2023/7/19 22:38, Ard Biesheuvel 写道:
> On Wed, 19 Jul 2023 at 16:23, Zhihao Cheng <chengzhihao1@huawei.com> wrote:
>>
>> 在 2023/7/19 16:33, Ard Biesheuvel 写道:
>>> On Wed, 19 Jul 2023 at 00:38, Eric Biggers <ebiggers@kernel.org> wrote:
>>>>
>>>> On Tue, Jul 18, 2023 at 02:58:31PM +0200, Ard Biesheuvel wrote:
>>>>> Currently, the ubifs code allocates a worst case buffer size to
>>>>> recompress a data node, but does not pass the size of that buffer to the
>>>>> compression code. This means that the compression code will never use
>>
>> I think you mean the 'out_len' which describes the lengh of 'buf' is
>> passed into ubifs_decompress, which effects the result of
>> decompressor(eg. lz4 uses length to calculate the buffer end pos).
>> So, we should pass the real lenghth of 'buf'.
>>
> 
> Yes, that is what I meant.
> 
> But Eric makes a good point, and looking a bit more closely, there is
> really no need for the multiplication here: we know the size of the
> decompressed data, so we don't need the additional space.
> 

Right, we get 'out_len' from 'dn->size' which is the length of 
uncompressed data. ubifs_compress makes sure the compressed length is 
smaller than original length.

> I intend to drop this patch, and replace it with the following:
> 
> ----------------8<--------------
> 
> Currently, when truncating a data node, a decompression buffer is
> allocated that is twice the size of the data node's uncompressed size.
> However, the fact that this space is available is not communicated to
> the compression routines, as out_len itself is not updated.
> 
> The additional space is not needed even in the theoretical worst case
> where compression might lead to inadvertent expansion: first of all,
> increasing the size of the input buffer does not help mitigate that
> issue. And given the truncation of the data node and the fact that the
> original data compressed well enough to pass the UBIFS_MIN_COMPRESS_DIFF
> test, there is no way on this particular code path that compression
> could result in expansion beyond the original decompressed size, and so
> no mitigation is necessary to begin with.
> 
> So let's just drop WORST_COMPR_FACTOR here.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> 
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index dc52ac0f4a345f30..0b55cbfe0c30505e 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -1489,7 +1489,7 @@ static int truncate_data_node(const struct
> ubifs_info *c, const struct inode *in
>          int err, dlen, compr_type, out_len, data_size;
> 
>          out_len = le32_to_cpu(dn->size);
> -       buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
> +       buf = kmalloc(out_len, GFP_NOFS);
>          if (!buf)
>                  return -ENOMEM;
> .
> 

This version looks better.

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>

