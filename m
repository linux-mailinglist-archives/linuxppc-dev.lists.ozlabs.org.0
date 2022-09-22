Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1CE5E6609
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 16:42:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYJ0W4M4Lz3c7V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 00:42:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PRngVALW;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PRngVALW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PRngVALW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PRngVALW;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYHzn4M8Fz3bkG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 00:41:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663857714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/9pBsgmOfMIOWdQk6MlBb5rIEq71XELNQZdnKY333M=;
	b=PRngVALWt0fiLbd1zdMqclsBCY6QG3jlvaBKCmXLhhYZeoBk7XDCd8h8KEjefdGQkrfaNo
	8rhUxlp3Ax9KH3hLD0oMw5VN5SkRWtXqB7J4hkA7fMB2aF8KfxrHfI+2cu4FtejqEXJUud
	DOnJ2fxcCcmdfvh/CzB7utyF2EPiWRU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663857714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/9pBsgmOfMIOWdQk6MlBb5rIEq71XELNQZdnKY333M=;
	b=PRngVALWt0fiLbd1zdMqclsBCY6QG3jlvaBKCmXLhhYZeoBk7XDCd8h8KEjefdGQkrfaNo
	8rhUxlp3Ax9KH3hLD0oMw5VN5SkRWtXqB7J4hkA7fMB2aF8KfxrHfI+2cu4FtejqEXJUud
	DOnJ2fxcCcmdfvh/CzB7utyF2EPiWRU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-hdh0M9A9O-2M0mX3AJ4BKQ-1; Thu, 22 Sep 2022 10:41:52 -0400
X-MC-Unique: hdh0M9A9O-2M0mX3AJ4BKQ-1
Received: by mail-wm1-f69.google.com with SMTP id ay21-20020a05600c1e1500b003b45fd14b53so2676116wmb.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 07:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=D/9pBsgmOfMIOWdQk6MlBb5rIEq71XELNQZdnKY333M=;
        b=RrsKjqQPxXSmC5HSrCDYh7qrVB+LGmb/wKHntkRk1AKKAP667B7xyhPPoE5pxCP2U/
         g+VTNf7+oNYe9I4lkv7zk2uDqTa+QKtLlutgd0IhdUElPuMpQNgePuIccIcsijnPIygh
         XEs6YN+xN3vv9wy8DcqmkuC6pZ2vG7+s1Vx1PI8J7YxG2DacBvDeC451UVNk1qnJqFRm
         h8RFjLqjL7v0V00Q5TVy9xrbVfu0jHHHz/hBZITgZD9ed7N5xLCVKdWGaWbAgk9QenA6
         bmgCR46DFhMJ11gT12cpEH0/5WjLnl3yXpvhGfFLRakqwL/6i36P48ApNMX6dy7ZIswN
         cc0g==
X-Gm-Message-State: ACrzQf3cU99du0KBJTL5GwGDg0st2lp7jx+E8+5lUC8uDycFexVxiIca
	BYwFZ5Zrl96KcExvDTokefmfVr2T7OPdVjFHff9dp7p7TWi2kheReYi+aU7vCVjtALBi9fvjUk0
	WEBF1qXA5uq+7HdTUzjVZi69LcA==
X-Received: by 2002:adf:fb0a:0:b0:225:265d:493 with SMTP id c10-20020adffb0a000000b00225265d0493mr2315221wrr.394.1663857711761;
        Thu, 22 Sep 2022 07:41:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7s2pVMK50HQj4mxZLRHO2jsgVJQFzFTuu2Qp94Zer8UgJMh/RaCJ3PGvdhnjto9D+jNlkhFA==
X-Received: by 2002:adf:fb0a:0:b0:225:265d:493 with SMTP id c10-20020adffb0a000000b00225265d0493mr2315185wrr.394.1663857711445;
        Thu, 22 Sep 2022 07:41:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:2200:d595:cc20:2e3a:fc5f? (p200300cbc7082200d595cc202e3afc5f.dip0.t-ipconnect.de. [2003:cb:c708:2200:d595:cc20:2e3a:fc5f])
        by smtp.gmail.com with ESMTPSA id bv3-20020a0560001f0300b0022b014fb0b7sm5493369wrb.110.2022.09.22.07.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 07:41:50 -0700 (PDT)
Message-ID: <9fc9759d-ac74-ca8f-874c-5058758c3ea1@redhat.com>
Date: Thu, 22 Sep 2022 16:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
To: Akira Yokosawa <akiyks@gmail.com>
References: <20220920122302.99195-2-david@redhat.com>
 <93343c05-f31e-cfbe-6650-8ea8d79e6d55@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 1/3] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
In-Reply-To: <93343c05-f31e-cfbe-6650-8ea8d79e6d55@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, bhe@redhat.com, corbet@lwn.net, dwaipayanray1@gmail.com, linux-doc@vger.kernel.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, joe@perches.com, torvalds@linux-foundation.org, David.Laight@ACULAB.COM, jani.nikula@linux.intel.com, apw@canonical.com, lukas.bulwahn@gmail.com, akpm@linux-foundation.org, dyoung@redhat.com, mingo@kernel.org, vgoyal@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>   
>> +22) Do not crash the kernel
>> +---------------------------
>> +
>> +In general, it is not the kernel developer's decision to crash the kernel.
>> +
>> +Avoid panic()
>> +=============
> This looks to me like a subsection-level title.  The adornment symbol
> needs to be:
> 
>     *************
> 
>> +
>> +panic() should be used with care and primarily only during system boot.
>> +panic() is, for example, acceptable when running out of memory during boot and
>> +not being able to continue.
>> +
>> +Use WARN() rather than BUG()
>> +============================
> Ditto.
> 
>> +
>> +Do not add new code that uses any of the BUG() variants, such as BUG(),
>> +BUG_ON(), or VM_BUG_ON(). Instead, use a WARN*() variant, preferably
>> +WARN_ON_ONCE(), and possibly with recovery code. Recovery code is not
>> +required if there is no reasonable way to at least partially recover.
>> +
>> +"I'm too lazy to do error handling" is not an excuse for using BUG(). Major
>> +internal corruptions with no way of continuing may still use BUG(), but need
>> +good justification.
>> +
>> +Use WARN_ON_ONCE() rather than WARN() or WARN_ON()
>> +**************************************************
> These wrong adornment symbol confuse ReST parser of Sphinx and results in
> the build error from "make htmldocs" at this title (long message folded):


Thanks,

the following on top should do the trick:


diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index e05899cbfd49..9efde65ac2f3 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -1192,14 +1192,14 @@ expression used.  For instance:
  In general, it is not the kernel developer's decision to crash the kernel.
  
  Avoid panic()
-=============
+*************
  
  panic() should be used with care and primarily only during system boot.
  panic() is, for example, acceptable when running out of memory during boot and
  not being able to continue.
  
  Use WARN() rather than BUG()
-============================
+****************************
  
  Do not add new code that uses any of the BUG() variants, such as BUG(),
  BUG_ON(), or VM_BUG_ON(). Instead, use a WARN*() variant, preferably


-- 
Thanks,

David / dhildenb

