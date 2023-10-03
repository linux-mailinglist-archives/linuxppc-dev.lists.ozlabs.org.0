Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8D77B70F2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 20:33:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cO8o0YQp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0RKW6bwJz3vbq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 05:33:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cO8o0YQp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0DVv3wSyz3c03
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 21:25:57 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40666aa674fso7171855e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 03:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696328752; x=1696933552; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJbPLQ2sJq+JdJneKcIjpXN6+YXEeaAlp1ihUjhH9nY=;
        b=cO8o0YQpNB3IH2djB1SP3AgtatxncX41ZkS+AqEYdnIhu4rbX9uJAWCrMsc9GBLYsw
         EQ+McK+EBwL7n4Hrx4bpP3mMm+zM8H1JQknKMCi47ErjE2QN7eFskQawL8E69+x8LudH
         5mJ0MF7eT0NpBjmq0/8t+1h/y1AJmRp9aGsbtM1R9MEnIKB0snk2IuxnoSarrquyOfe6
         Eg22Sy1qPQT6GFACOBhDg+PyyJiU0o46HDx4RqCAp3TjnvKeWI1jnEd2Iib3cjEByDFi
         b5kD0aLo7TQ3tvt0volTPMGHn1XzyC5uQlfUd8XI/+Ukmt744QQVT3J0S0Q9xUuvTD/D
         oPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696328752; x=1696933552;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJbPLQ2sJq+JdJneKcIjpXN6+YXEeaAlp1ihUjhH9nY=;
        b=YP1poEv/KEXY7bpF4Uhf02vOq1CEroididL9Mj7wDSkwuBEUh3paUVwUoiOEQYH6ts
         rMeQkv7Y3vrIESpL6sc9NKKzt/zURhG+8sKTbpm0WnkyImZN3sI/pEbGgjjLdY8hlw+T
         tsJU/oGxWlOI3eFM+ergNTsoKhvKQ/L9ugXlsvIMXhj/Kubt33M5Ow+xaaWv2sgX9Uqa
         y31sNcI9cifisu47GUJbUPwzGeU/RTZMR63PpD1nNBYfX4aU199i5XxJ++0ioe8U9iwP
         MlGEGaYkcXwUVnXcNE6Me7z09A/GFfZTSaHn06HExQSoX7jG5p/u3pSv8R3cj8wpkpbY
         m9YA==
X-Gm-Message-State: AOJu0Yxk+dMmp86wqIKQaZ4hK5+DW6Pcl/vhQVaHPXdZiokziqdbCR6G
	FCsclEMTqOy6byeXQCEqb14=
X-Google-Smtp-Source: AGHT+IH4PtfHldj0VvMZI/On+6s7VpV7CIQtUMLRVRfnUnG2AW04zeibvBdNxyG/QoznL6yrZAPK7w==
X-Received: by 2002:a1c:7c0b:0:b0:405:3885:490a with SMTP id x11-20020a1c7c0b000000b004053885490amr12474883wmc.0.1696328751231;
        Tue, 03 Oct 2023 03:25:51 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c021100b004063cced50bsm945150wmi.23.2023.10.03.03.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 03:25:50 -0700 (PDT)
Message-ID: <651bec2e.050a0220.f5ddb.3810@mx.google.com>
X-Google-Original-Message-ID: <ZRvsKwrdSOI43YWZ@Ansuel-xps.>
Date: Tue, 3 Oct 2023 12:25:47 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
Subject: Re: [net-next PATCH 2/4] netdev: make napi_schedule return bool on
 NAPI successful schedule
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
 <20231002151023.4054-2-ansuelsmth@gmail.com>
 <CANn89i+eSWYuE=wE1TPJFtAS1OCfFYytC_nAjDWkizxmR9e6JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89i+eSWYuE=wE1TPJFtAS1OCfFYytC_nAjDWkizxmR9e6JQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 04 Oct 2023 05:32:24 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>, Rick Lindsley <ricklind@linux.ibm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Krzysztof Halasa <khalasa@piap.pl>, Yuri Karpov <YKarpov@ispras.ru>, Lee Jones <lee@kernel.org>, Dany Madden <danymadden@us.ibm.com>, Gregory Greenman <gregory.greenman@intel.com>, Zhengchao Shao <shaozhengchao@huawei.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>, Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>, Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Haren Myneni <haren@linux.ibm.com>, linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>, Jose A
 breu <joabreu@synopsys.com>, Alex Elder <elder@linaro.org>, linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>, Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>, Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Bailey Forrest <bcf@google.com>, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Benjamin Berg <benjamin.berg@intel.com>, M Chetan Kumar <m.chetan.kumar@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@l
 inaro.org>, Zheng Zengkai <zhengzengkai@huawei.com>, netdev@vger.kernel.org, Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, linuxppc-dev@lists.ozlabs.org, Douglas Miller <dougmill@linux.ibm.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Junfeng Guo <junfeng.guo@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>, Praveen Kaligineedi <pkaligineedi@google.com>, Johannes Berg <johannes@sipsolutions.net>, ath10k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 03, 2023 at 07:21:46AM +0200, Eric Dumazet wrote:
> On Mon, Oct 2, 2023 at 5:10 PM Christian Marangi <ansuelsmth@gmail.com> wrote:
> >
> > Change napi_schedule to return a bool on NAPI successful schedule. This
> > might be useful for some driver to do additional step after a NAPI ahs
> 
> This might be useful for some drivers to do additional steps after a
> NAPI has been scheduled.
> 
> > been scheduled.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> Yeah, I guess you forgot to mention I suggested this patch ...
> 
> Reviewed-by: Eric Dumazet <edumazet@google.com>

Yes sorry, totally forgot to add this here. I already have the patch for the
other driver (but it's dependant on this so I'm waiting) and I forgot to
add the tag also for this piece.

-- 
	Ansuel
