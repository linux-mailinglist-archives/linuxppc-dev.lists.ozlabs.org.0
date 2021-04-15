Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F2336043A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 10:25:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLXV24MFBz3bvN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 18:25:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FrLbKiWI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UJbcKBLM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=FrLbKiWI; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=UJbcKBLM; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLXTY5cZNz2xyC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 18:25:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618475115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bQmWZhJFBGurEcgsfC0EuOHiXGG/UZMr42BKHCg0CM=;
 b=FrLbKiWI78+iV+MeIABfx+K9zAaRG/DDZJY6QU8LGlMryR2JBVkthmbJWj0GSj+fyfxu1w
 kCoD4Jofj26FBTwiLgkIoqTirJOGbYiH9fKKAYiCJPDTeOJ2CR423ZNrzaFetgEubFODyr
 RsvI7E0cksB0klAXaN6FDIZrz35Z4eA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618475116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bQmWZhJFBGurEcgsfC0EuOHiXGG/UZMr42BKHCg0CM=;
 b=UJbcKBLM63tXFdhL6+sbafxYYoa0aUY/icViLfFSJ3OpAIqwZ3EUxYDHXeuiawYzlbpV1q
 zkNBIpUjZlT9iEScEp5M68IQSwUKFdPl6Lks6dbTmfD8MpuLrNpc0N5IzAyhrGr+Mt0/WN
 ep1A56TsRhtbds8aPFUdyGazSylvnuE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-TN07U8r-Od-6qmW_jA9Dqw-1; Thu, 15 Apr 2021 04:25:14 -0400
X-MC-Unique: TN07U8r-Od-6qmW_jA9Dqw-1
Received: by mail-ej1-f70.google.com with SMTP id
 p26-20020a170906a01ab0290373d37378f3so657406ejy.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 01:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/bQmWZhJFBGurEcgsfC0EuOHiXGG/UZMr42BKHCg0CM=;
 b=QkxyeDCE0tZ7pxmZRL++SUDZu9WwzDj54xR3DTVMzIaSt4nQdl383O0xQ8dO87AxzK
 ThPaBLe6HzKRIbJJcCdvIYfTrlVWjMl2SBORvotu+5IS8NWNOg2lAmVpHIczHCeOQ/fV
 fw0byMdwkzZEw/hM9JrkMOfYKTq/+7DA6+KK+ndHq0fPU+SZTKUulaq7vEVzNTr2dgmf
 jx7g5f/dvVwYFNLnYTMTeqY5e2dak6R7KIEYwm9ziOxRwfIjgnPJyB2P3lX+JmwheZQr
 9joDnY06SCRhUiE76CVJ6i6VjlR3SlX1AzB4Zq3sCYGStQ47ImnNyzi2Q22UqhzIcHES
 8Q8g==
X-Gm-Message-State: AOAM531/7zvqYUurb7Q1VR1BtlzVozT3wWJ0Sy71e/impDczM/91zhSQ
 l2EiqKTjTU1gDL/32C4oQGUw9orYmX0jnhRKP8Sv1LDn4hRxqKaUlfA4K8Dm24oOBRx+nl0j8IC
 jIY6zykH1Li2ds6LZ/pUAqyG+Nw==
X-Received: by 2002:a17:906:fb90:: with SMTP id
 lr16mr2188966ejb.173.1618475113127; 
 Thu, 15 Apr 2021 01:25:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV9d4Hf8P/msHacfoZkJ3KBX3z8yqEirLBflCXrob29FKDQvETDro/hTdN8fxJUXyuYv/GnQ==
X-Received: by 2002:a17:906:fb90:: with SMTP id
 lr16mr2188956ejb.173.1618475112977; 
 Thu, 15 Apr 2021 01:25:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id bm13sm1380535ejb.75.2021.04.15.01.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 01:25:12 -0700 (PDT)
Subject: Re: [PATCH 2/2] tools: do not include scripts/Kbuild.include
To: Masahiro Yamada <masahiroy@kernel.org>
References: <20210415072700.147125-1-masahiroy@kernel.org>
 <20210415072700.147125-2-masahiroy@kernel.org>
 <9d33ee98-9de3-2215-0c0b-cc856cec1b69@redhat.com>
 <CAK7LNAQupbmeEVR0njSciv0X9FD+MofeB2Xm=wprEdNaO4TQKQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2e46231f-1d30-6a6f-c768-f34295376d0a@redhat.com>
Date: Thu, 15 Apr 2021 10:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQupbmeEVR0njSciv0X9FD+MofeB2Xm=wprEdNaO4TQKQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Song Liu <songliubraving@fb.com>, kvm@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, Janosch Frank <frankja@linux.ibm.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Harish <harish@linux.ibm.com>,
 Yonghong Song <yhs@fb.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 KP Singh <kpsingh@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Networking <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/04/21 10:04, Masahiro Yamada wrote:
> On Thu, Apr 15, 2021 at 4:40 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>> I think it would make sense to add try-run, cc-option and
>> .DELETE_ON_ERROR to tools/build/Build.include?
> 
> To be safe, I just copy-pasted what the makefiles need.
> If someone wants to refactor the tool build system, that is fine,
> but, to me, I do not see consistent rules or policy under tools/.

"Please put this in a common file instead of introducing duplication" is 
not asking for wholesale refactoring.

Paolo

