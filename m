Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53457F68F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 23:25:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Kla/e8Fr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sbt3W5WD6z3vdR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 09:25:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Kla/e8Fr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=zhouchengming@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sbgdz114Mz3dRT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 01:36:04 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6cbd24d9557so687868b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 06:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700750159; x=1701354959; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BjvsOOI1CnhAoy/GX9TR7wKdptTLbjiH2IDW8iJfER0=;
        b=Kla/e8Fr+EThouWwh3HkwcLsPva6SMVItWNw8ROc82/RqEtL7ZfNb8aQrdXGGgVNvp
         1gf1cDvu51Nv/UxlAA7HnuZM3zh7atrC3rhegbIM+q5pX93Be+oq2RrhGi5FIyPbhV6k
         iIJYeLXYuYxZ2/FhPBLYDzXqRzEDou5NjU1BOr5kABdor77mQYC9Gk3GuQlfuQ2fE4vt
         H1EF3fiFM4Lfj/ysH+g+5d/lYUxvR6m4xZZN1e5BbPK+iPj5UNpLbBoCFl3AFf+6x8xQ
         0GueEwbZs8XKMECJAO+vZYcShFOal4zpDczeGUuc6sPNYpJAqfnkNVAgK5byi7n51+Tr
         hM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700750159; x=1701354959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BjvsOOI1CnhAoy/GX9TR7wKdptTLbjiH2IDW8iJfER0=;
        b=sB31oVmiodobi12u8wxWzk7rwJ2GXDkepAnIoiAB6seBp5cbbvWC/8bp19up51hEJD
         MdTsbukAmeNaHMGefX0DVb69ssFjU/s/VpHhUL+keQftNBBR3moHg8rPzlkDGSzb81PQ
         6mY5pgu9/XHBa++mDuEDVwowOaQ2FMFSC6bTFXFRElfV3XmUQZFn3UJrLRsg904d4dAZ
         8PJKg+yxkm2JstWBmrA845NQFt6pRJcfkRxJf1Z6Zo4oDIez1jpKtij88sF/eFjJ3ydX
         gAgZMlo6Bbgq3Fdj4Gl6EivWyn99M51nZxIJLuZEmJ5FI8KcTAxxkIUGtUHJwRDlMQr4
         N34g==
X-Gm-Message-State: AOJu0YycnCquAvgjUw0iF/mkGZ1F/ugzC15pQ4HNApYrMrEmUnG2JS3d
	qnH1PfEkCylBSv+D0P4Bmt2fog==
X-Google-Smtp-Source: AGHT+IHrgZUGFXostlPf35eRbI6rCH9J4JTsEDonhP88bR3RgQuVAqv2bE8bRWv1+nkHyu/aVqnVZg==
X-Received: by 2002:a05:6a00:1c8b:b0:68a:5cf8:dae4 with SMTP id y11-20020a056a001c8b00b0068a5cf8dae4mr3559011pfw.3.1700750159379;
        Thu, 23 Nov 2023 06:35:59 -0800 (PST)
Received: from ?IPV6:2409:8a28:e66:da40:6c3c:bf04:d30f:8a1d? ([2409:8a28:e66:da40:6c3c:bf04:d30f:8a1d])
        by smtp.gmail.com with ESMTPSA id 18-20020aa79112000000b0068fcb70ccafsm1280743pfh.129.2023.11.23.06.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 06:35:58 -0800 (PST)
Message-ID: <8e000449-1e11-43be-87f5-f1826e296c39@bytedance.com>
Date: Thu, 23 Nov 2023 22:35:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [powerpc] Lockups seen during/just after boot (bisected)
Content-Language: en-US
To: Sachin Sant <sachinp@linux.ibm.com>, linux-mm@kvack.org
References: <5F8DAEC7-E815-40A5-AD4A-B01296F5165F@linux.ibm.com>
From: Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <5F8DAEC7-E815-40A5-AD4A-B01296F5165F@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 24 Nov 2023 09:22:20 +1100
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, vbabka@suse.cz
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/11/23 19:27, Sachin Sant wrote:
> While booting recent -next kernel on IBM Power server, I have observed lockups
> either during boot or just after.
> 
> [ 3631.015775] watchdog: CPU 3 self-detected hard LOCKUP @ __update_freelist_slow+0x74/0x90

Sorry, the bug can be fixed by this patch from Vlastimil Babka:

https://lore.kernel.org/all/83ff4b9e-94f1-8b35-1233-3dd414ea4dfe@suse.cz/

Thanks!
