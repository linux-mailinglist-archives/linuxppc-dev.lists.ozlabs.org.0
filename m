Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5286A935D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 10:06:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PShtK0VJHz3cgV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 20:06:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hdaKejUO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hdaKejUO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hdaKejUO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hdaKejUO;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PShsM2X69z3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 20:05:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677834354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YS0CjwhYVbsUEzzioDGeRBPspcNXXioriZQMTd1XWIQ=;
	b=hdaKejUOf/CePWfqvGNSh5dM3nu5ICqXF2iZZE01GMMe5eoh1R5v6+NumpPXKuGMRpcTP9
	IsTSXSMQhiJQbkcVy6lE1SOo9L1G2Dl91oaS5ebL4yOn/NfdM2Wp7HKotOSLMcITGBlBS3
	xm6Dta4pCGdTyYg+L68k2Z73OhkQ2OE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677834354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YS0CjwhYVbsUEzzioDGeRBPspcNXXioriZQMTd1XWIQ=;
	b=hdaKejUOf/CePWfqvGNSh5dM3nu5ICqXF2iZZE01GMMe5eoh1R5v6+NumpPXKuGMRpcTP9
	IsTSXSMQhiJQbkcVy6lE1SOo9L1G2Dl91oaS5ebL4yOn/NfdM2Wp7HKotOSLMcITGBlBS3
	xm6Dta4pCGdTyYg+L68k2Z73OhkQ2OE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-b323iwCwOCqwqipVzCxvOQ-1; Fri, 03 Mar 2023 04:05:53 -0500
X-MC-Unique: b323iwCwOCqwqipVzCxvOQ-1
Received: by mail-wm1-f70.google.com with SMTP id c7-20020a7bc847000000b003e00be23a70so2541330wml.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Mar 2023 01:05:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YS0CjwhYVbsUEzzioDGeRBPspcNXXioriZQMTd1XWIQ=;
        b=7qrnv3lZF1tD7x6hKk0MMMvARao1kwUHD/UbmTYJAwKLM82PFHntW5LNk/8CEmRNPf
         bw4/EVh6p/hV7ti0bczZkjdqwBIkie0ebgsGptGV4zb7sHjBbLADhaOUI/syGhywuhMd
         plt/R+as7cHbjwmypjroWWJmpUYx67TmiKMFC5SwRl0T4klNPFopKudb7jlWBdLqj+cM
         3qHoiaMPmG69PvP3G32+mV6GiXoJwExI61SATTbhfg/J2NcjN6CrD79pJG/uu/IVtjhq
         +Qx2mqDNfBocz3N4S2Y0Wz9Sj8bj/F5TGK+zLz/N17vuxsZ5nkJf2xOn1Cr6QMPqg5S8
         LnSw==
X-Gm-Message-State: AO0yUKUabTo//NcYVHwXCg44H8qDWbfp/0N8NHqq/LTgs1BUTPTQOCy4
	6WXpy0IMTsJX7lk8RLuUhJQtd0jdP+zt7vmId5y0N/VDOqo55KMktrryT6016SNQoRFCE5l0w1Q
	oaeAvDbHRnmvA/l1X1Ig8viuTRQ==
X-Received: by 2002:a05:600c:46d1:b0:3e1:f8af:8772 with SMTP id q17-20020a05600c46d100b003e1f8af8772mr962689wmo.9.1677834352105;
        Fri, 03 Mar 2023 01:05:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8jagMcNMmXQyfHV0dH3kB3yk7ffQXREEni9HXk4xFVSy4fCDC0ZRzxCl37hRsdKx/W7igNWA==
X-Received: by 2002:a05:600c:46d1:b0:3e1:f8af:8772 with SMTP id q17-20020a05600c46d100b003e1f8af8772mr962632wmo.9.1677834351710;
        Fri, 03 Mar 2023 01:05:51 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:6100:f5c9:50a5:3310:d8ac? (p200300cbc7026100f5c950a53310d8ac.dip0.t-ipconnect.de. [2003:cb:c702:6100:f5c9:50a5:3310:d8ac])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d408e000000b002bfd524255esm1593826wrp.43.2023.03.03.01.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 01:05:51 -0800 (PST)
Message-ID: <787e7d9a-fcf4-ad5f-97f1-c0e1c1553c2d@redhat.com>
Date: Fri, 3 Mar 2023 10:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Suren Baghdasaryan <surenb@google.com>
References: <20230301190457.1498985-1-surenb@google.com>
 <31a88065-063a-727e-52fd-9fbc7d17fb5c@redhat.com>
 <CAJuCfpGKK5SwxQr_BKrqnn0ZeaLVtX=n31MbKUwdnSSd4umB3A@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 1/1] mm/nommu: remove unnecessary VMA locking
In-Reply-To: <CAJuCfpGKK5SwxQr_BKrqnn0ZeaLVtX=n31MbKUwdnSSd4umB3A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Hyeonggon Yoo <42.hyeyoo@gmail.com>, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, 
 akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>
>> Just a general comment: usually, if review of the original series is
>> still going on, it makes a lot more sense to raise such things in the
>> original series so the author can fixup while things are still in
>> mm-unstable. Once the series is in mm-stable, it's a different story. In
>> that case, it is usually good to have the mail subjects be something
>> like  "[PATCH mm-stable 1/1] ...".
> 
> Ok... For my education, do you mean the title of this patch should
> somehow reflect that it should be folded into the original patch? Just
> trying to understand the actionable item here. How would you change
> this patch when posting for mm-unstable and for mm-stable?

For patches that fixup something in mm-stable (stable commit ID but not 
yet master -> we cannot squash anymore so we need separate commits), 
it's good to include "mm-stable". The main difference to patches that 
target master is that by indicating "mm-stable", everyone knows that 
this is not broken in some upstream/production kernel.


For patches that fixup something that is in mm-unstable (no stable 
commit ID -> still under review and fixup easily possible), IMHO we 
distinguish between two cases:

(1) You fixup your own patches: simply send the fixup as reply to the 
original patch. Andrew will pick it up and squash it before including it 
in mm-stable. Sometimes a complete resend of a series makes sense instead.

(2) You fixup patches from someone else: simply raise it as a review 
comment in reply to the original patch. It might make sense to send a 
patch, but usually you just raise the issue to the patch author as a 
review comment and the author will address that. Again, Andrew will pick 
it up and squash it before moving it to mm-stable.


That way, it's clearer when stumbling over patches on the mailing list 
if they fix a real issue in upstream, fix a issue in 
soon-to-be-upstream, or are simply part of a WIP series that is still 
under review.

-- 
Thanks,

David / dhildenb

