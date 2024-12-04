Return-Path: <linuxppc-dev+bounces-3760-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6BC9E309B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 02:01:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2zjm4PHzz2yRF;
	Wed,  4 Dec 2024 12:01:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::d31"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733274076;
	cv=none; b=meXXKLQFYezQlh4zLqGe/7Q0Ve1dYwOD9Y+zRn17jU/Tby08wJzuVMrzN6/zXodaTA2cu8zEScisHPcQwrhtwweL7ocbAz7rrrEgvvOjwlNrtuI/0NQcmrmtC4MZHShzJzCqTlcaZapAsMecP5vY81T7Wiz2Km6mCrXG/IH/OEghEHf6z3pl3/C+PfKl99HzvU5+Uw/JtYTFXsH1cZwPxNZYa4jxebSO4iie/pVEWl4X1Z7wHlE6XaDFPZkU/bybIP0HwiDjEfK4RguKfg8rGluNXFzSjgq1rtnb3vZ/gpvxMXonP/XaSD+UYYn2QUgIinPhWM8Pv1sCqPoAaYff5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733274076; c=relaxed/relaxed;
	bh=NA+ElRETJKY5CqdJTdKRnj5fYbwfNKrJQ8Yc5F8bfeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFNDEgk3V8J8bRk0xW63PbGymk8p46UaeTC6/v4ahrILsg/M5CUTflCOae17AWD++9xKQEbLy7LmfzNYQlorqKNLIWlm/+PNLpU4FkeuhVgsTtJhWVx3dA38iPmkTzDjVtq3RS5NgAyRaPe8J8C+GrjZKr2WXEH9wmQyT0Li9o3cnBmkvl970/IiB8Md4IYUsH9itG3dqDgGwx92JXj7Z0q7IiTCmGgGWR1wypatvrzxIiyv1gArjTVMmHZEXFn83B2P1rMefKTPJ9xa06F9pyHv7RpxXEp4dErFOEVh69QNpyPxriqBFZIb2TSN99/HkOVKIptFmg8PKqvDFJfsBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=SaKG4R+G; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=SaKG4R+G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2zjj1l2pz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 12:01:12 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-84197c469cfso202088039f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 17:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733274068; x=1733878868; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NA+ElRETJKY5CqdJTdKRnj5fYbwfNKrJQ8Yc5F8bfeI=;
        b=SaKG4R+G1zs3iW1WFUi8KRxXSjqM5BeiFIRwDgWchCmmwkpaOu0sYuWeanXeZMUJIZ
         XL+avDxBGnHwSPDsXIPzzQD2fhXNdgvoaQbreS26Wf4SPIpP6HFoeH4WAatadjMJ73zo
         vAXsIYEtH2dzfypE3D4MnlUs1Q9VQbIN0zYtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733274068; x=1733878868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NA+ElRETJKY5CqdJTdKRnj5fYbwfNKrJQ8Yc5F8bfeI=;
        b=lYcXB95gFJuwCdL6tUAP+K4Ye1X6uCwZ/F3EWh33Sl64ouIhur3OYoAfSMlc7iZMsH
         q9zmDyE2DqT/5/tPofkH8+b63xKfhJyZxBOeaRgIITmCQdx1QhuCWJPzFt4FeoKgIbEC
         3HIwW8BGfhj6o1+hiFwrCKk2ZNx8jrgFfbpNxLpR0fdZc7cKRIA0zQAcPi3WhKSjAZjr
         PYADIuoexzPeel2rgyW3nppzHFaEEAPcBzVJ2pVv//OeCMRNHtbPabvpEMdz9Yv2Cihv
         OF6yE4NrXQmCOX89yhUDVMAFWZXVRSz3ubknqr49elTi+2kqy18bDRX3BhUb8v1akNsw
         msyA==
X-Forwarded-Encrypted: i=1; AJvYcCW3KAlRCgJTEAOeATtfwiMivpACBHQJvr7/bc63UZvF2e9vAkOyb7srYU6R6nadQvr/RPaba1UZpCo9uJU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy8W0Jzgge6pyDTEh50NJ+lB/GcMb2si7YErxwr3De9bi2YNiRr
	I1vgyw4kX2f4ceRwW3yDE9vVeIB173eImKck5dAG1OFnHYTeKWd0JUu7ZLVe05w=
X-Gm-Gg: ASbGncvLHmxAOTyo6ycZs5eyFLw2feDSnEKbu4YtkzTyyTP+g8OsCvEabqcrDCIIj5P
	vKiorh2KM4XiNAwBZsJznrmTWqd0Bl+cbbjtAbdxOSc0da6GBnfmoZ7QWuhUr9hyFnyIScx9EPl
	reWLautmC6++1aQ2mg4hsKR8U3ZLBNECHqeHngJM6ekbt3Bpb391mX+9xn2yY7RhUGgM2kg2Ps9
	KAG7J3K+INBXjznHrFTCTPOCZQMf+wNOiCHsCnWNxGCNRY/ncwOnuaB+pkq7A==
X-Google-Smtp-Source: AGHT+IFa+Bd2NpYOHu6EHzfrniiaLxPU/ePwfT0m1+/YTPvjeHG3Isi7m4kg/5QlpdI+LxP5aHV9sA==
X-Received: by 2002:a05:6e02:164f:b0:3a6:ac4e:264a with SMTP id e9e14a558f8ab-3a7f9a46431mr58360885ab.10.1733274067594;
        Tue, 03 Dec 2024 17:01:07 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e230e779e8sm2783394173.137.2024.12.03.17.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 17:01:06 -0800 (PST)
Message-ID: <fa1e747f-1823-4d20-86c0-b85a3b959952@linuxfoundation.org>
Date: Tue, 3 Dec 2024 18:01:06 -0700
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/ftrace: adjust offset for kprobe syntax
 error test
To: Steven Rostedt <rostedt@goodmis.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Naveen N. Rao" <naveen@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241129202621.721159-1-hbathini@linux.ibm.com>
 <20241202144111.75d1bb3b@gandalf.local.home>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241202144111.75d1bb3b@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/2/24 12:41, Steven Rostedt wrote:
> On Sat, 30 Nov 2024 01:56:21 +0530
> Hari Bathini <hbathini@linux.ibm.com> wrote:
> 
>> In 'NOFENTRY_ARGS' test case for syntax check, any offset X of
>> `vfs_read+X` except function entry offset (0) fits the criterion,
>> even if that offset is not at instruction boundary, as the parser
>> comes before probing. But with "ENDBR64" instruction on x86, offset
>> 4 is treated as function entry. So, X can't be 4 as well. Thus, 8
>> was used as offset for the test case. On 64-bit powerpc though, any
>> offset <= 16 can be considered function entry depending on build
>> configuration (see arch_kprobe_on_func_entry() for implementation
>> details). So, use `vfs_read+20` to accommodate that scenario too.
>>
>> Suggested-by: Masami Hiramatsu <mhiramat@kernel.org>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> 
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> 
> Shuah,
> 
> Can you take this through your tree?

Yes I can take it. I do have question about whether this is
a fix - sounds like it is from the change log.

Clearly stating that it is a fix will help so it can be picked
up for stables.

thanks,
-- Shuah

