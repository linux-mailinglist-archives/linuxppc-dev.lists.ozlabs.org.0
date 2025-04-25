Return-Path: <linuxppc-dev+bounces-7988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10696A9CCFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 17:30:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkcH14bchz301G;
	Sat, 26 Apr 2025 01:30:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745595021;
	cv=none; b=E2HUOt43rBNguEFyUuyeLTKTX27xAQy2V/unFaKEEIgeQM39rzYfqSrH8dqPGUZ+P0GSR34hBmdyxFG0nz+jWPcxLzYHlaz25C0lHmFLTNALb4DPronFfY2RkANbULlmjhcRRzo7+YhVEuNwRIQ58LTX6by4JVAvu9Qemx/pTVOagoW7LF3YDa4q881sYdvcHWeWbHu8rqm7NdPkrNFzdToO+vkWf2EN18ARfUb9HKOvhooUw1FU9yxMezfovnAon2aMWt8yKGeNpkzZw5c+bsc1uciSfGJ0WKJ6bb29hOaDElpZRZiCfDi9rEG6fLiPHTy6NabPyS2JQ3XubMe95Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745595021; c=relaxed/relaxed;
	bh=XYX9LNywUVjZ5MKIhmplUJhVT60qSNh9kSQfKfBdFKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8HKL1VF6BKq93zMaL1mLe4UtLLREBKJodGika5aevQXVz9AtR26hUlru4irtJgla0zFkpKKfDP+KFgqdSypS8+wDepQLO4+PtD81wDY20z+L/JqoOD2L7gsVrgdv/VFMrDQpTLbJ7tBLxC/l62dWwUZMOEOBM7DNl9M6myPnyOrKaq3XzVwJh7kzb0HqaWPJMwEWhMuh2gQCC13thuTKbTP6e3yt0zlzi7Jb0Ofb6ql28HOhUq5fl/xCIu3+InmbJ49LzlEHsEh78A6mJZsK3n3BT8R7Df4a1XkdjCQiNnQOV6Y1Du+swe7NO9AUDfnwgOsoexRVmy+3RrlcILp+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZpFg2MlI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZpFg2MlI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkcGz6VK3z300M
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 01:30:18 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1733188f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 08:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745595014; x=1746199814; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XYX9LNywUVjZ5MKIhmplUJhVT60qSNh9kSQfKfBdFKY=;
        b=ZpFg2MlI9c25NXUo+VEHSEn3wgtgfSV5PkCiJ+6GaLScCaz85v0pmpDA1ImYeuNvWa
         LZnQmKzM4KvNHTkCwO9mQnda2llmIpj1NXc4bZ59X5Ubb8B8wXB/3r2B4j0ql/ZuPuZ8
         KHYZPmTTDkoVLi/QVXXb0HHw7oHsOcIHKnAh+oYZrDjqn0Cs/7ysf9fQbAOqx0vTQ66R
         AH4gh8NSiokhu3jSeZe4CfUBY6jjzlXpPZkfMe7rIaTggWEKp3Qjx/Djp7NmVgYzR73R
         FXGJHsSh37SaTDOuNM/XvfjZGpDbhy5Rq130tU4iZaDIB25nnB+z+cm/qFrcE4FWKy1j
         jCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595014; x=1746199814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYX9LNywUVjZ5MKIhmplUJhVT60qSNh9kSQfKfBdFKY=;
        b=BuZSprCSegyRUQsh9rgnFyu6LU1qGqEPIYC32Mm5LUe8fh+NMxf1QlHeLaxrnrTSaT
         pgJvfYUyfOn148oyvwkWgu42nl+J39SRpty9OsZVZVteJBL4A0TjK5HsnyAYiyLnEdfU
         AcyH2RwQ4fu6UDkxFl+DpL3qHqL63CYIvAdXvt3Ad6lKQ0JEURDV6DzP/KbXhkAiTAcf
         xJisQvoIDt6YzgGm9qWdnYcUWxy30k3vjfDxR0Q0csYt+y5VFeEEfZ55+OYJUoNMIEUf
         N/sGUyO5MuiwiNdk7czUAShBR9PW4eZm590cCyJQcObDgCi27aC0i7sSZyo/06QLz/7Q
         oamg==
X-Forwarded-Encrypted: i=1; AJvYcCU/WvGMyOHpgPQUUtLKOjbh0K2DeuL7y87+DxBITg4zoWBpFiczik6+xJ8JWFMIJGC/R6+OpLXqNOKaHjY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+BG+CPfXtXWTVayb3+CgJjancu20xrD1fPrF1jMAlq2sW0h4H
	YbhC3sGc95rVE/gvA6f0UNtBB/3JtKbZz49PGAtS63q3WcQh5zCmbgJoiL9/p2E=
X-Gm-Gg: ASbGncsgsfEBmhT3TBcY2QRSXHa9cCBz0sB3Ue4InK83CHx09N6dM1/XvBLprETe8/v
	toEdtX0OR9YZ2Za1x08CFWCp1Y1kL0wwVSUJQU19qSkb7yh58t3WBMGU3STc487AsPWr3jJjDHu
	/roW1LB9RnZKsr/LciRu7u1yMwybn1o5P9J8eXRLJIcTblXqsXGXUx0E/c/HnVzy8l+3RhZb760
	dNx6/Q8BJISniAoGHHKEnbyKc6lX4YsCjEMRCXjfIO0EM4PA8QPsf3A7wDpmXLCt9NkZbzAgjaO
	0eTXjPBC3DDRCYs2/7BYpup9zUFY52o+r1lH4Lo45WzyZVbJWObI3XgT
X-Google-Smtp-Source: AGHT+IGyQoffBkkjn9GdlBOynB35D8e4ETPc01tgM75yAlc1oqBxq4rXGz8GsC/XanHp8nvcBgQZNw==
X-Received: by 2002:a5d:6489:0:b0:39c:1f02:449f with SMTP id ffacd0b85a97d-3a074e0e059mr2152557f8f.2.1745595014541;
        Fri, 25 Apr 2025 08:30:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e6daa0sm2592945f8f.101.2025.04.25.08.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:30:14 -0700 (PDT)
Date: Fri, 25 Apr 2025 18:30:10 +0300
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
	chenjun102@huawei.com, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/9] of: Add warpper function
 of_find_node_by_name_balanced()
Message-ID: <aAuqgiSxrh24-L-D@stanley.mountain>
References: <20250207013117.104205-1-zhangzekun11@huawei.com>
 <20250207013117.104205-2-zhangzekun11@huawei.com>
 <Z6XDKi_V0BZSdCeL@pengutronix.de>
 <80b1c21c-096b-4a11-b9d7-069c972b146a@huawei.com>
 <20250207153722.GA24886@pendragon.ideasonboard.com>
 <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be93486b-91bb-4fdd-9f6c-ec295c448476@stanley.mountain>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Whatever happened with this thread from Feb.
https://lore.kernel.org/all/20250207013117.104205-1-zhangzekun11@huawei.com/

The issue was that people weren't expecting of_find_node_by_name() to
drop the reference on the of_node.  The patchset introduced a wrapper
which basically worked as expected except no liked the naming.  Krzysztof
suggested that maybe the callers should be using of_get_child_by_name()
instead.

I created a Smatch warning for this and here are the four issues it
found.  The line numbers are from linux-next.

drivers/net/ethernet/broadcom/asp2/bcmasp.c:1370 bcmasp_probe() warn: 'dev->of_node' was not incremented
drivers/net/pse-pd/tps23881.c:505 tps23881_get_of_channels() warn: 'priv->np' was not incremented
drivers/media/platform/qcom/venus/core.c:301 venus_add_video_core() warn: 'dev->of_node' was not incremented
drivers/regulator/tps6594-regulator.c:618 tps6594_regulator_probe() warn: 'tps->dev->of_node' was not incremented

regards,
dan carpenter


