Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C85E78E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 12:59:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYq0J6w0sz3chS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 20:59:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BYzbUNCX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gl2cDoLB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BYzbUNCX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gl2cDoLB;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYpzZ2wNDz30L5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 20:58:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663930711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pq+nqOhkpxfLUyiqEq4MNg6ulDavWi2pU/tSeIb7Oc0=;
	b=BYzbUNCXOeCS/YO58N031GhFD5jlKWUNlsjQrdmsDFGL7r87sZZApRo2ah10wWrUlaKHWr
	/m6wVpjRvdrwRQmAkXizfUlUsAUbQXhpKUmuNg1IzXXm+sA6l9VW/wDp4Lo5xiIXXkqMlQ
	5UhbHfOkS1EYGnfCwKnSYAV1vEiVd3Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663930712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pq+nqOhkpxfLUyiqEq4MNg6ulDavWi2pU/tSeIb7Oc0=;
	b=Gl2cDoLB6/AvIdcZ30SWvHLyp1GIr5KC5dwlIfWn7G+g9W8R1vRyGdKo5C8BW4d4hcFp+i
	gTGf/pnDjaAZYIhcC4xLdM+9RNrcuq1rcdT4UQmZ3h2tn+OXlOzFIPVzFjpPW2Er1g7Pir
	poaJbeOi3B9Hrm2smmnYnttw/Zx8KmU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-FHDQHwQ1Oa2umz9emL4olA-1; Fri, 23 Sep 2022 06:58:30 -0400
X-MC-Unique: FHDQHwQ1Oa2umz9emL4olA-1
Received: by mail-wm1-f71.google.com with SMTP id t14-20020a1c770e000000b003b4856a6ecaso1688663wmi.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 03:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=pq+nqOhkpxfLUyiqEq4MNg6ulDavWi2pU/tSeIb7Oc0=;
        b=JpRe1j4SydTakCFAvmAJd1eO6j8IQRMtV6R2UIQlcwczVxGa85gud1e4JbYV4gQRXG
         0f6Z3mKSstMODFqC6RhZGrbR2Cyrcxi6QFuI6kB8IYbGI8a/Tq7phfn0iurSDFsh5ZYk
         NMnZ6O1VT1w115PSatP5B+cxERyuZKwOCTeTixO19aILsIfSLKw6SzOf4xJLLe0DlyPy
         AA42tfiPlaRtDa2vLaM3xQ7EtTIKbfi47dnmpywQpo9O3qAl1NINK4bTFAhfwh+KedIG
         GuVtTiwnZWFx/5RQ2RbUonjZX9CnDSREkWt0TGclbMj3JHabEJCbdYKIUlbk+UxcbgX7
         EvGg==
X-Gm-Message-State: ACrzQf2CQLZ/FTyUecH+H4XejMolH2JqenKe8qhxiOOLAWAmkArsZhkB
	KEDx2s0QVNiO/lnSaN113TnJIGNN7lmHWSPDzXXCPwDaxzzt55aXrjFSqgpcArR3ZJk+RYmh7Pl
	AxSdILmoZYKLMgScv/yJcHrB37g==
X-Received: by 2002:a05:6000:794:b0:22b:311:afe9 with SMTP id bu20-20020a056000079400b0022b0311afe9mr4596515wrb.509.1663930709602;
        Fri, 23 Sep 2022 03:58:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM692HEan4sa48+pnUlqFXSHn8xzHJwtwuzQCIVFVG2mftuoGFZX1M6CyfbTNUt+KIc+bI3WYg==
X-Received: by 2002:a05:6000:794:b0:22b:311:afe9 with SMTP id bu20-20020a056000079400b0022b0311afe9mr4596495wrb.509.1663930709283;
        Fri, 23 Sep 2022 03:58:29 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:cc00:4585:a83b:64f2:ad21? (p200300cbc704cc004585a83b64f2ad21.dip0.t-ipconnect.de. [2003:cb:c704:cc00:4585:a83b:64f2:ad21])
        by smtp.gmail.com with ESMTPSA id i66-20020a1c3b45000000b003b2878b9e0dsm2158664wma.20.2022.09.23.03.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 03:58:28 -0700 (PDT)
Message-ID: <4f7ae306-7894-8baa-f920-441ce8c472a0@redhat.com>
Date: Fri, 23 Sep 2022 12:58:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 3/3] checkpatch: warn on usage of VM_BUG_ON() and other
 BUG variants
To: John Hubbard <jhubbard@nvidia.com>, Joe Perches <joe@perches.com>,
 linux-kernel@vger.kernel.org
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-4-david@redhat.com>
 <d0c59eb8-baca-26fd-5f10-4a1f89bcf7b9@nvidia.com>
 <3179f4545d3f71358da3e6c6ee18085af601b2eb.camel@perches.com>
 <60fa5b16-021e-1e54-7e06-39bbb871eaef@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <60fa5b16-021e-1e54-7e06-39bbb871eaef@nvidia.com>
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
Cc: Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Nicholas Piggin <npiggin@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> And I think that "Do not crash" is a stronger statement than "Avoid crashing"
>> so I prefer the original suggestion but it's not a big deal either way.
> 
> Yes, stronger wording is better. So how about this:
> 
> "Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants\n" . $herecurr);

Okay, let's use that.

Thanks!

-- 
Thanks,

David / dhildenb

