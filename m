Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA48715DC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 07:27:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jn1Wj1Lp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jn1Wj1Lp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tplw76bhhz3vXc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 17:27:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jn1Wj1Lp;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jn1Wj1Lp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TplvR13b3z3cp1
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 17:26:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709619983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Psz0OX/Ry6dfLhKgIYxOthAYSDfpuoHrqk87qxzifRI=;
	b=Jn1Wj1LpgzKYqyG00SILzJOHNiEEtiolf1DUCM2B6EbcSRu+niGrXD0IJOVJ57GR2usLRh
	Tli83WPyIQ6rNtSc4UAGRFOyv/S1lQ1NwooOaWYg+8iTlPvoq+OEd8t1Vk8JeN0REmhaxO
	BpcJEjehQSY7OgYo/hnv1S6trVmzHDQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709619983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Psz0OX/Ry6dfLhKgIYxOthAYSDfpuoHrqk87qxzifRI=;
	b=Jn1Wj1LpgzKYqyG00SILzJOHNiEEtiolf1DUCM2B6EbcSRu+niGrXD0IJOVJ57GR2usLRh
	Tli83WPyIQ6rNtSc4UAGRFOyv/S1lQ1NwooOaWYg+8iTlPvoq+OEd8t1Vk8JeN0REmhaxO
	BpcJEjehQSY7OgYo/hnv1S6trVmzHDQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-YE_scFf6NcSYyQdMO7zcjw-1; Tue, 05 Mar 2024 01:26:21 -0500
X-MC-Unique: YE_scFf6NcSYyQdMO7zcjw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a448cfe2266so411737766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 22:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709619980; x=1710224780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Psz0OX/Ry6dfLhKgIYxOthAYSDfpuoHrqk87qxzifRI=;
        b=BtL5WhzWlrVico+jEmaDIomaMwm3ZshfKoPBJFAb7wvh+Gju4wP4YD9ldBRAyXhl9f
         haR6DlwC/wvXt7AtQzTeT03md2YP14MtCroFJsciwyQX5toBv0oKeEwzeqw9OLhHwzoX
         xUHoljnexsM7kEYZE/NBq1XCMll4R+mNmhj8odSGyyYTkOMVv0RVSE7lknAGodgOpSsD
         RZQzsJIUeYYZknjToPcZNrwUYLxsS+d+TIXkQn9+ZzyvwBkQSiKU26dFCEgKovD0Pdlw
         PEpzO1iACfE01pZ1E8gTsyDq8deieJVAPN9/Kesy5YDHA8AujUUS00RSsU3nX95d+xWd
         gTYg==
X-Forwarded-Encrypted: i=1; AJvYcCUf8iHuqQscGA95waGs8xmzVf0BOoxKbP6y9R0lmn87bzbcpSHRD3CQuyhIBwLWaDvF4JSRYCYHAMXOUYtdLYL4TQr5iwSJ0I0A2mMjRw==
X-Gm-Message-State: AOJu0YytcKBbyOCnZj1BZy2+/80nyLLVMwKGt4SdMILRBkz915fd+bhX
	LBMeqk/gIzVnO0xyovETRqoj9pe+/gUDFO5dQU+mrpFjfaVkWR5PT1WcW1GEEGcGmTxSp9m6/rr
	VPFruXU6MXAbEj2byjz5xRqxoDe92CFdTYQZQFLrnGwTZf4OBIEHsNmlL+VYap461LMf1Ekk=
X-Received: by 2002:a05:6402:2152:b0:566:ef8:93f6 with SMTP id bq18-20020a056402215200b005660ef893f6mr8250390edb.0.1709619980494;
        Mon, 04 Mar 2024 22:26:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTa/zG+QpTThJzAA9O4uIQf+HbpHsGxRptfQLve9GrKC5j34N1kdtZVpEBSY7iYj/0WVHqdw==
X-Received: by 2002:a05:6402:2152:b0:566:ef8:93f6 with SMTP id bq18-20020a056402215200b005660ef893f6mr8250373edb.0.1709619980229;
        Mon, 04 Mar 2024 22:26:20 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-243.web.vodafone.de. [109.43.178.243])
        by smtp.gmail.com with ESMTPSA id g26-20020a056402321a00b0055fba4996d9sm5464921eda.71.2024.03.04.22.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 22:26:19 -0800 (PST)
Message-ID: <542716d5-2db2-4bba-9c58-f5fa32b22d52@redhat.com>
Date: Tue, 5 Mar 2024 07:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 14/32] powerpc: general interrupt tests
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-15-npiggin@gmail.com>
 <1b89e399-1160-4fca-a9d7-89d60fc9a710@redhat.com>
 <CZLGGDYWE8P0.VKR8WWH6B6LM@wheely>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CZLGGDYWE8P0.VKR8WWH6B6LM@wheely>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/03/2024 03.19, Nicholas Piggin wrote:
> On Fri Mar 1, 2024 at 10:41 PM AEST, Thomas Huth wrote:
>> On 26/02/2024 11.12, Nicholas Piggin wrote:
>>> Add basic testing of various kinds of interrupts, machine check,
>>> page fault, illegal, decrementer, trace, syscall, etc.
>>>
>>> This has a known failure on QEMU TCG pseries machines where MSR[ME]
>>> can be incorrectly set to 0.
>>
>> Two questions out of curiosity:
>>
>> Any chance that this could be fixed easily in QEMU?
> 
> Yes I have a fix on the mailing list. It should get into 9.0 and
> probably stable.

Ok, then it's IMHO not worth the effort to make the k-u-t work around this 
bug in older QEMU versions.

>> Or is there a way to detect TCG from within the test? (for example, we have
>> a host_is_tcg() function for s390x so we can e.g. use report_xfail() for
>> tests that are known to fail on TCG there)
> 
> I do have a half-done patch which adds exactly this.
> 
> One (minor) annoyance is that it doesn't seem possible to detect QEMU
> version to add workarounds. E.g., we would like to test the fixed
> functionality, but older qemu should not. Maybe that's going too much
> into a rabbit hole. We *could* put a QEMU version into device tree
> to deal with this though...

No, let's better not do this - hardwired version checks are often a bad 
idea, e.g. when a bug is in QEMU 8.0.0 and 8.1.0, it could be fixed in 8.0.1 
and then it could get really messy with the version checks...

  Thomas

