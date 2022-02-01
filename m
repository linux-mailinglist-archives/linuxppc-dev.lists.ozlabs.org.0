Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 938814A59CD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 11:17:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp18h0NGcz3bc6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 21:17:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BTJtMh/m;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BTJtMh/m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BTJtMh/m; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=BTJtMh/m; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp17t4kc3z2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 21:17:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643710626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rSMPibeU2/x9y1HGJmwIBX0MF6r0zdDZVn4ZSeYeqM=;
 b=BTJtMh/m9wI877MoJHJo8Ss1XH0a7PwVHOmxVkpkHjrxvMdSxPzz8ZscqYEXV3uEF4h7Nq
 JAbfc3pvCb0vO5IAiObiWenIWaQN7vCjMmb1ZSrYmeQUVRkIqULicGCQjO5sN+tCZd7zD+
 9kExqb8KeIhBd1T5B10BbJPp9h+gTdo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643710626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rSMPibeU2/x9y1HGJmwIBX0MF6r0zdDZVn4ZSeYeqM=;
 b=BTJtMh/m9wI877MoJHJo8Ss1XH0a7PwVHOmxVkpkHjrxvMdSxPzz8ZscqYEXV3uEF4h7Nq
 JAbfc3pvCb0vO5IAiObiWenIWaQN7vCjMmb1ZSrYmeQUVRkIqULicGCQjO5sN+tCZd7zD+
 9kExqb8KeIhBd1T5B10BbJPp9h+gTdo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-oLucTz8INietl9FH2gENLA-1; Tue, 01 Feb 2022 05:17:05 -0500
X-MC-Unique: oLucTz8INietl9FH2gENLA-1
Received: by mail-wr1-f71.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so5767672wrh.23
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 02:17:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1rSMPibeU2/x9y1HGJmwIBX0MF6r0zdDZVn4ZSeYeqM=;
 b=HdaPrzG61gdggjIAsawDRGKDhutkaQwUUTpdG+elGq2cr9k0Y1iEh0neeWG5D71OPW
 O7Mt7NguF1N17vf7ARKFiYFEZ2fTlzXRvP93quISRCx7AvL8/6up39eqyhkv9XKCq/IS
 Pc/IGLqC+Hh5lllIsJOvfw/r3E2Yb8wbxplTUTHzLxW9MLKXB2wd0UrTW7rujxuFHBzU
 K/q1B/FQCVZrSPLbv8MiZlj83WakpOuxj2ervf6wYe0Yx3zGPbuCn7+h52fwMoowNxEF
 u76Mbel0jIdH35ImFfxHmItYa3aGl3oQu27VSzbwiUwCdpdMEzN2S37E+z++TI1hDwcl
 9QvQ==
X-Gm-Message-State: AOAM531SeJKdUAU5ahnDhbSUe1kzkjQ0PJgKmicKw3HkEUBifY4+3D3e
 JwIqOzwJuoc0prEOElElvhOubfX/+13H/Ef3rm9d997pGni6g3+4pNBOm7QOa0I4NolnpdJ/Hij
 jBIvhy/iobKr11vFSEMYSC451ag==
X-Received: by 2002:adf:f54d:: with SMTP id j13mr20271531wrp.596.1643710624126; 
 Tue, 01 Feb 2022 02:17:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW9cnbVOET7eNHaJPpg1tW+PwHgA1p1BZnH/wRYWshALkMr1QDZjc+KGZLPaL4fKlWIFXhpA==
X-Received: by 2002:adf:f54d:: with SMTP id j13mr20271503wrp.596.1643710623856; 
 Tue, 01 Feb 2022 02:17:03 -0800 (PST)
Received: from ?IPV6:2003:cb:c711:ba00:67b6:a3ab:b0a8:9517?
 (p200300cbc711ba0067b6a3abb0a89517.dip0.t-ipconnect.de.
 [2003:cb:c711:ba00:67b6:a3ab:b0a8:9517])
 by smtp.gmail.com with ESMTPSA id p2sm1600619wmc.33.2022.02.01.02.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 02:17:03 -0800 (PST)
Message-ID: <19907f0c-4d83-4d85-4233-f4ee727574a0@redhat.com>
Date: Tue, 1 Feb 2022 11:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RFC v1] drivers/base/node: consolidate node device
 subsystem initialization in node_dev_init()
To: Oscar Salvador <osalvador@suse.de>
References: <20220128151540.164759-1-david@redhat.com>
 <YfeARpenqPii1WQH@localhost.localdomain>
 <3be2e20c-f0b9-c080-adf4-b0e17c046eb0@redhat.com>
 <20220131094041.GA15392@linux>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220131094041.GA15392@linux>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, Rich Felker <dalias@libc.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-sh@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31.01.22 10:40, Oscar Salvador wrote:
> On Mon, Jan 31, 2022 at 08:48:54AM +0100, David Hildenbrand wrote:
>> Hi Oscar,
> 
> Hi David :-),
> 
>> Right, and the idea is that the online state of nodes (+ node/zone
>> ranges) already has to be known at that point in time, because
>> otherwise, we'd be in bigger trouble.
> 
> Yeah, I wanted to check where exactly did we mark the nodes online,
> and for the few architectures I checked it happens in setup_arch(),
> which is called very early in start_kernel(), while driver_init()
> gets called through arch_call_rest_init(), which happens at the end
> of the function.
> 
> I am not sure whether we want to remark that somehow in the changelog,
> so it is crystal clear that by the time the node_dev_init() gets called,
> we already set the nodes online.
> 
> Anyway, just saying, but is fine as is.

I'll adjust the first paragraph to:

    ... and call node_dev_init() after memory_dev_init() from driver_init(),
    so before any of the existing arch/subsys calls. All online nodes should
    be known at that point: early during boot, arch code determines node and
    zone ranges and sets the relevant nodes online; usually this happens in
    setup_arch().

Thanks!

-- 
Thanks,

David / dhildenb

