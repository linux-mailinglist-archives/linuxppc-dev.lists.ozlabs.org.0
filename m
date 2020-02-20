Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58716681F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 21:11:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Nm266rc1zDqYV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 07:11:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=DAkOWfFv; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NfCs31SfzDqSq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 02:49:25 +1100 (AEDT)
Received: by mail-io1-xd43.google.com with SMTP id z1so5164390iom.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 07:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TNlV6j5dy2YpzNbMudPK2N6M4tmat+Q7yeBq9QSr2Cc=;
 b=DAkOWfFvuULYeW4zlDdUrSsxfOp2+6i3eNbNfme23q36UoDRNBkz3lGrwWsQARSF/b
 Bhcp7v4C73l4K6NITvym0C/OScIwDVQouN0vfj9CVVGbIxiQwUwfFxyjlbjrB23zO+ye
 ChHirGZ2CzowM+kOAz1UKlh2JTJKtBhGXeduU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TNlV6j5dy2YpzNbMudPK2N6M4tmat+Q7yeBq9QSr2Cc=;
 b=kItI2zFATC4gBxUwxi5hyFkHHQiH56W2gtKO3I2FNdfGq4CJfxwSSZcs8h6HidB1hg
 vbtiYPoMA9iZRavh8uqjuYKGG7UW9P3odz1b9O/ZWR1DZUSiiRBrEKIN58q96XT68rND
 Lw7Nrfeyh/ddgnRL0Rx66XwqjK2A0KPd2VTTypQReqVhlbBWSO1AY28I3CQS2I2jrxXv
 MCWZXq2WDlzyNROHTgiEkc8AYAPZPR1pfHidSCQWLyXOgLt0f+W37pg4OpoQw3kCG32u
 DcCpvMoFZkr3JBCmTrN81HB221yhC5THZz+L+kabRtK76NCg/cPZGMpB6qj8drqgV0cE
 VweQ==
X-Gm-Message-State: APjAAAUI9ZcCaroz7I/3K41g6rWihhOC+JLNN7Ev6h0CFPtq9qZ+NzDs
 2TU9twiqD0UdSbDXhviGVgQlJQ==
X-Google-Smtp-Source: APXvYqwo5E+136MY2CwhDaw8W8F8otbFcd8wGERgcY8BOLwyf/TxO32uWLk0lDAiASLqVmzlDZeraA==
X-Received: by 2002:a05:6602:2113:: with SMTP id
 x19mr26054792iox.227.1582213763404; 
 Thu, 20 Feb 2020 07:49:23 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id r18sm1216159ilo.3.2020.02.20.07.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2020 07:49:22 -0800 (PST)
Subject: Re: [PATCH] selftest/lkdtm: Don't pollute 'git status'
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Kees Cook <keescook@chromium.org>
References: <668b6ff463849ceee01f726fbf3e7110687575ec.1580976576.git.christophe.leroy@c-s.fr>
 <ca71e490-b4fa-bf53-7a60-b6954b9dd33e@c-s.fr>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <17ea7ab6-d5c4-cf38-3c3b-9da70b2c35b5@linuxfoundation.org>
Date: Thu, 20 Feb 2020 08:49:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ca71e490-b4fa-bf53-7a60-b6954b9dd33e@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 21 Feb 2020 07:09:45 +1100
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/20/20 7:58 AM, Christophe Leroy wrote:
> ping
> 
> On 02/06/2020 08:11 AM, Christophe Leroy wrote:
>> Commit 46d1a0f03d66 ("selftests/lkdtm: Add tests for LKDTM targets")
>> added generation of lkdtm test scripts.
>>
>> Ignore those generated scripts when performing 'git status'
>>
>> Fixes: 46d1a0f03d66 ("selftests/lkdtm: Add tests for LKDTM targets")
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> Without this, 'git status' now reports the following crap and real 
> problems are drowned in the middle, that's annoying.
> 

I will pull this in. Please cc linux-kselftest mailing list in the
future.

thanks,
-- Shuah

