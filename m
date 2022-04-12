Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D91E4FE142
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 14:57:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd5N73LzKz3bf5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 22:57:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KfW5XXZt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bwQf3k8Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=KfW5XXZt; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=bwQf3k8Y; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd5MQ1J5Lz2x9B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 22:56:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649768186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKGY79qeJkiZPEmiUhd4p41YrGI5Je/IzqvYghVlks4=;
 b=KfW5XXZto1mnpmpMM0UNfXqRC5xJagnek7fuklrPLbOLzzm5Pq1rwmSBBWgdbdPfMxuDGM
 9giwXmvKEnD/CkJjQRfBMSoBkp+QZI4pkZP/zAzeSXuDbqO0JDBZ1zRNPcm7paJFuqX7gz
 2f5Cg043jOaMnnHtpR6/t0LOjPKQ5gE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649768187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKGY79qeJkiZPEmiUhd4p41YrGI5Je/IzqvYghVlks4=;
 b=bwQf3k8Ygo5hLz7OjPzr0CRVVRyeJFz9cDLldhJzxp9N8qBZ9pGq+vcFi7+39mgWKeuuFH
 c5NAjJ7axOv09XPiAg4LS39X9Cz7R9EkyBIuwfAKLbuqCn73kII4b3bZghAtyXEbI/FjVN
 OziVf0G4b5Ye7tQc98dg/wgoFeApwaQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-3Xx8XiOHMc6rbkvk06wfwg-1; Tue, 12 Apr 2022 08:56:23 -0400
X-MC-Unique: 3Xx8XiOHMc6rbkvk06wfwg-1
Received: by mail-qt1-f199.google.com with SMTP id
 f22-20020ac840d6000000b002dd4d87de21so14683097qtm.23
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 05:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=fKGY79qeJkiZPEmiUhd4p41YrGI5Je/IzqvYghVlks4=;
 b=0jVv9P9f/rcZ5Xv78eCgT1s+hUM12Gdd/S1baos2SQI37oNOAyNOTkKrk/vEE3u+uM
 s8zkQruf2fFb97z5Pbp7h0S9soVR/5mo/4yONe+khDalrfC3I20YtUm4aZLbBCy6X8+L
 R7v8/ClSfb93Nc3mkTL31cFsGtBbfxmYpuTm3a6QJQ4hYrr/mysJsVBERxC434YJXDlx
 W6alQXMX8VVtVV9uK0NFtFLiDHKhQYAIXcD+zgK2UO+F7hiENwUfbeGImuT31gSEnk+s
 EXO74dYjIaxpuZlGpX1OmY/CAbWLYeyW71QFAXHcQsldeUXEyc7HUe1RifA3dN8eocGB
 VwDA==
X-Gm-Message-State: AOAM531Q3+1Pgw7k3ntFpV++SkVrWqyhdAjYFjirpI0gXr/Esuu7pAbG
 lgJ0dImbb5DTXiusKQCVOVboT0/OrNmkcOeVqu0oaJY6gWoW/eBK7YK15S8xnBdqJ/nxu2rrHpM
 SLh6N1Dp1XMsUB3qnAHWDlS/50A==
X-Received: by 2002:a05:6214:20e6:b0:440:f6d0:fe55 with SMTP id
 6-20020a05621420e600b00440f6d0fe55mr31833019qvk.57.1649768183299; 
 Tue, 12 Apr 2022 05:56:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfGzch4mtv0CtgEFK5dNCfGzrVh3HY2NYysAp6bl6G8/cDuBO5Qvh7If1QbYl5wRAYXhjOTw==
X-Received: by 2002:a05:6214:20e6:b0:440:f6d0:fe55 with SMTP id
 6-20020a05621420e600b00440f6d0fe55mr31832990qvk.57.1649768183030; 
 Tue, 12 Apr 2022 05:56:23 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-96-237.dyn.eolo.it.
 [146.241.96.237]) by smtp.gmail.com with ESMTPSA id
 j19-20020a05622a039300b002ecc2ebfd87sm10430205qtx.32.2022.04.12.05.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:56:22 -0700 (PDT)
Message-ID: <d303c605bdb951f1471800aca10bd97f47372295.camel@redhat.com>
Subject: Re: [PATCH net-next v2 05/18] net: dsa: mv88e6xxx: remove redundant
 check in mv88e6xxx_port_vlan()
From: Paolo Abeni <pabeni@redhat.com>
To: Jakob Koschel <jakobkoschel@gmail.com>, "Russell King (Oracle)"
 <linux@armlinux.org.uk>
Date: Tue, 12 Apr 2022 14:56:15 +0200
In-Reply-To: <8BAFAAD1-D9AB-4339-BE81-18BE564F78F6@gmail.com>
References: <20220412105830.3495846-1-jakobkoschel@gmail.com>
 <20220412105830.3495846-6-jakobkoschel@gmail.com>
 <YlViPWWKhvoV2DLN@shell.armlinux.org.uk>
 <8BAFAAD1-D9AB-4339-BE81-18BE564F78F6@gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, linux-arm-kernel@lists.infradead.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakub Kicinski <kuba@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2022-04-12 at 13:37 +0200, Jakob Koschel wrote:
> 
> > On 12. Apr 2022, at 13:27, Russell King (Oracle) <linux@armlinux.org.uk> wrote:
> > 
> > On Tue, Apr 12, 2022 at 12:58:17PM +0200, Jakob Koschel wrote:
> > > We know that "dev > dst->last_switch" in the "else" block.
> > > In other words, that "dev - dst->last_switch" is > 0.
> > > 
> > > dsa_port_bridge_num_get(dp) can be 0, but the check
> > > "if (bridge_num + dst->last_switch != dev) continue", rewritten as
> > > "if (bridge_num != dev - dst->last_switch) continue", aka
> > > "if (bridge_num != something which cannot be 0) continue",
> > > makes it redundant to have the extra "if (!bridge_num) continue" logic,
> > > since a bridge_num of zero would have been skipped anyway.
> > > 
> > > Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> > > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > 
> > Isn't this Vladimir's patch?
> > 
> > If so, it should be commited as Vladimir as the author, and Vladimir's
> > sign-off should appear before yours. When sending out such patches,
> > there should be a From: line for Vladimir as the first line in the body
> > of the patch email.
> 
> yes, you are right. I wasn't sure on how to send those commits, but
> I guess if I just set the commit author correctly it should be fine.
> 
> regarding the order: I thought I did it correctly doing bottom up but
> I confused the order, wasn't on purpose. Sorry about that.
> 
> I'll resend after verifying all the authors and sign-offs are correct.

whoops, too late...

Please, do wait at least 24h before reposting, as pointed out in the
documentation:

https://elixir.bootlin.com/linux/v5.18-rc2/source/Documentation/process/maintainer-netdev.rst#L148

Thanks,

Paolo


