Return-Path: <linuxppc-dev+bounces-3325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 379FA9CFE2F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 11:32:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xr9Dl0WdRz3bXS;
	Sat, 16 Nov 2024 21:32:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731753127;
	cv=none; b=Sy815Jj3p55a5+2MHp3HLf+rbND/covtOuy2DqKkpSUy57WIlbQrrrmpIkpXvB3QfBBwrKIrhjc/hlnn/bfjB83k6Hl9AV9S5bJM+C6b0C4PFxiop0diGinfjjpyDLGP3B4JnSzNOyrIQLcD3RaFloUvsl1Y4ZYwMql+GJfbenoPzQBFSYcevp/Irx1QaQPocZqMk8dOFdtdqvVhVu3y9SnwSkH+fs3gBsGc7rDOCYmBlsck9bs565UENgq5b5t7nAy4KdqLmN+rn/8AxUi73lJFjwJgsXOHRrm4Ne+aTxhQR3Awtzp+ZFZ4bQaBRhCny3V+lCRvFJlT9M+5EYo9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731753127; c=relaxed/relaxed;
	bh=eoB4Zba0oDILq/GyWjNIQLXHlVmq6QUNlZtjwtBqfrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=Jo4L4gexdEhAfTdpEa1R630k8c7CBWdhnxq+AIKSfQYOf+E9J4NcjCK01hZTXp4FybBZjVJnmGskCoj/eaSTXoYRxCQyyywNccHndIL3l+rQ5ZpK79QgdR4z8/ZDWsEXqfVyWYzF65qDsH1NXQA27+vxdB8snWOCCthWxBvFoq6kuqrnhvhFV9TL/lMOI0hJe6EZFXgqIyG31nTx4vdTMvDu3O6WCnwCKbqfaF+KKXIsSJo5EaOJtS4k1E9xj8WSlTgj31Y390eSmMkdtXDXmsUHAgZAqsIASI33FOd/QfIEd1n0JauR0lyLXspp3CYERHg4xg9Fr4CLBdbSjv5QMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=wW9Dq3AZ; dkim-atps=neutral; spf=pass (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=wW9Dq3AZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xr9Dc4fJHz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 21:31:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1731753089; x=1732357889; i=markus.elfring@web.de;
	bh=eoB4Zba0oDILq/GyWjNIQLXHlVmq6QUNlZtjwtBqfrw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=wW9Dq3AZud0Mh8eIxx8h+BRWpDDanRbjX7te2PngHotAhatJcH6+ajq66DZf63ea
	 x9DLAuX0ykm1CYkqOs2orWjR7ZQJhXLpZmi2LBFfsAYIhsv+oOmAyyLBXirS2etaB
	 3v8P6ihgau9jYhEfuIxCW8C0qj/THZBJsFVy9UjbdEdswUDtqXoh5WN2vo2c8QIC2
	 ZprWvwJrtaM5bhc1Y9aX3gLsg/KsfMgK11tyTQ6hzA0bcd65ovg1TdT4r4xPUSvmO
	 +KtpYjEAK6gPBLG0T4JNvXp3Pc6eKzqMjpmUE9I0V75TuY1sr3p2Vk6RUU1fk1MxQ
	 1RnqQMWB4+ZDArE2sA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M8kEV-1t87Dv2SuX-00FywX; Sat, 16
 Nov 2024 11:23:22 +0100
Message-ID: <9088f9a2-c4ab-4098-a255-25120df5c497@web.de>
Date: Sat, 16 Nov 2024 11:23:01 +0100
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
Subject: Re: [cocci] [PATCH v2 02/21] coccinelle: misc: Add secs_to_jiffies
 script
To: Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 linux-mm@kvack.org, linux-bluetooth@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 ceph-devel@vger.kernel.org, live-patching@vger.kernel.org,
 linux-sound@vger.kernel.org, etnaviv@lists.freedesktop.org,
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
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
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ozemPo5Q9OPy+/gWIfbNb/yTAwp7zpbaqzDjn4mcTmOYffBLZAH
 E0gCP/qnqze9l4Bx97cEhIN2OOovptOgRBkBUi+bKyV+a6ol7S4atoRxVmjqBCc2g41VI8a
 ROXhUKP5mlUoyzcJqOavJdVAoW8iKSPURqEhcga4JsnmJm/Pjl1vO+foxZw0grHWEblCrYI
 LJ17n1lYaEdE61JhX5uvg==
UI-OutboundReport: notjunk:1;M01:P0:Ut1/dqQTShk=;F91m7WPtJ3BUlVtKRZAnC+LWCZI
 +cjg25fBUksbtmXV3nSekf0nLkHlUg4tw3z4wJctDOB9qkRVE5T3889SK3u5OptuGCUjAgrRf
 L6lrbhw6GVbJKYcgnlSqdu1AUNxdBMhY8cs/buNF0m9zdffO7397JvKUWSE0xfZoPvfVoiMtQ
 2rypQvC+rAdvnjnqX8Z/l5k+Ta4df6gtnQvEEsYlCov9jYav74lPb8Xas1COGI9D3lbjDyE1R
 xQHUN5EKkVXWHCZYvzqjvkK7xgPuLQmwwKaKwn4FWyyoU8MOdgZqVvWWExog11GG0Bj0waEUX
 HUF6YaxivoxzV2Y5r6LAhOiUt+GhhmvrhgCG4+8JWzJdznufPV4+fP5RiQujgbpv4FQKCggkT
 01YuDMSvbhlBCwREndb1mVyp/Erqfz9nbAeHfrlRmQkPDlPPMfDp37/XjM9SgT9g+3E1xLDzU
 6tjKxDcoMNwIfLBQAhkn/ctTSaSOGeSTJzvC4lcDGr0qvfJXzxBKJvncbMk+yMqocqR8p094H
 cSM2zmRmlXf68Vxl9f0C7PKENLFipAxCDkva4DTvoVoUlI6L/GtfVX31tDhqzH1PFsgN3pqgA
 uOLYrVX3IK9TTGfCi2nSCbQTe0E7nATRkM0VKCUZGi+5RpXx2iG0D9UNHgMvG3BL7wdrVBTHd
 BJ+c4iVcO8Svev6YSdYxb1bL3paWXdHs8pyu1P4qoch+rL3WDY2bpB4E+pAFlwHbOO3e/EfS5
 F1WlN2iSMXR4ghTDMCs9q/a9XUxas73+B6HL+2MGt4NnSTabSXrIWg+WxI1MpkT2odmFv3Upb
 BMqveJ3dDzTl4lVtdfqBjUxzAjnvnI3fgq9DlyELZUJD7cUU7+mWoUVp575fJT8KXsst97DoH
 2wg3SL/rW5+og6V1XmzKomcDLIBRD9wsq1M3n0ZVJM6dUoisRvTDLFWOYa1bwyAfdRxqEZZYL
 f/k/ozG8py9wxlN+Q1xgfUvmnR1kZgL5rJjRRSXKfSx0DYecB5roqhMSSN9DHVKRnVKG/Q==
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Why is a change description missing here?


=E2=80=A6
> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> @@ -0,0 +1,21 @@
=E2=80=A6
> +/// Find usages of:
> +/// - msecs_to_jiffies(value*1000)
> +/// - msecs_to_jiffies(value*MSEC_PER_SEC)

I suggest to take another look at corresponding development documentation.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/dev-tools/coccinelle.rst?h=3Dv6.12-rc7#n71

Will the attention grow for the proper usage of operation modes
according to the tool =E2=80=9Ccoccicheck=E2=80=9D?


=E2=80=A6
> +// Copyright: (C) 2024 Easwar Hariharan Microsoft

Should personal details and company names be better distinguished in such =
information?


> +//
> +// Keywords: secs, seconds, jiffies

May a (blank) comment line be omitted here?


> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * 1000)
> ++ secs_to_jiffies(C)
> +
> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * MSEC_PER_SEC)
> ++ secs_to_jiffies(C)

I suggest to take a SmPL code variant (like the following)
better into account.


@depends on patch@
constant C;
@@
-msecs_to_jiffies
+secs_to_jiffies
 (C
- * \( 1000 \| MSEC_PER_SEC \)
 )


Can any expressions become relevant besides =E2=80=9Cconstants=E2=80=9D?

Regards,
Markus

