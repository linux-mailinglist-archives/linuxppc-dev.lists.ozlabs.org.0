Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C11662483
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 12:46:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrBwQ1s8cz3fCx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:45:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.45; helo=mail-wm1-f45.google.com; envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nr6gc5b9Nz304m
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 19:34:35 +1100 (AEDT)
Received: by mail-wm1-f45.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso5990356wmq.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 00:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ai89XU1vTr8jmWYzTC3dz44+t98FTx9wn3aEaRiaIuk=;
        b=Xbq63OKVQLAjNmZU4CWzY2YB5T288OxyNTkCG3/PyITGs/90hOC46E6PfMIsvnuKER
         e9fYQb9MhP95HG4lRweS2rAUsafkmyEsNVHwyIexS8k8H7OGqUOfsJaVeKJkgI8k4iqz
         K65bhroODog2AbilUnzqrMspb2iRU+b2Jys/ZSqd79O67+4g9aTzmAw6IIwuPVk4HP25
         SN79DcJeThhtsrr0ug6woSHg9bhb5vTZw6Au0x5rZpvkD+yg5y/wxJs40X+p9ltAnzH/
         DumC+Hx4tPUqFKdfc75JMxCeZ9m31MeqRD208wqfkTRr1rIo8r8/gjlY44+Z9pVgZ4MG
         0fZA==
X-Gm-Message-State: AFqh2krHR1gmww2UE3rHh5tauJWZ7DjN2T5/qomrOhpQ3QP8FSX6I/W6
	huP/e5r1n8SFY4uOk/bJEys=
X-Google-Smtp-Source: AMrXdXtjlHdY/ENv0HKrQhiUW86lNsmrAe9U9q9o1ZJzBphFcyOOuX1i4xq4T+O9/Z+J1SnbwUA6Kw==
X-Received: by 2002:a05:600c:1da3:b0:3d0:965f:63ed with SMTP id p35-20020a05600c1da300b003d0965f63edmr46049641wms.23.1673253271256;
        Mon, 09 Jan 2023 00:34:31 -0800 (PST)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id l27-20020a05600c2cdb00b003a84375d0d1sm16068925wmc.44.2023.01.09.00.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 00:34:30 -0800 (PST)
Message-ID: <ad6efc07-1706-a8e2-1478-45124838a043@kernel.org>
Date: Mon, 9 Jan 2023 09:34:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH net-next] Remove DECnet support from kernel
Content-Language: en-US
To: Jan Engelhardt <jengelh@inai.de>
References: <20220818004357.375695-1-stephen@networkplumber.org>
 <07786498-2209-3af0-8d68-c34427049947@kernel.org>
 <po9s7-9snp-9so3-n6r5-qs217ss1633o@vanv.qr>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <po9s7-9snp-9so3-n6r5-qs217ss1633o@vanv.qr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 09 Jan 2023 22:45:00 +1100
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
Cc: "open list:NETFILTER" <netfilter-devel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, Wang Qing <wangqing@vivo.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Eric Dumazet <edumazet@google.com>, Nathan Fontenot <nathan.fontenot@amd.com>, Suma Hegde <suma.hegde@amd.com>, Paolo Abeni <pabeni@redhat.com>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Menglong Dong <imagedong@tencent.com>, Florian Fainelli <f.fainelli@gmail.com>, Xin Long <lucien.xin@gmail.com>, Chen Yu <yu.c.chen@intel.com>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, Xie Yongji <xieyongji@bytedance.com>, "open list:NETFILTER" <coreteam@netfilter.org>, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Borislav Petkov <bp@suse.de>
 , Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Stefano Garzarella <sgarzare@redhat.com>, Petr Machata <petrm@nvidia.com>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Yu Zhe <yuzhe@nfschina.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, Yuwei Wang <wangyuweihx@gmail.com>, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Akhmat Karakotov <hmukos@yandex-team.ru>, "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Florian Westphal <fw@strlen.de>, open list <
 linux-kernel@vger.kernel.org>, Stephen Hemminger <stephen@networkplumber.org>, Chuck Lever <chuck.lever@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Antoine Tenart <atenart@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09. 01. 23, 9:14, Jan Engelhardt wrote:
> 
> On Monday 2023-01-09 08:04, Jiri Slaby wrote:
>> On 18. 08. 22, 2:43, Stephen Hemminger wrote:
>>> DECnet is an obsolete network protocol
>>
>> this breaks userspace. Some projects include linux/dn.h:
>>
>>   https://codesearch.debian.net/search?q=include.*linux%2Fdn.h&literal=0
>>
>> I found Trinity fails to build:
>> net/proto-decnet.c:5:10: fatal error: linux/dn.h: No such file or directory
>>      5 | #include <linux/dn.h>
>>
>> Should we provide the above as empty files?
> 
> Not a good idea. There may be configure tests / code that merely checks for
> dn.h existence without checking for specific contents/defines. If you provide
> empty files, this would fail to build:
> 
> #include "config.h"
> #ifdef HAVE_LINUX_DN_H
> #	include <linux/dn.h>
> #endif
> int main() {
> #ifdef HAVE_LINUX_DN_H
> 	socket(AF_DECNET, 0, DNPROTO_NSP); // or whatever
> #else
> 	...
> #endif
> }
> 
> So, with my distro hat on, outright removing header files feels like the
> slightly lesser of two evils. Given the task to port $arbitrary software
> between operating systems, absent header files is something more or less
> "regularly" encountered, so one could argue we are "trained" to deal with it.
> But missing individual defines is a much deeper dive into the APIs and
> software to patch it out.

Right, we used to keep providing also defines and structs in uapi 
headers of removed functionality. So that the above socket would 
compile, but fail during runtime.

I am not biased to any solution. In fact, I found out trinity was fixed 
already. So either path networking takes, it's fine by me. I'm not sure 
about the chromium users, though (and I don't care).

thanks,
-- 
js
suse labs

