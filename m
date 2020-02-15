Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B5C15FC66
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 03:44:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48KF236YhxzDqKb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 13:44:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48KF0S2hB9zDqn4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 13:42:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Is8gv9E4; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48KF0S1fCLz8sxx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 13:42:48 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48KF0S17kFz9sRJ; Sat, 15 Feb 2020 13:42:48 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=larry.finger@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Is8gv9E4; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48KF0Q51hfz9sPk
 for <linuxppc-dev@ozlabs.org>; Sat, 15 Feb 2020 13:42:44 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id w6so1860013otk.0
 for <linuxppc-dev@ozlabs.org>; Fri, 14 Feb 2020 18:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7sOBxSpA9pON1X4qvuLedOfQyXFuWJICSd0B4jNXqQY=;
 b=Is8gv9E4JLosOmgQokvuZa+VUxS8gYnDbUErzTY95CZOOn7+Hg86iqrGuWzj/806kv
 417txtu5S23oKOEnmddsn0+fnTCzwRKzg1T6crYk6pXCCwdzcgCw34VXenK3hy3fZhwR
 Ba3Qjxhn1pGLtpCOB6ennfD6iJUqJSbkQGaG2bUaoAM8YCHRw4AjQ+vZkJ6Ftl4OjG5Q
 u53mADMjV54M9f1u+WXqLcVI4TFopkf9hqDeFoX1LYOWASXAE1tLXoofGVk+Pe20ijO/
 6VN1lOcMV8S107Ep7nTBslALiRMHlY5F/w1n/UWe+Uh01KWA/ZLkVy7oVW74AQXpTMCx
 sVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7sOBxSpA9pON1X4qvuLedOfQyXFuWJICSd0B4jNXqQY=;
 b=MbqkwczS5nPEdpG1OIouCRhjPY3qDEoYhTPYycS7kXke0D+/hEwsuygCXJCzYcZ9O1
 cj68quTZUYLdT12wCPJzBQs56KvRUL7Kj34oTDqViUcVvRmKTiZAhNDGQ3xVamRwbD7Z
 ZHbueDyyvcsr44grL9eNC1EncJ0Z8IZROHIs9O7QIuokmY1100/6M+a2S+RqCElZz2tK
 xjB/wCb7yfE9vWPVGAvWOGzv6KwNCHdTWt4Pksj5DR8uJjx45LOL0jruZOiLATiu+yop
 gFIOPJGHBydRkLzk2abLS3WoFt/tKhwIyYwYecj522wGCwqur+4sRj73wg6n+9O60Wg5
 7Gvg==
X-Gm-Message-State: APjAAAXB/+nYXpsRUrvJJZekCaxAliP33DnZcraBuCAhJgSiJJB9JPSO
 /54D9glMxjVj9VxcZWSl1SIUyy3Z
X-Google-Smtp-Source: APXvYqy6G89/3yV70Wsukn0Tu6nMF7hPbNFzVYNNuSX6vXXtk4ii45Iu8w4p+9USAGxzVTfMOVlgcQ==
X-Received: by 2002:a9d:5a09:: with SMTP id v9mr4455179oth.214.1581734560955; 
 Fri, 14 Feb 2020 18:42:40 -0800 (PST)
Received: from [192.168.1.120] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id r2sm2654633otk.22.2020.02.14.18.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 18:42:40 -0800 (PST)
Subject: Re: RESEND: Re: Problem booting a PowerBook G4 Aluminum after commit
 cd08f109 with CONFIG_VMAP_STACK=y
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <f7565b89-c8b2-d2e7-929e-4b1abf72fc63@lwfinger.net>
 <159ed5d8-376b-1642-fb4b-01406d671cf1@c-s.fr>
 <6a1802b8-c6a7-d091-1036-689e089b786f@lwfinger.net>
 <f35ea4e6-7c54-6acc-7d91-3a6eea56133c@c-s.fr>
 <608a1a18-a0ed-2059-bfbc-081c9ef1bfd8@lwfinger.net>
 <a8a38651-974a-819a-810c-83c4097adc10@c-s.fr>
 <7f63e8a8-95c5-eeca-dc79-3c13f4d98d39@lwfinger.net>
 <9429f86e-8c7d-b2e6-6dc1-8f58c44baadc@c-s.fr>
 <2da19b26-9a44-2e4e-ab7d-d3fff65091bd@lwfinger.net>
 <02ce1278-5880-063c-2281-178edd541232@c-s.fr>
 <f3f628ca-4085-e9c2-2c62-170cf9801ac2@lwfinger.net>
 <074f2468-1fbe-0714-df58-b6d2e1d2725b@c-s.fr>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <04c1c725-6360-1663-c6ae-a4c7611dc385@lwfinger.net>
Date: Fri, 14 Feb 2020 20:42:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <074f2468-1fbe-0714-df58-b6d2e1d2725b@c-s.fr>
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe,

On 2/14/20 1:35 PM, Christophe Leroy wrote:
> --- a/arch/powerpc/kernel/head_32.S
> +++ b/arch/powerpc/kernel/head_32.S
> @@ -270,6 +270,9 @@ __secondary_hold_acknowledge:
>    * pointer when we take an exception from supervisor mode.)
>    *    -- paulus.
>    */
> +#ifdef CONFIG_PPC_CHRP
> +1:    b    machine_check_in_rtas
> +#endif
>       . = 0x200
>       DO_KVM  0x200
>   MachineCheck:
> @@ -290,12 +293,9 @@ MachineCheck:
>   7:    EXCEPTION_PROLOG_2
>       addi    r3,r1,STACK_FRAME_OVERHEAD
>   #ifdef CONFIG_PPC_CHRP
> -    bne    cr1,1f
> +    bne    cr1,1b
>   #endif
>       EXC_XFER_STD(0x200, machine_check_exception)
> -#ifdef CONFIG_PPC_CHRP
> -1:    b    machine_check_in_rtas
> -#endif
> 
>   /* Data access exception. */
>       . = 0x300

With the above changes and all the other patches applied, the machine finally 
boots. It is so bloody slow that it takes a long time to do anything, but you 
finally got all the places that needed patches. I really lost track of how many 
bugs were fixed in the process, but I can now put that old box aside until time 
for v5.7.0-rc1. As you can tell, it only gets used to verify that PPC32 is 
working on real G4 hardware. It has no real value for any other function.

Thanks for the help,

Larry
