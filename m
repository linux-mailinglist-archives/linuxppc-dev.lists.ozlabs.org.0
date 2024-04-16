Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7440F8A629B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 06:51:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e/U6Ws2p;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e/U6Ws2p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJWpd1pR4z3vXY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 14:51:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e/U6Ws2p;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e/U6Ws2p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJWnv0hBvz3dLl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 14:50:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713243055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hUMvOI44LQITn0QQfxWuxppp606ZUuM5f4XktOIdKpI=;
	b=e/U6Ws2p8THE53zPaD2KBTuzdCOvOCC4pRANi9+0Aesbt9pzVRRhbuOjD1+31kxtfLGlqi
	Qcr05H8HzY2lUcWey4aw4UJrHdeaOYBLARkAXb1JX4ak0BPg2qeLuFBhOFSbvtmCNnZaMI
	vuehOzvNFxjw/3ZdFttg4hggWFRK8r0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713243055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hUMvOI44LQITn0QQfxWuxppp606ZUuM5f4XktOIdKpI=;
	b=e/U6Ws2p8THE53zPaD2KBTuzdCOvOCC4pRANi9+0Aesbt9pzVRRhbuOjD1+31kxtfLGlqi
	Qcr05H8HzY2lUcWey4aw4UJrHdeaOYBLARkAXb1JX4ak0BPg2qeLuFBhOFSbvtmCNnZaMI
	vuehOzvNFxjw/3ZdFttg4hggWFRK8r0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-8DNsI-kfPAeaKb2EqWImNA-1; Tue, 16 Apr 2024 00:50:52 -0400
X-MC-Unique: 8DNsI-kfPAeaKb2EqWImNA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-56e68d12097so1408866a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 21:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713243052; x=1713847852;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUMvOI44LQITn0QQfxWuxppp606ZUuM5f4XktOIdKpI=;
        b=DF/Ncn0kTcdwUZjN5sGEEOjUWgVy1nSVop198onPVBrUw5rpgXbxvQUd6/oWTDDReh
         5soU1jsUQMesVjaTfmw2JmK/HIZmhg3wlBq1vUCdkStikDVhIIy6iDRwJ7N9H/VevXw2
         01s3EABy7GvS2hDPGjeezJs36RSRcCIxpBSFkqWcuPu+tf3dPZXuxXZOk2HrJjuxSH2R
         ttz9IU2Ss6upWpNu0kCCmPYEEz2AlIjXmSE2rQ7JEQbsdjvwMCSTjpOYMr9mIRvBBjlb
         aBHXNUmvjhcBFEmoAXU0l8nG8RRf9afWvY22VYaGrLzXaMf4kYGtNegGz7N3zrcCaYiP
         VR9w==
X-Forwarded-Encrypted: i=1; AJvYcCUrZ/4gHZu8df5+DSBWzaqOF1NdrQDOtfY0XsuH/XbqEB5tmDQQhhFmbLBmHvNibKIhIYaBnkiVZh4A+wsjtqwgSVWPMslk7v5ztBz47Q==
X-Gm-Message-State: AOJu0YxpwRU2q4m4YAdHdsQL27lInJcjab6T6UgNr+2eq1JPZyrA4jB5
	S4Y64vyhhrMtQwW9BFJEdaA/eINLFUiMekJ0urEq0JF4fyxUXxq+Qp6eTTAtC6cnW4QrPg61HaC
	zCZROTqmmVuD5A2ynuXmh2Sp0Lw4lNVDT213p2G3bl7k9JstlSQOniJX+SiQT9yc=
X-Received: by 2002:a50:9b53:0:b0:56d:f637:4515 with SMTP id a19-20020a509b53000000b0056df6374515mr7177618edj.42.1713243051863;
        Mon, 15 Apr 2024 21:50:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7YK9mWnBYKfr61YvddWRbU4muyppecHDHP8vmEPrtiwDcag/GTEQQUt6A2tVbOEJ+/qlDtg==
X-Received: by 2002:a50:9b53:0:b0:56d:f637:4515 with SMTP id a19-20020a509b53000000b0056df6374515mr7177612edj.42.1713243051583;
        Mon, 15 Apr 2024 21:50:51 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-50.web.vodafone.de. [109.43.179.50])
        by smtp.gmail.com with ESMTPSA id e21-20020a056402105500b0056e685b1d45sm5638987edu.87.2024.04.15.21.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 21:50:51 -0700 (PDT)
Message-ID: <75b85c85-1c82-487b-91dd-024c2e7163e1@redhat.com>
Date: Tue, 16 Apr 2024 06:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v8 03/35] migration: Add a migrate_skip
 command
To: Nicholas Piggin <npiggin@gmail.com>, Nico Boehr <nrb@linux.ibm.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
 <20240405083539.374995-4-npiggin@gmail.com>
 <171259197029.48513.5232971921641010684@t14-nrb>
 <D0L83A745KF8.1KXG6GEDFXSZD@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <D0L83A745KF8.1KXG6GEDFXSZD@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/04/2024 05.22, Nicholas Piggin wrote:
> On Tue Apr 9, 2024 at 1:59 AM AEST, Nico Boehr wrote:
>> Quoting Nicholas Piggin (2024-04-05 10:35:04)
>> [...]
>>> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
>>> index 39419d4e2..4a1aab48d 100644
>>> --- a/scripts/arch-run.bash
>>> +++ b/scripts/arch-run.bash
>> [...]
>>> @@ -179,8 +189,11 @@ run_migration ()
>>>                  # Wait for test exit or further migration messages.
>>>                  if ! seen_migrate_msg ${src_out} ;  then
>>>                          sleep 0.1
>>> -               else
>>> +               elif grep -q "Now migrate the VM" < ${src_out} ; then
>>>                          do_migration || return $?
>>> +               elif [ $skip_migration -eq 0 ] && grep -q "Skipped VM migration" < ${src_out} ; then
>>> +                       echo > ${src_infifo} # Resume src and carry on.
>>> +                       break;
>>
>> If I understand the code correctly, this simply makes the test PASS when
>> migration is skipped, am I wrong?
> 
> This just gets the harness past the wait-for-migration phase, it
> otherwise should not change behaviour.
> 
>> If so, can we set ret=77 here so we get a nice SKIP?
> 
> The harness _should_ still scan the status value printed by the
> test case when it exits. Is it not working as expected? We
> certainly should be able to make it SKIP.

I just gave it a try (by modifying the selftest-migration-skip test 
accordingly), and it seems to work fine, so I think this patch here should 
be ok.

  Thomas


