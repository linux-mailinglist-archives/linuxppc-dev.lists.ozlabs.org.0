Return-Path: <linuxppc-dev+bounces-15811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47793D23E6D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 11:20:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsJrm36L7z309H;
	Thu, 15 Jan 2026 21:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768472408;
	cv=none; b=OWcOf4ds4laW2YfvK1DX+dXuCaiYrwgpxPbNYOSXqp2ceqjcLyZd6F6llXOGOuQ6IppbnVNMUOQ5pbG/e8Tg2B7r9RHfmCrbu/lB84ESb0SopU8AJL0uoqltYUK5hxl7HV4eJ2cL/yjJID60HbGXlhmrlJksZd7i5arR3jwGUt93ZQwmkI0wRskHMhwLypmYXTNFLPHR+7wA2gY8wUVgtT2ebsaLZeQngs1MiLUbQFF6xq1t7jX62/0hdT6yQvpu0eIMkgswNYY50tcK0H2YhA4PwWYKI1R3+6zFo/LYX2eY+vfkVyRFfx5IPP5qwiOVXgV7wNRiCYwHiPcMXdauqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768472408; c=relaxed/relaxed;
	bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EqsrQhmGegrYs9nSDDQNShjSnIAefqZdposGlWe4TRX1CtxLIPE6KnMezoOPlkj9lVM2ZwCEu6uNye5evqxXZ+tyexA7Zp1j6gZc9QXKDJAifLIjvMvAODMi9C8Lukkbfh/11mWNTukLw2vZyOSmHBy19v8rfIfGtTfrqEYHX/CLVqzUAFxGeLO/xlLL5e1rVqjsNnSO6MtrVg5ks0a9ezn/pU+Dy5rqHbHNKMy+MMUAaxRWqaUI/jV1cgJN5tKDIyGG/kpjlRFoi3yDuPaoTFXNIjTCKx8pNYP56X9k6oTx5tigQluj9qASekEnG/70s+vMk8DnKFoInEdMjsPQyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VgeN8fM6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VgeN8fM6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsJrl1rVRz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 21:20:07 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso387787f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 02:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768472404; x=1769077204; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=;
        b=VgeN8fM6xGndeebz53k6hePBrnItOCRC303BP00krR+JDpi5IqMUGHlQqJB/H5ZjWB
         hAKw+x7dL+se6+nBvmfY38xd+GtbaT99Ibdhjdcn9r14UShwM7V4WoEaIOQjGblFkfyY
         aOujG8803joKzMj/sMsBUmMt0tZ+ZRKUhH6OQpeWjvz/gwB6H7ix/4keIu6gktRgumXe
         PnWtKEP7zbuu8woR3NwGY2v2KOgYPnVCMJ70H2IozO8OGSsHSCLd+UmqGL39K1u7cSXP
         Z+wvC2lYkrVDRcL7Ul2ZYoHonrEzRUHySb+0M4VbA/eMrA1fYRpehibv7zXK7CvDP/bS
         gDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472404; x=1769077204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Blw9ol92Adxv0ebGIyoRpKSiGhl8JOSAW1An3S4C+Hw=;
        b=iYnpYdFIMBJ4/zfZ3zIwOaZufSN1LdxrQMg3WYAqVNanRZzqhzjuGX3AYP8DXgZYQv
         jD6xMsEuYaXCaPIQowKRNgNvSa5tg/jZ8vu7nd7oHnUYpSQKiDUSHJhCdOzsFGQDa9t2
         kf2QZQ+NbmSdheLjyhDkXIZ9A1laSF+mSxJBRpkH8r9VxPBIBpxHzJHmuQoh0bUnyDY/
         MPs0PKrgaANt80U2+CYncHgh4RMM7xAmZZcNF/4lhm3YSueAHrd6W1CJ7jKyjP1N7Njc
         h+fwcoNOS3YD5oqtUvwFi1lD2kYinSZUyJux6Uw5N+E3v1mVAL/cRBKaR6qF+kakXjIG
         gzqg==
X-Forwarded-Encrypted: i=1; AJvYcCXlgqkYGII+0i4JdeEamCRh92H7259RlQH5LVTFiNH14FBwGKRBfBy563W0RoslJ+pN45Jw0dqtpEDi2n0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwyJg6QMgW1bCSyqwvn8ZLX8EMTPaBF0HRVPKE/tBt2mZT0sE9O
	zGhVXQxtW6V1pyLKpLNhq6cL5z2UFnjoZ7ckUbH96V9entaAeiNeDO03Oj4LjwNlWsE=
X-Gm-Gg: AY/fxX52xwB3wCLa4a9EGkXkV+ACfKeIZ4WCKqG9TiDOBVF+VnSpZquGrMkPsxl15o5
	Xdoufjj7gZvwXdMo6Q+693nSn9k2eT5DSxm4vQ83ZNY9NEaqS/QQlLfxCJNcOlcwZ1GwZZ56y8e
	F4tA+KdoVRenS6wK/mMtQG37tVEhPO40SEnW/rVCf6sWMm3K2VEBwO6b7c2+biA+j1IEdVL2tu3
	hwq+qNkVCloK1WvTJrLYfjRZ6wS3DJH0sLsdAfG1kYhIaeUJ9UnscefzAyuPKVW/MhBnJyNMXaB
	/LANeADMKi30d1qponsyW1+Qfr+TIm0ddbJXETf9+9qCdrFEGOIqGNiXj1YCveImS9grtL0rxRV
	qMWkGYkOIvU/XPOtCQujpSLSj7UjiW74x85ApbyNY40Q3CPgtkzZkVqt+NHT/9r46rxf+KCR3M2
	t83/piZY5+roFMsw==
X-Received: by 2002:a5d:6b41:0:b0:432:a9db:f99d with SMTP id ffacd0b85a97d-4342c535db3mr5505744f8f.36.1768472403629;
        Thu, 15 Jan 2026 02:20:03 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af653632sm5139931f8f.11.2026.01.15.02.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:20:02 -0800 (PST)
Date: Thu, 15 Jan 2026 11:20:00 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 08/19] debug: debug_core: Migrate to
 register_console_force helper
Message-ID: <aWi_UJcrphO9Esxw@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-8-21a291bcf197@suse.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-8-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:15, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

LGTM, nice cleanup!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

