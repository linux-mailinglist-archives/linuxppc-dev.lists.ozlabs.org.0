Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0108BFED5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:37:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8RLtDwY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8RLtDwY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGQl6LqTz3cCt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:37:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8RLtDwY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X8RLtDwY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGQ043mQz30VS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:36:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715175378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jlOOVvquEONflhjYihi2YNb8HhKu47eWlw4WXGMSFeE=;
	b=X8RLtDwYO5ZKL1qQpMbIfatYvorftQuoorhWrjohsgrO51G9wzNUi2FPejNtLBl7CAu2B4
	xeqhPXov43sYk4AIf7gf9W9vGFiVXiY3K41wx1sAuBPAKE+oD71rS81IP3vVLYr9fn6Li2
	uvMVMRtR26HTLa0iC+fJu6XEjOIZyBg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715175378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jlOOVvquEONflhjYihi2YNb8HhKu47eWlw4WXGMSFeE=;
	b=X8RLtDwYO5ZKL1qQpMbIfatYvorftQuoorhWrjohsgrO51G9wzNUi2FPejNtLBl7CAu2B4
	xeqhPXov43sYk4AIf7gf9W9vGFiVXiY3K41wx1sAuBPAKE+oD71rS81IP3vVLYr9fn6Li2
	uvMVMRtR26HTLa0iC+fJu6XEjOIZyBg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-dwf8yT8rNiiV3JBFxa7ugA-1; Wed, 08 May 2024 09:36:16 -0400
X-MC-Unique: dwf8yT8rNiiV3JBFxa7ugA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-41c0c438a97so14805095e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2024 06:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715175375; x=1715780175;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jlOOVvquEONflhjYihi2YNb8HhKu47eWlw4WXGMSFeE=;
        b=kdrOuDv08ukg3rPsFzh53MSm8ToX2moG/I5JWRMFF3fYNtPM+tkY5vC5612uIdd48I
         5OtlOE5F/6UNROXr25TEHV3/M1r+Djns0zruT+FSs+EgiR1/KbynM0wAgwAf1oaRrWAM
         v6nb1J8C1v8FVMylMyFwyvqNYRHe02NebHImvPohd2yk2kOodV7G9EGTeoX3UY6ymEFd
         PUiJZL9dffQp+/liX56gHclVtTNVcoQQYvUsAzl/Pp7YLHdjMxlrQz3AkGjqErBaANnP
         rBIUAqDeQTWm4DcRUvxJkgHfMewDxzGF2wsYHetGxfbcueKKnAGTalstLSkMAiqoGOWt
         rQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWOupZQjxAtkuAMKVhNsfdcxDcHK9z+pB/mFPKNJeJ3YlprfH6fcAoOyt7q+JsL2n3mUm5yBujxTF60B1JEWtUv9LIP8tkiHXLUsLV8w==
X-Gm-Message-State: AOJu0Yx0MYdHfa9FbhE/PupDPhlDToOVxloGAf5pF6lJo9rtNp8CFOGF
	X71PYl3SQlONdbNDsCvuHgnFbK6MfcGsWAG+w2AKoEHQ8WmPiPX3iS+y6dHRhJbGgi2jkfl7KKO
	aY9NHhCfh5xNEjMaEt/hADM/UzWafSDhs08Smx1bqPRqGTFw3XhFeC68NGw+2R09e+5+V6h0=
X-Received: by 2002:a05:600c:5027:b0:418:d6f2:a97a with SMTP id 5b1f17b1804b1-41f71cd2685mr27463635e9.13.1715175375048;
        Wed, 08 May 2024 06:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHr5S6VX+J+5hPD+jWfX8CO9JkNOJmRGWnOHIbdlGmr1BrExt9NlJKhWg/GQQf9KYlZRjb0w==
X-Received: by 2002:a05:600c:5027:b0:418:d6f2:a97a with SMTP id 5b1f17b1804b1-41f71cd2685mr27463435e9.13.1715175374590;
        Wed, 08 May 2024 06:36:14 -0700 (PDT)
Received: from [10.33.192.191] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41facbd295fsm5326515e9.36.2024.05.08.06.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 06:36:14 -0700 (PDT)
Message-ID: <50e43047-b251-465b-b4b0-b5987ec9aa78@redhat.com>
Date: Wed, 8 May 2024 15:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 07/31] scripts: allow machine option to
 be specified in unittests.cfg
From: Thomas Huth <thuth@redhat.com>
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-8-npiggin@gmail.com>
 <e0df1892-c17f-4fc3-b95a-4efc0af917d3@redhat.com>
 <D149GFR9LAZH.1X2F7YKPEJ42C@gmail.com>
 <f304924b-8acf-40f6-9426-10fdf77712b6@redhat.com>
 <1e07de7a-5b14-4168-aa14-56dae8766dc0@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <1e07de7a-5b14-4168-aa14-56dae8766dc0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/05/2024 14.58, Thomas Huth wrote:
> On 08/05/2024 14.55, Thomas Huth wrote:
>> On 08/05/2024 14.27, Nicholas Piggin wrote:
>>> On Wed May 8, 2024 at 1:08 AM AEST, Thomas Huth wrote:
>>>> On 04/05/2024 14.28, Nicholas Piggin wrote:
>>>>> This allows different machines with different requirements to be
>>>>> supported by run_tests.sh, similarly to how different accelerators
>>>>> are handled.
>>>>>
>>>>> Acked-by: Thomas Huth <thuth@redhat.com>
>>>>> Acked-by: Andrew Jones <andrew.jones@linux.dev>
>>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>>> ---
>>>>>    docs/unittests.txt   |  7 +++++++
>>>>>    scripts/common.bash  |  8 ++++++--
>>>>>    scripts/runtime.bash | 16 ++++++++++++----
>>>>>    3 files changed, 25 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/docs/unittests.txt b/docs/unittests.txt
>>>>> index 7cf2c55ad..6449efd78 100644
>>>>> --- a/docs/unittests.txt
>>>>> +++ b/docs/unittests.txt
>>>>> @@ -42,6 +42,13 @@ For <arch>/ directories that support multiple 
>>>>> architectures, this restricts
>>>>>    the test to the specified arch. By default, the test will run on any
>>>>>    architecture.
>>>>> +machine
>>>>> +-------
>>>>> +For those architectures that support multiple machine types, this 
>>>>> restricts
>>>>> +the test to the specified machine. By default, the test will run on
>>>>> +any machine type. (Note, the machine can be specified with the MACHINE=
>>>>> +environment variable, and defaults to the architecture's default.)
>>>>> +
>>>>>    smp
>>>>>    ---
>>>>>    smp = <number>
>>>>> diff --git a/scripts/common.bash b/scripts/common.bash
>>>>> index 5e9ad53e2..3aa557c8c 100644
>>>>> --- a/scripts/common.bash
>>>>> +++ b/scripts/common.bash
>>>>> @@ -10,6 +10,7 @@ function for_each_unittest()
>>>>>        local opts
>>>>>        local groups
>>>>>        local arch
>>>>> +    local machine
>>>>>        local check
>>>>>        local accel
>>>>>        local timeout
>>>>> @@ -21,7 +22,7 @@ function for_each_unittest()
>>>>>            if [[ "$line" =~ ^\[(.*)\]$ ]]; then
>>>>>                rematch=${BASH_REMATCH[1]}
>>>>>                if [ -n "${testname}" ]; then
>>>>> -                $(arch_cmd) "$cmd" "$testname" "$groups" "$smp" 
>>>>> "$kernel" "$opts" "$arch" "$check" "$accel" "$timeout"
>>>>> +                $(arch_cmd) "$cmd" "$testname" "$groups" "$smp" 
>>>>> "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>>>>>                fi
>>>>>                testname=$rematch
>>>>>                smp=1
>>>>> @@ -29,6 +30,7 @@ function for_each_unittest()
>>>>>                opts=""
>>>>>                groups=""
>>>>>                arch=""
>>>>> +            machine=""
>>>>>                check=""
>>>>>                accel=""
>>>>>                timeout=""
>>>>> @@ -58,6 +60,8 @@ function for_each_unittest()
>>>>>                groups=${BASH_REMATCH[1]}
>>>>>            elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
>>>>>                arch=${BASH_REMATCH[1]}
>>>>> +        elif [[ $line =~ ^machine\ *=\ *(.*)$ ]]; then
>>>>> +            machine=${BASH_REMATCH[1]}
>>>>>            elif [[ $line =~ ^check\ *=\ *(.*)$ ]]; then
>>>>>                check=${BASH_REMATCH[1]}
>>>>>            elif [[ $line =~ ^accel\ *=\ *(.*)$ ]]; then
>>>>> @@ -67,7 +71,7 @@ function for_each_unittest()
>>>>>            fi
>>>>>        done
>>>>>        if [ -n "${testname}" ]; then
>>>>> -        $(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" 
>>>>> "$opts" "$arch" "$check" "$accel" "$timeout"
>>>>> +        $(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" 
>>>>> "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>>>>>        fi
>>>>>        exec {fd}<&-
>>>>>    }
>>>>> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
>>>>> index 177b62166..0c96d6ea2 100644
>>>>> --- a/scripts/runtime.bash
>>>>> +++ b/scripts/runtime.bash
>>>>> @@ -32,7 +32,7 @@ premature_failure()
>>>>>    get_cmdline()
>>>>>    {
>>>>>        local kernel=$1
>>>>> -    echo "TESTNAME=$testname TIMEOUT=$timeout ACCEL=$accel 
>>>>> $RUNTIME_arch_run $kernel -smp $smp $opts"
>>>>> +    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine 
>>>>> ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
>>>>>    }
>>>>>    skip_nodefault()
>>>>> @@ -80,9 +80,10 @@ function run()
>>>>>        local kernel="$4"
>>>>>        local opts="$5"
>>>>>        local arch="$6"
>>>>> -    local check="${CHECK:-$7}"
>>>>> -    local accel="$8"
>>>>> -    local timeout="${9:-$TIMEOUT}" # unittests.cfg overrides the default
>>>>> +    local machine="$7"
>>>>> +    local check="${CHECK:-$8}"
>>>>> +    local accel="$9"
>>>>> +    local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
>>>>>        if [ "${CONFIG_EFI}" == "y" ]; then
>>>>>            kernel=${kernel/%.flat/.efi}
>>>>> @@ -116,6 +117,13 @@ function run()
>>>>>            return 2
>>>>>        fi
>>>>> +    if [ -n "$machine" ] && [ -n "$MACHINE" ] && [ "$machine" != 
>>>>> "$MACHINE" ]; then
>>>>> +        print_result "SKIP" $testname "" "$machine only"
>>>>> +        return 2
>>>>> +    elif [ -n "$MACHINE" ]; then
>>>>> +        machine="$MACHINE"
>>>>> +    fi
>>>>> +
>>>>>        if [ -n "$accel" ] && [ -n "$ACCEL" ] && [ "$accel" != "$ACCEL" 
>>>>> ]; then
>>>>>            print_result "SKIP" $testname "" "$accel only, but 
>>>>> ACCEL=$ACCEL"
>>>>>            return 2
>>>>
>>>> For some reasons that I don't quite understand yet, this patch causes the
>>>> "sieve" test to always timeout on the s390x runner, see e.g.:
>>>>
>>>>    https://gitlab.com/thuth/kvm-unit-tests/-/jobs/6798954987
>>>
>>> How do you use the s390x runner?
>>>
>>>>
>>>> Everything is fine in the previous patches (I pushed now the previous 5
>>>> patches to the repo):
>>>>
>>>>    https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/pipelines/1281919104
>>>>
>>>> Could it be that he TIMEOUT gets messed up in certain cases?
>>>
>>> Hmm not sure yet. At least it got timeout right for the duration=90s
>>> message.
>>
>> That seems to be wrong, the test is declared like this in 
>> s390x/unittests.cfg :
>>
>> [sieve]
>> file = sieve.elf
>> groups = selftest
>> # can take fairly long when KVM is nested inside z/VM
>> timeout = 600
>>
>> And indeed, it takes way longer than 90 seconds on that CI machine, so the 
>> timeout after 90 seconds should not occur here...
> 
> I guess you need to adjust arch_cmd_s390x in scripts/s390x/func.bash to be 
> aware of the new parameter, too?

This seems to fix the problem:

diff --git a/scripts/s390x/func.bash b/scripts/s390x/func.bash
index fa47d019..6b817727 100644
--- a/scripts/s390x/func.bash
+++ b/scripts/s390x/func.bash
@@ -13,12 +13,13 @@ function arch_cmd_s390x()
         local kernel=$5
         local opts=$6
         local arch=$7
-       local check=$8
-       local accel=$9
-       local timeout=${10}
+       local machine=$8
+       local check=$9
+       local accel=${10}
+       local timeout=${11}
  
         # run the normal test case
-       "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$check" "$accel" "$timeout"
+       "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
  
         # run PV test case
         if [ "$accel" = 'tcg' ] || grep -q "migration" <<< "$groups"; then

If you don't like to respin, I can add it to the patch while picking it up?

  Thomas

