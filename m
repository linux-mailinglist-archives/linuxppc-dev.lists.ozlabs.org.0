Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3B518B45
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 16:11:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450Fd36Wf9zDqR3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 00:11:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cfmr15nR"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450FWh1J1MzDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 00:06:39 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id y11so1370928pfm.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 07:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7XlyYld84sMizui4UM0AVQb85rbnPa3zUibJIGN+rGo=;
 b=Cfmr15nRMQ648hMh0Uljwu1px87lDv2u/ReIJaG3bGwGyftxrbhA2o7dQbIYYKGzoF
 /tzYyZJ/cc5IIN8rPKEDHhY+Ws1/gxrsodI+9OlMn7iareo6VUAOC03K0oGRmghONfN5
 iWYB3RiJXvX01TmUbQG6/Se3OyU0Vot9LhRXy/Mimpqo3uHZPl0RJbzz5rT/n098Yf0c
 AaMw9SS20T6lgobZZDwzzkt/UcXotWTmctVSo3CxDiJiyLFfric1CeRyl7ARJrjpkfV5
 jK1WUh3fZbH9elRdMPMzEPh7CfXbsQ33AICd7xyhDzaxjb/OvTJ31znJhPpTyRbQSSvI
 OXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7XlyYld84sMizui4UM0AVQb85rbnPa3zUibJIGN+rGo=;
 b=ntuwQUH7fCuy0yX0KLgFDAnOB2FqOdcXRrBBGM4Tt/paceT10zbEhhyyOeFkrGtgQe
 0J2PZSdkAsZTFZ3IYlFr9njHJ2JDlCsrAu+soxYwOl9r4NFmNTqZ0zjrjhLVU0qqPt/s
 fu13AvfUnDHujF54+FuAwIMEBU+bBJ8+yj8F/BjlEJcyYpbluAVbNd+X/7p5u3fcr80P
 oe9Tg7yKY4ToqRpOr2b7SOcyQJfGaSst3gUGTv5TA9zo9r1++wWrtrT4wh2RcpWPg7Nj
 EczI8ebdeJcLHqVMzHT3a20lES2Jd4L5ayD6lWnUhjsFBJhZo53zaLMUbVt7OzdKFaJg
 BY9g==
X-Gm-Message-State: APjAAAXj1anKnIDfEKE33WjBgYRP7OrujPc9wKlQ+nfZtPwZbj9BiMxS
 jUOqla5GmVyzt7xAllig5XY=
X-Google-Smtp-Source: APXvYqx3v6jG3HaAjthaj5kpJFK0XAvJKIu3KnAbDhMrbH8iQJi4WH+jTC61jBpJOMDV2IyRlg782g==
X-Received: by 2002:aa7:98c6:: with SMTP id e6mr5363491pfm.191.1557410795784; 
 Thu, 09 May 2019 07:06:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d66sm994593pfg.183.2019.05.09.07.06.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 07:06:34 -0700 (PDT)
Subject: Re: Build failure in v4.4.y.queue (ppc:allmodconfig)
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20190508202642.GA28212@roeck-us.net>
 <20190509065324.GA3864@kroah.com> <20190509114923.696222cb@naga>
 <e8aa590e-a02f-19de-96df-6728ded7aab3@roeck-us.net>
 <20190509152649.2e3ef94d@kitsune.suse.cz>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ace9aeac-f632-c004-1528-8c242def0904@roeck-us.net>
Date: Thu, 9 May 2019 07:06:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509152649.2e3ef94d@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/9/19 6:26 AM, Michal Suchánek wrote:
> On Thu, 9 May 2019 06:07:31 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 5/9/19 2:49 AM, Michal Suchánek wrote:
>>> On Thu, 9 May 2019 08:53:24 +0200
>>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>>>    
>>>> On Wed, May 08, 2019 at 01:26:42PM -0700, Guenter Roeck wrote:
>>>>> I see multiple instances of:
>>>>>
>>>>> arch/powerpc/kernel/exceptions-64s.S:839: Error:
>>>>> 	attempt to move .org backwards
>>>>>
>>>>> in v4.4.y.queue (v4.4.179-143-gc4db218e9451).
>>>>>
>>>>> This is due to commit 9b2d4e06d7f1 ("powerpc/64s: Add support for a store
>>>>> forwarding barrier at kernel entry/exit"), which is part of a large patch
>>>>> series and can not easily be reverted.
>>>>>
>>>>> Guess I'll stop doing ppc:allmodconfig builds in v4.4.y ?
>>>>
>>>> Michael, I thought this patch series was supposed to fix ppc issues, not
>>>> add to them :)
>>>>
>>>> Any ideas on what to do here?
>>>
>>> What exact code do you build?
>>>   
>> $ make ARCH=powerpc CROSS_COMPILE=powerpc64-linux- allmodconfig
>> $ powerpc64-linux-gcc --version
>> powerpc64-linux-gcc (GCC) 8.3.0
>>
> 
> Gcc should not see this file. I am asking because I do not see an .org
> directive at line 839 of 4.4.179. I probably need some different repo
> or extra patches to see the same code as you do.
> 
v4.4.179-143-gc4db218e9451 from
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
branch linux-4.4.y

That also includes 'powerpc/64s: Improve RFI L1-D cache flush fallback',
but reverting it does not make a difference. Also, the .org is
hidden in STD_RELON_EXCEPTION_PSERIES().

Guenter
