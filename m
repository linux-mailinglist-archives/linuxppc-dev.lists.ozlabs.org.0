Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F7F8BFDD0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 14:56:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d3GDKmvU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RWB5PRvb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZFWT3sYkz3cX2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 22:56:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=d3GDKmvU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RWB5PRvb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZFVh2m8Fz30TC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 22:55:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715172919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iYKRviCO0ESwo/Q7IHwYeyGnhjgwSW6TPsvug1uoKLc=;
	b=d3GDKmvU7ol3TpinKG8jsAfNDkYGGraxTQAVVuH75JOAs73ta/7AgGKATKIQX85QVgenGA
	+zTBHFb/P+5KhoLgJlrffeZBtMieKuVjhzOwNV2+N8GSNpWOKa1f6WIwfScADFQYX2eTqd
	A0jRE9F+0qWTvbyKz/MqJlepem4OsJw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715172920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iYKRviCO0ESwo/Q7IHwYeyGnhjgwSW6TPsvug1uoKLc=;
	b=RWB5PRvbWhiki7zaKmBLPGfDDKPtMeJfhEGS50j4ZfgSze+dhbts5+d9eIiZbhd5tUU9iR
	gvANdrIgE4XIhYxvfD0cpUIm8BN6RNBRR9Gb23hSo+55cfDStWaVQ1+bHwqDe/WSjpPtB7
	8/RAilZgxKfg/UKPjOdyjPpmdy+tttI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-rmCECIBTO9WaooBRhjD2GA-1; Wed, 08 May 2024 08:55:18 -0400
X-MC-Unique: rmCECIBTO9WaooBRhjD2GA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-41facbcfa40so493325e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2024 05:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715172917; x=1715777717;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYKRviCO0ESwo/Q7IHwYeyGnhjgwSW6TPsvug1uoKLc=;
        b=HxoHDo7kQTNPNbMoluyj2NU1rRSDM3DTemgbq02aX7+wtmXFhu977dxzLTwzwKtn/H
         nrQR1Nr6k/3+DVP9J9qsy1x0bfBlcTkXVhSrZjp6Gmg3RFRP9wLhhpOY+BVoXRc1KsPJ
         XIxYp5uVFBvzo0s+qDCLJjv3VsRVswxa5eD13o0TCju/55XXohk44thOsPrGdN/+lmIJ
         r+UQoi3o/dATbup0VLckXxr1OUF8hA4EiCepxX7xil/N5aZyfla5719OSuWXvdRkWX6/
         esK8pm8VP90Ne0Y/Yaw7jKdygaDUUMgCJzFOJr8vqw/ooy5nwOic5FXVEqUY/yZ8ocqn
         KRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeu903KGiAU7ArqEs0kdMxxDX40dmY6kEjoybWRx7injCoMC29je4usaQk+UNWJiqzU3NZttsLdd223WBlL4LhYEP6ia0koHVUa/LULA==
X-Gm-Message-State: AOJu0YxxAU0k2Dcqpl8aUz5cHw6xXjIKy/uWiNNTdr84S+V0z1cOxI4P
	w5JXuPx8mk0TrG7s2rmmAFSKfHiBL5qmJOaGd2dXfH9FWsYhEVKFZLjRfav8qVp+iOcomcuN0sF
	VyuSJbgXGxFUeFo8lJF8cZZlI3/Wp/WGeCbA9tvBG1RxOwitezqA21cfYL79r+Bg=
X-Received: by 2002:a05:600c:548e:b0:41a:408b:dbaa with SMTP id 5b1f17b1804b1-41f7093c527mr23352905e9.0.1715172917024;
        Wed, 08 May 2024 05:55:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYLU3AMWrITBc7txQdaLPQ7PZ2/BPNTBSnySZhsBKwezfWi1nBEFFZ4Muj5kJ28lbO4Tv1zw==
X-Received: by 2002:a05:600c:548e:b0:41a:408b:dbaa with SMTP id 5b1f17b1804b1-41f7093c527mr23352715e9.0.1715172916642;
        Wed, 08 May 2024 05:55:16 -0700 (PDT)
Received: from [10.33.192.191] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id h18-20020a056000001200b0034c78001f6asm15289416wrx.109.2024.05.08.05.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 05:55:16 -0700 (PDT)
Message-ID: <f304924b-8acf-40f6-9426-10fdf77712b6@redhat.com>
Date: Wed, 8 May 2024 14:55:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 07/31] scripts: allow machine option to
 be specified in unittests.cfg
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-8-npiggin@gmail.com>
 <e0df1892-c17f-4fc3-b95a-4efc0af917d3@redhat.com>
 <D149GFR9LAZH.1X2F7YKPEJ42C@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <D149GFR9LAZH.1X2F7YKPEJ42C@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/05/2024 14.27, Nicholas Piggin wrote:
> On Wed May 8, 2024 at 1:08 AM AEST, Thomas Huth wrote:
>> On 04/05/2024 14.28, Nicholas Piggin wrote:
>>> This allows different machines with different requirements to be
>>> supported by run_tests.sh, similarly to how different accelerators
>>> are handled.
>>>
>>> Acked-by: Thomas Huth <thuth@redhat.com>
>>> Acked-by: Andrew Jones <andrew.jones@linux.dev>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    docs/unittests.txt   |  7 +++++++
>>>    scripts/common.bash  |  8 ++++++--
>>>    scripts/runtime.bash | 16 ++++++++++++----
>>>    3 files changed, 25 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/docs/unittests.txt b/docs/unittests.txt
>>> index 7cf2c55ad..6449efd78 100644
>>> --- a/docs/unittests.txt
>>> +++ b/docs/unittests.txt
>>> @@ -42,6 +42,13 @@ For <arch>/ directories that support multiple architectures, this restricts
>>>    the test to the specified arch. By default, the test will run on any
>>>    architecture.
>>>    
>>> +machine
>>> +-------
>>> +For those architectures that support multiple machine types, this restricts
>>> +the test to the specified machine. By default, the test will run on
>>> +any machine type. (Note, the machine can be specified with the MACHINE=
>>> +environment variable, and defaults to the architecture's default.)
>>> +
>>>    smp
>>>    ---
>>>    smp = <number>
>>> diff --git a/scripts/common.bash b/scripts/common.bash
>>> index 5e9ad53e2..3aa557c8c 100644
>>> --- a/scripts/common.bash
>>> +++ b/scripts/common.bash
>>> @@ -10,6 +10,7 @@ function for_each_unittest()
>>>    	local opts
>>>    	local groups
>>>    	local arch
>>> +	local machine
>>>    	local check
>>>    	local accel
>>>    	local timeout
>>> @@ -21,7 +22,7 @@ function for_each_unittest()
>>>    		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
>>>    			rematch=${BASH_REMATCH[1]}
>>>    			if [ -n "${testname}" ]; then
>>> -				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$check" "$accel" "$timeout"
>>> +				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>>>    			fi
>>>    			testname=$rematch
>>>    			smp=1
>>> @@ -29,6 +30,7 @@ function for_each_unittest()
>>>    			opts=""
>>>    			groups=""
>>>    			arch=""
>>> +			machine=""
>>>    			check=""
>>>    			accel=""
>>>    			timeout=""
>>> @@ -58,6 +60,8 @@ function for_each_unittest()
>>>    			groups=${BASH_REMATCH[1]}
>>>    		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
>>>    			arch=${BASH_REMATCH[1]}
>>> +		elif [[ $line =~ ^machine\ *=\ *(.*)$ ]]; then
>>> +			machine=${BASH_REMATCH[1]}
>>>    		elif [[ $line =~ ^check\ *=\ *(.*)$ ]]; then
>>>    			check=${BASH_REMATCH[1]}
>>>    		elif [[ $line =~ ^accel\ *=\ *(.*)$ ]]; then
>>> @@ -67,7 +71,7 @@ function for_each_unittest()
>>>    		fi
>>>    	done
>>>    	if [ -n "${testname}" ]; then
>>> -		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$check" "$accel" "$timeout"
>>> +		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>>>    	fi
>>>    	exec {fd}<&-
>>>    }
>>> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
>>> index 177b62166..0c96d6ea2 100644
>>> --- a/scripts/runtime.bash
>>> +++ b/scripts/runtime.bash
>>> @@ -32,7 +32,7 @@ premature_failure()
>>>    get_cmdline()
>>>    {
>>>        local kernel=$1
>>> -    echo "TESTNAME=$testname TIMEOUT=$timeout ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
>>> +    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
>>>    }
>>>    
>>>    skip_nodefault()
>>> @@ -80,9 +80,10 @@ function run()
>>>        local kernel="$4"
>>>        local opts="$5"
>>>        local arch="$6"
>>> -    local check="${CHECK:-$7}"
>>> -    local accel="$8"
>>> -    local timeout="${9:-$TIMEOUT}" # unittests.cfg overrides the default
>>> +    local machine="$7"
>>> +    local check="${CHECK:-$8}"
>>> +    local accel="$9"
>>> +    local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
>>>    
>>>        if [ "${CONFIG_EFI}" == "y" ]; then
>>>            kernel=${kernel/%.flat/.efi}
>>> @@ -116,6 +117,13 @@ function run()
>>>            return 2
>>>        fi
>>>    
>>> +    if [ -n "$machine" ] && [ -n "$MACHINE" ] && [ "$machine" != "$MACHINE" ]; then
>>> +        print_result "SKIP" $testname "" "$machine only"
>>> +        return 2
>>> +    elif [ -n "$MACHINE" ]; then
>>> +        machine="$MACHINE"
>>> +    fi
>>> +
>>>        if [ -n "$accel" ] && [ -n "$ACCEL" ] && [ "$accel" != "$ACCEL" ]; then
>>>            print_result "SKIP" $testname "" "$accel only, but ACCEL=$ACCEL"
>>>            return 2
>>
>> For some reasons that I don't quite understand yet, this patch causes the
>> "sieve" test to always timeout on the s390x runner, see e.g.:
>>
>>    https://gitlab.com/thuth/kvm-unit-tests/-/jobs/6798954987
> 
> How do you use the s390x runner?
> 
>>
>> Everything is fine in the previous patches (I pushed now the previous 5
>> patches to the repo):
>>
>>    https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/pipelines/1281919104
>>
>> Could it be that he TIMEOUT gets messed up in certain cases?
> 
> Hmm not sure yet. At least it got timeout right for the duration=90s
> message.

That seems to be wrong, the test is declared like this in s390x/unittests.cfg :

[sieve]
file = sieve.elf
groups = selftest
# can take fairly long when KVM is nested inside z/VM
timeout = 600

And indeed, it takes way longer than 90 seconds on that CI machine, so the 
timeout after 90 seconds should not occur here...

  Thomas

