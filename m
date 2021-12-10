Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 349AD46F97E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 04:10:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9G9h1GR5z3c9S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 14:10:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FkOw6GT+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fEIK60pJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=FkOw6GT+; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fEIK60pJ; 
 dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Fri, 10 Dec 2021 14:09:33 AEDT
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9G8s4cm6z2xtj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 14:09:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639105770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXWUh5En4X6dZFkxf6+B8+f+LS16fp3Q6dwt0j3g/Gk=;
 b=FkOw6GT+AYl3FdEPsJZ9kGByJCfjEhwwzMDgS2Bh18TxlueELVufAPo1GwlVxAA9HEW00M
 TytWNR2Z0NRCz80BHFGJe8hWRusUeIlQJXMxwZ1uQL8SA3UF+BWdWRmNQZMTJQ/OegmcfY
 qzrkABZ+9QptpoFtBVPJ6ZQApxea0xc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639105771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXWUh5En4X6dZFkxf6+B8+f+LS16fp3Q6dwt0j3g/Gk=;
 b=fEIK60pJLj0nCotIaS00FnIpakR8dulytMS9yT/TyuPLM7ytukEZMg0lzzUPGbyJXzoeND
 AceqgK5wBYRzg2kuTkvEvZsGsBSkFGcE3X08WNgjj58h/TNP0iPTa2pN1uGUeERj6gh/Vk
 1U92NZUjjMl9iQKakELD+TmlIbnQeIw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-dkRGu73KPomfhD5iyX_KSQ-1; Thu, 09 Dec 2021 22:08:19 -0500
X-MC-Unique: dkRGu73KPomfhD5iyX_KSQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 x5-20020a05620a0b4500b004679442640aso9068504qkg.20
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 19:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PXWUh5En4X6dZFkxf6+B8+f+LS16fp3Q6dwt0j3g/Gk=;
 b=6X3LZXQFKlxQJw9rsP4mC3WcQEFA13pblZhHUUsQXOP+2aPvEJmWAUezcwLC4LiBZ4
 /wKsml0yi3wJQ6BQz0wlaDp5ajgtdlboCOPxflZvMbffivulJ6t3qgH2RSOia7Bp348Z
 20Ns74h5HYGVmuImGUYLSm4yUoWq+CFdcMkOrRIXXWC+R8zqkuc5dvkHne9EOBYvLw0H
 qV6mJPQTmzYxm0ovgRcAO2smVtBNq9Yn7lesCS4TOMeggha2gUGms2v2qxJMT8KLy3s1
 pbFSaMwgi9NFEQvzrsAXu3Np2fY9tGRgdenFRy/N7OkbdTKxiMry9WEOtnxhqr+xBAeT
 BGWQ==
X-Gm-Message-State: AOAM532xAdPekgXDWDy4lbMYkN6FhEJ2VyvcuWFH7RPmESHohbpDcnc8
 HsCYQjX8snZugcG18oZIh7A6qel7fb6FMeJhWy8Mv9OiqaOM9vaKrPriUyVyfmZRGGd4saseadQ
 pBp1dtijHaiZeibJCACI1mH5AgQ==
X-Received: by 2002:ac8:5fc2:: with SMTP id k2mr23663619qta.310.1639105699203; 
 Thu, 09 Dec 2021 19:08:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykFyHDqmr5EaqtBOtK1YMnFz8OsH4Ii95ABA5uZFruxDtBgRptKweMHr5q+khjc7T1O9Y+Ag==
X-Received: by 2002:ac8:5fc2:: with SMTP id k2mr23663595qta.310.1639105698934; 
 Thu, 09 Dec 2021 19:08:18 -0800 (PST)
Received: from [192.168.1.9] (pool-68-163-101-245.bstnma.fios.verizon.net.
 [68.163.101.245])
 by smtp.gmail.com with ESMTPSA id n6sm1073550qtx.88.2021.12.09.19.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 19:08:18 -0800 (PST)
Subject: Re: [PATCH] powerpc/module_64: Fix livepatching for RO modules
To: Michael Ellerman <mpe@ellerman.id.au>, Russell Currey
 <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20211123081520.18843-1-ruscur@russell.cc>
 <d9d9ef2d-4aaa-7d8b-d15e-0452a355c5cf@redhat.com>
 <25d35b916e87ed7a71ebc6528259e2f0ed390cb2.camel@russell.cc>
 <87y24umfe9.fsf@mpe.ellerman.id.au>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <e6378545-4218-1bb6-468e-3d957ce15904@redhat.com>
Date: Thu, 9 Dec 2021 22:08:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87y24umfe9.fsf@mpe.ellerman.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=joe.lawrence@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: jniethe5@gmail.com, naveen.n.rao@linux.vnet.ibm.com,
 live-patching@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/9/21 2:00 AM, Michael Ellerman wrote:
> Russell Currey <ruscur@russell.cc> writes:
>> On Tue, 2021-12-07 at 09:44 -0500, Joe Lawrence wrote:
>>> On 11/23/21 3:15 AM, Russell Currey wrote:
>>>
>>> [[ cc += livepatching list ]]
>>>
>>> Hi Russell,
>>>
>>> Thanks for writing a minimal fix for stable / backporting.  As I
>>> mentioned on the github issue [1], this avoided the crashes I
>>> reported
>>> here and over on kpatch github [2].  I wasn't sure if this is the
>>> final
>>> version for stable, but feel free to add my:
>>>
>>> Tested-by: Joe Lawrence <joe.lawrence@redhat.com>
>>
>> Thanks Joe, as per the discussions on GitHub I think we're fine to use
>> this patch for a fix for stable (unless there's new issues found or
>> additional community feedback etc).
> 
> Hmm, I read the GitHub discussion as being that you were going to do
> another version, which is why I haven't picked this up. But I guess you
> and Christophe were talking about the non-minimal fix.
> 
> I know we want this to be minimal, but I think it should be checking
> that patch_instruction() isn't failing.
> 
> Incremental diff to do that is below. It boots OK, are you able to throw
> a livepatch test at it?
> 

No problem.  The incremental patch update tests successful.

Thanks,

-- 
Joe

