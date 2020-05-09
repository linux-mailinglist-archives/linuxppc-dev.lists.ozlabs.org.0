Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA921CBFAD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 11:14:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49K1j90nBMzDr7q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 19:14:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49K1dR1lcSzDqQj
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 19:10:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nMEKaFm5; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49K1dQ1Sbhz8tTk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 19:10:50 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49K1dQ05Cxz9sT0; Sat,  9 May 2020 19:10:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nMEKaFm5; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49K1dP64nfz9sSy;
 Sat,  9 May 2020 19:10:48 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id t40so5361806pjb.3;
 Sat, 09 May 2020 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=3aZQPfVWvX/Cz5y+To9kc7EjGlGudGJTepWhWgdPzfM=;
 b=nMEKaFm5QFtFvFT83hrZXFfe/JcPlWekxSRSdCWVTjeHUXJ6SjqOdZ9PkdqJnhsGW7
 CRskhIp1dRqpmTxUjR2IrGlobcVwPdZ3vMMIRWDb8pv2dfdiTkeI4c+Mg5pUHpOrBEZb
 4SrQv2Qt/lZte0gnmeIyhE1Bh9lfGZHyXidt4XYLPMvIz6+s3s3yka/3gV7fN9ZWOCKx
 douzzivfznHJS4u2kejQ/rMD+JWxsipcOA3vco+imBZ0kuUONb86+eiT5ZhVfGg37JHT
 k84+iI4otYXeyIpKv4vf6lT6Q2D4VESvH8dV/dWF/Rh9ln1LleN/zwV2M1RuYDOQXQPR
 yc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=3aZQPfVWvX/Cz5y+To9kc7EjGlGudGJTepWhWgdPzfM=;
 b=Nm2nRD6BYZSYATqoldUafYzEyufLbPtplaIA42AmjtZoLuXXq7TQ5McYWYAN2ekKBr
 RhC+jkD4gWDabFUIdlFMELMViFslkxnRRZoQrwETkZE51omZelDLxi57hBnEEGIEWZ9j
 h+pBkSBSHBSCi2d9FV5TRGeLmsBF/XSjkZbdlpkwSfbiM5Rfv6uxQGBRMTUgsdpEKwTT
 sxt0xIUdQgCRkJ6F0vLFuo8ERvB2uGHdg+f39LSUg+QbQxooaHwk2ewxEnMoGigHgtZe
 MhvRYDm2oFhV80t3fNEqmtzgmBgbyylSB55lPSfL2SMI6GKVab5SFQ5vxt8NhYJNKEZv
 53sA==
X-Gm-Message-State: AGi0PuYoIsceeFhaQpm1DAuhkfwYy/HwdDe4FbXJEkS6h+L4yph1KNPV
 6L+nYniOfeZmr7lN/IUZA3k=
X-Google-Smtp-Source: APiQypJam4gCw6uppv/XnVHP25QtCioUrt9qom4TTEVWg0Bb8JexFztfJccyVR0OVAaA9Bo+w8P4JA==
X-Received: by 2002:a17:902:b202:: with SMTP id t2mr4256600plr.1.1589015444980; 
 Sat, 09 May 2020 02:10:44 -0700 (PDT)
Received: from localhost (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id d14sm2863420pgt.66.2020.05.09.02.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 02:10:44 -0700 (PDT)
Date: Sat, 09 May 2020 19:10:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH RFC 2/4] powerpc: Add Microwatt platform
To: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
 <20200509050255.GC1464954@thinks.paulus.ozlabs.org>
 <1589010752.ygtog0nhjc.astroid@bobo.none> <2771261.oJVn4HZnso@townsend>
In-Reply-To: <2771261.oJVn4HZnso@townsend>
MIME-Version: 1.0
Message-Id: <1589015352.vol2thm3ae.astroid@bobo.none>
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
Cc: linuxppc-dev@ozlabs.org, Michael Neuling <mikey@neuling.org>,
 Benjamin Herrenschmidt <benh@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Alistair Popple's message of May 9, 2020 6:36 pm:
> On Saturday, 9 May 2020 5:58:57 PM AEST Nicholas Piggin wrote:
>> Excerpts from Paul Mackerras's message of May 9, 2020 3:02 pm:
>> > Microwatt is a FPGA-based implementation of the Power ISA.  It
>> > currently only implements little-endian 64-bit mode, and does
>> > not (yet) support SMP.
>> >=20
>> > This adds a new machine type to support FPGA-based SoCs with a
>> > Microwatt core.
>>=20
>> Very cool!
>>=20
>> Would there be any point sharing this with the "naked metal" platform
>> Alistair has for booting POWER in L3 without OPAL? Or is it easy enough
>> to have a several different simple 64s platforms?
>=20
> It looks pretty similar at the moment, I've been meaning to clean those=20
> patches up and send them upstream but Paul has beaten me to it. The main=20
> difference so far is how the console is setup. For booting cache containe=
d I=20
> was using a device tree pointing at a standard UART driver and enabling t=
he=20
> standard OF platform device tree probing.

Well I'd only merge them if you think it makes sense. If the platform is=20
a perfectly good abstraction for the differences and merging them would=20
just result in painful special cases it wouldn't be worthwhile. It's
clearly not a lot of code.

Thanks,
Nick
