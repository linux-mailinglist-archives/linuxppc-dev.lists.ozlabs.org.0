Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 529AE4CB4CD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 03:28:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8FKH3b8Rz3c2k
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 13:28:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qBGtve+I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=xiam0nd.tong@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qBGtve+I; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8FJX3Knnz30R0;
 Thu,  3 Mar 2022 13:27:55 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so3550423pjl.4; 
 Wed, 02 Mar 2022 18:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C6016/38QKZUQAyk5HMPjenTvm42Pe8sPBzTcqL5vmY=;
 b=qBGtve+IuFrAkJa+gsN1WQjHRs2fvQkSK1D44BenBKAqsyswWIPF49CjeAw6Lc/Xiz
 7VY9uX10GWOeYOq3Roffx9lK59MGCnSnWmLkHD6Zz3XGADMqQbIXFAspvzlfyt7tl87F
 C44YITS/y0gKUKqqxM42VKL4jH/Xx4KasojD++jZOWXtcwkx1m//DlSoFwhQEbp4i/NS
 eGEaCL2abI9d2Qo/vgVE47lljuFHl9RIsYb9haWI9DYl1+oIMHXMK3O9uyeK26H4D1AX
 Jy4saNgfSyFkb5FP8pbKE6ds3BSqIpGBCoZu+qijzq/vfSl1dGYXTnehjmH9/ySByi+z
 BIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C6016/38QKZUQAyk5HMPjenTvm42Pe8sPBzTcqL5vmY=;
 b=7OGqnNSS0KtJmBF8pY/DfVVBLZE1YbQmYNGdOhQaIIxsqA6+D71mAkI17hq59/jPcK
 VCxZn8ndDgb7A5uln3YeO/RuZT/bHBlbWcB2MgksuTvXlKBCgXgNLaBDPSRn8A58dz+Q
 uu+/H/fGj5q4oW3c8dyVytIvjmOe4sG4E9uJ5Xo7d6D1rWvXlqgt7NYl8YEbUSEDplQM
 ryT13kA4rbIHTT9Il+3K+K0FvTIOaIAvsEmGhD+igvRoremIP9zOc36hc1WJbYNTxesi
 bABLI3eDWw2UKNFZBf8oFIO2wnSi+As11vmcgtgyu7KA4E9Tw8TNvwF7caNljK7eUOob
 W/Vw==
X-Gm-Message-State: AOAM5317jSbKy3aMrTfqvKURxsaVXeZxtDB0q+hyuNSWJCWnEfu5bQRa
 LsQGpzurzWsEKE9KnFSWtLI=
X-Google-Smtp-Source: ABdhPJwdGKGtPoJbq9KB0b78P8kOQOqlHazHAUCZQHvA6TzNHcldJErwW75BUHOqmaVxrll88UvLqQ==
X-Received: by 2002:a17:902:ec90:b0:151:a632:7ebb with SMTP id
 x16-20020a170902ec9000b00151a6327ebbmr1936164plg.154.1646274473191; 
 Wed, 02 Mar 2022 18:27:53 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
 by smtp.googlemail.com with ESMTPSA id
 d15-20020a17090ab30f00b001b8e65326b3sm359822pjr.9.2022.03.02.18.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 18:27:52 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: david.laight@aculab.com
Subject: RE: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Date: Thu,  3 Mar 2022 10:27:29 +0800
Message-Id: <20220303022729.9321-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1077f17e50d34dc2bbfdf4e52a1cb2fd@AcuMS.aculab.com>
References: <1077f17e50d34dc2bbfdf4e52a1cb2fd@AcuMS.aculab.com>
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, gustavo@embeddedor.com,
 linux-iio@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org, c.giuffrida@vu.nl,
 amd-gfx@lists.freedesktop.org, torvalds@linux-foundation.org,
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, h.j.bos@vu.nl, jgg@ziepe.ca,
 intel-wired-lan@lists.osuosl.org, nouveau@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, dan.carpenter@oracle.com,
 linux-media@vger.kernel.org, keescook@chromium.org, arnd@arndb.de,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 bjohannesmeyer@gmail.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 jakobkoschel@gmail.com, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 linux-sgx@vger.kernel.org, nathan@kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 xiam0nd.tong@gmail.com, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, christian.koenig@amd.com, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Mar 2022 14:04:06 +0000, David Laight
<David.Laight@ACULAB.COM> wrote:
> I think that it would be better to make any alternate loop macro
> just set the variable to NULL on the loop exit.
> That is easier to code for and the compiler might be persuaded to
> not redo the test.

No, that would lead to a NULL dereference.

The problem is the mis-use of iterator outside the loop on exit, and
the iterator will be the HEAD's container_of pointer which pointers
to a type-confused struct. Sidenote: The *mis-use* here refers to
mistakely access to other members of the struct, instead of the
list_head member which acutally is the valid HEAD.

IOW, you would dereference a (NULL + offset_of_member) address here.

Please remind me if i missed something, thanks.

> OTOH there may be alternative definitions that can be used to get
> the compiler (or other compiler-like tools) to detect broken code.
> Even if the definition can't possibly generate a working kerrnel.

The "list_for_each_entry_inside(pos, type, head, member)" way makes
the iterator invisiable outside the loop, and would be catched by
compiler if use-after-loop things happened.

Can you share your "alternative definitions" details? thanks!

--
Xiaomeng Tong
