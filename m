Return-Path: <linuxppc-dev+bounces-2156-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF1999B57E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 16:27:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQm5g5ZCQz2yR9;
	Sun, 13 Oct 2024 01:26:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::342"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728743207;
	cv=none; b=oEISSgilWEYNPD1ARNG+6NFtYOuc5qSA7QoLIqfr/vv6CS1CJtGh3nRRTofqwb6QIx6F+IfTQGKkbVZ0ZGfbRCh9NMKOLOUbxoCqEgYWE2WWfsEhfhSRc2+DT1RNTnEbwzpZVLSsZPVhKceRXgF32Qd5vcOSv/xjw7+lqGrevIvDUmxVJIzl+FVkj7nmeLl2O7JSMU25nRb0SZPPdV2lhG5QV47J/0/qt/ZdXfozH2FxsvTSCjmwtGWff8b7ofE4pydncjhZRcZkukKqQ89nuBwG7xDKoJmZzsQnfXDVV3Zy/FN9zCORrmgEHeeIy67vzp8xTWOl9dxVAvkkgzMbYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728743207; c=relaxed/relaxed;
	bh=fGkJyif5bIVfNU/uCfBv40Mi/s06SWcLG1CftlIRMgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xa+FruOuhY22nPiT15p7L+dIMGLAIriTbAmznP5Bg/1R2+SubjRre0lZoWMc4IUXQoyt4W0IJIULH4t8OVsYWVQBb0eDocvP1LByxCDPAwEk7Uu5WyyBZnzqaV7joUXK0t054FADDxpvbYD+oYdxFqxFtT4JAMVGmlLd73jci+eGYG8LyY0aFZaCH/CQAHH1CcSPYWSo5U/8h9MPIjC8VsH70XfcacXpRJF4tl0XQrLOw7LcjmOc6UkW1Rdk6ikYbr3AcY0rbnTPqbfk8UI2OWxbGC0TW3HQ2fbwU16Ar8zIm2D2qQC2tG/tHxdjOpUdMZ1+bjeiCyCxOzNLPU3fTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=UI00U2kr; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com; envelope-from=andrew.cooper@cloud.com; receiver=lists.ozlabs.org) smtp.mailfrom=cloud.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=UI00U2kr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cloud.com (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com; envelope-from=andrew.cooper@cloud.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQm5X5cHrz2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 01:26:37 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4311bb9d4beso16011985e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 07:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728743194; x=1729347994; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fGkJyif5bIVfNU/uCfBv40Mi/s06SWcLG1CftlIRMgI=;
        b=UI00U2krnkOtgJkyMnhT6VG+O9vzS5Oapk8Ub3RZEWFfk+OrhZbt8xUJdNDHGUdhDd
         1pp8RgarytEY0CsrVWoeinzz/bOCebsxP+LJQPFvfOtuQyCJ6cdcpGuGHVyez34lF2rX
         SaPCc7dio5MzRtsK++XhhJAlQz6nYPKMAnEwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728743194; x=1729347994;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGkJyif5bIVfNU/uCfBv40Mi/s06SWcLG1CftlIRMgI=;
        b=EsiJGksJtfF4tp7zR9qZqrjo1N9vUdtM8Ly6OVsxmhpwOX1tofFuMlGt0gxdTI7Aow
         kJQz2JrJ1AD9fk7mcDX9DsRPY73PQd6XIpty5ntvH5iAd8TsRIAYzp7vNpHq8eJJddCA
         YPTdyh4R+LQcRx5Gx9zDa8q/Gt3EACVBW/+iGYqSvnYsooZsratJ2lEru3FMO6vfZUE7
         MyyOB2hCWKWIIAFyRDa9ym84Rd1/dOIjGLDjCESBxJXuLftcHZJhB7YwIrMOLYBN4OtC
         Z3QcYbfFDf7IUyJgq5/mCGzLBQOjGTQc6p7t7KeEM31uCyLdS9ragMboxy4mTPUMaKzE
         NyfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiAHfoNJgfExiXX5osa5PDciSlG605oqTFrAWrYi/5fboNitQftq1JIHJGUEHmwGh6K+sAlD5ZOYas+PM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzoSgBDMFICdYix5uCDoXQOMgyqzuc39y+/dErLS/YRG61cfnpD
	rm1bZAque+BMgnI0EHKDhMwlnNf7wc46FYD6Xo843XrfCeve3zEYEqDemNApalU=
X-Google-Smtp-Source: AGHT+IHS/6Xfwmu1E3WhEGV2lf3ppNj0QG6WFrYAwXcvuoADf8/J3qoWks7gzy2U5wmO1rHduSWZrQ==
X-Received: by 2002:a05:600c:1da7:b0:42f:8e2e:c00a with SMTP id 5b1f17b1804b1-431255d4ae3mr20816585e9.2.1728743193639;
        Sat, 12 Oct 2024 07:26:33 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf45d6csm101162065e9.17.2024.10.12.07.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 07:26:33 -0700 (PDT)
Message-ID: <80d94591-1297-4afb-b510-c665efd37f10@citrix.com>
Date: Sat, 12 Oct 2024 15:26:32 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Mark Rutland <mark.rutland@arm.com>
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com>
 <20241012140923.kl2evqb6aue2pzfs@treble>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241012140923.kl2evqb6aue2pzfs@treble>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/10/2024 3:09 pm, Josh Poimboeuf wrote:
> On Sat, Oct 12, 2024 at 09:48:57AM +0100, Andrew Cooper wrote:
>> On 12/10/2024 5:09 am, Josh Poimboeuf wrote:
>>> For x86-64, the barrier_nospec() in copy_from_user() is overkill and
>>> painfully slow.  Instead, use pointer masking to force the user pointer
>>> to a non-kernel value even in speculative paths.
>>>
>>> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
>> You do realise mask_user_address() is unsafe under speculation on AMD
>> systems?
>>
>> Had the mask_user_address() patch been put for review, this feedback
>> would have been given then.
>>
>>
>> AMD needs to arrange for bit 47 (bit 58 with LA57) to be the one
>> saturated by shifting, not bit 63.
> Ok... why?

CVE-2020-12965

https://www.amd.com/en/resources/product-security/bulletin/amd-sb-1010.html

~Andrew

