Return-Path: <linuxppc-dev+bounces-10048-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A52DFAF5A9C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 16:10:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXMH80N5wz30RK;
	Thu,  3 Jul 2025 00:10:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751465411;
	cv=none; b=LIsbpD36h0XSHirYX5mYcUlAffNNS2ku18g4zyKW4e1+PzBgmeQ65kHMPQJBzzvywreY0dOma75dBXnHbz8v85JDktCow4R8RsJ1sIjnnP6FdfaV9bC3ufRaxRE+fL/6b16QZLGG663v60+ghLDQFm+Zqi/Ol5wr8cNs+q/hhjL6kTTDyvchb5lEDrignMTIApTSEsaX7+DsnmV3fmsTadyJZ0aQcZrIozUh2t76wzz0mTC4ZGPLwvB6QgwHFqADkPFahpgK47uO3wCenYhyn/zDX7vR0ZADTIw6LznI11EtcV2hwM6nt7d9dNzuyyWwrbvpY40fxroRmQVU8Ot4bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751465411; c=relaxed/relaxed;
	bh=TgZwYQY/6//7Y1IiL72sIvHhk7c1rsqVRlKePVxyg/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nlUh3dxAaLmubeoKncuPIEVP6iuUq2MEs3ha27ftQxcrr1QJomhgEyAhnLKdLSe8iHQ4D8n+HN78+19r9U4Jf1Dcm0f39wSwGzRpLF00V3ulPrD8d2QgajWVa9kuU8sTHLUX94ayo5/kD11mVtEzvvMNpR/UO6pZmH/pirxxHKQ+RqjjAV5cdTtJ9kPlYmLtRuxQuhlTt9SBBLZ+edxu/CocYb/QLKxXOHCkhJV5bnnwb1WZsZ/95ZnyyXPO/JJqZi7sZglAD4kojy13fqFN6knU4w+hX0T6E0A7R5Mo8BGQ3MdI6ICnofphSkK9pKd+j6nItHJrrwX7nB+NZc6F7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MwYtWHqV; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MwYtWHqV; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MwYtWHqV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MwYtWHqV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXMH621G7z2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 00:10:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751465407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TgZwYQY/6//7Y1IiL72sIvHhk7c1rsqVRlKePVxyg/g=;
	b=MwYtWHqVMjQHr3CJcTNfDKZvIA7iLymUtfddzSLPI1VVHk4ifTvCaOyt7INPqWsXagm4tR
	c8tHZIl5evYqOlW92yXiT+GK9LK/RpivPwp1rDJmyWPspVBCW8eJ6VHx2xaGzOwDalgy7x
	+aHRvZXgdyYviJ6nKs8h/1yOpbEvMQY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751465407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TgZwYQY/6//7Y1IiL72sIvHhk7c1rsqVRlKePVxyg/g=;
	b=MwYtWHqVMjQHr3CJcTNfDKZvIA7iLymUtfddzSLPI1VVHk4ifTvCaOyt7INPqWsXagm4tR
	c8tHZIl5evYqOlW92yXiT+GK9LK/RpivPwp1rDJmyWPspVBCW8eJ6VHx2xaGzOwDalgy7x
	+aHRvZXgdyYviJ6nKs8h/1yOpbEvMQY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-XheaiIEENRK690anlBwIwQ-1; Wed, 02 Jul 2025 10:10:03 -0400
X-MC-Unique: XheaiIEENRK690anlBwIwQ-1
X-Mimecast-MFC-AGG-ID: XheaiIEENRK690anlBwIwQ_1751465402
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so3385859f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jul 2025 07:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751465402; x=1752070202;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TgZwYQY/6//7Y1IiL72sIvHhk7c1rsqVRlKePVxyg/g=;
        b=iEJw7nKb2Hm79YhLPHuZWySEOl2oepvrOmMP8GLTj93qY1zGTT6J5PLNwTiFrfa0rW
         /Txtlhoi6WD+1eJ4fRqZTngMntw2aWVoh6P98Eya1JkWdy8QtOKvUYYRer3XuhrRgy44
         e4qR1/DIxRdZsGqz5HHEDCtudR5IZCcvXr6zb/R+RM4q+MXOla/Hu2scAdzkbnK//6zS
         Qah/PUeV6Vsg6hN8Ay0UXCyLws0N+2AG/Q6CUEiaQ1HNC7q2uevz/N4Qw9NKHpKon1YT
         AFE3gApGURWUviT2brAKobzhaVeKevfr5+LgofIiLFTa0Jn5k5ntz+qK/xaVr3cZKNWZ
         fhzA==
X-Forwarded-Encrypted: i=1; AJvYcCXl7e9jUfmlZyrHBKQcKzG0ms6fZV4coNJEo5JNckd7w9OuL8Y2zEYXJri+/gtD7NL/RrQN3ZIiSbFflGw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySJRwZRtSi0Ja9J1EDHDWEHURvI3jeLJklCf0UFI8lQxjUty4K
	kYDtCqsuE+HW8gsBhFM+UduO2Hd9BOdrLhThyakTW24Ch31BywA9wq4h7gghTu8jeb5d597ZJjf
	qGHxF9yDm338O1cAC42FZG4p9TRLT5egiyfkdrOr5cBrknkUNzGFC9aDge7vzJHf+TEm7kNeR1j
	A=
X-Gm-Gg: ASbGncsFjhVph0M4Y9wXgKpyxUsRujzxpnGT4cF4wR/FnGn1OZlZON5GD1iKB7NQDoD
	/btECS0wtGpbhR8K/y8Qt/16Z3iY4uDYvXSFWgesOXdJtK+b1tGJaSC9wLCYHriA8A2KDGaBomb
	LOilLJ3dgKwYOu2RT9bSmTJFMlrFA73oBcrGzPx1i7Pax+PIRatIpVfQXndJ9lh9+l3RbVNJQ/d
	7EQDMiL9jRAHWJOG/6/yMrH7qT2ZMUbEMGD6R6Xyk1Nf7FXYbFPUg4gt5V+ceFWR0CXAGlemdoX
	xhPoOxivRdaTPM1SwNAScgkaBGzrgsmmHsNEh9HdFLPLCBNJeM9YJS5eq/pgwQ==
X-Received: by 2002:a05:6000:18a5:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3b20048e6acmr2349172f8f.32.1751465402212;
        Wed, 02 Jul 2025 07:10:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTHkYd/ujfN4fgDDxoyAu+QvDaaEzPHy6fqG+fLvYE5NiiLRk5DOmUub4YoMfZz682a8//Nw==
X-Received: by 2002:a05:6000:18a5:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3b20048e6acmr2349116f8f.32.1751465401643;
        Wed, 02 Jul 2025 07:10:01 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-114-041.pools.arcor-ip.net. [47.64.114.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm240986715e9.40.2025.07.02.07.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:10:01 -0700 (PDT)
Message-ID: <627b4dd5-b08c-41b4-a3cb-99d522fc2063@redhat.com>
Date: Wed, 2 Jul 2025 16:09:59 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 2/2] scripts: Add 'test_args' test
 definition parameter
To: Alexandru Elisei <alexandru.elisei@arm.com>, kvm@vger.kernel.org,
 andrew.jones@linux.dev, lvivier@redhat.com, frankja@linux.ibm.com,
 imbrenda@linux.ibm.com, nrb@linux.ibm.com, pbonzini@redhat.com,
 eric.auger@redhat.com, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 david@redhat.com, linux-s390@vger.kernel.org
Cc: Shaoqin Huang <shahuang@redhat.com>
References: <20250625154354.27015-1-alexandru.elisei@arm.com>
 <20250625154354.27015-3-alexandru.elisei@arm.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250625154354.27015-3-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yoV-2vX_aa6rlTfaUf3XdcEUa3TQT1L83xAJ9Yq8dBU_1751465402
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 25/06/2025 17.43, Alexandru Elisei wrote:
> kvm-unit-tests, on arm and arm64, is getting ready to support running all
> the test automatically under kvmtool. Even though kvmtool has a different
> syntax for configuring and running a virtual machine, kvmtool and qemu have
> in common the test arguments that are passed to the main() function.
> 
> Add a new test definition parameter, 'test_args', that contains only the
> VMM-independent arguments that are passed to the main() function, with the
> intention for the parameter to be used by both qemu and kvmtool, when
> support for kvmtool is added.
> 
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>   arm/unittests.cfg     | 94 ++++++++++++++++++++++++++-----------------
>   docs/unittests.txt    | 17 ++++++--
>   powerpc/unittests.cfg | 19 +++++----
>   riscv/unittests.cfg   |  2 +-
>   s390x/unittests.cfg   | 13 +++---
>   scripts/common.bash   |  8 +++-
>   scripts/runtime.bash  | 18 ++++++---
>   x86/unittests.cfg     | 92 ++++++++++++++++++++++++++----------------
>   8 files changed, 164 insertions(+), 99 deletions(-)

FWIW,
Acked-by: Thomas Huth <thuth@redhat.com>


