Return-Path: <linuxppc-dev+bounces-3428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA29A9D1DBF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 03:00:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsnlB1x5Fz2yT0;
	Tue, 19 Nov 2024 13:00:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731980659;
	cv=none; b=dFd1SJEJWopuUYSZJaJyaeOhDrtJ0X6s3uSuBTEDSmPN4SiOJaxSYePZXf/I2bUkBpkPHoWel0+DhyK1Msa4PxKl+JeVl6a+/QJB8kttR7enO/Wz38xYdt+TlWkfr0fiCVJMuGEc9k96XaxxLhNosb76EZhjouWhtHV1qrubedQ5B6N+Z5L6tLB4uqu6441QGcKcO48yYaTh86hTjWdmEsIKGmzvkA10kDDYf8UDnH6+LQywFBG0N/qhBl4DYv7Z/p/LWshUlj3snKV4SGy99YWvUm8WYgsQ2Lrjng+0Fkczmroi+eRKpTCmUfv3NFfsvmJzSAN9JR1VQQV8YqcJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731980659; c=relaxed/relaxed;
	bh=6TLGZPhgwiSdTuoKO9EIOhX+7x+wgHfPfCEdlENWql4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GW2Ch8rqtR4HMbX7L7ketcYAuOn/Hl+W7eqaeIDRy9WUl5Q4uhZCslArAVTbKlyBFmYuiq9XLYM7CYOYb8wz5Igofk8jSgGyrOQ98mU4OiOFn6EEl9zF/RwLl1DBDzJC87X3QdrPjtU6lDdSgV+3LRZqeG1KETbXKDpw8GDWCLFR/WnuF2pqZ0XeBClmEn2250KeBURdDO2OGiEKN0/k7iEBW0H9ikHaArjoav756GHYD0oHKaQJ53R6Iezahwm1xt25ILN6TIpx8i9/5zmPXDa5UipNcX6pD1aIlvR9g4zlBUy04bdG8VlHU27VmgDL0rdIVyxYGzknf3JtBIyIyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hvXmg/UF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=zhangwarden@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hvXmg/UF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=zhangwarden@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsnNK2gnHz2yF6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 12:44:16 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20cb47387ceso3237675ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 17:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731980653; x=1732585453; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TLGZPhgwiSdTuoKO9EIOhX+7x+wgHfPfCEdlENWql4=;
        b=hvXmg/UFWxVEKBdVwCaMe+7KE4nbulS6j9yagH4zG4SciZSsoJhL9K1tC1srsBoWZO
         8FhAZjCc0uK4Mvv9iIdfDABUbUG1SGM3MZb4m/eHSHHoMU9OizuxTEiVoMt0N9VvYWxI
         y6BC4gmaul0CCH92VSa3UmN/qWRQjV0sRmbVFv9P0pNSSxBBBwzhp70rvtXoiOivuqab
         Gdol8NRZPbfiD1DOfYZoiacUWRCBufsP7nMq2n3ik3J/Qg45yPIbIiK2S3MwdbWQuyxY
         1BxEi/BVxm519Xr3eXIsW2bSyV4do9Ecz+XF+x/TO4g2lutEnrMHoxj3ZPVIjeaypsXQ
         JtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731980653; x=1732585453;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TLGZPhgwiSdTuoKO9EIOhX+7x+wgHfPfCEdlENWql4=;
        b=KpZG2Wrf7DcEnXEGxt7xf+9Mfi7hsfETb9yEMKyYb018227rGlp/jmav/6l9qSavhq
         BB7Axs+McoHjF+VtJhffFn5TWKw81H8tBawcCwF4EQrd2TVrjTvOYbzt4bYzvr8TWZwl
         V/kz8TUxLoQ5rNvKt2HULLWj4ug0HGv2byYRFYQbGUfZkpcK/eDzVYX+M2vt2O2tmxad
         B5HsJ8EwkXRGKLEwB2PZB0uUckY4fKNLZrV3Y0URJLPSSkClwbFh8tUV/fo+RjZ5R0D4
         7LuVloHqD1VLwYrzjV3kieGBP82FT6scMZonIGkqkgynVlUqcFb4m56kJ3YTGUQOEled
         eEgw==
X-Forwarded-Encrypted: i=1; AJvYcCWfR1ATjj3DWXjreVLDhrrU/5kHTrX2Q2hESxPIYdbRWnCtXQq1qP1D2o1v6izJuHrwHAHwcBg4LDQJbXk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwGxyaNUzbFNZvRmDRLjP3HKmKn9xJy2LxEUhRsGJsGSuXr7VvS
	nKPija6/7ix/IdOVOEXxKtb1UYgKsflfiplYjbQVXRXPa2gZ9Omj
X-Google-Smtp-Source: AGHT+IGKOuuVyAvdbfIttKIxJSv7PNCbNBMgaHYEIodVhJO4YNPmnFai9XI15Qs6QZqqMPXdK5RTjA==
X-Received: by 2002:a17:903:186:b0:212:46c2:632e with SMTP id d9443c01a7336-21246c26707mr25423135ad.15.1731980653295;
        Mon, 18 Nov 2024 17:44:13 -0800 (PST)
Received: from smtpclient.apple ([198.11.178.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f6182bsm62977715ad.277.2024.11.18.17.43.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2024 17:44:12 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v2 19/21] livepatch: Convert timeouts to secs_to_jiffies()
From: zhang warden <zhangwarden@gmail.com>
In-Reply-To: <96f3b51b-c28c-4ea8-b61e-a4982196215f@linux.microsoft.com>
Date: Tue, 19 Nov 2024 09:43:32 +0800
Cc: Petr Mladek <pmladek@suse.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
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
 Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>,
 Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org,
 netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org,
 linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org,
 linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,
 ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org,
 linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org,
 oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <99755FD2-270C-4122-8A22-6C73A81028F6@gmail.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-19-911fb7595e79@linux.microsoft.com>
 <718febc4-59ee-4701-ad62-8b7a8fa7a910@csgroup.eu>
 <Zzsfuuv3AVomkMxn@pathway.suse.cz>
 <96f3b51b-c28c-4ea8-b61e-a4982196215f@linux.microsoft.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On Nov 19, 2024, at 02:18, Easwar Hariharan =
<eahariha@linux.microsoft.com> wrote:
>=20
> On 11/18/2024 3:06 AM, Petr Mladek wrote:
>> On Sat 2024-11-16 11:10:52, Christophe Leroy wrote:
>>>=20
>>>=20
>>> Le 15/11/2024 =C3=A0 22:26, Easwar Hariharan a =C3=A9crit :
>>>> [Vous ne recevez pas souvent de courriers de =
eahariha@linux.microsoft.com. D=C3=A9couvrez pourquoi ceci est important =
=C3=A0 https://aka.ms/LearnAboutSenderIdentification ]
>>>>=20
>>>> Changes made with the following Coccinelle rules:
>>>>=20
>>>> @@ constant C; @@
>>>>=20
>>>> - msecs_to_jiffies(C * 1000)
>>>> + secs_to_jiffies(C)
>>>>=20
>>>> @@ constant C; @@
>>>>=20
>>>> - msecs_to_jiffies(C * MSEC_PER_SEC)
>>>> + secs_to_jiffies(C)
>>>>=20
>>>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>>> ---
>>>>  samples/livepatch/livepatch-callbacks-busymod.c |  2 +-
>>>>  samples/livepatch/livepatch-shadow-fix1.c       |  2 +-
>>>>  samples/livepatch/livepatch-shadow-mod.c        | 10 +++++-----
>>>>  3 files changed, 7 insertions(+), 7 deletions(-)
>>>>=20
>>>> diff --git a/samples/livepatch/livepatch-callbacks-busymod.c =
b/samples/livepatch/livepatch-callbacks-busymod.c
>>>> index =
378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993b=
adcc9aba 100644
>>>> --- a/samples/livepatch/livepatch-callbacks-busymod.c
>>>> +++ b/samples/livepatch/livepatch-callbacks-busymod.c
>>>> @@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
>>>>  {
>>>>         pr_info("%s\n", __func__);
>>>>         schedule_delayed_work(&work,
>>>> -               msecs_to_jiffies(1000 * 0));
>>>> +               secs_to_jiffies(0));
>>>=20
>>> Using secs_to_jiffies() is pointless, 0 is universal, should become
>>> schedule_delayed_work(&work, 0);
>>=20
>> Yes, schedule_delayed_work(&work, 0) looks like the right solution.
>>=20
>> Or even better, it seems that the delayed work might get replaced by
>> a normal workqueue work.
>>=20
>> Anyway, I am working on a patchset which would remove this sample
>> module. There is no need to put much effort into the clean up
>> of this particular module. Do whatever is easiest for you.
>>=20
>> Best Regards,
>> Petr
>=20
> If we're removing the module, I'll drop it from the series. Just to
> clarify, do you mean to remove all of samples/livepatch/* or some
> particular file(s)?
>=20
> Thanks,
> Easwar
>=20

Hi Easwar!

I think Petr is going to remove just this module away. Anyway, I don't =
think
removing all of them is a good idea.

Thanks.
Wardenjohn.=20


