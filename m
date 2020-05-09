Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B261CBEAA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 10:00:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49K04c3wSfzDr61
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 18:00:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49K02g0L28zDqhT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 17:59:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tENHITOp; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49K02f5Vf3z8tGy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 17:59:06 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49K02f4X6qz9sSt; Sat,  9 May 2020 17:59:06 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tENHITOp; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49K02f3bNLz9sSc;
 Sat,  9 May 2020 17:59:06 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id f15so1752699plr.3;
 Sat, 09 May 2020 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=gRd36KDB/iRwVs0k/ovAO6MuzA9nrtLsKZZjdOoWw/c=;
 b=tENHITOpFOah3/6OZ96t37NbAK34SeEdT3DzUkhoW4PnyR8harIDIT10+38Bzz6mnE
 H1UkkxaM77xo8OlvXg1GufHerAQPc2XQoKTPYv9OX/kRIuqkUGfszuqbKCF5SNbxHjwa
 8bISYaNHjIP78/rQrp0jHJpjwWgfGHaB9l9IyCninjgoY42kY8lUk2uXp6EXrGb19w4Y
 wvCXiBsb42jV1vK8zoxsn8aVvmHjQulXPRxJsXbRq9iZcgc4fMUfYJS3UD4h8y/RGkij
 K/Q5r5GptXSJ8TxrJYP7QfQVKf6UuwPt8c1Whxt1HCV4eLE9YJksIuEQF1qknPGQQ+iS
 VzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gRd36KDB/iRwVs0k/ovAO6MuzA9nrtLsKZZjdOoWw/c=;
 b=Bxj6YLqq8zXktsFeOMnAifkQLP69WXTggF4E2IB5oHh099xWBdx/4z97cdIrFb0Atb
 xiQT6/6Ks8CoyUtIaxLGGv717e/HRB19cpM+2acKqZoTj6ZUP9JUAtlzECUj9fY/llnq
 Zt5hB+YEshLyNymeLxdCHDq7ZVTgXbvutVfU7SB5qs0cT9C2j2GpFuHWVCZnEz8733GQ
 hwAyaDpjc9tSAp5Td5CxC3/oDTvEt69P+Kcmjzj2Bf02EeQ0WX4u+YTht7xptgykNRwS
 7y5wLYmUlHcdgIAgOXBznVnjjIdI4+PWiix+XXP8CoLcl2C0aLEDIKmatp/ysxID1JF6
 kXAw==
X-Gm-Message-State: AGi0PuaT9ZS275FGxavUMHb/VeIPyF9K4dTiIB4NQ6N0uelRKW9/fY3M
 EBTRyUxNb+neOELiPa2gRpcr3wlY
X-Google-Smtp-Source: APiQypLKhYjG6BfA73DPjCWtDwRIFQf4z4YT2MSK6/bo6EwHzYa07ppUz6yNZaSMKj7IUCClbRMf/w==
X-Received: by 2002:a17:90b:2385:: with SMTP id
 mr5mr10733747pjb.172.1589011143316; 
 Sat, 09 May 2020 00:59:03 -0700 (PDT)
Received: from localhost (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id 128sm3246126pfd.114.2020.05.09.00.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 00:59:02 -0700 (PDT)
Date: Sat, 09 May 2020 17:58:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH RFC 2/4] powerpc: Add Microwatt platform
To: Anton Blanchard <anton@ozlabs.org>, Benjamin Herrenschmidt
 <benh@ozlabs.org>, linuxppc-dev@ozlabs.org, Michael Neuling
 <mikey@neuling.org>, Paul Mackerras <paulus@ozlabs.org>
References: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
 <20200509050255.GC1464954@thinks.paulus.ozlabs.org>
In-Reply-To: <20200509050255.GC1464954@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1589010752.ygtog0nhjc.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of May 9, 2020 3:02 pm:
> Microwatt is a FPGA-based implementation of the Power ISA.  It
> currently only implements little-endian 64-bit mode, and does
> not (yet) support SMP.
>=20
> This adds a new machine type to support FPGA-based SoCs with a
> Microwatt core.

Very cool!

Would there be any point sharing this with the "naked metal" platform=20
Alistair has for booting POWER in L3 without OPAL? Or is it easy enough=20
to have a several different simple 64s platforms?

I have an HPT conditional compile patch and a few other diet Kconfig
things I'll now be better justified to try get merged :)

Thanks,
Nick
