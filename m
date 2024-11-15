Return-Path: <linuxppc-dev+bounces-3295-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 570C69CF984
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 23:15:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xqrv42HMtz3c5N;
	Sat, 16 Nov 2024 09:15:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731708944;
	cv=none; b=IzY6ec6jpFTYfxwBhm/sX2MOgBkMTyTP+1xMPl5eIlStjKicCMILY8PsNvDb5u0YUkL1vIJvQcJCX/9vI6H+IMBvHGuymAKoItVJ/+MzaCBfokLBPNvgZPrTzlzssMegKUHC/aS6+YX2jNO+eJgMyk4FlStA/329QTn9Pl4LhDZugj3AKWsW7uhaJsmB5rzOP9jZsQnSZarZX7Ikz/t0XB3u6zD7g7pDYx4zmId9XxYZqV5pBb9E8sP1IKKerEqt13XdVGiBcsOXSTOYJ+IYWjBL3I6+yD8MU0AZv+xbpplS2btUEoa/i1Ox5HTkqt6+fPwn93o/0VLHXcqpGiUG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731708944; c=relaxed/relaxed;
	bh=3z7ywabUJ27i2rb14B4LEGDccer8KYu9+MGXqf4uX30=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fhh4HispYodXjmVOiTq7ggLTH1M6SH9anOQX2W257dIkD23uboBbokrYfiqI6JxZGySrm11JeZbGbtifd1Pvz04H+Zfpn3tuoe3Ga0QLKsLTceSFZvOqdbgGfW/wTVHwTYM57svfd8VmibeakHqxFEf3n2QmtpoQHEPG0SV+samPO6wVQvOv6Rf57vwjyiABh1u6aPzUS763lU6KTyI+nJRwNhqNMg/BtPbifiRaT10QA/ECNcowyUly3CKzYYbiVQYIN1J98W2YLDDhaqiEkOtG9GrMu24Mk8r4jnDJl9wPgNFbWmS5rhQxLvaP3E/MM2CyfspBHUaEFUEb9dbjAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=N1g55SdN; dkim-atps=neutral; spf=pass (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=N1g55SdN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xqrv32z4nz3c5B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 09:15:43 +1100 (AEDT)
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id C2E092064AEB;
	Fri, 15 Nov 2024 14:15:08 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C2E092064AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731708911;
	bh=3z7ywabUJ27i2rb14B4LEGDccer8KYu9+MGXqf4uX30=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=N1g55SdNOAVrXtoAUWPnvUkB3x2fHI9b6jafO92eRdbbD4Gte6s/kvOokfmkgYHJe
	 Frz5kbgdiLksPpFFaWRXGFZ7VcwJJIP77+3HbEyB4bGSyYhL140G+m7AP2fdg7ax7k
	 BFhXHlM0RPRrW6JGtgd18IntrfjEtsdFiu0GVoGc=
Message-ID: <8127a2e6-fa62-4c85-b7ed-24748cc9e285@linux.microsoft.com>
Date: Fri, 15 Nov 2024 14:15:08 -0800
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
 <anna-maria@linutronix.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Naveen N Rao <naveen@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Louis Peens <louis.peens@corigine.com>, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>, Miroslav Benes <mbenes@suse.cz>,
 Jiri Kosina <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Marcel Holtmann <marcel@holtmann.org>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jeroen de Borst <jeroendb@google.com>,
 Shailend Chand <shailend@google.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Ofir Bitton <obitton@habana.ai>,
 Sven Schnelle <svens@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Russell King <linux@armlinux.org.uk>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Daniel Mack <daniel@zonque.org>, Nicolas Palix <nicolas.palix@imag.fr>,
 Julia Lawall <Julia.Lawall@inria.fr>, Simon Horman <horms@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <10ee4e8f-d8b4-4502-a5e2-0657802aeb11@linux.microsoft.com>
 <3ac480f5-549b-4449-baa9-f766e074c409@quicinc.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <3ac480f5-549b-4449-baa9-f766e074c409@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11/15/2024 1:41 PM, Jeff Johnson wrote:
> On 11/15/2024 1:29 PM, Easwar Hariharan wrote:
>> On 11/15/2024 1:26 PM, Easwar Hariharan wrote:
>>> This is a series that follows up on my previous series to introduce
>>> secs_to_jiffies() and convert a few initial users.[1] In the review for
>>> that series, Anna-Maria requested converting other users with
>>> Coccinelle. This is part 1 that converts users of msecs_to_jiffies()
>>> that use the multiply pattern of either of:
>>> - msecs_to_jiffies(N*1000), or
>>> - msecs_to_jiffies(N*MSEC_PER_SEC)
>>>
>>> The entire conversion is made with Coccinelle in the script added in
>>> patch 2. Some changes suggested by Coccinelle have been deferred to
>>> later parts that will address other possible variant patterns.
>>>
>>> CC: Anna-Maria Behnsen <anna-maria@linutronix.de>
>>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>>
>>> [1] https://lore.kernel.org/all/20241030-open-coded-timeouts-v3-0-9ba123facf88@linux.microsoft.com/
>>> [2] https://lore.kernel.org/all/8734kngfni.fsf@somnus/
>>>
>>> ---
>>> Changes in v2:
>>> - EDITME: describe what is new in this series revision.
>>> - EDITME: use bulletpoints and terse descriptions.
>>> - Link to v1: https://lore.kernel.org/r/20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com
>>>
>>
>> Apologies, I missed out on editing the changelog here. v1 included a
>> patch that's already been accepted, there are no other changes in v2.
>>
>> Thanks,
>> Easwar
> 
> How do you expect this series to land since it overlaps a large number of
> maintainer trees? Do you have a maintainer who has volunteered to take the
> series and the maintainers should just ack? Or do you want the maintainers to
> take the individual patches that are applicable to them?
> 
> /jeff

I am hoping for tglx to take it through his tree since the patch
introducing secs_to_jiffies() is in his tree, so sequencing of
dependencies would not be an issue.

But if tglx won't, we could push it out another cycle and individual
maintainers can take the patches that are applicable to their tree for
the series.

Thanks,
Easwar

