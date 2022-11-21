Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52602632849
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 16:33:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGBHq1VWlz3cL1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 02:33:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K7o49WGe;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K7o49WGe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K7o49WGe;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K7o49WGe;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGBGG2Rl3z3cJv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 02:32:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669044737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aAnNSC79PB+nEOAdqHzoVvnCbPLv+tVDX8zsNeLu1uI=;
	b=K7o49WGekkO8f2GwroPK7CenXe2r6iiacCUBEwlejsIo1QML1p5+oCskZJ/fOmdNu2t5Rm
	FzRsn/LXkCM3zpFjxxb7H/Sg8LxJ/p+Lpwa8DqmUrIqXJ4bUbrI6lpzp0zBw+MpqIavaBv
	b4FGyc8MJ6XBBlt6al1x/95uUbzJfr4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669044737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aAnNSC79PB+nEOAdqHzoVvnCbPLv+tVDX8zsNeLu1uI=;
	b=K7o49WGekkO8f2GwroPK7CenXe2r6iiacCUBEwlejsIo1QML1p5+oCskZJ/fOmdNu2t5Rm
	FzRsn/LXkCM3zpFjxxb7H/Sg8LxJ/p+Lpwa8DqmUrIqXJ4bUbrI6lpzp0zBw+MpqIavaBv
	b4FGyc8MJ6XBBlt6al1x/95uUbzJfr4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-42-SeawZv6dMzimdgn-JF9oHg-1; Mon, 21 Nov 2022 10:32:13 -0500
X-MC-Unique: SeawZv6dMzimdgn-JF9oHg-1
Received: by mail-qk1-f199.google.com with SMTP id bj1-20020a05620a190100b006fa12a05188so15842592qkb.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 07:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAnNSC79PB+nEOAdqHzoVvnCbPLv+tVDX8zsNeLu1uI=;
        b=NWiwSWI8MHqSDma9P2z6/BNHdVEhNgTvqrJra++4Wya6/2dUXTzV5lGk+56vnax8RP
         lPngLOQa17IlXe2/+/O9rfTEFQjzTeK5/aH4SR08jA7lzS6qymGnUhwbhVSbQiX/86/h
         JkUycfugHISPNMdMJ3nkCBXjNp7NspfIz942EbGGDstI0RfnsqSXe+YDUqt3Tlla7lJS
         NBuDSAhECQEq/g2ogD1ewQgB0ayc5j0LGlSBSlCsYTVi99O0clC/RDnf5AdoatSapdGY
         +yq1CdGYUzAyQ2yv0OABfWqKxw+PSOqI02MCceN3X6DsCViTaDd7s/wH2hmRE9yrmvg1
         cbNA==
X-Gm-Message-State: ANoB5pljq3shwYcbhu8HQwpMxBdjWA5HJE1+KSN1DqKXy9CyssL09pao
	Dj4YmWkHQQybOFlLxLLKGAMtTP6Sg+cJ838WmdsRlnj0U5QKI17c7+i693jilazMoZxLR38d28w
	ITdPtpXiYKGpkZbZZgovPZnF3kQ==
X-Received: by 2002:a05:620a:c02:b0:6ec:54d6:ea87 with SMTP id l2-20020a05620a0c0200b006ec54d6ea87mr16526649qki.245.1669044733168;
        Mon, 21 Nov 2022 07:32:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5QzcKpByoH5IFOBRZhUId/n1mZE/TJWamNTXtflc+eRaSTrKwX2lDdC7dfI+/Rue70ehtUbg==
X-Received: by 2002:a05:620a:c02:b0:6ec:54d6:ea87 with SMTP id l2-20020a05620a0c0200b006ec54d6ea87mr16526622qki.245.1669044732744;
        Mon, 21 Nov 2022 07:32:12 -0800 (PST)
Received: from [192.168.1.9] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id k7-20020ac80747000000b003a4d5fed8c3sm6718285qth.85.2022.11.21.07.32.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 07:32:11 -0800 (PST)
Subject: Re: [PATCH v6] livepatch: Clear relocation targets on a module
 removal
To: Song Liu <song@kernel.org>
References: <20220901171252.2148348-1-song@kernel.org>
 <Y3expGRt4cPoZgHL@alley>
 <CAPhsuW4MaiJBTNnwVhqkmxPxBn8e1cn9PPGm9PkgF6YaO0AWKQ@mail.gmail.com>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <09ac46a0-45fe-e280-cabb-682e05c7fddc@redhat.com>
Date: Mon, 21 Nov 2022 10:32:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAPhsuW4MaiJBTNnwVhqkmxPxBn8e1cn9PPGm9PkgF6YaO0AWKQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Petr Mladek <pmladek@suse.com>, jikos@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, live-patching@vger.kernel.org, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/18/22 12:14 PM, Song Liu wrote:
> Hi Petr,
> 
> On Fri, Nov 18, 2022 at 8:24 AM Petr Mladek <pmladek@suse.com> wrote:
>>
>> On Thu 2022-09-01 10:12:52, Song Liu wrote:
> [...]
>>>
>>>  arch/powerpc/kernel/module_32.c |  10 ++++
>>>  arch/powerpc/kernel/module_64.c |  49 +++++++++++++++
>>>  arch/s390/kernel/module.c       |   8 +++
>>>  arch/x86/kernel/module.c        | 102 +++++++++++++++++++++++---------
>>>  include/linux/moduleloader.h    |   7 +++
>>>  kernel/livepatch/core.c         |  41 ++++++++++++-
>>
>> First, thanks a lot for working on this.
>>
>> I can't check or test the powerpc and s390 code easily.
>>
>> I am going to comment only x86 and generic code. It looks good
>> but it needs some changes to improve maintainability.
> 
> Thanks for these comments and suggestions. I will work on them
> and send v4.
> 

Hi Song,

I'll help with testing the arches (at least ppc64le and s390x, I can
only cross-build ppc32).  I can either pick up the patches from the list
when you post, or if you want to run them through testing first, lmk.

Thanks,

-- 
Joe

