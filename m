Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7163E511BEF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 17:37:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpNDD1vQKz3bdJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 01:37:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9neTzgH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gNmHh6bq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=L9neTzgH; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=gNmHh6bq; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpNCT4qZKz2xlF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 01:36:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651073809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLzRtimpMwkEhbx4emiYpoBgN4Y+vripnsA+QcNWh8Y=;
 b=L9neTzgHNPXxkVumE7UtKHaKRaNewoUPG4ESJgY2tvTVO+3NOHYvAk5vibjhefROrxY7hk
 edlCiu18Ah6BDsnJxDblIyf5xQEA9PztC0URptgwzMZw3a8gto0R11x63CoFqpDg3e40N5
 27OGxzk/5WhPKXma0frWlXgEkz7Y43U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651073810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLzRtimpMwkEhbx4emiYpoBgN4Y+vripnsA+QcNWh8Y=;
 b=gNmHh6bqiVVPVfaWp4w+VvL1GK8+r6MQi4X6kIWKFJdt2CecqFQ58djl3WKv2jh5nzFAvX
 HgSR0+JOrEpazvhgPlKjQqz7UPnLH/NSJZLVRvdcPSpAtlwjDHtlZpkoT7rVy6iB+8IuDn
 GxayNslkOJI258f4dRergjQAVHwkzCw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-5_GL670NPBacWWYIvarR8Q-1; Wed, 27 Apr 2022 11:36:46 -0400
X-MC-Unique: 5_GL670NPBacWWYIvarR8Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so716270wmj.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 08:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=PLzRtimpMwkEhbx4emiYpoBgN4Y+vripnsA+QcNWh8Y=;
 b=A8J68Dl1IFrTFe5VFsvLuZ+KgWECUUXdgQPojKh40YMYC8rTc/ffgcBA25TMR5In5D
 gGluH4UsOh++ghj3D2oG9iXLjjJF8Ig49c4xMjOMwe0lDtv7C/nnNj+9OAtgbrcvs/Ze
 lQhcpOwgeq9DaZ5gWRYNEmXkiaPbjDnSGKT7zlYSHG/+9CBoGOMUYJtLa8CMZUARja+q
 JnRpqnNejZJBPbbmRm9ylRhhD2Uu/edg0JHQJteIwvzz28TCHWADnUAxQHzYG4fiv+8s
 FcLg732mrfRpBV7lQRVonRcl9UhxRRdgkqng/x3oRrD4o/8Ri7CIC/xv7LFw99XQMgSR
 66IQ==
X-Gm-Message-State: AOAM533F9FphUAq/IRKiAkkU6WzQckbo5X+Mj5+vlNCmK3NWQ71ZuZhO
 ZBg0Jw8p/abWMdqT+I7PNZdi06DHHVXCJyXQZKOwltsblHa0GJphTBXh5lR3Ikt16dqiO6pwiVk
 /AjaY2IWlLQ7h09zrnfdb5SFnEA==
X-Received: by 2002:adf:bd91:0:b0:209:19ac:7159 with SMTP id
 l17-20020adfbd91000000b0020919ac7159mr21994603wrh.3.1651073805287; 
 Wed, 27 Apr 2022 08:36:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeRxULmrOLQQqJqV/2VI13K13LIoNQxVijy/gvXXFK1QVi4JzXOkCbG+oqjLDKbRpFmoLMvQ==
X-Received: by 2002:adf:bd91:0:b0:209:19ac:7159 with SMTP id
 l17-20020adfbd91000000b0020919ac7159mr21994591wrh.3.1651073805033; 
 Wed, 27 Apr 2022 08:36:45 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a1ce910000000b0038eabd31749sm2160786wmc.32.2022.04.27.08.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 08:36:44 -0700 (PDT)
Message-ID: <4106256f-1648-cf8b-b0e2-cefc84caf18e@redhat.com>
Date: Wed, 27 Apr 2022 17:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: serial hang in qemu-system-ppc64 -M pseries
From: Thomas Huth <thuth@redhat.com>
To: Rob Landley <rob@landley.net>, QEMU Developers <qemu-devel@nongnu.org>
References: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
 <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
In-Reply-To: <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
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
Cc: qemu-ppc@nongnu.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/04/2022 17.27, Thomas Huth wrote:
> On 26/04/2022 12.26, Rob Landley wrote:
>> When I cut and paste 80-ish characters of text into the Linux serial 
>> console, it
>> reads 16 characters and stops. When I hit space, it reads another 16 
>> characters,
>> and if I keep at it will eventually catch up without losing data. If I type,
>> every character shows up immediately.
> 
> That "16" certainly comes from VTERM_BUFSIZE in hw/char/spapr_vty.c in the 
> QEMU sources, I think.
> 
>> (On other qemu targets and kernels I can cut and paste an entire uuencoded
>> binary and it goes through just fine in one go, but this target hangs with 
>> big
>> pastes until I hit keys.)
>>
>> Is this a qemu-side bug, or a kernel-side bug?
>>
>> Kernel config attached (linux 5.18-rc3 or thereabouts), qemu invocation is:
>>
>> qemu-system-ppc64 -M pseries -vga none -nographic -no-reboot -m 256 -kernel
>> vmlinux -initrd powerpc64leroot.cpio.gz -append "panic=1 HOST=powerpc64le
>> console=hvc0"
> 
> Which version of QEMU are you using? Which frontend (GTK or terminal?) ... 
> this rings a distant bell, but I thought we had fixed these issues long ago 
> in the past... e.g.:
> 
> https://yhbt.net/lore/all/1380113886-16845-10-git-send-email-mdroth@linux.vnet.ibm.com/ 
> 
> https://git.qemu.org/?p=qemu.git;a=commitdiff;h=8a273cbe53221d28
> 
> ... but maybe my memory also just fails and this has never been properly fixed.

In case you're using GTK, I think I just found the problem that I was 
remembering again:

https://lists.gnu.org/archive/html/qemu-ppc/2016-11/msg00142.html
https://lists.gnu.org/archive/html/qemu-ppc/2016-11/msg00143.html

I assume this has never been properly fixed.

  Thomas

