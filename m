Return-Path: <linuxppc-dev+bounces-3432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2599D21E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 09:53:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xsyv50DVsz2yMF;
	Tue, 19 Nov 2024 19:53:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732006384;
	cv=none; b=Oy5BpWLzRzQFaMe0jTnzTWam8fBxGYJxuRPYWacv3PQ2lQjY7adEXyiKWuhBYIpWDQ0nvy3IskPR2ZjB0e6wMaJ2JnPP5safXYCS7Oz4fLAQZ+QdZvSqj5IG7UeVj57GdI2xSyEORVREY/ojIXfTbCKKgnXXQRHqhgEIWIkG8Hmo1W/fKGrudOU82QymGB+S7uMorSc8g9RDbdzVhxPLJklq3MUvJgHkjtMmk5ulPegFyL6RPiQSjH9Azwm5q2AOA4KhHrBl9zqoEUe9MREEwP6H2xw7kkprENUHFfZCFWMaNngeMYPhN1X5aWW36C2p6k71nENsB1qU14a6eRaZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732006384; c=relaxed/relaxed;
	bh=qaBG3Z7R9DOuiOybc185RSD4M8rIPEBBhrkZgjFmOxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgyFMnmgNDSo4HtxQlPpvzkHXxm5VIe57Z9A61lExoStJysyY7lvs2JB5DxZ1xMbF/8WesNi8WDpCHMvKTVp4nUTpJqxROnZ9TwUp2OVLt7hXM3+rC51V0Kpr/XdJcV/7pvtHLlunJCKwY7b8rIGWR/yTrXcZJLlUbYX7A1GiEi5jHw9/8Fh/DKtvaUQZ6yRoC2e1ct/HnH5J684WFTMUXeGOYscYXDtL+v7hSaFxAo8EEWYX2YMlbUCYAWNkxh4YjQe2/5/1Gs8MzRmxvkdidI9MA33XeDXwsS0gumu8v2cEPynIf4d+SwAolL9cYgcGRVePaEUv0UjXqU70t6daQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WQPNOlcg; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WQPNOlcg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xsyv151d4z2xvR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 19:52:59 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so5644755e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 00:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732006375; x=1732611175; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qaBG3Z7R9DOuiOybc185RSD4M8rIPEBBhrkZgjFmOxU=;
        b=WQPNOlcg0MhX8sK0kjl8hHsH3se/SflAOjYbCF15mx2OS3jDbZcAY/uhUuMLwbIc54
         pVHqkAwU2ZCNRq+BEJwqrzTJqbKhD320ynP/IF8j7k3ooW2WpE4JJB/EkO/FPS7R3jO5
         r9Vuv/Jhs+gWjSACmNx3eFEvE3KEZDW9IBWXOiwbOYWwaGh9VCQeOELjJQYLAxKQB72w
         5utFXr2nJfbriPxaoCJRKQaPtYFLKMV9LLtG9pvmzaqvXyod2EkD7XkqOpCDH1d6qf30
         izEUoAzLd1VmJGQcqk+sjA+ZXnj/ZDn47EMge/E7w/eIwlHzCq32K/W/L3mApVOixT58
         D6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732006375; x=1732611175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qaBG3Z7R9DOuiOybc185RSD4M8rIPEBBhrkZgjFmOxU=;
        b=H8g5ycyrqPRy8KeQZxcetueAocfPiChL8D+ktekhobBRdisDR3i+ZqVqurY6ypXUm2
         7S7cHeb6TAZ8X//B1Y/2a61pB2BJpcwQF9RwinC8KnTT/mnhXsVp04G7W7MMDeRVl+IJ
         RXYFOeUzpClzyqlDgYaI41bUSrTpYf1LVl9RYU0Z1YvFcWTgTAsvcmwcnit1iDFLzsxQ
         uWjv8R0t7JeRef7kCUmsNr4K4La7aR5Aia1xL+zcOAICTdpFWlIlUGRCPCNRnYxsnTV9
         2uKjsW2OOs2Sfzbp0I2OqCGArI3ZtByAL5unU5vfyDzP9lg4aabu4N8TjpbpNx9Urog5
         74jA==
X-Forwarded-Encrypted: i=1; AJvYcCWty5+cHyT5O2IyAMLAUcFwFVLPm5RL2QBqZQ5E3RVogsvkfgBezdslvtcJgDHHmRWqCX2ZNvBMbPwi7i4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxTl9BMCDqOkMNyakB/7IJ7wzCVjjJqUVr5F4fDN2uSFJwmIs0q
	Ljc75cSbJ7pmwivFsiVauGKtezS+0sopX3j9ovE+EfGoEAWyNUPo8IrPpFUSn6I=
X-Google-Smtp-Source: AGHT+IHrqP9nC2rPwknktgIKbjWoIt1yh0m5e2N0IUvcTBAuP3H8V/AdHOWp2OIw94YWQU//ijQi/A==
X-Received: by 2002:a5d:6d0f:0:b0:382:2492:3218 with SMTP id ffacd0b85a97d-38225aaee39mr12773115f8f.47.1732006374705;
        Tue, 19 Nov 2024 00:52:54 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3824a8109a7sm3705943f8f.104.2024.11.19.00.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 00:52:54 -0800 (PST)
Date: Tue, 19 Nov 2024 09:52:46 +0100
From: Petr Mladek <pmladek@suse.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ofir Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Louis Peens <louis.peens@corigine.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	linux-mm@kvack.org, linux-bluetooth@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	ceph-devel@vger.kernel.org, live-patching@vger.kernel.org,
	linux-sound@vger.kernel.org, etnaviv@lists.freedesktop.org,
	oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v2 19/21] livepatch: Convert timeouts to secs_to_jiffies()
Message-ID: <ZzxR3uAcWFEPUIUK@pathway.suse.cz>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-19-911fb7595e79@linux.microsoft.com>
 <718febc4-59ee-4701-ad62-8b7a8fa7a910@csgroup.eu>
 <Zzsfuuv3AVomkMxn@pathway.suse.cz>
 <96f3b51b-c28c-4ea8-b61e-a4982196215f@linux.microsoft.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96f3b51b-c28c-4ea8-b61e-a4982196215f@linux.microsoft.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon 2024-11-18 10:18:49, Easwar Hariharan wrote:
> On 11/18/2024 3:06 AM, Petr Mladek wrote:
> > On Sat 2024-11-16 11:10:52, Christophe Leroy wrote:
> >>
> >>
> >> Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
> >>> [Vous ne recevez pas souvent de courriers de eahariha@linux.microsoft.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> >>>
> >>> Changes made with the following Coccinelle rules:
> >>>
> >>> @@ constant C; @@
> >>>
> >>> - msecs_to_jiffies(C * 1000)
> >>> + secs_to_jiffies(C)
> >>>
> >>> @@ constant C; @@
> >>>
> >>> - msecs_to_jiffies(C * MSEC_PER_SEC)
> >>> + secs_to_jiffies(C)
> >>>
> >>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> >>> ---
> >>>   samples/livepatch/livepatch-callbacks-busymod.c |  2 +-
> >>>   samples/livepatch/livepatch-shadow-fix1.c       |  2 +-
> >>>   samples/livepatch/livepatch-shadow-mod.c        | 10 +++++-----
> >>>   3 files changed, 7 insertions(+), 7 deletions(-)
> >>>
> >>> diff --git a/samples/livepatch/livepatch-callbacks-busymod.c b/samples/livepatch/livepatch-callbacks-busymod.c
> >>> index 378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993badcc9aba 100644
> >>> --- a/samples/livepatch/livepatch-callbacks-busymod.c
> >>> +++ b/samples/livepatch/livepatch-callbacks-busymod.c
> >>> @@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
> >>>   {
> >>>          pr_info("%s\n", __func__);
> >>>          schedule_delayed_work(&work,
> >>> -               msecs_to_jiffies(1000 * 0));
> >>> +               secs_to_jiffies(0));
> >>
> >> Using secs_to_jiffies() is pointless, 0 is universal, should become
> >> schedule_delayed_work(&work, 0);
> > 
> > Yes, schedule_delayed_work(&work, 0) looks like the right solution.
> > 
> > Or even better, it seems that the delayed work might get replaced by
> > a normal workqueue work.
> > 
> > Anyway, I am working on a patchset which would remove this sample
> > module. There is no need to put much effort into the clean up
> > of this particular module. Do whatever is easiest for you.
> > 
> > Best Regards,
> > Petr
> 
> If we're removing the module, I'll drop it from the series. Just to
> clarify, do you mean to remove all of samples/livepatch/* or some
> particular file(s)?

To be precise, I am going to replace:

	samples/livepatch/livepatch-callbacks-demo.c
	samples/livepatch/livepatch-callbacks-mod.c
	samples/livepatch/livepatch-callbacks-busymod.c

with a completely different modules because I am reworking the
callbacks API.

All other sample modules are going to stay.

Feel free to remove livepatch-callbacks-busymod.c from the patchset.
But also feel free to keep it. The API rework goes slowly. I am not
sure if it would be ready for 6.14.

Best Regards,
Petr

