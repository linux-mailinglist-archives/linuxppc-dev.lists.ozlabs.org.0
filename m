Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EA616F84F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 08:05:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S6JT3YHMzDqyZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 18:05:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mpY8AoEn; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S6380Z46zDqc9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 17:53:55 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id i6so968592pfc.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 22:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=pzAhKB+RbnwI3hMYHFEGbAcZ3ouGUMpj0xC/JoKvq8Q=;
 b=mpY8AoEn9hGfSx/xl5lSfukYEmbQXIuFKHmfPVYAv6vzHhhzvKVoHJeexXVEjurr1o
 mDXhxdzoOlz6vGyAQVS191fxLhWvt39WrRBGQOqkLi29sWzej6b4yqMMUnza3kMVM1fH
 WMAiiO3kefBqSxeW7BcC4YcNde6QGN+ahrPdBcSuVK2q5rWUGsWy7pNGL+x0P2GRdtPc
 D8qjyN/8bBEZrPKrvP0ju2vLXuLhEzKIPQgY2Fz6GUSungvGgXVExMDi5sc/Fh7VfyMt
 iWkB/0XwxovYXvBbL0wKxnnnHcnRcXZGm7jSGQsEKLWhFnzbkX11RDPywIJa9oUNRuWt
 4Wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=pzAhKB+RbnwI3hMYHFEGbAcZ3ouGUMpj0xC/JoKvq8Q=;
 b=P7mtbNocaNmtJ0Hr01rGzjGNACxe5YnZ9O5cMRXneaQ1uvfWpWiz7EcjimIPvDrX3f
 HpoVxpeJFQI7mB1CyS12WFcAyP0WCqbQRXtEe6q38scFRBFxiCf9Dmm+plkN6KGaetjy
 E9oKcl9PMTDKJ15Mu41b2RA0fS27d1o1B8WxO9G7iObKLim7GQ3AA0U/Ajt5m10ZSzla
 JH8V20Qf4MlgaXRiZBR7p7OCnEAe6lpHMjGN8ifY11xvsed7uDbMHGA/Eed0iKmiDkug
 vYmLZlIWSN7Nq34DfDC1AWkg1UG09s1P8WBF9ZlyFJIsbFkHWkxCYZ6Ng7wl0A9Eb9RY
 vnzA==
X-Gm-Message-State: APjAAAWXxuhb9I3mplnF54xv4sDDJcZ80ESDDGFc7YmVMOZQNSSTXqLO
 r+5hLzxEG3Kq2+bgFDF9OoM=
X-Google-Smtp-Source: APXvYqyI5gvWv/C5PHlooeCHs4B0fe6xkGamIuyaJpqNZ4FvN/PNVJ7/rxLieXqZ1xBDRTkZ+rpfaw==
X-Received: by 2002:a65:4bc7:: with SMTP id p7mr2579165pgr.204.1582700033592; 
 Tue, 25 Feb 2020 22:53:53 -0800 (PST)
Received: from localhost ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id v9sm1244862pja.26.2020.02.25.22.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 22:53:53 -0800 (PST)
Date: Wed, 26 Feb 2020 16:49:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 07/14] powerpc/traps: Check for prefixed instructions
 in facility_unavailable_exception()
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-8-jniethe5@gmail.com>
In-Reply-To: <20200226040716.32395-8-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582699744.9jdw100hst.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: alistair@popple.id.au, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on February 26, 2020 2:07 pm:
> If prefixed instructions are made unavailable by the [H]FSCR, attempting
> to use them will cause a facility unavailable exception. Add "PREFIX" to
> the facility_strings[].
>=20
> Currently there are no prefixed instructions that are actually emulated
> by emulate_instruction() within facility_unavailable_exception().
> However, when caused by a prefixed instructions the SRR1 PREFIXED bit is
> set. Prepare for dealing with emulated prefixed instructions by checking
> for this bit.
>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Oh you've got it here, I would just squash this together with the first
patch.

Thanks,
Nick
=
