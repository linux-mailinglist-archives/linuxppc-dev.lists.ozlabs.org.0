Return-Path: <linuxppc-dev+bounces-5981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA591A2D3BB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 05:19:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yqczb56j2z30Vk;
	Sat,  8 Feb 2025 15:19:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738988347;
	cv=none; b=d74XssfkA1PxrYh/HPNz4RsX75Ljnl/PMc1yjzXrsR0bSkxttQKXvJklkKoPbRoyzZR/fpfYSRdwi8RxEvqgOG37sST6a47FrpRSCaPjt13WoNX5HbhXxunExlx8VJEESxvZ6eNXHSZaZajOcotD9VYo7X4EgjtZBQTL2SF4oGoHY03XoTxKHDDWHok2U+RyODrZ5o2Nn0/i6/HdcMjfwaExUJQdh4FpugRdXaSqZ6EErGGR/6I9krpbPFKxK2jhMZj7KU797bNv4uOsTeby6wjMz8GcpZNgItTi7iVBK6tzKTOS+oxuMRnDibYm1qv6fmjqA/lJMmFjAhK1Wqem3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738988347; c=relaxed/relaxed;
	bh=rJnBLg+2EMCubVxOzepIpdcBMB6agbuUnEZ2sZAa12A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGEuuQNkSXNLdmvtXuZPpj6T3jvGDyoUnLqniylw4ZcqD1yRSoj7FIu2hnnksVHF0mVsGISp+v8UuSxGevIrjtMoGZ1x7LNeAA9L8G180YCUcJUUEqgK+HDg7XPhvM55afmXEc5T7CuLzUcU/GaX32oj5EpZvLTUYQQjbYowZb1RXX1w+GyqOOZNqNlxFQiNMFoIcMjlqoiS3Ajcgb+Vp871VJ88f6kXAX3FadAq/vouG7HYzgHemDZC8q2dKmOJOgFoQ3iJfFN/GFMKEEvquvFLQMvRN9tlg+n2hahAI07rp5kxN/pb/59KJ0nd8nYgKdaXSzbp2Mh54OK43b60AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nXhkZdYX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nXhkZdYX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqczW6lL5z304l
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 15:19:02 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab7157cf352so737834066b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Feb 2025 20:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738988337; x=1739593137; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJnBLg+2EMCubVxOzepIpdcBMB6agbuUnEZ2sZAa12A=;
        b=nXhkZdYXblSXk61TCSD6CTuNuHZFlvsDDC8CoL5auwuNGf8yjm7CYYbWQfwe8B707y
         hX65apXFzWnCXWuiGbvoOVR+fvw4ig5SWVy9YN60IKGXv7/TvoEKfd9Th1eQdysK1zzd
         Ujhq8X9GM16vGCVVNr2Kb4j15qGmUTnRrg+BzqMEpC11qqF991ZSs/cOIxc9vsl1G17z
         nxZ60oPQFVE25SSCWcnjz1Yb0G9RQdx3nxBqv66lIqY4DKQGs2JvhjxNymVxSd6//gJt
         mmA6d4qOsATbg4lO5bPwBpBqzDhj732PZB38tB0lGFSmpg60SB/hR3jafW9YfcaNIE7x
         /Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738988337; x=1739593137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJnBLg+2EMCubVxOzepIpdcBMB6agbuUnEZ2sZAa12A=;
        b=Vvul6xEn90lpfiEo+rbN+D8b0f/x4dwyxlm279zTsPekfS17i5S7+2MLCRPoyVaxt6
         kDfTyJsVNdcaF8oJXbsCk0K1nWsn4EKU1H/b9mmKYWnajk2vroWihk6aXHAPTxH77NtU
         XVURiV9MYbt2/zGs0jTFsnEbdxfURMAliJ3ZC6l9SeTc2BcwRRu9iHY33vixOlCqVS0t
         aKTvg4NfxxfsbxX9Hf+Wzvws4aujNArzKOoflaAh5Srf2f87TDtbWGdNGt348X2F6Et6
         047u/tTFQX5UFHleWZFNgmm9tg57hww510kQl4hvQCXf4uyrQB3KpnoMXpjyozsFXFu6
         b/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVoboqlx/vuOUuaJOAjWL1CFpQGR7BkF6tVh49bnlpbUH5qSJYftbAlLawzDnjVZx3R/hsPSdEEqD8omOw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAqyQlWLSz+M+Ny6lvg8gLjOT7mc778q4jDJZo66xGUnEj1bf4
	hJcnhW3DG2zl9n9Y6MLki2xOiJuLnw+insC/nBcyAJiIO+9/A0g+OhmLJ+X1Htg=
X-Gm-Gg: ASbGncu8XEU7vMq/D7q7ttuXwafxJTb2X5T2A77UCqpoOxkDZI+Pb8o6LCkgH1C+L/D
	bf8iaPpk5E0Pe3kzD95CVta4i8mj7u7MEsRY6vgRPjA/3/s7zI8q4V+QAMQc+lT9NsA8+CIcdOX
	7MdALW6n6wTjsLU/A3K1FZ5/tQoI/vP3To4hrMQ+/6DZpwDFWZlRRGMUs14ZtT7/+C2bdmWis56
	Kh+65QKHFxwYt3Fe9994SFxSb72/2whQBFLONCJEKIEq4rC7idPpKjPt/1v+TrYaH8tR6GGeS+v
	wTU0f71icf3UqYVShgX4
X-Google-Smtp-Source: AGHT+IHn89AYm8QeUz9PnuTAmBi0sjoUrl44qsoKpOAlveTucLfggPm9SdbIhHVoYrkXGlxj1n8EoQ==
X-Received: by 2002:a17:907:2ce3:b0:ab6:f4eb:91aa with SMTP id a640c23a62f3a-ab76e896c0cmr1077297866b.10.1738988336641;
        Fri, 07 Feb 2025 20:18:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7732e7120sm391127366b.91.2025.02.07.20.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 20:18:55 -0800 (PST)
Date: Sat, 8 Feb 2025 07:18:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "zhangzekun (A)" <zhangzekun11@huawei.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, robh@kernel.org,
	saravanak@google.com, justin.chen@broadcom.com,
	florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
	kuba@kernel.org, kory.maincent@bootlin.com,
	jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, taras.chornyi@plvision.eu,
	edumazet@google.com, pabeni@redhat.com, sudeep.holla@arm.com,
	cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	chenjun102@huawei.com, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
Message-ID: <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
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
Content-Type: multipart/mixed; boundary="ZyGJHelXDmJEw393"
Content-Disposition: inline
In-Reply-To: <20250207153722.GA24886@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--ZyGJHelXDmJEw393
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 07, 2025 at 05:37:22PM +0200, Laurent Pinchart wrote:
> I'm tempted to then rename of_find_node_by_name() to
> __of_find_node_by_name() to indicate it's an internal function not meant
> to be called except in special cases. It could all be renamed to
> __of_find_next_node_by_name() to make its behaviour clearer.
> 

Adding "next" to the name would help a lot.

Joe Hattori was finding some of these bugs using his static checker.
We could easily write something really specific to find this sort of
bug using Smatch.  If you have ideas like this feel free to ask on
smatch@vger.kernel.org.  It doesn't find anything that your grep
didn't find but any new bugs will be detected when they're introduced.

regards,
dan carpenter

--ZyGJHelXDmJEw393
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=err-list

drivers/net/ethernet/broadcom/asp2/bcmasp.c:1370 bcmasp_probe() warn: 'dev->of_node' was not incremented
drivers/net/pse-pd/tps23881.c:505 tps23881_get_of_channels() warn: 'priv->np' was not incremented
drivers/media/platform/qcom/venus/core.c:301 venus_add_video_core() warn: 'dev->of_node' was not incremented
drivers/regulator/tps6594-regulator.c:618 tps6594_regulator_probe() warn: 'tps->dev->of_node' was not incremented

--ZyGJHelXDmJEw393
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="check_of_find_node_by_name.c"

/*
 * Copyright 2025 Linaro Ltd.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
 */

#include "smatch.h"

static int my_id;

static void of_find_node_by_name(struct expression *expr, const char *name, struct symbol *sym, void *data)
{
	if (!refcount_was_inced_name_sym(name, sym, "->kobj.kref.refcount.refs.counter"))
		sm_warning("'%s' was not incremented", name);
}

void check_of_find_node_by_name(int id)
{
	my_id = id;

	if (option_project != PROJ_KERNEL)
		return;

	add_function_param_key_hook_early("of_find_node_by_name", &of_find_node_by_name, 0, "$", NULL);
}

--ZyGJHelXDmJEw393--

