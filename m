Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E94D598245
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 13:32:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7jRC3ZZ8z3cdk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 21:32:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=blackwall-org.20210112.gappssmtp.com header.i=@blackwall-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=8WejKLL+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=blackwall.org (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=razor@blackwall.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=blackwall-org.20210112.gappssmtp.com header.i=@blackwall-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=8WejKLL+;
	dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7bbT3bXkz2xrW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 17:09:09 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id uj29so1674075ejc.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 00:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=uB1dny6tZXinATmuz0fIf4H2QaK3MjZ8vYEWovRHfu4=;
        b=8WejKLL+aMqLWC0O3FQnTQmsIGmJCsnGHI2BDlBU8o4VWw/LcfeBgWzHmX3qQ0kNdP
         i2wsCNg8dEG2PeAx3BljZBM7q9E11q3FuTEevJM6v/fsy6yCCds3XLZ0KNJgMEwickhT
         5pX++joOCNvyGmso9a/ojzehd7Cu+02vF5ZdH+w627ZOLQGf12vEwqgwdFkq2GSxyk3o
         qKVx23t5WYxxqDzVDlUxryvOZHIM45E9l9h0uZxMmePvFva3B4rfwF+trq833C+5x8YJ
         SqjNNHj/sd925+/MH11H9yWzWNmxhAGk+W5tp0j6FKddjOmqYwdrEqQ2VLWtuHStlIh3
         ns3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=uB1dny6tZXinATmuz0fIf4H2QaK3MjZ8vYEWovRHfu4=;
        b=dydUOJyQwFm6+raHjnUD1MYCpEx7HXaZQr2qyM7rXljb7LLGOw1+FIZGLithA3rx0x
         0il99NYUHTD8bU2KvWiIM08wCn8GDW4wZTojkv+dLPjjtsBwZ8t+ufZtKLiOAk2rZ1Gq
         vKkB610jnNNH/CNdPoUB7YkY0EFsuwkKGbgqoUAsySDK4PDSenF5UT7/6JdeNmf1eSIV
         mzDdVLCyOAa2czKqCSWUQ1GKndfPBzX9BubEqC8U00VESiwh25Z6BgoimbFYupjdVhxI
         ngYzPLkUXoTS+DsTIL1dRFDXRZeJwGJnAAMGu+fJeJjdRO7j9Peuv5tub2/1dH3XCFRB
         E0eg==
X-Gm-Message-State: ACgBeo3lTomTW178Y382wqwzW3JCMTckdrYXRP4q8lNWMLZaPtHFWnDx
	OlUZ27+S/IdDG492msVPo+AflA==
X-Google-Smtp-Source: AA6agR6L6Nq587p/lJCgXhHMIohS0fuUSvnisu370SwFRdqGr62Y3rWmL+GZ/dHscdaOTusJwrlmKQ==
X-Received: by 2002:a17:906:6a2a:b0:730:a3f1:aee with SMTP id qw42-20020a1709066a2a00b00730a3f10aeemr1105108ejc.387.1660806544983;
        Thu, 18 Aug 2022 00:09:04 -0700 (PDT)
Received: from [192.168.0.111] (87-243-81-1.ip.btc-net.bg. [87.243.81.1])
        by smtp.gmail.com with ESMTPSA id f28-20020a056402329c00b004418c7d633bsm594454eda.18.2022.08.18.00.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 00:09:04 -0700 (PDT)
Message-ID: <10091e35-491a-c10f-35ec-044357f09e3e@blackwall.org>
Date: Thu, 18 Aug 2022 10:09:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH net-next] Remove DECnet support from kernel
Content-Language: en-US
To: Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org
References: <20220818004357.375695-1-stephen@networkplumber.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20220818004357.375695-1-stephen@networkplumber.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 18 Aug 2022 21:31:51 +1000
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "open list:MIPS" <linux-mips@vger.kernel.org>, Wang Qing <wangqing@vivo.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Eric Dumazet <edumazet@google.com>, Nathan Fontenot <nathan.fontenot@amd.com>, Suma Hegde <suma.hegde@amd.com>, Paolo Abeni <pabeni@redhat.com>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Menglong Dong <imagedong@tencent.com>, Florian Fainelli <f.fainelli@gmail.com>, Xin Long <lucien.xin@gmail.com>, Chen Yu <yu.c.chen@intel.com>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, Xie Yongji <xieyongji@bytedance.com>, "open list:NETFILTER" <coreteam@netfilter.org>, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Borislav Petkov <bp@suse.de>, "open list:NETFILTER" <netfilter-devel@vger.ker
 nel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, Stefano Garzarella <sgarzare@redhat.com>, Petr Machata <petrm@nvidia.com>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Yu Zhe <yuzhe@nfschina.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, Yuwei Wang <wangyuweihx@gmail.com>, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Akhmat Karakotov <hmukos@yandex-team.ru>, "Martin K. Petersen" <martin.petersen@oracle.com>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, David Ahern <dsahern@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Florian Westphal <fw@strlen.de>, open list <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.n
 et>, Chuck Lever <chuck.lever@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Antoine Tenart <atenart@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18/08/2022 03:43, Stephen Hemminger wrote:
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
> ---
> 
> Incorporates feedback from the initial RFC.
> The MPLS neighbour table to family table is left alone.
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>




