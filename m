Return-Path: <linuxppc-dev+bounces-12014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A44B523E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 23:56:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMZJh3lf3z3dVf;
	Thu, 11 Sep 2025 07:56:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757541380;
	cv=none; b=Ba9PCHlW/Rycd2ZZoZyP3oh3hPm8Z+f5yFgEeFEivX7G9VtVVLusAZUIWJb7pmhGBSyq0ukurGFl8u6kbSHe+1utRlBlU+L2Nx4/x5jtcG6lV1L1eklugLe6tnihCZh61Ydex56scqwOvTp448BB7A0fjAmdYvD212Bgv9e+dxyZ7PBN9D9hS3cHHkULJ3+WixnCeWpkl90m5sg6GkmC/igqqHotCZdyn4G3MJGcfpTTQR5SDoNEi/ljLW8/JdAjqux2YmQ0a44qWp8wzhD+RZJqLyHjT02R2GeOjG1vR6EnAbbjBHsiFHoBJ3X0+p8iQPnga1ocNP+7uJh218fouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757541380; c=relaxed/relaxed;
	bh=g9d1QV8DriomeYuygow3J7NXcF+FjsYxyafVX+X7WJo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=hjjRys5yTiYR9jw2nZOlQdw0RoAFWLv/q3OJ4SZ1n9vUOcMEAtvg0hdj92VV9WRLUmoG5/MPX6giuW7ELQPt4QE2hqoVjqwhQHXc8mywpejigMISF6kodC+/lGsnROWMK/DDNGLSueQzpni+3ziZ8jhS0NXrJnh6p9KVeyWbTrAe8KQg6jODIhWxebT3OanZGpVgJitPZIX0hB2J9DAlrsqE75y+6vVxPfgr15ZY9zR/2pt34fgSuJJqzX9+4XPyO4Z+dYFMm0ONE4F4FIA7DzURvGWdZyITG0ETiTwItU+hUNgmxQW4hbPZ2MRtvVlaQY7paKMAs/YLKjsNJnM66A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=URxxOIpg; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=rene.herman@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=URxxOIpg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=rene.herman@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMZJf5JSZz3dVX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 07:56:17 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6228de280ccso56828a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 14:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757541373; x=1758146173; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9d1QV8DriomeYuygow3J7NXcF+FjsYxyafVX+X7WJo=;
        b=URxxOIpgUVHJ4SOAKauHB99URg0PBnWHwpujr2aHW/KRVr7QKO0WRoI6Gwur64tuIr
         7nnCHDSyujyioMi3KncyDn5NYxki4xESdEg3dHQSiI0eL2av65HWyGSWTXutYT6opRWo
         blmKq3OBAy0r1vF2wT2CSrVkwCafBXYkkXZisE1zfBdo7BZpaF+FlYIwXbQ+EwPeMlT+
         myheYq05mFbLjUxBcc034ylVoaFm695WERVy7l+ZP0p7C0H+oEyMjAQr2ikP6fLyEmkU
         4gGJbk27lQIStnRV2eR1gGIGwUUSDZ0bvnaSGiLPUnb8gGfMq+y9CXuYKIoBDnq56TAo
         t0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541373; x=1758146173;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9d1QV8DriomeYuygow3J7NXcF+FjsYxyafVX+X7WJo=;
        b=EXBM55aPoCbO0z/Z8I1yCTYMrkYjAi1O9/ZysJoqn1I9ecjMw2utPeGB+pwGGw6ym/
         QneoTrZVSJM7IunT7MwY11quhPjIPMPMoezOMsunyQx+KqUBvluxRK3LYBSnja0vReg/
         mxGqt1PaemrX8/w2+juSciAUo8f/+94lLND9bV9zwzXuabfiQdIEtC9diUUtjJ1xhEQr
         9159IfgOAV5PjPhpaNUIqiUpJuY0uvIHH6GsOuKPYCV9SWA9Ttd72Dj40AJYEgiM9nq3
         H/bfgb0eAwhrQM4OU3lqQj4N7Y3KrzM0viqnd7QzxwLVuTOnmBnC5FohTurU1lZNRBZ7
         XIRA==
X-Forwarded-Encrypted: i=1; AJvYcCVewA4r2WveqePtwWp0PkRb7wCYcLS6+WKN8V1tYiOUF2SPzxkhAZgksSLqEoXe9mVMYiI1JgiklBS9VoA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxnrdTXFj7CR229AuIp5Mh0ZfYUxd48xUhEq2kIZglRHDC1WtYv
	Z1r25sQ4W8TVTnbT5MQ7IBSRyRqpZwuOssH0mbGw6pgT4U94Tsyeh/ME
X-Gm-Gg: ASbGncuom96+N7AguKnn6SvFW7hVHZj7MpO9nhwdLsrpg4qDqV01X1sn6CqgX+zrdVp
	pUUHIj8YdyjZuT4Y6ON6e/5CvWFwqxHC1vbMPKUY5RnznPZAjpKMa23Qh+h11psDUSMhS6C/kqs
	PK0Tf3UEQlZpR1yX90JW5mVW7stKAsTDYRN1uXRxyoGenisROMN7MXLaTKx0Kaoe6dvbqcQ48qC
	FlQrWUPUO3hoWVQ3OaA7a7D8Wh7kMC5cEfjES0WHiiWBaNoFyJrXskJ6eEW7u5s0ucPWYEJkcPL
	4uZ+I3bhTYM2q1ApR5NMfVV3u1QMIV6udbwoFLjifmD2lb0WBZJCeEy0R5J3Yk5ZOgYn9vAWlDr
	uPGa4soI+QRqhDOxsGzNQNfZ7DyAYhoQtwqWA0GnanOMdmbfACPJTrAQheGpnkJGhjByaZQ0cqS
	vXG3C2rCE=
X-Google-Smtp-Source: AGHT+IGBsR+U1n4WFqO8g+vB4ERFu4ybrDNCTovC+1KY6W1/R7uSZEcXa89aKrlY6FwBWGiHJP9Ndw==
X-Received: by 2002:a05:6402:50d2:b0:629:c417:ee5c with SMTP id 4fb4d7f45d1cf-629c417f146mr10662130a12.32.1757541373118;
        Wed, 10 Sep 2025 14:56:13 -0700 (PDT)
Received: from [192.168.0.51] (217-62-96-139.cable.dynamic.v4.ziggo.nl. [217.62.96.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ebfe0ac03sm69476a12.16.2025.09.10.14.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 14:56:12 -0700 (PDT)
Message-ID: <1206e86e-488c-4c58-9e67-2313a678a5a0@gmail.com>
Date: Wed, 10 Sep 2025 23:56:11 +0200
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
User-Agent: Mozilla Thunderbird
To: richard@nod.at
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 alexander.sverdlin@gmail.com, andreas@gaisler.com, ankur.a.arora@oracle.com,
 arnd@arndb.de, chester.a.unal@arinc9.com, christophe.leroy@csgroup.eu,
 dave@sr71.net, david@redhat.com, geert+renesas@glider.be, heiko@sntech.de,
 imx@lists.linux.dev, ira.weiny@intel.com, ksummit@lists.linux.dev,
 l.stach@pengutronix.de, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, lorenzo.stoakes@oracle.com, nm@ti.com,
 rppt@kernel.org, sergio.paracuellos@gmail.com, surenb@google.com,
 vbabka@suse.cz, willy@infradead.org
References: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Language: en-US
From: =?UTF-8?Q?Ren=C3=A9_Herman?= <rene.herman@gmail.com>
In-Reply-To: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> In the past I saw that programs such as the Java Runtime (JRE) ran
> into address space limitations due to a 2G/2G split on embedded
> systems. Reverting to a 3G/1G split fixed the problems.
Believe you guys are talking specifically ARM so FWIW, but I remember 
for x86 that at least initially Wine and things such as VMware were 
affected by the more creative PAGE_OFFSET choices.

Both will have been as a matter of plain bugs and are supposedly long 
fixed (and I in fact believe I recall such fixing for VMware). Never had 
or as far as I recall heard of other issues back then.

Rene.

