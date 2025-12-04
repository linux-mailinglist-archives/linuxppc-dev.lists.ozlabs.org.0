Return-Path: <linuxppc-dev+bounces-14631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DE8CA5B03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 00:23:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMrDH5kQqz2xQ1;
	Fri, 05 Dec 2025 10:23:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764890623;
	cv=none; b=hVLt+jopCs8A5Hv9J4QD9XZ1T0rExyRpr5FCtZHBEBtWIS24Jm4WNJYmOMoHckq/xIh6sMZIJccq1bpLtdfB9p5WXvdy4gs2i5+uT/kevQJUix6nfUn9mVnNF0AxqFjPY00emAuqgLkPjyBV5DL0ZHpf2vX+qy/hFBw8L/RUiG48C90XCRod6RpW01p5CUJV06Bmo2XbIeOqiBi56sd0urF9Ebn2otAnkU15qwF8yU2jctEqkIgvjHu0QbGFF7JW6OLWZWTxAWSgPA5jsv/45imstvUKJaVo+O6NHqioPYt4ZAHKodLTZe+CZdCN4ggyoiBd3IR9Ok8QfePAJppwBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764890623; c=relaxed/relaxed;
	bh=hr7YzaYb6eBISUfqlJbQwKFjf3zCgII84LAcloMq6GM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nnn9P92n04FADzLCgbKF+TO5XRUJT2TZAEdQPOTPJzsB3gxhBFy4CK0J+OKMUI6c6HpFQBnbw13uBT9ViO0vDN/3QLWIEFDQWQXunOVotAW9nS7fAURU9QxB8MuwYhG9HhhhmGDjkcFpes0MXzD52YRie2u6yLa1xwkVNXw+zX0Qhon8iDiEVCPLItJ/AG6efNv+JE6gXlM2vI66ZqGwudUWho8FhqoYAxeTYQHrt84OXiCbWb777qRCWeThCiTHEeugzrodfOMlULf4D//Ll3Qds2uzTaTzOfc+Yi89L3y+BNkXlGcB07Nd6wXUZu4APr6ZCbYsTidnfJ8P8weDIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=c+im2ZEr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=c+im2ZEr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMrDG2YNPz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 10:23:41 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7c75fc222c3so764414a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 15:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1764890618; x=1765495418; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hr7YzaYb6eBISUfqlJbQwKFjf3zCgII84LAcloMq6GM=;
        b=c+im2ZErpZQGK89oBIUzCDeAZxL6FMBXb28qHGWBpmE3vCiJNUd5vPrywQa5GYNwA1
         Hu0hrlu5OfpWUn1pwfaaZ82h5BhfQNkXPNUBrsnJghDkpmScqNvx7V8d4twPLQZ3Wb53
         c/id5cl+LBFpMRrVpENgvWgGrJVVOGM5/y3O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764890618; x=1765495418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hr7YzaYb6eBISUfqlJbQwKFjf3zCgII84LAcloMq6GM=;
        b=PzuKiyrdQYCcl801AJN/nfCDQnqVxeghbTbH6vz7c+4liBGOta5E0OMaaNU2MHi/0K
         4D2xEgmUpkfScIZPUt5jFEE/OMae7lcyN30AatBSwOWsqUVdoz/TnN5/U3PXyTjPuY3e
         xnsLdINeFJNuUJKwT8CCUAm+stY5ODvIhnFzh/OOggJKk05BsnNyi1+BsYGyK4FcGEfh
         1oUmiBrcieniV3NJrL6bYMqD8vmwEBR8ZVKSM+p597ArIyG9akvADk2RBlPCbqzlKesj
         EXEgJYiz5lfUN7bfxD1n1kOoMW2M0565HhDh26J7Qx34GVbinShDqINQRO42toZDouPt
         /7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWbs+pn+9QumdEPxCFhk7r5d8PEaN+n/3OP6xWSeVBGz/gEu0B+h2O5FNUGJGfe+54IJw1lHVpNMnlkM0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxEQluWR/p+3feSQPwzsz+BqNzVvQ3sf5jq6LxgOPgEah7rz2ue
	/B2W/QcQ7wVZnGZAKL3WdQ6Y+vOQdHWmWu3/6tkYFMsnFweKGMxx44YmRaC2/OxgpPI=
X-Gm-Gg: ASbGncsMxGs9hzerLNH3dBbpptgaKu9x/SP1i5MEe4o9rrC22bjIDEjMIs6pptla6Ui
	AwA9uU6A2aGHND+ypepS17MB8KwWKG9KttEIlTGQq0YRNdHArjk29EdrsjVeN9MYZxsqu4z7YjF
	V0r5nuKhEqiBCBVXwMgYgio5QOotIPIM4O66Cud+pn9JLhexJY1WYdyYan4i8/T7SFGFqucHt5P
	XkmHjS8TexGgk5zMiQaPOqfbFTxMfq/f+E7r18jcSgQEPSgJS/8G0Phwik41CDJXmH2QiP8Lwa6
	mYt9K5k96iAFW4eZhykhU3/RWC04k77H9QbK4d+38WdYUKyRotNAmSIR0FNbfYCV7HhmMXwG7Me
	r3pmVZL60gDoqtkuquPLzRdG9VbfYxFdd8hvBhO8mZagaPJP5Tco/MdxIoRAnWrtl5eA2g1HYkh
	R50OCTnrV6TLS/qbB1iUrnTaQ=
X-Google-Smtp-Source: AGHT+IHwjZ/zpAGcvx6Y2WWCyk7TEnPm6i5oJD1lnEaXl9QZZMoDHIIMLrGP7RHllD2MXO9k2S0g1g==
X-Received: by 2002:a05:6830:4112:b0:7c7:5907:b1a8 with SMTP id 46e09a7af769-7c94db4a335mr5228767a34.13.1764890618208;
        Thu, 04 Dec 2025 15:23:38 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95acd733bsm2409067a34.26.2025.12.04.15.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 15:23:37 -0800 (PST)
Message-ID: <317deba2-e560-44ed-a9f7-3c6fdc446b6d@linuxfoundation.org>
Date: Thu, 4 Dec 2025 16:23:36 -0700
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "mm: fix MAX_FOLIO_ORDER on powerpc configs with
 hugetlb"
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 akpm@linux-foundation.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, masahiroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251204023358.54107-1-skhan@linuxfoundation.org>
 <51d8549e-b084-498e-84c0-76fd3de116cb@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <51d8549e-b084-498e-84c0-76fd3de116cb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/4/25 15:16, David Hildenbrand (Red Hat) wrote:
> On 12/4/25 03:33, Shuah Khan wrote:
>> This reverts commit 39231e8d6ba7f794b566fd91ebd88c0834a23b98.
>>
>> Enabling HAVE_GIGANTIC_FOLIOS broke kernel build and git clone on two
>> systems. git fetch-pack fails when cloning large repos and make hangs
>> or errors out of Makefile.build with Error: 139. 
> 
> Looking at the last part, "Error 139" was confirmed to be fixed in 6.18, right? At least reading [1] there I find
> 
> "it was issue of 6.18.0-rc6 kernel itself. After switching to default Arch Linux kernel build went without problem and I'm now on 6.18 stable kernel."
> 
> Did you mange to report the make issue you reported here [2] on 6.18 as well, or only pre 6.18-rc7?

The problems I saw were on rc6. See below.

Repeating what I said on the thread so we are all in the
loop and on the same page. It took me a bit of time to
retest on two systems.

Both my systems were running rc6 - I was stuck in a state
where I was able to rebase to rc7 and then 6.18, but could
never build either one.

When I suspected rc6 to be the problem, I booted rc5 and compiled 6.18
after reverting 39231e8d6ba based on config file changes between rc5
and rc6.

I retested on both systems on 6.18 making sure I have 5bebe8de19264
and 39231e8d6ba in there. I cloned linux_next and built it on both.

I didn't see any problems on 6.18. Having said that, It might make
sense to hold off on including 39231e8d6ba in 6.18 so there is more
time to test beyond 2 rc cycles. That is for you all to decide.

thanks,
-- Shuah

