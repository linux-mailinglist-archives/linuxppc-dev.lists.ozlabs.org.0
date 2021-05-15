Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CECB381BB5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 01:05:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FjLbQ1RX7z3bnZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 09:05:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=B/uIdQOy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B/uIdQOy; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FjLZw3pRxz2yXS
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 09:05:09 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id y12so2300693qtx.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 16:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uoo0qXdDxgLvDQ6O3zd/SIJRl7VC+uLuxoa4iDl46SM=;
 b=B/uIdQOyaCH2JuF/j0KRQ1IkQXG3dUU3vPPcp37i1LHk2YJ/OzjzwHruzoGP4j+3qw
 pLRfBTcw5ANthLrQMZYJsU1u9I4Jofx+wVh/R8e04vqOUU1CsQUy81anwrW8oNNl0SyG
 vRAM1R2yDLttd7b4pvUrUfApu7/w861wlWIeyhrzV2AaD5O3sXO9NfayzmXGXllzm5T4
 dai7kErDuHnaFl0APAnRjvdBDhC0esQkNySdEumPWEDMeU3sPOwZdiWZ7mlKkk1BWacm
 ku0Pwp3iGrebF/zP6EHlUzxrSNXpJF6G0bUDustOPRoMdLkoqUHKjVn4FeUIwsyXVB/I
 APLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uoo0qXdDxgLvDQ6O3zd/SIJRl7VC+uLuxoa4iDl46SM=;
 b=FEdLeesynjH3YoI0i5jR/Y+NB7IrC6IfX5COwpO3pGD/T/mYNhca7orHmX+28Yq/mR
 XVC6mqRaM/+VO6X3Dfr8SinButeQXpPWfPKqTkEoBQ970iq7KicjSHLGLNmQbIOOzRly
 rCCJ0J9/t2crSa2pEU9aOEmUYx6v791AiVpisUzFbfSexJ2y5Fco13RG7+W4bsAC0fHj
 Ku8GXwpT6pgqgYJJ+jAFzEXMB3jasP0HEuy2RxN8qLphlfR3rWYvegaz26pna9qKpugZ
 /b/XzFliTkMimEfIX4qavZLvPLRkaGITihBhPeI+O3jXUkiQVHrVVTG4bg7R9a0tHhlj
 I0gA==
X-Gm-Message-State: AOAM5334D1RT3bt3kl2D7HWKCGLIATaIXY/WxSvziGw6dH9qX49Yu7NE
 hRR5bJNnC4T+zcj3SXoI/IU=
X-Google-Smtp-Source: ABdhPJyuzpRNgj2PdyTmuCTqw+goRfaazw+9D4ESaV8KAA5fApck7lRw6T07DdsxBH0HeeNBZ7zqfA==
X-Received: by 2002:ac8:5790:: with SMTP id v16mr22366187qta.301.1621119905496; 
 Sat, 15 May 2021 16:05:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 189sm7505298qkd.51.2021.05.15.16.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 16:05:04 -0700 (PDT)
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines to
 take a page walk cache flush argument
To: Andrew Morton <akpm@linux-foundation.org>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
 <20210515163525.GA1106462@roeck-us.net>
 <20210515134141.b719412dc9dc46bdf2a8ced2@linux-foundation.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5df3f31f-17d5-ac4d-927c-6b90f31e1311@roeck-us.net>
Date: Sat, 15 May 2021 16:05:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210515134141.b719412dc9dc46bdf2a8ced2@linux-foundation.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/15/21 1:41 PM, Andrew Morton wrote:
> On Sat, 15 May 2021 09:35:25 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> 
>>>   
>>>   #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>>>   static inline void flush_pmd_tlb_range(struct vm_area_struct *vma,
>>                   ^^^^
>>>   				       unsigned long start, unsigned long end)
>>> +{
>>> +	return flush_pmd_tlb_pwc_range(vma, start, end, false);
>>          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> Doesn't that cause build warnings/errors all over the place ?
> 
> It will, thanks.  I queued a fix.
> 

Also in mm/mremap.c, in case you didn't see it:

#ifndef flush_pte_tlb_pwc_range
#define flush_pte_tlb_pwc_range flush_pte_tlb_pwc_range
static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
               ^^^^
                                            unsigned long start,
                                            unsigned long end)
{
         return flush_tlb_range(vma, start, end);
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
}
