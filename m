Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E02862D76A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 10:48:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCZqB50QTz3f5t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 20:48:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e0HLJWQO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e0HLJWQO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e0HLJWQO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e0HLJWQO;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCBzP1clXz3cGV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 05:54:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668624844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XrMOrTfFoolcBWY273BC4KVOqyrI8gbytsgZlItRSSY=;
	b=e0HLJWQOrV59rnSGTS6YIVqETW+MetNgrpEQbikp3pa0MOp9YQkUcSBKEy34EwX53rBRFD
	0/8z3cE73sZ2kOYmBtxg+J08kdSPfrx1ndau6dZ1tPvBzgkqWSa2ycA4qZIE6IIlwIjnzj
	IYmDlr5WO9CbNLhnJleRx34142BoDRo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668624844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XrMOrTfFoolcBWY273BC4KVOqyrI8gbytsgZlItRSSY=;
	b=e0HLJWQOrV59rnSGTS6YIVqETW+MetNgrpEQbikp3pa0MOp9YQkUcSBKEy34EwX53rBRFD
	0/8z3cE73sZ2kOYmBtxg+J08kdSPfrx1ndau6dZ1tPvBzgkqWSa2ycA4qZIE6IIlwIjnzj
	IYmDlr5WO9CbNLhnJleRx34142BoDRo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-gmERU_K0NCSS1lLOKJIikA-1; Wed, 16 Nov 2022 13:54:02 -0500
X-MC-Unique: gmERU_K0NCSS1lLOKJIikA-1
Received: by mail-wr1-f70.google.com with SMTP id n13-20020adf8b0d000000b0023658a75751so4065065wra.23
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 10:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrMOrTfFoolcBWY273BC4KVOqyrI8gbytsgZlItRSSY=;
        b=vTRK2qobN+1IjIfn6A2A7WOs/nkwUdTF3JmKOG/kg2YyPYVyZlty+aGjEJH89DRDRZ
         jRbwyb8+B52f3WiWaoopSpTZeebYXUmqYTU9PAeUNnVK+AVxX9UR4FyByromjw9VErp8
         gjBanmW7kzYh0P8kuaKl7NcYZRBDd6PSdX2z1tJAWmVGCU31Y47aQlPHVh+6rV+tMF1X
         +LHhNVRwJOhYXezyzvRoV2o3hO6Xx3UUbQ6jkCWjYHnIoTt2/k2WM/RZ1xNgpQBcibgm
         rm+GdlO/2Ps6fdEzmVK/fiV4yH+k2SodleCOodvBo6y/6d0ZnghhcKGw2RXVfWdAVIj3
         wXrg==
X-Gm-Message-State: ANoB5plvOTqe0qnFVuNLcQ0LgEmIjhF4ZEN4t+P2HhOptoiGZ3Jl0sss
	tw9/WU26AW+RmHpLlf3SkVR1z6ZseuhfBYcWc+G8yaWDJTT2BgZ2PlBpEsXiWcX/QqNFpS4p+uP
	D6k8NTXAPk63eCTw/siEwuRWMUA==
X-Received: by 2002:a05:600c:188a:b0:3cf:8e62:f769 with SMTP id x10-20020a05600c188a00b003cf8e62f769mr3135332wmp.52.1668624841276;
        Wed, 16 Nov 2022 10:54:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5DCp6F6fiXltcSvKkMYb+ZcNvwNu+I48re+Q7o+sjDMiBTT1rVi2cU7FL82kIKKDnPvsKEPw==
X-Received: by 2002:a05:600c:188a:b0:3cf:8e62:f769 with SMTP id x10-20020a05600c188a00b003cf8e62f769mr3135302wmp.52.1668624841029;
        Wed, 16 Nov 2022 10:54:01 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:9f00:a98d:4026:7c44:40fd? (p200300cbc7049f00a98d40267c4440fd.dip0.t-ipconnect.de. [2003:cb:c704:9f00:a98d:4026:7c44:40fd])
        by smtp.gmail.com with ESMTPSA id h16-20020a05600c315000b003cff309807esm3012333wmo.23.2022.11.16.10.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 10:54:00 -0800 (PST)
Message-ID: <caf52607-49cd-3073-ca4a-ddce9509e7c9@redhat.com>
Date: Wed, 16 Nov 2022 19:53:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
In-Reply-To: <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 17 Nov 2022 20:44:04 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Will Deacon <will@kernel.org>, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, James Morris <jmorris@namei.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Matt 
 Turner <mattst88@gmail.com>, Kentaro Takeda <takedakn@nttdata.co.jp>, linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Nicholas Piggin <npiggin@gmail.com>, Richard Weinberger <richard@nod.at>, Alex Williamson <alex.williamson@redhat.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <richard.henderson@linaro.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Oleg Nesterov <oleg@redhat.com>, linux-arm-kernel@lists.infradead.org, "Serge E. Hallyn" <serge@hallyn.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oded Gabbay <ogabbay@kernel.org>, linux-mips@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexand
 er Viro <viro@zeniv.linux.org.uk>, linux-perf-users@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Lucas Stach <l.stach@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16.11.22 19:16, Linus Torvalds wrote:
> On Wed, Nov 16, 2022 at 2:30 AM David Hildenbrand <david@redhat.com> wrote:
>>
>> Let's make it clearer that functionality provided by FOLL_FORCE is
>> really only for ptrace access.
> 
> I'm not super-happy about this one.
> 
> I do understand the "let's rename the bit so that no new user shows up".
> 
> And it's true that the main traditional use is ptrace.
> 
> But from the patch itself it becomes obvious that no, it's not *just*
> ptrace. At least not yet.
> 
> It's used for get_arg_page(), which uses it to basically look up (and
> install) pages in the newly created VM.
> 
> Now, I'm not entirely sure why it even uses FOLL_FORCE, - I think it
> might be historical, because the target should always be the new stack
> vma.
> 
> Following the history of it is a big of a mess, because there's a
> number of renamings and re-organizations, but it seems to go back to
> 2007 and commit b6a2fea39318 ("mm: variable length argument support").
> 

Right.

> Before that commit, we kept our own array of "this is the set of pages
> that I will install in the new VM". That commit basically just inserts
> the pages directly into the VM instead, getting rid of the array size
> limitation.
> 
> So at a minimum, I think that FOLL_FORCE would need to be removed
> before any renaming to FOLL_PTRACE, because that's not some kind of
> small random case.
> 
> It *might* be as simple as just removing it, but maybe there's some
> reason for having it that I don't immediately see.

Right, I have the same feeling. It might just be a copy-and-paste legacy 
leftover.

> 
> There _are_ also small random cases too, like get_cmdline(). Maybe
> that counts as ptrace, but the execve() case most definitely does not.

I agree. I'd suggest moving forward without this (last) patch for now 
and figuring out how to further cleanup FOLL_FORCE usage on top.

@Andrew, if you intend to put this into mm-unstable, please drop the 
last patch for now.

-- 
Thanks,

David / dhildenb

