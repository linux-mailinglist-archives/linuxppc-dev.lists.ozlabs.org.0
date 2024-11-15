Return-Path: <linuxppc-dev+bounces-3309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F429CFB0F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 00:21:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqtLJ6Lwmz3c8G;
	Sat, 16 Nov 2024 10:20:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731712856;
	cv=none; b=EF3SzJPo2p4BzBO0Dvn6UYneZmvhUXjN1IoA0kS5K8tKH9nDKGzu747mOGOVsGtIg/tVDlsb84HuzuxOdeJ0VDtjorNh/RioAftqLXZb1zksucJ56WbxfIRqqN3KLMv3L5eL4Gh1k2vzwkh5x9b4n6/FkYWBGbRDAdSixV6KsZTjch2h3iHOtt/cIVL9jve8r8SnYbWTXbPTnQeKem6m8cCKA3xa/AcHvLtOVgxm5BZn/w5YeSLKFciXKoQq+3xSBbThCpMzg/dqYuDvSW9a4EknSVwnvPh+H/fkH+ILH/Q3A/+ofSRgi3YDu9xwe9QlCUJfWBXjZPzVN2GNmMXF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731712856; c=relaxed/relaxed;
	bh=ocF2UaqffllWgiGWdH3dEXBRLSQ8zx6v3UTSvYUEWBM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d3N6L5OGpTsNPn18snnxNcc6s6BBBwD7RIo/0dlR0jNeT8zJPzmDh6CYU4XMxe14A6dH7lRX4lgOAWzlLTMXTWKAv8gur2ERQc7/PY3S4gx9LZBw8Rb+QnRGHkKdI2vWL8mDHSu8w+S9xIeunmiRimYe3SPnLMM0l3zw0kWCkb4OdPedqhFsAxBLMYk+MX67yhwrIDgtKPtozLyFeXrhN+OB5OgsYsU77+8EYYZcZs25MHdtFgyJ44mhV4m/xkGQfvoqwcnYDF2OvSXNFz2ssz/g2L2qP1vSfcd0VTzAmHHwDMV5/Fc12WqrlVXZqfotgcE2v5In48lYYgLUdYbztA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SaYzzMZW; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=o0jZxjqE; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SaYzzMZW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=o0jZxjqE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqtLG6ctZz3bt2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 10:20:54 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731712845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ocF2UaqffllWgiGWdH3dEXBRLSQ8zx6v3UTSvYUEWBM=;
	b=SaYzzMZW0ZsY0TGo8HlsbXzuUvCi20iDEgp+8ohYBSE4TZQXRHLKLbged2BOetLpsx4OkO
	tbZB0k+QLCEJmNzJNJ7TX06kODrXybKEr0MN0pB2oucYCsCZhXwiPTvkrVYx4d0RSom1W9
	M5V6DhOs4++KN4sHh/UkGD4PfYSgL/msvq0en1H26aBKpf6quxCthUWooMmyaT4o/QkfC2
	lCNSo4ipp434fYIwklbWGy8m/kIcsHAL1J9mGF0JwBaNElltRXstfx+KSUKFTEf5oJlO1l
	imvGv9XAnBM1fMHYuOdaaDvDY2O6X0pakSlzfvsLT9wL98INhCHIDkaV3HsBDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731712845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ocF2UaqffllWgiGWdH3dEXBRLSQ8zx6v3UTSvYUEWBM=;
	b=o0jZxjqE/bb/KZAxT0liDWVEJtakeTQr/m7JfpgliBKuwvw5FjJoNIULPPZ+hcCbxwHCjD
	VmO8h0eWyvF8dzAA==
To: Easwar Hariharan <eahariha@linux.microsoft.com>, Jeff Johnson
 <quic_jjohnson@quicinc.com>
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
 Naveen N Rao <naveen@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Louis Peens <louis.peens@corigine.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Lucas Stach
 <l.stach@pengutronix.de>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
 <perex@perex.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Jiri Kosina
 <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Ilya Dryomov
 <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, Jens
 Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>, Jack
 Wang <jinpu.wang@cloud.ionos.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, James
 Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Jeroen de Borst <jeroendb@google.com>, Shailend Chand
 <shailend@google.com>, Thomas Zimmermann <tzimmermann@suse.de>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Ofir Bitton
 <obitton@habana.ai>, Sven Schnelle <svens@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Russell King <linux@armlinux.org.uk>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>, Nicolas Palix
 <nicolas.palix@imag.fr>, Julia Lawall <Julia.Lawall@inria.fr>, Simon
 Horman <horms@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jozsef Kadlecsik <kadlec@netfilter.org>, Pablo
 Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
In-Reply-To: <8127a2e6-fa62-4c85-b7ed-24748cc9e285@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <10ee4e8f-d8b4-4502-a5e2-0657802aeb11@linux.microsoft.com>
 <3ac480f5-549b-4449-baa9-f766e074c409@quicinc.com>
 <8127a2e6-fa62-4c85-b7ed-24748cc9e285@linux.microsoft.com>
Date: Sat, 16 Nov 2024 00:20:50 +0100
Message-ID: <87plmwytgt.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Nov 15 2024 at 14:15, Easwar Hariharan wrote:
> On 11/15/2024 1:41 PM, Jeff Johnson wrote:
>> 
>> How do you expect this series to land since it overlaps a large number of
>> maintainer trees? Do you have a maintainer who has volunteered to take the
>> series and the maintainers should just ack? Or do you want the maintainers to
>> take the individual patches that are applicable to them?
>> 
>> /jeff
>
> I am hoping for tglx to take it through his tree since the patch
> introducing secs_to_jiffies() is in his tree, so sequencing of
> dependencies would not be an issue.

Right, but it's two days before the merge window opens, so no.

> But if tglx won't, we could push it out another cycle and individual
> maintainers can take the patches that are applicable to their tree for
> the series.

That's the easiest way forward as it does not create conflicts and all
maintainers will have the base patch in their trees after rc1.

Thanks,

        tglx

