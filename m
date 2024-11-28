Return-Path: <linuxppc-dev+bounces-3599-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7569DB7B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2024 13:33:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzbLv0dJbz2yYs;
	Thu, 28 Nov 2024 23:33:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732796962;
	cv=none; b=YNV5LBRdn8zz57dHeFUKM/RLK+UhSIhUupE+pph5dUAraZk6Ov6KhWKSE31sGqtVHLC8CJTNliMNwB3oIEt7i79PG0E/PfFAItfwpiezoVLICtnY65Pn332tu/AX19yFTJZ5QEtwkCbq+7WyskuQJ0YVeIhiZcN1N35a9sLkYKCL3cgZ+KVx6GRLOp7OM231HQBomCzPSPpdeIfWZa3mczbUdlfkqOsQP8CSOO4U6s5naJ1GA2PIqMUFG3wqpFg9CfDte0UmXMSv3fuukU2pW5a7SpoJPgv108Dk01vhc+345iERq+l7c7u88V7FnKpY4r+1QRjq5PMrqAhxjYxbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732796962; c=relaxed/relaxed;
	bh=0Nxf6CkGK3NslY+JLgqPcTLt32q1OCumzkrHYUKQkbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0d4imDuarRAEbrTR0VKXF52xxecSVXkDJSNIR3MUuw7gPrPGvSG24ddZvv1zYMKoxb+1j4fwjIJs9mS6f8689XbED2g5AkQ+1vEOW4XXaRazCVy5D2OE4RIXHLYgaQxZsbVw6UgnnKfva0WDV5JOYDQtIYPVApTcpiKvLr5AAXRmvjxc+OSlOK0OeUWKx5HYEHGOg4PI4FM+Jk6wRCaNhCfT36OWIx5Tudrci/DEMreIOLqNPe6NcbgdsypgjYDeKkRZu09WtsJH3EBMu/ZG7MnCnLlprMSC7sb7EtD1XpWkQWt0qFjbSsvdYgZGsHaggjxSfzuhjMC/k3auHCGZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UNEaJeuD; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jq/53W59; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=amarkuze@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UNEaJeuD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jq/53W59;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=amarkuze@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XzbGT32Knz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 23:29:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732796957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Nxf6CkGK3NslY+JLgqPcTLt32q1OCumzkrHYUKQkbE=;
	b=UNEaJeuDUBIKy/9HqczXYo7JR4UVF6T38avS6PzDmorvdFsCiSXxSzAcWcuCWb2yecEdEN
	VMSEOn7TIvCRv1TsvrlS8a8rX/3O0S1z5jLnYC3t5Iw99OSinoVYefc6tvkylD5pfn0X02
	gcTj/qbifgrIdN1QBrlJ0CRb0bA5LIg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732796958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Nxf6CkGK3NslY+JLgqPcTLt32q1OCumzkrHYUKQkbE=;
	b=Jq/53W59pPenUxjAm376VhsQppZUhS+gOz2TZIdqdG1AgoHmZiK4pRr3J6KGSMDY03rD/S
	qyiX9M2Gs16irK9gSz0fdVdPMvipV/ohjHijyMxUaMefJBjrT29v3j+SZYtlbdzeUfijB2
	PZ2nElKbyKvkl/WBixDZDqn9WMkEY9I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-U79yzWY9NuaVrrrvwO7jFg-1; Thu, 28 Nov 2024 07:29:13 -0500
X-MC-Unique: U79yzWY9NuaVrrrvwO7jFg-1
X-Mimecast-MFC-AGG-ID: U79yzWY9NuaVrrrvwO7jFg
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5cfbec85442so510288a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 04:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732796952; x=1733401752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Nxf6CkGK3NslY+JLgqPcTLt32q1OCumzkrHYUKQkbE=;
        b=BnFnFYAIWyAMUixWWwwzrqZub5aDkPjI20oSrnM9EzdCtBpCajnD5j+w6Z2dqH7WiO
         d4FqKmT4mU96zvtrhV3KjT4tuz82O0Ou6rqjNGByN9EG8fJ/RE5nQQrkA7dtEbmmy83h
         Z76wtd+xO8DWF9ADxE+YsfRRAbVc/3EPsjZZdnsrjtHVFIlDVpa6vn1NVzcPSYROGPSo
         sIzGtej+uTTWeLlDfoV4VBt4az+hECzC8cXioij1Pq4DPRGB0ejhsN/Kd23sY7nyDvNH
         P5dvoCY69QGFll4bmCky39Cwrd6yeXkQsjTb+sOyNcYjbWRubIa5SSwHqM4BrfjIorNZ
         yrag==
X-Forwarded-Encrypted: i=1; AJvYcCVafhlxQeAHFo4omszaPlGMuTFyZuZXG93BMrHh2fJG/+z+GPxVLrd3TWEotEdptON+N4uE6l8eQm2Aamo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxTvdDPhXXcNsNX7MM6wsedGHKxI3ND6l8dwCwewUCePYs7J8M4
	LXjZglK6DkVtCme1kTzMa8zgw0c5PAtWY5otrd3q7clWE/EfSqi8P4CFVlEhy7j3yTabKmJGzJb
	KPOcxDz5MQZ5FHiyHFiNSCPJPVIDVego3cEXapJcAKvc8KBFi/DZrYga5RKcs97C4VLY+fp9WET
	ZUbCjFWpDy6qJ+ijD3jAs301Pv7eKazeF0xzVP6g==
X-Gm-Gg: ASbGncs+nyM1JGBrl0VPJ2+MSEY4pwyTtKOJE2fcdpqwGQ+GtMcymVzk3t9Sx/BsY20
	7S1YPbWSs5n3TQnCb/8j742tauNsjpgQ=
X-Received: by 2002:a05:6402:5243:b0:5cf:e26b:9797 with SMTP id 4fb4d7f45d1cf-5d080c604fcmr5605164a12.29.1732796951977;
        Thu, 28 Nov 2024 04:29:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuE0zkJ6zJza+fGet7qX+06h7Jmet7/bu0xRwgqC9A06SMAgod8PaoQJd1k5pY7KRDfw0cJAGqmNIglvOyUZo=
X-Received: by 2002:a05:6402:5243:b0:5cf:e26b:9797 with SMTP id
 4fb4d7f45d1cf-5d080c604fcmr5605060a12.29.1732796951475; Thu, 28 Nov 2024
 04:29:11 -0800 (PST)
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
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v1-18-19aadc34941b@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-18-19aadc34941b@linux.microsoft.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Thu, 28 Nov 2024 14:29:00 +0200
Message-ID: <CAO8a2SjKS2nWWVkAcqXkZhR+Q1TocULkwRk09ABf8XQjjzwJPQ@mail.gmail.com>
Subject: Re: [PATCH 18/22] ceph: Convert timeouts to secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
	Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>, 
	Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, Louis Peens <louis.peens@corigine.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RvQ_PYtCJa4XXJ9Zu7f-UyNoshfCOpFdbNyfhHBB6aA_1732796952
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

looks good

On Fri, Nov 15, 2024 at 11:35=E2=80=AFPM Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> Changes made with the following Coccinelle rules:
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
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  fs/ceph/quota.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ceph/quota.c b/fs/ceph/quota.c
> index 06ee397e0c3a6172592e62dba95cd267cfff0db1..d90eda19bcc4618f98bfed833=
c10a6071cf2e2ac 100644
> --- a/fs/ceph/quota.c
> +++ b/fs/ceph/quota.c
> @@ -166,7 +166,7 @@ static struct inode *lookup_quotarealm_inode(struct c=
eph_mds_client *mdsc,
>         if (IS_ERR(in)) {
>                 doutc(cl, "Can't lookup inode %llx (err: %ld)\n", realm->=
ino,
>                       PTR_ERR(in));
> -               qri->timeout =3D jiffies + msecs_to_jiffies(60 * 1000); /=
* XXX */
> +               qri->timeout =3D jiffies + secs_to_jiffies(60); /* XXX */
>         } else {
>                 qri->timeout =3D 0;
>                 qri->inode =3D in;
>
> --
> 2.34.1
>
>


