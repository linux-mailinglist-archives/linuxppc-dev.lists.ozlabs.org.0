Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE69315D8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 03:53:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db47w60PlzDvb3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 13:53:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lHQwf0E4; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db45v4y69zDspH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 13:51:28 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id z6so346364pfq.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Feb 2021 18:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=U8jmIVnteY6Cvi+FunUg3/qgAhG73KICgddMeyHjELM=;
 b=lHQwf0E4G0LRXEJWL4K0euTXb73sLApH/1u4LImd3Q6fycxxgTm7p3ljKtEMNddT6P
 vKMLNBANySj3pT+rr4BAkCX5KldSoh0v4vbSDy/rzTYPN+24LYlFkpz5WXGv3Rf+/qWP
 WAkXX8PSwoRYOLXG956jD7iKIYfjccfOdLTPFDrESDdYiQz0kH57sFSIdg1kU0NLcbKC
 XV6+7FVPrzkBnG00wRGng6BFTSfJFnzBEOm6NXFeK/aUCH6ZIKcl0NcLPvcFl6xgxyO/
 RbkFNSmjXIhcLlVObzmyBL2lz9x4l7RrrElPeiCuV8MflywLBAyZwFDcD9d9PLb7sCn6
 d+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=U8jmIVnteY6Cvi+FunUg3/qgAhG73KICgddMeyHjELM=;
 b=hpyiRu3UhDH6qJKYFGdAL/6r+DzwU8wXy7sCYuBKh/Mf4KTAV9ulR5pJgJHrg5/jB8
 T1ixxTVzJplcN6/RkpSZ/O7Wb84l0f3iidP2/Han5fgLjOCYqj9Q6z9NtEy4DLzn/Hze
 baqSsBY+AXHFCcqUWQzthHvCGfaGAKcSi7AWqunEe743jO/YkVw++2p+fFdokvlkvdhV
 Xi3D8JshA9y1FzVsnKg3/2pwZW6/RAwIRY8Vrur37SLnXmc64Vi4INnHVWNSB1FjW0sx
 sJBB1GFKk8Y1zQ9kTbTBPWLa0NMOnAWdhwjKePM+FS4Foxe+IcFkkPi7YvuDJuFnOOOq
 qutg==
X-Gm-Message-State: AOAM532Lt78vomGQ75j1ETPnY5uuHTQCtPMk7Q9uzkWg3xm2fc6xqRiH
 RWNBRgjqyYfKM8MBMLmdWxU=
X-Google-Smtp-Source: ABdhPJzGuyUf0+zPwFpXjibQ7Kru2qwEsnS+gmjOOBTPT99oWQMmTK0u/3Hj7NL5KcLAmIzhikOxuA==
X-Received: by 2002:a63:1f54:: with SMTP id q20mr1000253pgm.135.1612925484888; 
 Tue, 09 Feb 2021 18:51:24 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id w19sm279581pgf.23.2021.02.09.18.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 18:51:23 -0800 (PST)
Date: Wed, 10 Feb 2021 12:51:17 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/4] KVM: PPC: Book3S HV: Fix radix guest SLB side channel
To: Paul Mackerras <paulus@ozlabs.org>
References: <20210118062809.1430920-1-npiggin@gmail.com>
 <20210118062809.1430920-3-npiggin@gmail.com>
 <20210210012852.GD2854001@thinks.paulus.ozlabs.org>
In-Reply-To: <20210210012852.GD2854001@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1612925162.lmf4qdejxr.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of February 10, 2021 11:28 am:
> On Mon, Jan 18, 2021 at 04:28:07PM +1000, Nicholas Piggin wrote:
>> The slbmte instruction is legal in radix mode, including radix guest
>> mode. This means radix guests can load the SLB with arbitrary data.
>>=20
>> KVM host does not clear the SLB when exiting a guest if it was a
>> radix guest, which would allow a rogue radix guest to use the SLB as
>> a side channel to communicate with other guests.
>=20
> No, because the code currently clears the SLB when entering a radix
> guest,

Not AFAIKS.

> which you remove in the next patch.

The next patch avoids clearing host SLB entries when a hash guest is=20
entered from a radix host, it doesn't apply to radix guests. Not sure
where the changelog for it went but it should have "HPT guests" in the
title at least, I guess.

> I'm OK with moving the SLB
> clearing from guest entry to guest exit, I guess, but I don't see that
> you are in fact fixing anything by doing so.

I can set slb entries in a radix guest in simulator and observe they=20
stay around over host<->guest transitions, and they don't after this
patch.

Thanks,
Nick
