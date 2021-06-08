Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A766139EB92
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 03:40:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzXxZ1FSFz3bnl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 11:40:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=e7ddUgQH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e7ddUgQH; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzXx30nPFz2yQy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 11:40:06 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id p13so4916279pfw.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 18:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=LmbJ2cp9d+faibVwJt5sXOKKJnAg7e+IPDELoo8ZgrE=;
 b=e7ddUgQHWp77SiSJqo65Mn37u7qIgCnEabvtOd3R9qWfDVGI61SBgkXCjB2Ov6LMz8
 ddQsE4VpbqP/wwrnUFb4cBfGE0TeCFOHqA7eeXrupmE33NXDtezdF4f+KL8fUPXvAuUZ
 SWjqXeFIC27Iwu4vJDWdL51ccU8z3UefeSc9H3q78+dYrGc0WAvulbioViTVOFP/w43t
 JCOVqKKQSD086R+DVdXo4G/wlMAPqXXUNVSBdfdhCTE5z3F+gHXef0rCm4/dJPlfzhiW
 BSSIzbjkvr06zDHkSDjCKEUKW/+VTIerWbVfbBwRH4o5KfV2y8wRn4GACnH6bPZsrMPJ
 fXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=LmbJ2cp9d+faibVwJt5sXOKKJnAg7e+IPDELoo8ZgrE=;
 b=m++QVplArTzjx7eTeJjgNXFm/jyKg4LZF+kMOZL9L2CmO3bheV8PFZSv2Ept+Vo+5P
 jU5dmo58RXaQ01LwRpT1iatvtFHxRIBFMcHVjTKVnlyOCbDTqM5BnLo4DBjzz4hleS5o
 mSnb5dxnabLrvlc0BBJzRFZHW1k+gL8LRAkXV8FV91CP3rJ16lN4zZHLYujOZjGThxgp
 3D9NCMInWhA80X3eRkxa5jjw5+9QYfe4w+DfRFgsszuH6ZJWDb9Opn8Yx48jykS21TUk
 X7gyABKdrsl4Zp3EJX5d2C9kdFA3V9VRmYrEI8IbfhHqyKyC3izEIVZ8dnmjhyEXYMXB
 A1Sg==
X-Gm-Message-State: AOAM530KLg1rnOZ2Wt5JnTUH+ilnNS4RyV1GhUA0UQcBZSVXqHJ6iNum
 ktg3KO2J1nNMSvAez5GHAck=
X-Google-Smtp-Source: ABdhPJzOfkIzeToLfJJOUxLbidAvCn+caiAWIe+szT2HeJWl8ScK6XZBhdd+ERrJwrp2bhftZQZfEw==
X-Received: by 2002:a63:d08:: with SMTP id c8mr2962362pgl.248.1623116402237;
 Mon, 07 Jun 2021 18:40:02 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id p11sm13524395pjo.19.2021.06.07.18.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 18:40:01 -0700 (PDT)
Date: Tue, 08 Jun 2021 11:39:56 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 1/4] lazy tlb: introduce lazy mm refcount helper
 functions
To: Andrew Morton <akpm@linux-foundation.org>
References: <20210605014216.446867-1-npiggin@gmail.com>
 <20210605014216.446867-2-npiggin@gmail.com>
 <20210607164934.d453adcc42473e84beb25db3@linux-foundation.org>
In-Reply-To: <20210607164934.d453adcc42473e84beb25db3@linux-foundation.org>
MIME-Version: 1.0
Message-Id: <1623116020.vyls9ehp49.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andrew Morton's message of June 8, 2021 9:49 am:
> On Sat,  5 Jun 2021 11:42:13 +1000 Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>=20
>> Add explicit _lazy_tlb annotated functions for lazy mm refcounting.
>> This makes lazy mm references more obvious, and allows explicit
>> refcounting to be removed if it is not used.
>>=20
>> ...
>>
>> --- a/kernel/kthread.c
>> +++ b/kernel/kthread.c
>> @@ -1314,14 +1314,14 @@ void kthread_use_mm(struct mm_struct *mm)
>>  	WARN_ON_ONCE(!(tsk->flags & PF_KTHREAD));
>>  	WARN_ON_ONCE(tsk->mm);
>> =20
>> +	mmgrab(mm);
>> +
>>  	task_lock(tsk);
>>  	/* Hold off tlb flush IPIs while switching mm's */
>>  	local_irq_disable();
>>  	active_mm =3D tsk->active_mm;
>> -	if (active_mm !=3D mm) {
>> -		mmgrab(mm);
>> +	if (active_mm !=3D mm)
>>  		tsk->active_mm =3D mm;
>> -	}
>=20
> Looks like a functional change.  What's happening here?

That's kthread_use_mm being clever about the lazy tlb mm. If it happened=20
that the kthread had inherited a the lazy tlb mm that happens to be the=20
one we want to use here, then we already have a refcount to it via the=20
lazy tlb ref.

So then it doesn't have to touch the refcount, but rather just converts
it from the lazy tlb ref to the returned reference. If the lazy tlb mm
doesn't get a reference, we can't do that.

Thanks,
Nick
