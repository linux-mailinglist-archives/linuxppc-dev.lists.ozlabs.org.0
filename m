Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE823BE6C2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 12:58:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GKbyB4bFkz3bjw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 20:58:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.51; helo=mail-ed1-f51.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GKbxn6Dcrz306r
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 20:58:21 +1000 (AEST)
Received: by mail-ed1-f51.google.com with SMTP id t3so2819504edc.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jul 2021 03:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6zKc5bM/j/Saim3WcJ7XMsv777ylB6DzjZT8Xkvqlo8=;
 b=Rj3vhaHDXkxqsRmx6Qc2nCXOAFzdZglYD6GEFwrYh7j8tnaeXWSxJbWMjzUQYdXf6f
 nfqPAIs+rj0Ca5NuTcDcznh3Ky2Xu8/npVizm5M9GVRtZdqrJ1y3PZjwpfm6LuJcWQlt
 QUtqN5h1oT5Yl+logTEt2bNaCMrYZ2/ANeEavb6xS6THaxBbV8LKWdHzHzVx1uoDywHq
 yON6RAZExL8CsBepUWJXSu6sodfGqoh9D6rrMQ2BMyXpXaUrPL5f7zSBTuFnWMwK1QHj
 PfI+yJ2VFj6Pn/d95X7MWQkIycketzx8VtM8X537MuActkeHt2Ku1rUbxG1yA4nK9fxn
 zXhA==
X-Gm-Message-State: AOAM533xCSYcZvjUPJ1XNyVSiYCRCYGc6UJm7wggEujFk9ATWnCpp6Pr
 +28kdH0hgkyEfzE9HKeJZML99/09LtFRvQ==
X-Google-Smtp-Source: ABdhPJw9AWx/zVkQP7+TWOppO1SN41FBH7XT10N9Y4mW5X2FTCcM1e3yMvvdcWiMqnnW+M23v3zplQ==
X-Received: by 2002:a05:6402:1001:: with SMTP id
 c1mr29109250edu.26.1625655495857; 
 Wed, 07 Jul 2021 03:58:15 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id h8sm7057430ejj.22.2021.07.07.03.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 03:58:15 -0700 (PDT)
Subject: Re: [PATCH v2] xen/hvc: replace BUG_ON() with negative return value
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <20210707091045.460-1-jgross@suse.com>
 <9e45c5f8-0ac0-e1bb-4703-838679285e80@suse.com>
 <dd32b09b-7345-664b-165d-dfb30c285448@suse.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <b38eddf2-52af-3fa1-9cc0-681c094e327f@kernel.org>
Date: Wed, 7 Jul 2021 12:58:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dd32b09b-7345-664b-165d-dfb30c285448@suse.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07. 07. 21, 12:40, Juergen Gross wrote:
>> And btw, since I've got puzzled by the linuxppc-dev@ in the recipients
>> list, I did look up relevant entries in ./MAINTAINERS. Shouldn't the
>> file be part of "XEN HYPERVISOR INTERFACE"?
> 
> I wouldn't mind. Greg, Jiri, what do you think?

/me concurs.

thanks,
-- 
js
suse labs
