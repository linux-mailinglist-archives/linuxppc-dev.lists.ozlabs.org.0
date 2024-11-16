Return-Path: <linuxppc-dev+bounces-3312-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD11E9CFB87
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 01:13:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqvWK38VBz3cB5;
	Sat, 16 Nov 2024 11:13:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731716029;
	cv=none; b=TeNjnAKzR9N7sqLwHUnbck7/E9poqFNiLrcFKbCGOZqHK7Z2ypuaY9ClmRILjQsMCnsAGNH2NWGGUQftBdbtxbnDmndNo81GrR97ECwoSJz5aBVA1P/vBXqf+97jHbSi6FiGlXLThgdWBvuRJ2+oZKuA62jPU2jVeQNbIOqOymW05vAVZuNDeW8nFaYc6kKr0E0woQWRG5v1eVHSHyin5oI1U+X4iwoiSkYiRwgBrqg0kXtlgZzuYiSssm4apIWAZWohx6tyuS+eHsY3lo0UmDzapgokzzLiq1p9rhJWwesCk16zUGIJWYYvLVygDztWZfee+WmV+4B1a4wBc/9l/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731716029; c=relaxed/relaxed;
	bh=8aWsE6KsHqgZAR/UTPX2BOaIFAyMPoSLG9xpC4Hm8PA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CDUf9NnYtJmKOgz/LcxvyQ8XuWbCWM7EaI+6ipYq6bHZlmW/oxjUAxpHI18FLJh6/GWsHSeXdjOCHvNurELHqmyqTnqOxYHN4CGEsiWm4Qy5bLJ4VA1X93gtUOGnATs0rJMuX9v9Wb9R3Eq/QF1cIyOSPqcXPeoXpdUiT5ibzv+oGRGiFztrjVrfP+e8nC2PDEVrnM6j52hDrMOEe4Skl5+ybGgtDCGgIHA9uzNM333KcjWxfvLVs1zJ0zXxB1056yadSraATzlYmgo9UKwP2vEAsfPRnlRnMDKpRts7sGUqlcj8L/FgxBTS7PJkIH9NNNqbfqIQ+LZCbVWhb0JElw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=juHtZTV0; dkim-atps=neutral; spf=pass (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=juHtZTV0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqvWJ3Rrzz3c6n
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 11:13:48 +1100 (AEDT)
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 95E342064AF0;
	Fri, 15 Nov 2024 16:13:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 95E342064AF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731715997;
	bh=8aWsE6KsHqgZAR/UTPX2BOaIFAyMPoSLG9xpC4Hm8PA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=juHtZTV0RDh+wTFwjvF/I5Cbue56gEXjd0kD3znUPuWXx2wtRwF3SiJZ6HWwI5inJ
	 TBVBD9vnbAv41iOqcNYfHcjXy0Jo4vpPQnYC829Cp+vZARPfhAL4M9phLDROf5akb8
	 KGqyHrYITaajwfOdtt56+uCdzgps3Ezs57MjrN0w=
Message-ID: <0b4bbd38-f6aa-4091-b7db-8b87572ad83a@linux.microsoft.com>
Date: Fri, 15 Nov 2024 16:13:13 -0800
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
Cc: eahariha@linux.microsoft.com, Pablo Neira Ayuso <pablo@netfilter.org>,
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
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
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
Subject: Re: [PATCH v2 01/21] netfilter: conntrack: Cleanup timeout
 definitions
To: Stephen Rothwell <sfr@canb.auug.org.au>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-1-911fb7595e79@linux.microsoft.com>
 <20241116093458.4aa19a0e@canb.auug.org.au>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20241116093458.4aa19a0e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
	UPPERCASE_50_75 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11/15/2024 2:34 PM, Stephen Rothwell wrote:
> Hi Easwar,
> 
> On Fri, 15 Nov 2024 21:26:18 +0000 Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>>
>>  static const unsigned int sctp_timeouts[SCTP_CONNTRACK_MAX] = {
>> -	[SCTP_CONNTRACK_CLOSED]			= 10 SECS,
>> -	[SCTP_CONNTRACK_COOKIE_WAIT]		= 3 SECS,
>> -	[SCTP_CONNTRACK_COOKIE_ECHOED]		= 3 SECS,
>> -	[SCTP_CONNTRACK_ESTABLISHED]		= 210 SECS,
>> -	[SCTP_CONNTRACK_SHUTDOWN_SENT]		= 3 SECS,
>> -	[SCTP_CONNTRACK_SHUTDOWN_RECD]		= 3 SECS,
>> -	[SCTP_CONNTRACK_SHUTDOWN_ACK_SENT]	= 3 SECS,
>> -	[SCTP_CONNTRACK_HEARTBEAT_SENT]		= 30 SECS,
>> +	[SCTP_CONNTRACK_CLOSED]			= secs_to_jiffies(10),
>> +	[SCTP_CONNTRACK_COOKIE_WAIT]		= secs_to_jiffies(3),
>> +	[SCTP_CONNTRACK_COOKIE_ECHOED]		= secs_to_jiffies(3),
>> +	[SCTP_CONNTRACK_ESTABLISHED]		= secs_to_jiffies(210),
>> +	[SCTP_CONNTRACK_SHUTDOWN_SENT]		= secs_to_jiffies(3),
>> +	[SCTP_CONNTRACK_SHUTDOWN_RECD]		= secs_to_jiffies(3),
>> +	[SCTP_CONNTRACK_SHUTDOWN_ACK_SENT]	= secs_to_jiffies(3),
>> +	[SCTP_CONNTRACK_HEARTBEAT_SENT]		= secs_to_jiffies(3),
> 
> You have changed this last timeout from 30 seconds to 3 (presumably
> just a copy and paste error).
> 

Will fix in v3.

