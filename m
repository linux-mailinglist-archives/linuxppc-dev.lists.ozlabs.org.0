Return-Path: <linuxppc-dev+bounces-3977-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9799EC5C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 08:42:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7SHd2GFrz2yWK;
	Wed, 11 Dec 2024 18:42:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733902957;
	cv=none; b=bMMnv+qK57zQ5WwHH6ptV+SGdGYaHyrNcGYZ/t7AC0BvG96Kr8aD+XmECd73R+87/JNbFXuFAp3MyoOkMZubk/mQPUnp2VEAZdymuXq2KgXpnO1nuCI/uGi7fIsqyo1l8FeImMCDmwnfJj8UQjP8UrLU8898JrH61wvasuN83BU2jxV9E9BJxEf9CXprYt4B2CexZdBtRZe7uqOL3nMFxILFNzaGX8EPw58VLjnjVbJrUTK7hgZ1YtuGGRoJNoPWqhBD7immxwUL0I7qYjGq0Yqh/i9hN03hwGMJFrv7Cr6DbudY3BBcJnYTRiMB/M9qBIyM/P4Ik4BaIWg4yI1g9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733902957; c=relaxed/relaxed;
	bh=JkNVVFFGbFo9FbSw2XPZzS8G5YLDR8er2AkrPtCRzJ8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=MlqbLmlJErE4rTbu/bGHxs/XnqKPcoh8tynNf/V6xRIcxF8Ep5AKtQeM99RoqpoqiB2GbT17tsnPrhGbMe7euPcUmitCc0e6E1KWGCotBAPalfbslzTy8bZCs37RjALtB8aPO0jT3dH+W5PTQP757bgcMzMqiuvtqCm5wjsvnSMMCssFNfRKVCihpnnHssyjqU3Tr1CQ7t0+7g4ZHpcuE0PFdSOC70mEO6K48+7T27cAn0/wINNhlS2k/7H7IPzRuBlCyzV1J2wyX9d5AexkcD2zI1A4ZrKZ/40S8VEATrLLckn+t35xO/s6cpcQR07uyb35curmxnPq7yPkw/HXpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lzCs9W07; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lzCs9W07;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7SHb2P1sz2yV8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 18:42:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D3F25C5531;
	Wed, 11 Dec 2024 07:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6363CC4CED2;
	Wed, 11 Dec 2024 07:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733902951;
	bh=2uMUDx+CZ3m3qrGORQssIpf9SkBZEr5sXYGVq8CLbbk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lzCs9W07TRdYy9JWVA19UEcEu4CvACr8Yh0wQYYSfGHV9Xmm3k/fpbGlRqmHhrV+4
	 m+NXNTf0ojEsKvo2HABNezvu0E3y4f8qwtj50O+Tpecim7ilciV/YQzBLNsRpBxgh2
	 kFcAO8hw1xQeAKLLWrzRXln1VFfP4BsLZkJYWlflCYYKj1xjZBYezOsESJaMXsh8Tr
	 hQ+/FOtWX9XeTV7X9iJbxMRHo8S8Byh7AJhYOGIti6Ul764xlpsl746ormGsN6d2KW
	 ZfV5twBXO7B+t0Fxemw7h0pYOWhdCFQdt/A+Rzvz9BButSX+3CHe4CYkaTdr1ABqIe
	 IMFDpd1/B9rEg==
From: Kalle Valo <kvalo@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,  Jozsef Kadlecsik
 <kadlec@netfilter.org>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Julia Lawall
 <Julia.Lawall@inria.fr>,  Nicolas Palix <nicolas.palix@imag.fr>,  Daniel
 Mack <daniel@zonque.org>,  Haojian Zhuang <haojian.zhuang@gmail.com>,
  Robert Jarzmik <robert.jarzmik@free.fr>,  Russell King
 <linux@armlinux.org.uk>,  Heiko Carstens <hca@linux.ibm.com>,  Vasily
 Gorbik <gor@linux.ibm.com>,  Alexander Gordeev <agordeev@linux.ibm.com>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Sven Schnelle
 <svens@linux.ibm.com>,  Ofir Bitton <obitton@habana.ai>,  Oded Gabbay
 <ogabbay@kernel.org>,  Lucas De Marchi <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  Rodrigo
 Vivi
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jeroen de Borst
 <jeroendb@google.com>,  Praveen Kaligineedi <pkaligineedi@google.com>,
  Shailend Chand <shailend@google.com>,  Andrew Lunn
 <andrew+netdev@lunn.ch>,  James Smart <james.smart@broadcom.com>,  Dick
 Kennedy <dick.kennedy@broadcom.com>,  "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,  "Martin K. Petersen"
 <martin.petersen@oracle.com>,  Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
  Jens Axboe <axboe@kernel.dk>,  Jeff Johnson <jjohnson@kernel.org>,
  Catalin Marinas <catalin.marinas@arm.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Jack Wang <jinpu.wang@cloud.ionos.com>,
  Marcel Holtmann <marcel@holtmann.org>,  Johan Hedberg
 <johan.hedberg@gmail.com>,  Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>,  Ray Jui <rjui@broadcom.com>,  Scott
 Branden <sbranden@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Xiubo Li <xiubli@redhat.com>,
  Ilya Dryomov <idryomov@gmail.com>,  Josh Poimboeuf <jpoimboe@kernel.org>,
  Jiri Kosina <jikos@kernel.org>,  Miroslav Benes <mbenes@suse.cz>,  Petr
 Mladek <pmladek@suse.com>,  Joe Lawrence <joe.lawrence@redhat.com>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Louis
 Peens <louis.peens@corigine.com>,  Michael Ellerman <mpe@ellerman.id.au>,
  Nicholas Piggin <npiggin@gmail.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Naveen N Rao <naveen@kernel.org>,
  Madhavan Srinivasan <maddy@linux.ibm.com>,
  netfilter-devel@vger.kernel.org,  coreteam@netfilter.org,
  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  cocci@inria.fr,
  linux-arm-kernel@lists.infradead.org,  linux-s390@vger.kernel.org,
  dri-devel@lists.freedesktop.org,  intel-xe@lists.freedesktop.org,
  linux-scsi@vger.kernel.org,  xen-devel@lists.xenproject.org,
  linux-block@vger.kernel.org,  linux-wireless@vger.kernel.org,
  ath11k@lists.infradead.org,  linux-mm@kvack.org,
  linux-bluetooth@vger.kernel.org,  linux-staging@lists.linux.dev,
  linux-rpi-kernel@lists.infradead.org,  ceph-devel@vger.kernel.org,
  live-patching@vger.kernel.org,  linux-sound@vger.kernel.org,
  oss-drivers@corigine.com,  linuxppc-dev@lists.ozlabs.org,  Anna-Maria
 Behnsen <anna-maria@linutronix.de>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v3 14/19] wifi: ath11k: Convert timeouts to
 secs_to_jiffies()
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
	<20241210-converge-secs-to-jiffies-v3-14-ddfefd7e9f2a@linux.microsoft.com>
Date: Wed, 11 Dec 2024 09:42:11 +0200
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-14-ddfefd7e9f2a@linux.microsoft.com>
	(Easwar Hariharan's message of "Tue, 10 Dec 2024 22:02:45 +0000")
Message-ID: <87sequr7ho.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
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
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Easwar Hariharan <eahariha@linux.microsoft.com> writes:

> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> secs_to_jiffies(). As the value here is a multiple of 1000, use
> secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.
>
> This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
> the following Coccinelle rules:
>
> @@ constant C; @@
>
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
>
> @@ constant C; @@
>
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)
>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  drivers/net/wireless/ath/ath11k/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I assume we can take this to our ath.git tree, please let us know if
that's not the case.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

