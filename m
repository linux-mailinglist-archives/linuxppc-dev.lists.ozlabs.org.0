Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF881CA0E2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 04:28:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JDlK2gXwzDqw1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 12:28:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=STORK5wU; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JDjh0qrXzDqqW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 12:26:47 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id m13so291703otf.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 19:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A1osOVPMQoaAhfv8QCWgEvBktlfbGbhiTJKk4iQtpcQ=;
 b=STORK5wUHG40OXp0aFe0UEfQEUFiN/nLc61glw18YdYVgInN7Tnfysgh7pZ0511PGo
 mhnIrxu2q3YjTmMaQ8urLafGvKZfLdq84OP3dMi28LdSwU3UADbhJmkQIaRxJl6jit1R
 Q0rSlO//TNs4qaLe6kx8lsqa9f8yy/80ulvxrc6Yj/CJ1IfZykL6Tl9bQEo31zfiJIEx
 BMv+KLoQK22B3G9+9u+2X9yQyGKhtlI3TNJfkofsqTP430aG+9wPhwlFHYNUVRB2A+Bd
 LNKUTdRz2ZEjL1hS/hglFCyfuJHuPDMQ3qntmGadp2eT/HCT6H8S4ghAEnQssO0wRcuT
 yM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A1osOVPMQoaAhfv8QCWgEvBktlfbGbhiTJKk4iQtpcQ=;
 b=oWcYdNBovifyBsSoTTpiYhOe/ouL3Ql2PtyjLKOe2kRB8TiwFwQ3ctb4DjfHfYzsIY
 et0DtL6yMil17mXI3+DtmVwJDb3HNPGhd57YlJSh9i0D3axrQOJMPVf35IDJnXj8Bpls
 9+nM3J2z+r0hbcv1cEmrHU+oMfn76/6+QyjjxPVnWavemLPIOiUIiiRqgAYE0jcqdg9P
 Kh7ZwSVr8xL6OhHRSLvGf0LKK5P0thtNdzNzv5WHLKgc94mncaIlBvwBw+Vn7qFwXbiP
 G/RTyHhnCNmJDnlque04FdkXMrG2TApD3rwxxPSoEyQpVZd4o8VAioDEBWaPob+ehC0W
 btWA==
X-Gm-Message-State: AGi0PuYfeU5+mFSR+881lZ0CKSTZf+FgQf58RWlnI7G2wCvo6c0OG2Nt
 Z4BwlH85xw4MB9kFolbtbUQg/WgsOoCKCnv90pkT7LE2g1Y=
X-Google-Smtp-Source: APiQypLlK/BupZNGpwTCRK2Hw/smSXJr5l9rGovYHTNIHEVot7EU457Yb4Q4hb1ckQj/sZsPX8XeanxXveLoeKEl1oM=
X-Received: by 2002:a9d:bd1:: with SMTP id 75mr358875oth.155.1588904804862;
 Thu, 07 May 2020 19:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-23-jniethe5@gmail.com>
In-Reply-To: <20200506034050.24806-23-jniethe5@gmail.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Fri, 8 May 2020 12:26:33 +1000
Message-ID: <CACzsE9p4RosZ87M62dSm0GYw07GP9gxst08dHTwzAg5v9dFMqQ@mail.gmail.com>
Subject: Re: [PATCH v8 22/30] powerpc: Define new SRR1 bits for a future ISA
 version
To: linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 naveen.n.rao@linux.vnet.ibm.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi mpe,
Could you please take some changes for the commit message.
In the patch title
s/a future ISA version/ISA v3.1/

On Wed, May 6, 2020 at 1:47 PM Jordan Niethe <jniethe5@gmail.com> wrote:
>
> Add the BOUNDARY SRR1 bit definition for when the cause of an alignment
> exception is a prefixed instruction that crosses a 64-byte boundary.
> Add the PREFIXED SRR1 bit definition for exceptions caused by prefixed
> instructions.
>
> Bit 35 of SRR1 is called SRR1_ISI_N_OR_G. This name comes from it being
> used to indicate that an ISI was due to the access being no-exec or
> guarded. A future ISA version adds another purpose. It is also set if

s/A future ISA version/ISA v3.1/

> there is an access in a cache-inhibited location for prefixed
> instruction.  Rename from SRR1_ISI_N_OR_G to SRR1_ISI_N_G_OR_CIP.
>
> Reviewed-by: Alistair Popple <alistair@popple.id.au>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: Combined all the commits concerning SRR1 bits.
> ---
