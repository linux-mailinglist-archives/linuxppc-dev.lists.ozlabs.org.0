Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C769139A7F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 21:07:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xPkT4Q56zDqPR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 07:06:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.195;
 helo=mail-pg1-f195.google.com; envelope-from=paulburton89@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xNTs6B4rzDqLG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 06:10:51 +1100 (AEDT)
Received: by mail-pg1-f195.google.com with SMTP id s64so5143977pgb.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 11:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
 :references:in-reply-to;
 bh=TKkoejQV2c6zTi0Lk84zRP/sLh+dHPb6nJ3LQs91rO0=;
 b=JXMuLyE32WreI9q0CqePVwQGzgIYhW9YD5e3yd7Hj4wrix+JqiqCz4sUlMzUUECwTH
 /U+rKKKaCkuBjNSZJfF3u8Ij1nChoDzqTIKRfBIAfGSG1On96xXgh/uYrHnm55ZOO91F
 dl3Oh9ZxNr4cx2W42WqgeW/h6IhuMLU0v5by2Pt3aOF5moHmI1DoHnfScEzt67JfzHVU
 Ekh3xpIpGoy4dql+hwU5TI9G3DehfjOlwTOua4alrRDN9hG29LWzVwBVuDD8XptCO9JP
 Yfu3JDn3OjDf7zKhE1NtpYT57Dekv42mmT0FXhcWoM0ggxdNtD4QOaVdOgn+mDHmHUdy
 e6AA==
X-Gm-Message-State: APjAAAXqPE7MdG1FcBE2YYRSyZX4D//3oR4Sd5KYRjd9IngBxPpXxPZG
 yK4WV9VD4DhGSs8D83bCj1s=
X-Google-Smtp-Source: APXvYqxpcMDnuAK6LNWLusoFsllAJWymSw/KyOmcfqBZ+FKSDh+VYiY8UaD3R5kny7v3CzIXMzUf6w==
X-Received: by 2002:a63:6b07:: with SMTP id g7mr21929891pgc.243.1578942648698; 
 Mon, 13 Jan 2020 11:10:48 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
 by smtp.gmail.com with ESMTPSA id
 y6sm14563154pgc.10.2020.01.13.11.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 11:10:47 -0800 (PST)
Message-ID: <5e1cc0b7.1c69fb81.c151b.187c@mx.google.com>
Date: Mon, 13 Jan 2020 11:10:47 -0800
From: Paul Burton <paulburton@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 08/10] soc: lantiq: convert to
 devm_platform_ioremap_resource
References: <20191214175447.25482-8-tiny.windzz@gmail.com>
In-Reply-To: <20191214175447.25482-8-tiny.windzz@gmail.com>
X-Mailman-Approved-At: Tue, 14 Jan 2020 07:05:12 +1100
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, john@phrozen.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 khilman@baylibre.com, krzk@kernel.org, wens@csie.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org,
 shawnguo@kernel.org, linux-mips@vger.kernel.org, leoyang.li@nxp.com,
 kgene@kernel.org, khalasa@piap.pl, jun.nie@linaro.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.

Applied to mips-next.

> commit 23c25c732530
> https://git.kernel.org/mips/c/23c25c732530
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
