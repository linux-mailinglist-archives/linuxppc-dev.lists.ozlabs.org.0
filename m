Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB6D661EFB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 08:05:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nr4hJ3C30z3cdj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 18:05:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.46; helo=mail-wr1-f46.google.com; envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nr4gj3D7Zz304m
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 18:04:31 +1100 (AEDT)
Received: by mail-wr1-f46.google.com with SMTP id r2so7158110wrv.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Jan 2023 23:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYsLuw/5810Zy5eTIZ7iJqDyeo47uMIQ6w06dFLUs+Q=;
        b=eO4wkqkEVGn6M+FhX+4BkLbvdPePRzkdiSXjnFM6s23GBODqCGGyvTe4ELVFVCpeD9
         0wGG5yd8952J02XddtU53ZLUeWE0YoKK5p+Wy0x8K9JnlcFzZxIpUU0IPyHd2nEbtlJQ
         kovDWp7lu8Jfx1ep2S61/3amCSzjpJSN2f8n5qLETsIlvJDMyVqDkJc3qPXJ56tvZIpd
         yHUXin2L22JN9J2RdYp4QaoZSRO1uTBSbcw+RD2WJFXry3xL8IPRsByFH4ipYBmFxZ8j
         X26aiFQ+viPAaaLCI9hQuHTlMANlcp57361hnqxMhOB7xfkEj6eHt+svWFYEf8u9uwb+
         O97g==
X-Gm-Message-State: AFqh2kqlFgqQ+eVpnZO9HsboexlfynIh2xbL0XQbBmAYZqEQ0fKHeZEH
	Wb4Xbk6Rv9n+drDwr67FsyY=
X-Google-Smtp-Source: AMrXdXsEyHJGnZLB96JH3rcVegZBjOFlVPnyGgXG2g9g13hBlhCt3SpTnjtaAmK/XwGxmzdpSoCmAQ==
X-Received: by 2002:a05:6000:38d:b0:2b5:90e:cfa5 with SMTP id u13-20020a056000038d00b002b5090ecfa5mr10255103wrf.29.1673247866783;
        Sun, 08 Jan 2023 23:04:26 -0800 (PST)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id f3-20020adfdb43000000b00236883f2f5csm7846356wrj.94.2023.01.08.23.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 23:04:26 -0800 (PST)
Message-ID: <07786498-2209-3af0-8d68-c34427049947@kernel.org>
Date: Mon, 9 Jan 2023 08:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH net-next] Remove DECnet support from kernel
Content-Language: en-US
To: Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org
References: <20220818004357.375695-1-stephen@networkplumber.org>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20220818004357.375695-1-stephen@networkplumber.org>
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, Wang Qing <wangqing@vivo.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Eric Dumazet <edumazet@google.com>, Nathan Fontenot <nathan.fontenot@amd.com>, Suma Hegde <suma.hegde@amd.com>, Paolo Abeni <pabeni@redhat.com>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Menglong Dong <imagedong@tencent.com>, Florian Fainelli <f.fainelli@gmail.com>, Xin Long <lucien.xin@gmail.com>, Chen Yu <yu.c.chen@intel.com>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, Xie Yongji <xieyongji@bytedance.com>, "open list:NETFILTER" <coreteam@netfilter.org>, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Borislav Petkov <bp@suse.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pabl
 o Neira Ayuso <pablo@netfilter.org>, Stefano Garzarella <sgarzare@redhat.com>, Petr Machata <petrm@nvidia.com>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Yu Zhe <yuzhe@nfschina.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, Yuwei Wang <wangyuweihx@gmail.com>, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Akhmat Karakotov <hmukos@yandex-team.ru>, "Martin K. Petersen" <martin.petersen@oracle.com>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, David Ahern <dsahern@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Florian Westphal <fw@strlen.de>, open list <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Chuck Lev
 er <chuck.lever@oracle.com>, Arnd Bergmann <arnd@arndb.de>, "open list:NETFILTER" <netfilter-devel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Antoine Tenart <atenart@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18. 08. 22, 2:43, Stephen Hemminger wrote:
> DECnet is an obsolete network protocol that receives more attention
> from kernel janitors than users. It belongs in computer protocol
> history museum not in Linux kernel.
> 
> It has been "Orphaned" in kernel since 2010. The iproute2 support
> for DECnet was dropped in 5.0 release. The documentation link on
> Sourceforge says it is abandoned there as well.
> 
> Leave the UAPI alone to keep userspace programs compiling.
> This means that there is still an empty neighbour table
> for AF_DECNET.
> 
> The table of /proc/sys/net entries was updated to match
> current directories and reformatted to be alphabetical.
> 
> Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> Acked-by: David Ahern <dsahern@kernel.org>

...
>   include/uapi/linux/dn.h                       |  149 -
>   include/uapi/linux/netfilter_decnet.h         |   72 -

Hi,

this breaks userspace. Some projects include linux/dn.h:

   https://codesearch.debian.net/search?q=include.*linux%2Fdn.h&literal=0


I found Trinity fails to build:
  net/proto-decnet.c:5:10: fatal error: linux/dn.h: No such file or 
directory
      5 | #include <linux/dn.h>



Should we provide the above as empty files?

thanks,
-- 
js
suse labs

