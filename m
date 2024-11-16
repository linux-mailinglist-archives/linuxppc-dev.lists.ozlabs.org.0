Return-Path: <linuxppc-dev+bounces-3317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD1E9CFD8F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 10:40:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xr85V3nqpz2xxw;
	Sat, 16 Nov 2024 20:40:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731750046;
	cv=none; b=E7lq7hnsCYNxYcJ9RStkEZ0ZtAawAYBpamQ1adaDhA4k91mER3lMNh1A9tgzaEp++y0j7pwFjR6rK+hah4XNPrwE29K3jiAWbcKQom45WNbvmaZMXfymvyX0AmDgqNRL+ifzrXEwVN6QJchA9F7J62u0+bEgk7O2fz2kxyrNOkH290fQxvGD5/Eez83BMcCtDNBbqvtQPcfobHos+7aMxUrHqKQY8ndssEHreY+sLVRWOO+0mqCThK1R0VVdzLmfGwB3KPzYqWug1lrsKZ8ZBW1UbIh6sY3c4UTx9EeKkm6KnbfvHVj8l5/DybQ7BZebzckuK8Oqci+8pM1RKVlVPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731750046; c=relaxed/relaxed;
	bh=VPdyc30iNLh1F/YcS88wqEE6MNTecDdE0d2dBEGzlFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIbG6pCtrs2dNTT7L8RtElrZZLSZUbX6U34vMVRmzW96oBbCBqHtxfo5lfNbVy07K9I9TbwfiKEdaD5UKYKV5ee3/1tQE+DSGx9smPhvE0OhkKxpHN1jzAxhY6iW2kZfPT4pNje5pgvy0e7piVZxIEFoTPR6kXz1sMGDf2oNIfaDPQ4fKBHMKn4y/Aj5ktJfSO7oul+90G/pIZy+5rOIWAFbBM0B+9t9b1Om4GYRULfWEmQaWPlQos9AdC/NzBNlRt/EgZ5MOq3tI8ympp2khcOktKvChuw6pAmPZnypMoIBHrxeuNBRw+dFXXj+mK47LO/1eJINJYx2NUQQXjrzlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xr85S5krtz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 20:40:43 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Xr85N5Gv6z9sSR;
	Sat, 16 Nov 2024 10:40:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSlaypuNxNm4; Sat, 16 Nov 2024 10:40:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xr85N41fnz9sSL;
	Sat, 16 Nov 2024 10:40:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6B8F18B7A0;
	Sat, 16 Nov 2024 10:40:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9RKIVUrbVgoj; Sat, 16 Nov 2024 10:40:40 +0100 (CET)
Received: from [192.168.232.159] (POS169858.IDSI0.si.c-s.fr [192.168.232.159])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EDBE28B763;
	Sat, 16 Nov 2024 10:40:36 +0100 (CET)
Message-ID: <b370e8d0-2f87-4819-8f30-1181946295d9@csgroup.eu>
Date: Sat, 16 Nov 2024 10:40:36 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/21] netfilter: conntrack: Cleanup timeout
 definitions
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann
 <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-1-911fb7595e79@linux.microsoft.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-1-911fb7595e79@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
> [Vous ne recevez pas souvent de courriers de eahariha@linux.microsoft.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> None of the higher order definitions are used anymore, so remove
> definitions for minutes, hours, and days timeouts. Convert the seconds
> denominated timeouts to secs_to_jiffies()

There is very similar things with tcp_timeouts[] in 
nf_conntrack_proto_tcp.c, why not convert it as well ?

> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>   net/netfilter/nf_conntrack_proto_sctp.c | 21 ++++++++-------------
>   1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/net/netfilter/nf_conntrack_proto_sctp.c b/net/netfilter/nf_conntrack_proto_sctp.c
> index 4cc97f971264ed779434ab4597dd0162586b3736..6c95ac96fa42a39acafb5b88a7cf8898010e911c 100644
> --- a/net/netfilter/nf_conntrack_proto_sctp.c
> +++ b/net/netfilter/nf_conntrack_proto_sctp.c
> @@ -39,20 +39,15 @@ static const char *const sctp_conntrack_names[] = {
>          [SCTP_CONNTRACK_HEARTBEAT_SENT]         = "HEARTBEAT_SENT",
>   };
> 
> -#define SECS  * HZ
> -#define MINS  * 60 SECS
> -#define HOURS * 60 MINS
> -#define DAYS  * 24 HOURS
> -
>   static const unsigned int sctp_timeouts[SCTP_CONNTRACK_MAX] = {
> -       [SCTP_CONNTRACK_CLOSED]                 = 10 SECS,
> -       [SCTP_CONNTRACK_COOKIE_WAIT]            = 3 SECS,
> -       [SCTP_CONNTRACK_COOKIE_ECHOED]          = 3 SECS,
> -       [SCTP_CONNTRACK_ESTABLISHED]            = 210 SECS,
> -       [SCTP_CONNTRACK_SHUTDOWN_SENT]          = 3 SECS,
> -       [SCTP_CONNTRACK_SHUTDOWN_RECD]          = 3 SECS,
> -       [SCTP_CONNTRACK_SHUTDOWN_ACK_SENT]      = 3 SECS,
> -       [SCTP_CONNTRACK_HEARTBEAT_SENT]         = 30 SECS,
> +       [SCTP_CONNTRACK_CLOSED]                 = secs_to_jiffies(10),
> +       [SCTP_CONNTRACK_COOKIE_WAIT]            = secs_to_jiffies(3),
> +       [SCTP_CONNTRACK_COOKIE_ECHOED]          = secs_to_jiffies(3),
> +       [SCTP_CONNTRACK_ESTABLISHED]            = secs_to_jiffies(210),
> +       [SCTP_CONNTRACK_SHUTDOWN_SENT]          = secs_to_jiffies(3),
> +       [SCTP_CONNTRACK_SHUTDOWN_RECD]          = secs_to_jiffies(3),
> +       [SCTP_CONNTRACK_SHUTDOWN_ACK_SENT]      = secs_to_jiffies(3),
> +       [SCTP_CONNTRACK_HEARTBEAT_SENT]         = secs_to_jiffies(3),

Was 30 before, if you think it must be changed to 3 you must explain it 
in the commit message, or maybe do another patch for that change.

>   };
> 
>   #define        SCTP_FLAG_HEARTBEAT_VTAG_FAILED 1
> 
> --
> 2.34.1
> 

Christophe


