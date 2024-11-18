Return-Path: <linuxppc-dev+bounces-3418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C63D9D17CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 19:14:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsbNk5qVFz3039;
	Tue, 19 Nov 2024 05:13:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731953638;
	cv=none; b=cghhXq0eTud2F1++K2TyB9d6ymBdeVubvkqdVDH1h9EI1usFrAilaVBqu7nbcaso96YcSqzPx/Pv61lMMPBGZaewn91txPgrc29D975XqpGxhXsdIpT1A3zIp3aob3/hF2iW5MMDL6kB700pRAL0DS/fZphR5YLuQnRstZ5nJfNrmd530rFiJlf837J8wEJh6Vk3KxXMMjKBnNHXYd8ZGMp86Df+hFE1R17ouBvjW96Au23cwCIPCMKitC+dUA1jf9ZrbvK+0FJk1FXNc+WafvmQn2MlwRHL9D/1LG5FYR1nd17SQ2sBC197nbRku+g1eXn0pNxNb1tq3Y1dEXD36g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731953638; c=relaxed/relaxed;
	bh=4rGKqWlJzIh5S6WJog1UbY+9wr2RIzuf6CA98XkvD9A=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AOMw+vDCjPKxntUwyb9DmixOCnl8qw+y1fo/kEJFQm9WT4Ow9JCnNhxxrsdaNUKzmok5uFclvl6zkYDLPRqbfqznIxLgj7JAva9rwFQj8v1hTZd8bwzpIElUzVQOYwPHjSe9SLZ6xuXpJIkBdtBR/39uaJ5qBB/uRiArHu7jShwgH1XCaiLztvRZuSclavUQ1GBb2rHO9hZQiJGVV/HMFQT/b0DfAGsaDQq70Ys0DEleEc3MwSsPWjkNk1V0kND8GREQZ/hv6oBFMsA5/intVdvkwR1RsRazVJXui9YuGu3lDSPso1ouV2jzoVEGz51n4MbOJtIrZowMpTclUWoTuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=WgQq6VDm; dkim-atps=neutral; spf=pass (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=WgQq6VDm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsbNj5GxVz2yNt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 05:13:57 +1100 (AEDT)
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 079B420B7D5F;
	Mon, 18 Nov 2024 10:13:24 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 079B420B7D5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731953606;
	bh=4rGKqWlJzIh5S6WJog1UbY+9wr2RIzuf6CA98XkvD9A=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=WgQq6VDmQPqDVd9HrdDJWYVeePI1o6O7aH2e5YK2i2MPTb79KOYC8kOEtCVdZyQyl
	 eQBQq4Gru6AuE3dhO0MWMctvjnMle6WwOzCHVKzijDojX1XF1tLPvCR2mFqRKiKQA2
	 T8BTz//c1DSiW16jlJvFvYtwS5WkMEtzzK+2O4cI=
Message-ID: <c2a5d9d2-ac73-46b0-9d2e-6960e2a13c1e@linux.microsoft.com>
Date: Mon, 18 Nov 2024 10:13:23 -0800
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
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
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
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 eahariha@linux.microsoft.com, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, cocci@inria.fr,
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
Subject: Re: [PATCH v2 01/21] netfilter: conntrack: Cleanup timeout
 definitions
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-1-911fb7595e79@linux.microsoft.com>
 <b370e8d0-2f87-4819-8f30-1181946295d9@csgroup.eu>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <b370e8d0-2f87-4819-8f30-1181946295d9@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11/16/2024 1:40 AM, Christophe Leroy wrote:
> 
> 
> Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
>> [Vous ne recevez pas souvent de courriers de
>> eahariha@linux.microsoft.com. Découvrez pourquoi ceci est important à
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> None of the higher order definitions are used anymore, so remove
>> definitions for minutes, hours, and days timeouts. Convert the seconds
>> denominated timeouts to secs_to_jiffies()
> 
> There is very similar things with tcp_timeouts[] in
> nf_conntrack_proto_tcp.c, why not convert it as well ?

This patch happens to have been hand-modified and not by Coccinelle.
I'll consider tcp_timeouts[] for v3, but that actually seems to have
minute, hour, and days denominated timeouts, and replacing the 4 SECS
timeouts may actually hinder readability in that file.

> 
>>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>> ---
>>   net/netfilter/nf_conntrack_proto_sctp.c | 21 ++++++++-------------
>>   1 file changed, 8 insertions(+), 13 deletions(-)
>>
>> diff --git a/net/netfilter/nf_conntrack_proto_sctp.c b/net/netfilter/
>> nf_conntrack_proto_sctp.c
>> index
>> 4cc97f971264ed779434ab4597dd0162586b3736..6c95ac96fa42a39acafb5b88a7cf8898010e911c 100644
>> --- a/net/netfilter/nf_conntrack_proto_sctp.c
>> +++ b/net/netfilter/nf_conntrack_proto_sctp.c
>> @@ -39,20 +39,15 @@ static const char *const sctp_conntrack_names[] = {
>>          [SCTP_CONNTRACK_HEARTBEAT_SENT]         = "HEARTBEAT_SENT",
>>   };
>>
>> -#define SECS  * HZ
>> -#define MINS  * 60 SECS
>> -#define HOURS * 60 MINS
>> -#define DAYS  * 24 HOURS
>> -
>>   static const unsigned int sctp_timeouts[SCTP_CONNTRACK_MAX] = {
>> -       [SCTP_CONNTRACK_CLOSED]                 = 10 SECS,
>> -       [SCTP_CONNTRACK_COOKIE_WAIT]            = 3 SECS,
>> -       [SCTP_CONNTRACK_COOKIE_ECHOED]          = 3 SECS,
>> -       [SCTP_CONNTRACK_ESTABLISHED]            = 210 SECS,
>> -       [SCTP_CONNTRACK_SHUTDOWN_SENT]          = 3 SECS,
>> -       [SCTP_CONNTRACK_SHUTDOWN_RECD]          = 3 SECS,
>> -       [SCTP_CONNTRACK_SHUTDOWN_ACK_SENT]      = 3 SECS,
>> -       [SCTP_CONNTRACK_HEARTBEAT_SENT]         = 30 SECS,
>> +       [SCTP_CONNTRACK_CLOSED]                 = secs_to_jiffies(10),
>> +       [SCTP_CONNTRACK_COOKIE_WAIT]            = secs_to_jiffies(3),
>> +       [SCTP_CONNTRACK_COOKIE_ECHOED]          = secs_to_jiffies(3),
>> +       [SCTP_CONNTRACK_ESTABLISHED]            = secs_to_jiffies(210),
>> +       [SCTP_CONNTRACK_SHUTDOWN_SENT]          = secs_to_jiffies(3),
>> +       [SCTP_CONNTRACK_SHUTDOWN_RECD]          = secs_to_jiffies(3),
>> +       [SCTP_CONNTRACK_SHUTDOWN_ACK_SENT]      = secs_to_jiffies(3),
>> +       [SCTP_CONNTRACK_HEARTBEAT_SENT]         = secs_to_jiffies(3),
> 
> Was 30 before, if you think it must be changed to 3 you must explain it
> in the commit message, or maybe do another patch for that change.

This one's a typo, I'll fix it in v3.

Thanks,
Easwar

