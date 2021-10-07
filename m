Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0C942503A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 11:39:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ5rp09W4z3069
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 20:39:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZwlvK3uS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZwlvK3uS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZwlvK3uS; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZwlvK3uS; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ5r35YWbz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 20:39:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633599552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLM20CrNDiSc8ANWHfJkU17zM0jd+LCsGgIfHq5T3Hk=;
 b=ZwlvK3uSyX0kLru7cPg1Wq3+yb8s52FdoEIgjJMh0mSzQN0Z3sGqR+GWwIvSUYACIBAqdu
 B/PzT/S7zO2YRxHN+enVTllSQC8Gqf2os4OBAg9EIiRycuehw0B3isf+JkNh5YEglcczrJ
 qtzJrYdzO8p7533mtdQv4xZrhQ+x68U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633599552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLM20CrNDiSc8ANWHfJkU17zM0jd+LCsGgIfHq5T3Hk=;
 b=ZwlvK3uSyX0kLru7cPg1Wq3+yb8s52FdoEIgjJMh0mSzQN0Z3sGqR+GWwIvSUYACIBAqdu
 B/PzT/S7zO2YRxHN+enVTllSQC8Gqf2os4OBAg9EIiRycuehw0B3isf+JkNh5YEglcczrJ
 qtzJrYdzO8p7533mtdQv4xZrhQ+x68U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-E2OMnUOkMp2fbaBLLCc73g-1; Thu, 07 Oct 2021 05:36:08 -0400
X-MC-Unique: E2OMnUOkMp2fbaBLLCc73g-1
Received: by mail-ed1-f69.google.com with SMTP id
 c7-20020a05640227c700b003d27f41f1d4so5293883ede.16
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Oct 2021 02:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YLM20CrNDiSc8ANWHfJkU17zM0jd+LCsGgIfHq5T3Hk=;
 b=k/pTB6DBHRiAFLvBlGHDsaPJB4HhAflxVr+jUkaOMR/mtV/2VNg8Apwow2emAa0o0b
 MdbtJdolMWLOgpTaKUN3NqsnVVrCdev8sJ+wsV/CF2Ddq3qJs7Y5XtJEGArDOybJTu82
 WWt7kJwtKVwFg/8o3hb18BNoaa8qO/t3fjudzKwapC2b9FWAU46L+qwGchCo3djPTpj7
 rwaKOiFxIEC+CsB4rD98NdMJci6M+mkSM23RyM5yBF8A9Oc5SQTLZ+dhrkKtBCnlzIfN
 5K2uXlWDofQZgRGWMsK6WrZgIGHRLEEVzFrxMrBks2nbeFPa/uDH/XMoZg8JQt3Cpqtd
 FLCw==
X-Gm-Message-State: AOAM5335fgxD6CBGB8TPq+xu+rhWkUXec2jxaE69hE9en8RunYUXJsuE
 cqHrQThi7h2Jis+0OwojY94LezQpw8WNzs2B1yrMWTnYq6uVej29B7w7xYstfOA3w6wErLXDvCW
 cmIJ/DHbgmTh+L1/68nExL89c2g==
X-Received: by 2002:adf:a118:: with SMTP id o24mr3898239wro.15.1633598859309; 
 Thu, 07 Oct 2021 02:27:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTkTGQO7OWYf67tE5FRQkAoLSad774DWcZLIKG1RX8coeD4jn+lqAsFsAow6Xbu9zf7PRTow==
X-Received: by 2002:adf:a118:: with SMTP id o24mr3898207wro.15.1633598859138; 
 Thu, 07 Oct 2021 02:27:39 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6886.dip0.t-ipconnect.de. [91.12.104.134])
 by smtp.gmail.com with ESMTPSA id l17sm23582725wrx.24.2021.10.07.02.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 02:27:38 -0700 (PDT)
Subject: Re: [PATCH v1 6/6] x86: remove memory hotplug support on X86_32
To: Oscar Salvador <osalvador@suse.de>
References: <20210929143600.49379-1-david@redhat.com>
 <20210929143600.49379-7-david@redhat.com>
 <YV66zoLEP3niIHEu@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <565bdc3e-04b2-8eff-181c-d4dcf82e0e40@redhat.com>
Date: Thu, 7 Oct 2021 11:27:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YV66zoLEP3niIHEu@localhost.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Michal Hocko <mhocko@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07.10.21 11:15, Oscar Salvador wrote:
> On Wed, Sep 29, 2021 at 04:36:00PM +0200, David Hildenbrand wrote:
>> CONFIG_MEMORY_HOTPLUG was marked BROKEN over one year and we just
>> restricted it to 64 bit. Let's remove the unused x86 32bit implementation
>> and simplify the Kconfig.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>

Thanks for the review Oscar!

-- 
Thanks,

David / dhildenb

