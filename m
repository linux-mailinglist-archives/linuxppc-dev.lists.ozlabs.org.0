Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B6B4FF1A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 10:19:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kdb8v42D0z3bdM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 18:19:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZO7+1DjF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531;
 helo=mail-ed1-x531.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZO7+1DjF; dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kdb8D1fYsz2yPY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 18:18:34 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id b15so1426439edn.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 01:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NM1pfbSgTEQ9uckWSvNkdocJAYN18ejH2fT6Ofk0eeU=;
 b=ZO7+1DjFeRVhMTsgznRttF4gB2w6B0IYKtFlA4KFq1h3iyBj5QYxSIJne7Yh506ZqM
 swB8QzLiPoWAF3LMh/l3KgD4/mNV4sn59GaBuq53ifDYJ6XuI8eoXMS+5IhfE3NKTDB/
 I4zsbZ5y//peeXAXtyPrmwrTYKsLaEVebBGl+MJmM70/yZUB/e0WGb3YVaxtS0h1vOUV
 7z+2mxqxR0TqdfF1n8LGT7V81mhY2K9kNXpsvuTebVelCQRK3PT0oTHKyMEwiPUGb15s
 FN7kEnSW2tGnQUNQWa/CAboo8LsqaQvW3AqfeP4IN1PEMq1kjLOJjqSJx/cXQ7Gfo5pP
 dacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NM1pfbSgTEQ9uckWSvNkdocJAYN18ejH2fT6Ofk0eeU=;
 b=vzhTDlHOq5M3u8K1d2dPUzrr7UavFFRJwRBG9T1hlxNCKAljxjXB+tqUNh3/4KND/D
 0ftbTxoff/ZwY4NlbqBgIPiwFCoTzIN86qFB6y5tzTRTY8dP5RR8mYZiZbAg/9mczLdG
 Cs/tV1NK/XT9ZbgqvvV+A0f74rvbRMncGD8QlBb+iWXcEec4XpEhXVf2fHtU6pu/gc5G
 qnjDvUA4mbnCss7y/ELehUneTgP7SFvr5DF31mpByLr/5JJ7+kvPrv/yFSNpvzLqUWpY
 BnhVcrifo448gsqROo82jTqoKqV8d3DNWpcHFskaiSFCG4Yg+SpP7LKENhXOZQ6W4FcY
 lcQw==
X-Gm-Message-State: AOAM531JBETHvwReEQoGX7jpxhR7I0V6T3yA4k3HdSFaRBAAhISLnKVz
 THtB8+KOCSFIlsUdhEtZsWU=
X-Google-Smtp-Source: ABdhPJz1zFDl7IwBBpiJdJJrHQx/gNJ9eFMxB5nFGFZzuNCuKc3atEKIDRvXQCvDLr+YN63LNf2RhA==
X-Received: by 2002:a05:6402:51c6:b0:419:8269:f33d with SMTP id
 r6-20020a05640251c600b004198269f33dmr41758137edd.264.1649837910214; 
 Wed, 13 Apr 2022 01:18:30 -0700 (PDT)
Received: from smtpclient.apple (i130160.upc-i.chello.nl. [62.195.130.160])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170906780400b006ce69ff6050sm13728111ejm.69.2022.04.13.01.18.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Apr 2022 01:18:29 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH net-next v3 14/18] sfc: Remove usage of list iterator for
 list_add() after the loop body
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <20220412142905.54489567@kernel.org>
Date: Wed, 13 Apr 2022 10:18:28 +0200
Content-Transfer-Encoding: 7bit
Message-Id: <132EC4A3-4397-4124-B736-0C3057B63B26@gmail.com>
References: <20220412121557.3553555-1-jakobkoschel@gmail.com>
 <20220412121557.3553555-15-jakobkoschel@gmail.com>
 <20220412142905.54489567@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Yonghong Song <yhs@fb.com>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 UNGLinuxDriver@microchip.com, Edward Cree <ecree.xilinx@gmail.com>,
 Michael Walle <michael@walle.cc>, Casper Andersson <casper.casan@gmail.com>,
 Xu Wang <vulab@iscas.ac.cn>, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 bpf@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Martin KaFai Lau <kafai@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 12. Apr 2022, at 23:29, Jakub Kicinski <kuba@kernel.org> wrote:
> 
> On Tue, 12 Apr 2022 14:15:53 +0200 Jakob Koschel wrote:
>> -	struct list_head *head = &efx->rss_context.list;
>> +	struct list_head *head = *pos = &efx->rss_context.list;
> 
> ENOTBUILT, please wait with the reposting. Since you posted two
> versions today I guess that's 2x 24h? :)

oh gosh, seems like I indeed forgot to build this commit.
Sorry about all the mess :( Also I'll wait with reposting (not
going to make the same mistake twice ;)).

I messed up three times yesterday, was really not on a high.
I'll be more careful in the future to not the the same kind of
mistakes again :/
