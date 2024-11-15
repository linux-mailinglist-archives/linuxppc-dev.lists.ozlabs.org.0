Return-Path: <linuxppc-dev+bounces-3304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F33CB9CF99A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 23:17:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xqrwt74Mqz3c9M;
	Sat, 16 Nov 2024 09:17:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731706521;
	cv=none; b=hroF2Jq3wwzNXeDnLN0B7l4rU9hFACIR0wiTzhWfQVSJodIDhuBR/JVt2D3SVQE4z0zozYMyz1GI5vFPZTzkI3WucpvJog6ykcwQ1RDOr4VyFFkckDbo2x0ruSTvKqd9yUjZeojGQ08DJ0kDz8WsOUfbJhnoED4H5okC+8fzkgkt/k9TA6A7b0RD9TSqKVUtm+WbaesBOOjwrb9i6eVO0izB5bWJr+DtM0tItOg3ygZNkvShe+hIxkWbQKFkYynqFO83JzBHXQAdveeD72cH13ga3taixCuBVbc0F4lwcVJmEPzTmQQE4mD8t/+SoIyDruQKFKpMqo4lv/Zo6vR+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731706521; c=relaxed/relaxed;
	bh=OEAxYqndmV97fB2t7JocLL7u1S4ql6E8JdtDlfM98mA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XEI/xO5TLr1CW3mIAlTiB43HYj8VZSBI5jxTJboN57mjRuLYJyW6MZRmpBK/oLORY2eQFmr36XfBZNhZXUyOamZio1COxa1x/XcxcdKq5oppxIEZ6Z3aDnhcmsBYebL3Hmimspu8suR7gEtY/Z6snSWFtoQABePKpqOQbz3JMcsNI4MX3o0ElAdFHQjOiSiz63J02p3ssE75YMdzKbksg5O32ZTQodiEviZSqTdzMbh1EXz5ZsOqhmE25rMfK2p1RZKOFEw9iGVj3qRNf9MeS1t1rNu4aheGPhQPs5YeHrD4p2Bho4U3RD+q+xpaaPSUA4RBMImyubL8xT8z909SEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=Xurk/K9N; dkim-atps=neutral; spf=pass (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=Xurk/K9N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xqr0S4F0Xz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 08:35:20 +1100 (AEDT)
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 684CD2064AE8;
	Fri, 15 Nov 2024 13:34:46 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 684CD2064AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731706489;
	bh=OEAxYqndmV97fB2t7JocLL7u1S4ql6E8JdtDlfM98mA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Xurk/K9NZ4Pt7R0qwaS9VSYSKCTMSaNp/aapEsQZCtIT74ft5tvctXWuFivs3Zswx
	 hrelPOn+ppZ3FOsJiI+79MeaWo7lX97CMgyLO8+gyOebFfO+/iJc5GjxBT3U1ILKzl
	 NFamFr9+2AnMiAp4lQnkRWbNDRlCI9FqXsyeg14c=
Message-ID: <ae1f83c3-88fe-4b75-9446-e7e711b954ae@linux.microsoft.com>
Date: Fri, 15 Nov 2024 13:34:46 -0800
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
Cc: eahariha@linux.microsoft.com, netfilter-devel@vger.kernel.org,
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
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Michael Kelley <mhklinux@outlook.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: Re: [PATCH 22/22] jiffies: Define secs_to_jiffies()
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
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
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v1-22-19aadc34941b@linux.microsoft.com>
 <e1ff4b71-7abf-4ac6-8b82-86aad5394de6@quicinc.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <e1ff4b71-7abf-4ac6-8b82-86aad5394de6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11/15/2024 1:30 PM, Jeff Johnson wrote:
> On 11/15/2024 1:22 PM, Easwar Hariharan wrote:
>> secs_to_jiffies() is defined in hci_event.c and cannot be reused by
>> other call sites. Hoist it into the core code to allow conversion of the
>> ~1150 usages of msecs_to_jiffies() that either:
>>
>>  - use a multiplier value of 1000 or equivalently MSEC_PER_SEC, or
>>  - have timeouts that are denominated in seconds (i.e. end in 000)
>>
>> It's implemented as a macro to allow usage in static initializers.
>>
>> This will also allow conversion of yet more sites that use (sec * HZ)
>> directly, and improve their readability.
>>
>> Suggested-by: Michael Kelley <mhklinux@outlook.com>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> Reviewed-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>> Link: https://lore.kernel.org/all/20241030-open-coded-timeouts-v3-1-9ba123facf88@linux.microsoft.com
> 
> your signed-off-by should be last.
> 
> and you have a patch ordering problem since this patch must come before all
> the patches that use secs_to_jiffies(), otherwise this series cannot be bisected

Thanks for the quick response, indeed this patch is already in tip[1], I
pulled it in for testing the series but missed out on removing it before
sending. Please review v2 that excludes this:
https://lore.kernel.org/all/20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com/

[1]: https://git.kernel.org/tip/b35108a51cf7bab58d7eace1267d7965978bcdb8

Thanks,
Easwar

