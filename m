Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39FE9441FA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 05:41:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZFBk4jplz3dTw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 13:41:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.181; helo=mail-lj1-f181.google.com; envelope-from=wens213@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZFBL32gTz2xWX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 13:41:28 +1000 (AEST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso74435471fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 20:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722483680; x=1723088480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rpFbA20aLHJ+Am8YxkTg4RUa3XKubG9hiY6Kx7P8xtw=;
        b=U/1MxFvldWf4G1bTiYAsmzCFiQAZv8ja6aI0a7e5sby58hpa7uz/I6eZhbcD2V42G8
         iZb37XM4NwMR+xw9KHXc1ddsQItwVSitirzMv8R42cZRzu52q6BNLBqgWdxcMO4vJgTU
         NXzQF7VNAohvI8VvgNBUmIkLKvrXFpB/sv0pZl6unj8djKgcssggdoL1vh07qTUCz+yb
         WQvAXJoGRx0KNkrA292OhFihdop+tUtv6OoOiTsikYKgNecbxlpHmaJZBpjiPR4lX65K
         A540DOD53jTegn6TsAoohB5zQGyvl2hK1vi0KC/ZpyfPOvj5DMx4+OPIFh9W48RVU0Fr
         NGQA==
X-Forwarded-Encrypted: i=1; AJvYcCW9WsC5kiZslNDHXyD9a2eT8F2Md7Js3VSviJGopjiXb2Dea3TTRNfjZKZW5XKDCgHBc+QajvhyBgHhgmgsjcdIn9CY/0Tx4HQH+T0i5g==
X-Gm-Message-State: AOJu0Yy7hBNrtPilDz8XFRRYi7sWZSRIV1P1atmrCuXLjSdf3LfrTT9O
	x5fN5SVEmqdlFZYU3qjdOvPXAzmShcPuO2xV+tsXWib1m3CAcpXwPP6btv2m
X-Google-Smtp-Source: AGHT+IH91F1bdm2aVoT9rZegOeInRRLxYD8phus/EFsl+EuJ9trxcaKDbfTkrKRhkB14fGeq0FKvyA==
X-Received: by 2002:a2e:8296:0:b0:2ef:2c0f:283e with SMTP id 38308e7fff4ca-2f1530e8cafmr6743741fa.12.1722483679336;
        Wed, 31 Jul 2024 20:41:19 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03d0773a9sm21767051fa.127.2024.07.31.20.41.17
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 20:41:18 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so101779171fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 20:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAFgiRTumAahgF0HPxT4CJLxNRQCHj/3RQfMKHsNX2ZJoXtOGz8XHO20sV3PoUAo7WK/6sGWEqRs6Zgx89mdAswGfzuu8LBveCBCpZ1w==
X-Received: by 2002:a2e:84d6:0:b0:2ee:7a71:6e3b with SMTP id
 38308e7fff4ca-2f15310167cmr6804891fa.27.1722483677641; Wed, 31 Jul 2024
 20:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240731191312.1710417-2-robh@kernel.org>
In-Reply-To: <20240731191312.1710417-2-robh@kernel.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 1 Aug 2024 11:41:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v65GvkyMS3kZWEADGWKvZ818w5uvJASkEMrox535c4Ba_Q@mail.gmail.com>
Message-ID: <CAGb2v65GvkyMS3kZWEADGWKvZ818w5uvJASkEMrox535c4Ba_Q@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Use of_property_present()
To: "Rob Herring (Arm)" <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@csie.org
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Patrice Chotard <patrice.chotard@foss.st.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 1, 2024 at 3:13=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Use of_property_present() to test for property presence rather than
> of_(find|get)_property(). This is part of a larger effort to remove
> callers of of_find_property() and similar functions. of_find_property()
> leaks the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/cpufreq/cpufreq-dt.c           | 11 +++--------
>  drivers/cpufreq/pmac64-cpufreq.c       |  2 +-
>  drivers/cpufreq/sti-cpufreq.c          |  2 +-

>  drivers/cpufreq/sun50i-cpufreq-nvmem.c |  2 +-

Acked-by: Chen-Yu Tsai <wens@csie.org>
