Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E620866DB1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 10:09:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i5NdKNkO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i5NdKNkO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjvtr2Vtqz3vbq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 20:09:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i5NdKNkO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i5NdKNkO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjvt374mzz2xFl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 20:08:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708938503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Nd4KNSHTsPg8sEq3delbthyC/APIQx24iJ0AiYrHHVk=;
	b=i5NdKNkOxFfl+9UgUDmveRS41D4F444YAqhe4L3TAw5byaavx2DYU+1z5A9qg9GJcp+NlC
	1x++E3nWDluqp4dykuTovsKJBe7t0HmKQ7qC+I44DtWG9LlBu8WpE5KeywcsU1PREfS66i
	RRF/Z5AyFys/0Qw6e/oxrXTLkYlZXRI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708938503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Nd4KNSHTsPg8sEq3delbthyC/APIQx24iJ0AiYrHHVk=;
	b=i5NdKNkOxFfl+9UgUDmveRS41D4F444YAqhe4L3TAw5byaavx2DYU+1z5A9qg9GJcp+NlC
	1x++E3nWDluqp4dykuTovsKJBe7t0HmKQ7qC+I44DtWG9LlBu8WpE5KeywcsU1PREfS66i
	RRF/Z5AyFys/0Qw6e/oxrXTLkYlZXRI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-dbAdjY0CNIGoKahf1hNynQ-1; Mon, 26 Feb 2024 04:08:19 -0500
X-MC-Unique: dbAdjY0CNIGoKahf1hNynQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33d10bd57d7so1014244f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 01:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708938498; x=1709543298;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nd4KNSHTsPg8sEq3delbthyC/APIQx24iJ0AiYrHHVk=;
        b=apAryUKiCw9RSCmaYfxOL5iF/Mtf3dWXE05SDt2B0Up6ARu+GQGvkoMEZjlKsEhlUO
         eFsGNB5oWTP0p2b39pFfc8d7RrncSpvw3zb0F+83Y0wB+3PTb3uGAbBNqGirXjrZqTQf
         78BTA3u3Zt3V9MdrtJarZDN9dyUUPPNRMXmbFSMu8LsT/NjL3/B97Z3+TBAk14kN4lmi
         dZfV7GND3zaBeWbQFXZsrE508kmeBEYm1GlHM75uVQsy0TtLN3lRWiE2japbEC4/5Nwv
         fwYkVtL4IU54pax5KTzupD/d1ss5BJ5Q9KSkus1sXQKh9D84cJzYTMxvwN+Ikod5wngi
         jeWA==
X-Forwarded-Encrypted: i=1; AJvYcCWR5NC+9GEirLPTO+rxKguxSE+tkK1KU7H7kRg+VMzmSt6nZB4qcjN/FtDTAzxYbfjGobZeNNxQuzbWga21WuNm41fAfz5g+0MFQgGZoQ==
X-Gm-Message-State: AOJu0YwD80OMqc3m8BCb3AT2MHZsVHXTcJQIOwBXp8+jFDtoUnqQowTh
	y1GU6w9/PCbzXDvtfxkYXP6Cu7lpY/6s1ynyXzDg3tTdBM4YndHCh/M2CHUYxgg3LsetlW6RdYW
	DrbkxNZOekQj66DaaXhox97UmjGwEyevmTb1J0Ada7TZCs1XSXDHlD5xruheu4DU=
X-Received: by 2002:adf:f350:0:b0:33d:855d:7457 with SMTP id e16-20020adff350000000b0033d855d7457mr4399511wrp.21.1708938498794;
        Mon, 26 Feb 2024 01:08:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFjmnajipOzaVs1cymu3XapHbGqxmQuOJVM3lzDCaND8iWQ5Iz+3PcFM5ZHEhGzbfZOV1QvQ==
X-Received: by 2002:adf:f350:0:b0:33d:855d:7457 with SMTP id e16-20020adff350000000b0033d855d7457mr4399486wrp.21.1708938498451;
        Mon, 26 Feb 2024 01:08:18 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-215.web.vodafone.de. [109.43.176.215])
        by smtp.gmail.com with ESMTPSA id w4-20020a5d4044000000b0033b7ce8b496sm7491263wrp.108.2024.02.26.01.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 01:08:18 -0800 (PST)
Message-ID: <d7d4644f-0c82-42b8-b211-f53d8135786c@redhat.com>
Date: Mon, 26 Feb 2024 10:08:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v5 0/8] Multi-migration support
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240221032757.454524-1-npiggin@gmail.com>
 <5383a1b2-20ca-4d07-9729-e9d5115948dc@redhat.com>
 <CZEUWE22JA80.3S73L9F5A04RK@wheely>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CZEUWE22JA80.3S73L9F5A04RK@wheely>
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

On 26/02/2024 09.10, Nicholas Piggin wrote:
> On Fri Feb 23, 2024 at 5:06 PM AEST, Thomas Huth wrote:
>> On 21/02/2024 04.27, Nicholas Piggin wrote:
>>> Now that strange arm64 hang is found to be QEMU bug, I'll repost.
>>> Since arm64 requires Thomas's uart patch and it is worse affected
>>> by the QEMU bug, I will just not build it on arm. The QEMU bug
>>> still affects powerpc (and presumably s390x) but it's not causing
>>> so much trouble for this test case.
>>>
>>> I have another test case that can hit it reliably and doesn't
>>> cause crashes but that takes some harness and common lib work so
>>> I'll send that another time.
>>>
>>> Since v4:
>>> - Don't build selftest-migration on arm.
>>> - Reduce selftest-migration iterations from 100 to 30 to make the
>>>     test run faster (it's ~0.5s per migration).
>>
>> Thanks, I think the series is ready to go now ... we just have to wait for
>> your QEMU TCG migration fix to get merged first. Or should we maybe mark the
>> selftest-migration with "accel = kvm" for now and remove that line later
>> once QEMU has been fixed?
> 
> Could we merge it? I'm juggling a bunch of different things and prone to
> lose track of something :\ I'll need to drum up a bit of interest to
> review the QEMU fixes from those who know the code too, so that may take
> some time.

Ok, I merged it, but with "accel = kvm" for the time being (otherwise this 
would be quite a pitfall for people trying to run the k-u-t with TCG when 
they don't know that they have to fetch a patch from the mailing list to get 
it working).

> I left it out of arm unittests.cfg entirely, and s390 and powerpc seems
> to work by luck enough to be useful for gitlab CI so I don't think there
> is a chnage needed really unless you're paranoid.

At least the s390x test does not work reliably at all when running with TCG 
without your QEMU patch, so I think we really need the "accel = kvm" for the 
time being here.

> I do have a later patch that adds a memory tester that does trigger it
> right away on powerpc. I'll send that out after this series is merged...
> but we do still have the issue that the gitlab CI image has the old QEMU
> don't we? Until we update distro.

We only run selected tests in the gitlab-CI, so unless you add it to 
.gitlab-ci.yml, the selftest-migration test won't be run there.

  Thomas


