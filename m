Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3B4871616
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 07:53:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HtPCPJOw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HtPCPJOw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpmVN022xz3dX1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 17:53:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HtPCPJOw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HtPCPJOw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpmTg2CMNz3cgJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 17:52:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709621556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=055i0Cw+qSF55YTg7cbDTnODJKfJ+o7mIN7GUyBDy/4=;
	b=HtPCPJOwo5QohktITTiT+7KI/FMAMDPCFWvABogKmR/B6YrdvHO4faHJYiRtcX4GI6VcLh
	wp6hJYTuE3nfHVhRrc6o8BaiAbFzWOpfGHOLZxZvSGPITIZBDRSH1jh9VrevW4dyAU3yDc
	DEmyHgMt9EM/xXM5hKSnwZTEFLrgJhE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709621556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=055i0Cw+qSF55YTg7cbDTnODJKfJ+o7mIN7GUyBDy/4=;
	b=HtPCPJOwo5QohktITTiT+7KI/FMAMDPCFWvABogKmR/B6YrdvHO4faHJYiRtcX4GI6VcLh
	wp6hJYTuE3nfHVhRrc6o8BaiAbFzWOpfGHOLZxZvSGPITIZBDRSH1jh9VrevW4dyAU3yDc
	DEmyHgMt9EM/xXM5hKSnwZTEFLrgJhE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186-YGAjKI5hMjGby9fsr3y6dw-1; Tue, 05 Mar 2024 01:52:33 -0500
X-MC-Unique: YGAjKI5hMjGby9fsr3y6dw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a3fb52f121eso362769966b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 22:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709621552; x=1710226352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=055i0Cw+qSF55YTg7cbDTnODJKfJ+o7mIN7GUyBDy/4=;
        b=mwXPpmh6+1JKlgznqua1d2ExGZn3Hc1ss6OlvDGX+ThkSI7lhj6Mj+u1V3Yy/udN+v
         zmbCkLRNVxNxq91UVc44eSDVAk1KtYOwQRoGtfKTorQ0zrpyQSgegwSo6Rg+J8o2kgyV
         ec//IxX9FMuz8dNyCx1e8GRtnxSa5peqSlJJ5TmBxe/3zrno+7oZe06oqKmui3SQbcs8
         aBd66m2u1IsaVpCJAJnRitQyC1GM0kwB1mROQb3tP1ClGogHugeubqyQWCPKqd/Z4ueI
         ss/JGKoctalmIxREL5lYrqutI5Uj60ACG+2F6doh7eGneTUI3rgU8k7SkjORA6xEajCj
         xMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDpvC+PfjecEZjUjr3hkXzKLYkB8RJED1r28bhWqMMoMe/afxYxxj71RNgR/Ep+gNOCXRHd50BfVA3XLQMMa+7iXLKbWP/baaFRoCcXg==
X-Gm-Message-State: AOJu0Yxyn0ZxPl+k3WujihuPqVjwa1cKKxjskLmpabTb2/6AQYvdhjo5
	di3na4JuJ9BUMikPHH8hClYRnxB2vD4jDeSjUYN3awarTWNoNWkZEcb/U36NcN3NTpLABxip9jv
	L9rx5pMJZQxGGUo+Jbcanl6Owv9pBmAqpk/vDMV5FAwYzaWNQ3aG88GsNDe4PC8g=
X-Received: by 2002:a17:906:475a:b0:a40:4711:da20 with SMTP id j26-20020a170906475a00b00a404711da20mr7932078ejs.34.1709621552517;
        Mon, 04 Mar 2024 22:52:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFajVdOaJs4uKX0LYrWLK+X2XMHvDfhEUWWpjcLyw7CAYFHHlfoPf9mDziaodNnuUxasFUVcg==
X-Received: by 2002:a17:906:475a:b0:a40:4711:da20 with SMTP id j26-20020a170906475a00b00a404711da20mr7932065ejs.34.1709621552193;
        Mon, 04 Mar 2024 22:52:32 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-243.web.vodafone.de. [109.43.178.243])
        by smtp.gmail.com with ESMTPSA id uz3-20020a170907118300b00a44bb63f29csm4007506ejb.47.2024.03.04.22.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 22:52:31 -0800 (PST)
Message-ID: <839ca22a-b6e6-4e53-9819-cf803fb18101@redhat.com>
Date: Tue, 5 Mar 2024 07:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 7/7] common: add memory dirtying vs
 migration test
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226093832.1468383-1-npiggin@gmail.com>
 <20240226093832.1468383-8-npiggin@gmail.com>
 <e967e7a6-eb20-4b2b-ab7a-fc5052a3eb52@redhat.com>
 <CZLH3XUGU8Z8.2R73ILJ3ISWN8@wheely>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CZLH3XUGU8Z8.2R73ILJ3ISWN8@wheely>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/03/2024 03.50, Nicholas Piggin wrote:
> On Mon Mar 4, 2024 at 4:22 PM AEST, Thomas Huth wrote:
>> On 26/02/2024 10.38, Nicholas Piggin wrote:
>>> This test stores to a bunch of pages and verifies previous stores,
>>> while being continually migrated. This can fail due to a QEMU TCG
>>> physical memory dirty bitmap bug.
>>
>> Good idea, but could we then please drop "continuous" test from
>> selftest-migration.c again? ... having two common tests to exercise the
>> continuous migration that take quite a bunch of seconds to finish sounds
>> like a waste of time in the long run to me.
> 
> Yeah if you like. I could shorten them up a bit. I did want to have
> the selftests for just purely testing the harness with as little
> "test" code as possible.

Ok, but then please shorten the selftest to ~ 2 seconds if possible, please.

  Thomas


