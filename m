Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A54154A3E58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 08:49:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnKwC38fWz3bPM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 18:49:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CmRYQFuJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CmRYQFuJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CmRYQFuJ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=CmRYQFuJ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnKvS69zhz2xMQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 18:49:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643615342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAt16hzi0jARVC2SH2tfH/9B/mqcxkzoEuuB90n1AMk=;
 b=CmRYQFuJH6yB2KQLE7oMkHUfTpfGl+jBXq66TK/e1pymA9QTuU8YS28mWzDhCoykv/Un9/
 vFjIar+1f3zKoxBfyBPaiYUaJBSgjAz5qB1SkubWQOC9wSQo2NC3SmfnPJPBGAQHYcXqc3
 5FPFOXv5U5QBbiGMDdjEt5ibPH5z32g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643615342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAt16hzi0jARVC2SH2tfH/9B/mqcxkzoEuuB90n1AMk=;
 b=CmRYQFuJH6yB2KQLE7oMkHUfTpfGl+jBXq66TK/e1pymA9QTuU8YS28mWzDhCoykv/Un9/
 vFjIar+1f3zKoxBfyBPaiYUaJBSgjAz5qB1SkubWQOC9wSQo2NC3SmfnPJPBGAQHYcXqc3
 5FPFOXv5U5QBbiGMDdjEt5ibPH5z32g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-ZtleZQzhMwSGgaOTVVYX0g-1; Mon, 31 Jan 2022 02:48:58 -0500
X-MC-Unique: ZtleZQzhMwSGgaOTVVYX0g-1
Received: by mail-wr1-f72.google.com with SMTP id
 r27-20020adfb1db000000b001d7567e33baso4432091wra.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 23:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZAt16hzi0jARVC2SH2tfH/9B/mqcxkzoEuuB90n1AMk=;
 b=ly3Ea6wNTK+BTFy9n7XvTu5WgDtZX0IfF3g4GorgA1N0yU0lV0DamDFUtBz1HKZ3wE
 td4siDt63xlUvHg9z9K9HcatEsuu3TUY3mehzL4pwu0Ve3azVKtgjMGvVoTi0dQXA+We
 xCLldBysf6Yb2KjTaIvba36vhkZ181J7WLlq2cPHYgVipjsESmKG+23XCz9vMqIwBp/3
 xMNnk8199GqCqDvgsDYX4H6MaO55sHtIyj6ym5oMEHgD5Wiifen+VyQ3D5U3C4GXihkL
 CoI2mF0LydyePMyQ7yH6wthjFShJdknPEBFchhYoqX73c6TxxWAH5msWkFCdPKqjLmeA
 Q5fg==
X-Gm-Message-State: AOAM532eROTM1xrxwB+ThfEHPBOPY/1o8+u6qop8dZ9stIS90t1HDHIS
 W3l/fcxATonnhRE1wL1BskCbVwiG0DD2m1eDLsLmF5TW9pDXeqTSr5Mqgo1Tm8/rVs1FHOEsnX4
 1vtyE6Q8Ayrz3ON/ArQXDs0Rzww==
X-Received: by 2002:a05:6000:1008:: with SMTP id
 a8mr15911188wrx.563.1643615337601; 
 Sun, 30 Jan 2022 23:48:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziNLNeLdU3x1hO5PuIt8mvz7fg18Pv6lGvSgHdK7fS7xha3a7EYrVkbUytI3CwE4ViZc3ZTg==
X-Received: by 2002:a05:6000:1008:: with SMTP id
 a8mr15911171wrx.563.1643615337390; 
 Sun, 30 Jan 2022 23:48:57 -0800 (PST)
Received: from ?IPV6:2003:cb:c709:b200:f007:5a26:32e7:8ef5?
 (p200300cbc709b200f0075a2632e78ef5.dip0.t-ipconnect.de.
 [2003:cb:c709:b200:f007:5a26:32e7:8ef5])
 by smtp.gmail.com with ESMTPSA id y6sm5081791wrl.46.2022.01.30.23.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 23:48:56 -0800 (PST)
Message-ID: <3be2e20c-f0b9-c080-adf4-b0e17c046eb0@redhat.com>
Date: Mon, 31 Jan 2022 08:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RFC v1] drivers/base/node: consolidate node device
 subsystem initialization in node_dev_init()
To: Oscar Salvador <osalvador@suse.de>
References: <20220128151540.164759-1-david@redhat.com>
 <YfeARpenqPii1WQH@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YfeARpenqPii1WQH@localhost.localdomain>
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

On 31.01.22 07:23, Oscar Salvador wrote:
> On Fri, Jan 28, 2022 at 04:15:40PM +0100, David Hildenbrand wrote:
>> ... and call node_dev_init() after memory_dev_init() from driver_init(),
>> so before any of the existing arch/subsys calls. All online nodes should
>> be known at that point.
>>
>> This is in line with memory_dev_init(), which initializes the memory
>> device subsystem and creates all memory block devices.
>>
>> Similar to memory_dev_init(), panic() if anything goes wrong, we don't
>> want to continue with such basic initialization errors.
>>
>> The important part is that node_dev_init() gets called after
>> memory_dev_init() and after cpu_dev_init(), but before any of the
>> relevant archs call register_cpu() to register the new cpu device under
>> the node device. The latter should be the case for the current users
>> of topology_init().
> 

Hi Oscar,

> So, before this change we had something like this:
> 
> do_basic_setup
>  driver_init
>   memory_dev_init
>  do_init_calls
>   ...
>    topology_init
>     register_nodes/register_one_node
> 
> And after the patch all happens in driver_init()
> 
> driver_init
>  memory_dev_init
>  node_dev_init
> 
> I guess this is fine as we do not have any ordering problems (aka: none
> of the functions we used to call before expect the nodes not to be
> there for some weird reason).
> 
> So, no functional change, right?
> 

Right, and the idea is that the online state of nodes (+ node/zone
ranges) already has to be known at that point in time, because
otherwise, we'd be in bigger trouble.

Thanks!


-- 
Thanks,

David / dhildenb

