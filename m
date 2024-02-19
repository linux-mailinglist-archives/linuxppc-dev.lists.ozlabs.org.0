Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2600B859C70
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 07:57:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g0wXNUCK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g0wXNUCK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TdYHz0czTz3d3Q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 17:57:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g0wXNUCK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g0wXNUCK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TdYHB200lz3bsw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 17:56:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708325792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YE5SUQ6P85lCv9ueDPInmuqKDSZltz/dw8thQgaLw/U=;
	b=g0wXNUCK3VTwkTyuYcmk6Q4TPF8WUJ02GAGh7B/gfyCXGEeSci45jpJLNExlJQDzZvxq7W
	qh3YkwE6Ql2xmxMSyErCeW1SC/4agGc3qrH+HGNWL/9NrP6qUxvUCYr95U+LWH8zyhgoUk
	nmk56lmRFdQn6cmxJdQGqg+ZB91VrGE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708325792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YE5SUQ6P85lCv9ueDPInmuqKDSZltz/dw8thQgaLw/U=;
	b=g0wXNUCK3VTwkTyuYcmk6Q4TPF8WUJ02GAGh7B/gfyCXGEeSci45jpJLNExlJQDzZvxq7W
	qh3YkwE6Ql2xmxMSyErCeW1SC/4agGc3qrH+HGNWL/9NrP6qUxvUCYr95U+LWH8zyhgoUk
	nmk56lmRFdQn6cmxJdQGqg+ZB91VrGE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-Ik1-H6kPOC6LI1MOQvjzSA-1; Mon, 19 Feb 2024 01:56:27 -0500
X-MC-Unique: Ik1-H6kPOC6LI1MOQvjzSA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7874e5e0915so165301985a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Feb 2024 22:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708325787; x=1708930587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YE5SUQ6P85lCv9ueDPInmuqKDSZltz/dw8thQgaLw/U=;
        b=AplEdnazApEk5iQsTZ4X/pvn0KOOrKG316tGGv5mggxmpFNc3muw0pqQKvkctFO5zF
         BCqfOupfaPhCm/VMScQ58R19eGtHHxcC1MRPBAFD5ObCp9fIBwYOai82RgxBK+7sYvY5
         ODn09Uo7SLhcwyIxSqzYavCxvmdPQeoZ+dL4ycUhF+t3n5KdigFUYszPGsKZX4ZnLGHP
         rGjC4ynSOIJVblKkF1nWuw/xVdm/nPWp8e87w5bacP71MkBDNFPEFoDhZHuxd7tA16ys
         Ira3/usep1XTgMT8+f0FexB8frvZDguYa4J4ODfm1gFQdP41XjMrmQ/zrv/3ue4keUQW
         mfSw==
X-Forwarded-Encrypted: i=1; AJvYcCXM/5k7oOGNizcHULZtzlxZcUbSQnSz2yyMfmugzJKD60wZMr5CcjDCHo/K4V7d3EiKunkGTB3Yn5FstSR557BWjQndzHtF5ZGJs5e/GA==
X-Gm-Message-State: AOJu0YxWp62i1HnbtaDll19Gw2Eed3r9iy6YfUIQlqYhUVV2hPgXCyVe
	d4rUudbd2lmCZF5jDR6WgJAnLANit1YeknD1L6hFvhpyh8b0SEv1y3Fa/0XeKhQIdOAgMkkZTwN
	VDud2wDOjrBLT0sTu5Whb0PC/wYamU5OnlOkM23ChaEgQ6xwNToLidn1x+YRhjL8=
X-Received: by 2002:ac8:5d8b:0:b0:42c:54d6:99fb with SMTP id d11-20020ac85d8b000000b0042c54d699fbmr15624790qtx.55.1708325787471;
        Sun, 18 Feb 2024 22:56:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTOW/vjFnoKRoExIXffu9pU0oDU4E/siRxT5/SvPfw5icjpuTChge/eWrQhyvNO1ncSWTERQ==
X-Received: by 2002:ac8:5d8b:0:b0:42c:54d6:99fb with SMTP id d11-20020ac85d8b000000b0042c54d699fbmr15624786qtx.55.1708325787202;
        Sun, 18 Feb 2024 22:56:27 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-48.web.vodafone.de. [109.43.177.48])
        by smtp.gmail.com with ESMTPSA id e7-20020ac85dc7000000b0042c50e1adf3sm2254061qtx.95.2024.02.18.22.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 22:56:26 -0800 (PST)
Message-ID: <4d73467d-2091-4342-87a1-822f4aeb8b70@redhat.com>
Date: Mon, 19 Feb 2024 07:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v4 8/8] migration: add a migration selftest
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
 <20240209091134.600228-9-npiggin@gmail.com>
 <abbcbb47-1ae7-4793-a918-dede8dcaf07f@redhat.com>
 <CZ7673PUQ853.DB10GSBEZ65Z@wheely>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CZ7673PUQ853.DB10GSBEZ65Z@wheely>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/02/2024 08.19, Nicholas Piggin wrote:
> On Fri Feb 16, 2024 at 9:15 PM AEST, Thomas Huth wrote:
>> On 09/02/2024 10.11, Nicholas Piggin wrote:
>>> Add a selftest for migration support in  guest library and test harness
>>> code. It performs migrations in a tight loop to irritate races and bugs
>>> in the test harness code.
>>>
>>> Include the test in arm, s390, powerpc.
>>>
>>> Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    arm/Makefile.common          |  1 +
>>>    arm/selftest-migration.c     |  1 +
>>>    arm/unittests.cfg            |  6 ++++++
>>
>>    Hi Nicholas,
>>
>> I just gave the patches a try, but the arm test seems to fail for me: Only
>> the first getchar() seems to wait for a character, all the subsequent ones
>> don't wait anymore and just continue immediately ... is this working for
>> you? Or do I need another patch on top?
> 
> Hey sorry missed this comment....
> 
> It does seem to work for me, I've mostly tested pseries but I did test
> others too (that's how I saw the arm getchar limit).
> 
> How are you observing it not waiting for migration?

According to you other mail, I think you figured it out already, but just 
for the records: You can see it when running the guest manually, e.g. 
something like:

  qemu-system-aarch64 -nodefaults -machine virt -accel tcg -cpu cortex-a57 \
    -device virtio-serial-device -device virtconsole,chardev=ctd \
    -chardev testdev,id=ctd -device pci-testdev -display none \
    -serial mon:stdio -kernel arm/selftest-migration.flat -smp 1

Without my "lib/arm/io: Fix calling getchar() multiple times" patch, the 
guest only waits during the first getchar(), all the others simply return 
immediately.

  Thomas

