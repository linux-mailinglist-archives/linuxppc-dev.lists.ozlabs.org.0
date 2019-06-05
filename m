Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECDF35AB4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 12:53:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jlxn4k7tzDqdv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 20:53:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JlwN2FyzzDqRq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 20:51:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45JlwL62JYz9sBb;
 Wed,  5 Jun 2019 20:51:46 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Oliver <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/nvdimm: Add support for multibyte read/write for
 metadata
In-Reply-To: <87ef49hg85.fsf@linux.ibm.com>
References: <20190602044350.31660-1-aneesh.kumar@linux.ibm.com>
 <CAOSf1CEsWiDyc3rAzNoPwBUUhs4deXt_1MJpuKUV_CP-LJhjhw@mail.gmail.com>
 <87ef49hg85.fsf@linux.ibm.com>
Date: Wed, 05 Jun 2019 20:51:45 +1000
Message-ID: <8736konw3i.fsf@concordia.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Oliver <oohall@gmail.com> writes:
>> On Sun, Jun 2, 2019 at 2:44 PM Aneesh Kumar K.V
>> <aneesh.kumar@linux.ibm.com> wrote:
...
>>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>>> index 0176ce66673f..e33cebb8ee6c 100644
>>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>>> @@ -97,42 +97,102 @@ static int drc_pmem_unbind(struct papr_scm_priv *p)
>>>  }
>>>
>>>  static int papr_scm_meta_get(struct papr_scm_priv *p,
>>> -                       struct nd_cmd_get_config_data_hdr *hdr)
>>> +                            struct nd_cmd_get_config_data_hdr *hdr)
>>>  {
>>>         unsigned long data[PLPAR_HCALL_BUFSIZE];
>>> +       unsigned long offset, data_offset;
>>> +       int len, read;
>>>         int64_t ret;
>>>
>>> -       if (hdr->in_offset >= p->metadata_size || hdr->in_length != 1)
>>> +       if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
>>>                 return -EINVAL;
>>>
>>> -       ret = plpar_hcall(H_SCM_READ_METADATA, data, p->drc_index,
>>> -                       hdr->in_offset, 1);
>>> -
>>> -       if (ret == H_PARAMETER) /* bad DRC index */
>>> -               return -ENODEV;
>>> -       if (ret)
>>> -               return -EINVAL; /* other invalid parameter */
>>> -
>>> -       hdr->out_buf[0] = data[0] & 0xff;
>>> -
>>> +       for (len = hdr->in_length; len; len -= read) {
>>> +
>>> +               data_offset = hdr->in_length - len;
>>> +               offset = hdr->in_offset + data_offset;
>>> +
>>> +               if (len >= 8)
>>> +                       read = 8;
>>> +               else if (len >= 4)
>>> +                       read = 4;
>>> +               else if ( len >= 2)
>>> +                       read = 2;
>>> +               else
>>> +                       read = 1;
>>> +
>>> +               ret = plpar_hcall(H_SCM_READ_METADATA, data, p->drc_index,
>>> +                                 offset, read);
>>> +
>>> +               if (ret == H_PARAMETER) /* bad DRC index */
>>> +                       return -ENODEV;
>>> +               if (ret)
>>> +                       return -EINVAL; /* other invalid parameter */
>>> +
>>> +               switch (read) {
>>> +               case 8:
>>> +                       *(uint64_t *)(hdr->out_buf + data_offset) = be64_to_cpu(data[0]);
>>> +                       break;
>>> +               case 4:
>>> +                       *(uint32_t *)(hdr->out_buf + data_offset) = be32_to_cpu(data[0] & 0xffffffff);
>>> +                       break;
...
>>
>> I assume you got the qemu bits sorted out with Shiva? Looks good otherwise.
>
> That is correct. I also tested with different xfer values (1, 2, 4, 8)
> on both Qemu and PowerVM.

With a big endian kernel?

cheers
