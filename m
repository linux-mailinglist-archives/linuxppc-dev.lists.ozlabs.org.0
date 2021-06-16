Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD03A90AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 06:40:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4XYD167Gz3btF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 14:40:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=BhoZH0Nr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=BhoZH0Nr; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4XXj4zlGz2xZW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 14:39:49 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id 11so462791plk.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 21:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5w3M3t3Z4U9itzhliFyQ9k6bBdvkeu8fXdsAtgl3rqo=;
 b=BhoZH0Nr3ZHtpXLjF2kiPY7YRdY/6qIXrextonsCRJ2vn3Ezw0B6jrysimae7W7qYW
 GJT+ozMHK5wtRIoAwyz/ClsSc9N8NjfRoqLmP+nkRlD07lAlZHdxBXpDjiEXhF1kl+MA
 k7rvWoYBPTW3FwCCoyeB+RXgdsINqgpyon4BM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5w3M3t3Z4U9itzhliFyQ9k6bBdvkeu8fXdsAtgl3rqo=;
 b=Ts3RjyxgHvfSXBSOzcJZvKKoePeuqsNVdKc7WZGnzOjekxRhc5tVIV6zNmhHLFLVpe
 +ZRzoixHoCeVtiHUipzH2tKUBVamV/nTopTqwlQwCbO+EPEzaDaPmEoUEjq2NFDqJJU/
 UqVdYZ2pPBzVCdOPv6ULQDMhBU1BtkGnjq8ghwvYPETg7nipD0+fES3eufE6MvYM6THl
 wOm1VjcOZP/Xpq4r7+3TtETG1W+ql4tY/y8/TEIdx2xYfDDJo5C9jxYwV06hGP/ifOjy
 Fpk2qf2/HmsM8XpKHWT0lDIutHmu4G2ut/3I6/hT3RsMVmt2CaGYTr6vsb6IbQj/lr+q
 8fIg==
X-Gm-Message-State: AOAM531k68BTs/VBGIu715oCvv5hyojT65Z7+6UbL89aHGBi5Vb/4BFG
 O7EQFNhTwV29JqvmPhywyEDvxg==
X-Google-Smtp-Source: ABdhPJxS52+0zEjYNpTjrkU9yDk9Lb9mREVnKzrzxmFtRrSP1pLKGqx/loFfJeSlNx4FwkYBioRzNg==
X-Received: by 2002:a17:90b:1805:: with SMTP id
 lw5mr2950044pjb.120.1623818383687; 
 Tue, 15 Jun 2021 21:39:43 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id f28sm732424pgb.12.2021.06.15.21.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 21:39:43 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v12 1/6] kasan: allow an architecture to disable inline
 instrumentation
In-Reply-To: <CANpmjNOa-a=M-EgdkneiWDD0eCF-DELjMFxAeJzGQz6AgCdNWg@mail.gmail.com>
References: <20210615014705.2234866-1-dja@axtens.net>
 <20210615014705.2234866-2-dja@axtens.net>
 <CANpmjNOa-a=M-EgdkneiWDD0eCF-DELjMFxAeJzGQz6AgCdNWg@mail.gmail.com>
Date: Wed, 16 Jun 2021 14:39:38 +1000
Message-ID: <87im2ev2wl.fsf@dja-thinkpad.axtens.net>
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
Cc: aneesh.kumar@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 kasan-dev <kasan-dev@googlegroups.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Marco,

@@ -12,6 +12,15 @@ config HAVE_ARCH_KASAN_HW_TAGS
>>  config HAVE_ARCH_KASAN_VMALLOC
>>         bool
>>
>> +# Sometimes an architecture might not be able to support inline instrumentation
>> +# but might be able to support outline instrumentation. This option allows an
>> +# arch to prevent inline and stack instrumentation from being enabled.
>
> This comment could be moved into 'help' of this new config option.

It could. I did wonder if that made sense given that this is not a user
selectable option so I'm not sure if the help will ever be visible, but
I see that we do this sort of thing in Kconfig.kcsan and Kconfig.kgdb.
I've changed it over.

>> +# ppc64 turns on virtual memory late in boot, after calling into generic code
>> +# like the device-tree parser, so it uses this in conjuntion with a hook in
>> +# outline mode to avoid invalid access early in boot.
>
> I think the ppc64-related comment isn't necessary and can be moved to
> arch/ppc64 somewhere, if there isn't one already.

Fair enough. I'll pull it out of this file and look for a good place to
put the information in arch/powerpc in a later patch/series.

Kind regards,
Daniel

