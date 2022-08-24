Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A421359F0DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 03:26:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC7jR3zgNz3cBL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 11:26:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dpb/yMlo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dpb/yMlo;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC7hm28RTz2yZc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 11:25:59 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id c2so14367296plo.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 18:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=uUmdHBpzbriSuoiotw31C+sqS36Q04kPztFqTxJQriw=;
        b=dpb/yMlot+zmKLKXIjN6Lvob6LhNAAMCj/+/Os1pajANbCivi3fer2r0Fmqkba5q5j
         mbVtDCeEkBqAxJA3Jwlcnmc1UGiPMfco0NiKCUraZVvrh30cMjKwZxOY9GGgVhthe9Ba
         9YnAbqk5d/0N1mR8i2cUsV7gh4GHg62DdyrbY8WR+VFMR8zadMzS98Xqp6+Rt14tDot6
         pPYnphfWLxgQrJveBRXJbcJ65Cl48WyQilgLXE7j4egkKdSNlm0kFrmVKaakvi1wWVxf
         fPS6XZsZsSycgRBMgX8F1jZmlqbGON/rJYkPsA+k23m1N6Yq7vijy6NkAS6mIBkCqrXR
         D+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=uUmdHBpzbriSuoiotw31C+sqS36Q04kPztFqTxJQriw=;
        b=maV88MnW146udzTM2eUBJxPcLhxtaEP5U3qzkFRcdOXUsIrjo3u4YC0msUIsNcUGZS
         hIrjWYQKHMMHc1V2BaBhWAHAeav0lByDGalkBWQ7SSX19DGA0WAGUU0asmmZstdNxRi+
         0Dk5mBPZW4O0NcLSn9GAcRcGtBiTM24ooH0l1ALhAS7Cp4paeM2vXY33RK0JCxjFce6l
         S8JBKfkHKmdRQgBMedVZkXlU60n2UwvHGYRU4um2tpgFLaFFHD2DWjn6o2gjI4mfOjEO
         LjT5XX0i2a0h5eM3PuCpDvXia9Qc2WA0sVI1gIiGaFC+WRxhEbADhaZZNOVl5OajzUum
         dD2Q==
X-Gm-Message-State: ACgBeo3fc6XZlklvt/ZEcVd+lvAaTjhcsNE5sOcWssjwqd81QYZkovuD
	cP69OECEKscAVy5ejinBqRyT5EHg2McG6NJiaSTbcRC0
X-Google-Smtp-Source: AA6agR7xbfLJ1Uo0SN1Sc8YyuIhlZnLymcTgcuHc3xIKaCc5l2Col+H8uCrdOb9eDMMna3TkYDUkhhZNCNjnMhaqWsU=
X-Received: by 2002:a17:90b:4a05:b0:1f5:62d5:4155 with SMTP id
 kk5-20020a17090b4a0500b001f562d54155mr6063079pjb.6.1661304356632; Tue, 23 Aug
 2022 18:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220821010030.97539-1-zhouzhouyi@gmail.com> <87edx7l5px.fsf@mpe.ellerman.id.au>
 <0d7b55bc-4dd2-7de1-8ca5-353b1a044caf@csgroup.eu> <3756ad84-a5b0-b404-7962-86f77d6f38b3@csgroup.eu>
In-Reply-To: <3756ad84-a5b0-b404-7962-86f77d6f38b3@csgroup.eu>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 24 Aug 2022 09:25:45 +0800
Message-ID: <CAABZP2w5zOWwLknAEY4UoEQZraOn29TqpaaZxmZKpqS2GhT_yQ@mail.gmail.com>
Subject: Re: [PATCH linux-next] powerpc: disable sanitizer in irq_soft_mask_set
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: atrajeev@linux.vnet.ibm.com, "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 24, 2022 at 12:50 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 23/08/2022 =C3=A0 10:47, Christophe Leroy a =C3=A9crit :
> >
> >
> > Le 23/08/2022 =C3=A0 10:33, Michael Ellerman a =C3=A9crit :
> >> Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> >>
> >> My worry is that this will force irq_soft_mask_set() out of line, whic=
h
> >> we would rather avoid. It's meant to be a fast path.
> >>
> >> In fact with this applied I see nearly 300 out-of-line copies of the
> >> function when building a defconfig, and ~1700 calls to it.
> >>
> >> Normally it is inlined at every call site.
> >>
> >>
> >> So I think I'm inclined to revert ef5b570d3700 ("powerpc/irq: Don't op=
en
> >> code irq_soft_mask helpers").
> >
> > Could you revert it only partially ? In extenso, revert the
> > READ/WRITE_ONCE and bring back the inline asm in irq_soft_mask_return()
> >   and irq_soft_mask_set(), but keep other changes.
>
> I sent a patch doing that.
Thank Christophe for the fix. I am very glad to be of benefit to the
community ;-)
Also thank Michael and Paul for your constant encouragement and
guidance, I learned to use objdump to count the number of failed
inline function calls today ;-)

By the way, from my experiments, both gcc-11 and clang-14 behave the
same as Michael has described.

Cheers
Zhouyi
>
> Christophe
