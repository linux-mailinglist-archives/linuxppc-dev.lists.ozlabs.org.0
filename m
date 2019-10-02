Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F42C457A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 03:24:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jdjB26rxzDqSt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 11:24:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="oEyO3Jbn"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jdgQ0QHCzDqNd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 11:23:12 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id a24so10983825pgj.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Oct 2019 18:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=/C36wUinGnzT8rrY5Cyg+JNcSuMeir+tSfeOcjZGD7Q=;
 b=oEyO3JbnfIMqMzafNHHg54f0APQRylbM/MziaBN0Tl76MDxdcN7kvP8rZLEY65LWJl
 ZkmB53wVKnOWptMEs6NKncv6Mw0uEZ+RIEdpQM3f2YmIaKQ0uNmZa/rTyDi21nxUSxoD
 7hyZZf1UnkOhzSIWf32UyhfgNdWxnxJoi2HXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=/C36wUinGnzT8rrY5Cyg+JNcSuMeir+tSfeOcjZGD7Q=;
 b=svKYO6JSuM1ZOqULRdCcAz75KCqTH7JIDhDoHpfVzMVpjHHsp0ZgL3Y3aDA0YdXlrD
 jMTroTi6a1wHuzx6trXOuRGrE83MGAUv5FxIpQCMxf+9Q9omX2IUpc7o2vnVpc5SIpS7
 V51ECfQbIv5DVvI6VHWsfr7LQ9O0oWdXxiBBV6tUOoa1Eh9coSp2C+SpLbpLtuIhNw2b
 N1ywVTZ64XlTvgrP3Zz3sTElntUN8wstLWevrZq2/MoWODeqjXm1lXFYkKRw/ezT1WXF
 vc7AS/7wLjG6EQKrwgn05OGxK99KVH3GI8M8hyxqQPd+GmMZUqxwPCj0Cc1eSn2T1rFW
 nngQ==
X-Gm-Message-State: APjAAAVWAX+IT8Oy/qs2fSluHDbRk61L8da4iZvLqawyStaZblRjDcMy
 8jnTJKxujaFfHAeO1+kiUU4z7w==
X-Google-Smtp-Source: APXvYqzGuf68jpYONt9jUaE/QZfzyFEfhgDb7lWE4iWG3aqIQx4VlrFOIeTrDSkYMG7TTPlhj3siAQ==
X-Received: by 2002:a62:82c8:: with SMTP id w191mr1456666pfd.99.1569979390621; 
 Tue, 01 Oct 2019 18:23:10 -0700 (PDT)
Received: from localhost ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id ev20sm3561837pjb.19.2019.10.01.18.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 18:23:09 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Uladzislau Rezki <urezki@gmail.com>
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
In-Reply-To: <20191001101707.GA21929@pc636>
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net> <20191001101707.GA21929@pc636>
Date: Wed, 02 Oct 2019 11:23:06 +1000
Message-ID: <87zhik2b5x.fsf@dja-thinkpad.axtens.net>
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
Cc: mark.rutland@arm.com, gor@linux.ibm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 glider@google.com, luto@kernel.org, aryabinin@virtuozzo.com,
 linuxppc-dev@lists.ozlabs.org, dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

>>  	/*
>>  	 * Find a place in the tree where VA potentially will be
>>  	 * inserted, unless it is merged with its sibling/siblings.
>> @@ -741,6 +752,10 @@ merge_or_add_vmap_area(struct vmap_area *va,
>>  		if (sibling->va_end == va->va_start) {
>>  			sibling->va_end = va->va_end;
>>  
>> +			kasan_release_vmalloc(orig_start, orig_end,
>> +					      sibling->va_start,
>> +					      sibling->va_end);
>> +
> The same.

The call to kasan_release_vmalloc() is a static inline no-op if
CONFIG_KASAN_VMALLOC is not defined, which I thought was the preferred
way to do things rather than sprinkling the code with ifdefs?

The complier should be smart enough to eliminate all the
orig_state/orig_end stuff at compile time because it can see that it's
not used, so there's no cost in the binary.

Regards,
Daniel
