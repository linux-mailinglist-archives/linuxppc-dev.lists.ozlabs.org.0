Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA5E86E2DF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 14:57:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1gO54np;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1gO54np;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmV6B234Rz3vdk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 00:57:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1gO54np;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T1gO54np;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmV5R6dTLz3vXF
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Mar 2024 00:57:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709301431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=X7PBjlrpvNONsqh2uMY775tMAp1gZn/T320+nNQVSQ8=;
	b=T1gO54npBC0gYzodTHqP92oUWinnQKGHe+QuC1X86Xnuok+EP1R8OcnTUIfJdgfZbv4Y3u
	sp892Bcfs00E6FRDdWqZbywMN6yyZ7q/JGKO4i8okhp4Bkv5mgBJKfJ/E7br2X1aBhcCgI
	wKgmf+sHbKopcaSOhrk2Fpvy6GVQZcQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709301431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=X7PBjlrpvNONsqh2uMY775tMAp1gZn/T320+nNQVSQ8=;
	b=T1gO54npBC0gYzodTHqP92oUWinnQKGHe+QuC1X86Xnuok+EP1R8OcnTUIfJdgfZbv4Y3u
	sp892Bcfs00E6FRDdWqZbywMN6yyZ7q/JGKO4i8okhp4Bkv5mgBJKfJ/E7br2X1aBhcCgI
	wKgmf+sHbKopcaSOhrk2Fpvy6GVQZcQ=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-mcHgs0ktPEGK6tPRnc-IxA-1; Fri, 01 Mar 2024 08:57:10 -0500
X-MC-Unique: mcHgs0ktPEGK6tPRnc-IxA-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5a10683780dso345394eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Mar 2024 05:57:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709301429; x=1709906229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7PBjlrpvNONsqh2uMY775tMAp1gZn/T320+nNQVSQ8=;
        b=LV35n8H3eQlxFW9W30xKcYgyW31FUtp77kd3WZsoLJ5MBpOAomnc/TkvTj8YNPDr60
         WmqchS5Tesox93gC4fsM5v9tAO1xizq5nmbsBDEeLW/SLgu+sdlnrKO37ThIe8/T+wQz
         ysAE9yFxB1btQjuL3TsIfqt7OWFNF3EqjjfGch93SxU3pMrhInCJ2k3ikjOCXKIQa1sX
         gZdZlrp7sglN+ITOwvsjn+SAwGXq1z0GzmBAzchhYebpsdBalnRQjWDkgbxEo1D4EqIg
         TODO4wEfbbVCmfBt8VhjJ30pQnEDjuFZDNiD5w7+DeDjZynxs2dfO7dmaSu7R9SRACWp
         f+rA==
X-Forwarded-Encrypted: i=1; AJvYcCU96X4ORV5vEm4+b6eVjeuElkVnVuMjvNQ9TcYMIuC5p3gnR87mIxnDi6jfkk5yrZs4sj4fmbkhmRKIAQT+lkb8ccZyHivZsrmgQ2WotQ==
X-Gm-Message-State: AOJu0YzQ01xndUSlkvXI5VMiBFEke508vXWkO+gEcW+AaYhL/x1gA+bT
	GNN5akKG8khwYmc8uWjCXPGWtJ3hWXuUb0ROZ3roCS8AwbyqE4s9/JxXbyNmJDvCFuLno2QWkbe
	gDVMOnizf3huEB0d0po0upYHWsYelCjTPHqo1Lnezy40QtlEJ3NlYWzHbJB6yzkI=
X-Received: by 2002:a05:6359:4104:b0:17b:581c:430e with SMTP id kh4-20020a056359410400b0017b581c430emr1629944rwc.3.1709301429082;
        Fri, 01 Mar 2024 05:57:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAALUYF3MjHnSxAWn3yxvvW7J/Y+wZ+qYcQuBwbpMuvxGNhVX2UbCWs/R+c5oDVW3YrxDr8Q==
X-Received: by 2002:a05:6359:4104:b0:17b:581c:430e with SMTP id kh4-20020a056359410400b0017b581c430emr1629929rwc.3.1709301428811;
        Fri, 01 Mar 2024 05:57:08 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de. [109.43.178.133])
        by smtp.gmail.com with ESMTPSA id a19-20020a0ce353000000b00690314356a4sm1874327qvm.80.2024.03.01.05.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 05:57:08 -0800 (PST)
Message-ID: <b4a1b995-e5cd-40e9-afc1-445a9e5f6fa5@redhat.com>
Date: Fri, 1 Mar 2024 14:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 14/32] powerpc: general interrupt tests
To: Andrew Jones <ajones@ventanamicro.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-15-npiggin@gmail.com>
 <1b89e399-1160-4fca-a9d7-89d60fc9a710@redhat.com>
 <20240301-65a02dd1ea0bc25377fb248f@orel>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240301-65a02dd1ea0bc25377fb248f@orel>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/03/2024 14.45, Andrew Jones wrote:
> On Fri, Mar 01, 2024 at 01:41:22PM +0100, Thomas Huth wrote:
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
>>
>> Or is there a way to detect TCG from within the test? (for example, we have
>> a host_is_tcg() function for s390x so we can e.g. use report_xfail() for
>> tests that are known to fail on TCG there)
> 
> If there's nothing better, then it should be possible to check the
> QEMU_ACCEL environment variable which will be there with the default
> environ.

Well, but that's only available from the host side, not within the test 
(i.e. the guest). So that does not help much with report_xfail...
I was rather thinking of something like checking the device tree, e.g. for 
the compatible property in /hypervisor to see whether it's KVM or TCG...?

  Thomas


