Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B78BB31183D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 03:32:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXbsQ3V6GzDrVW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 13:32:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rtRAOrV2; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXbqp2xmlzDwg3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 13:30:45 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id o21so4427791pgn.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Feb 2021 18:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=3Fi8z3aDMK6SLGRFmW7/sd7tkTtOagycLE2d1dIDY6o=;
 b=rtRAOrV2nEwgcUNM8Bgzcw57M4vJGgkUG3PJgKWP1L/JR1szJU+EcKSvOLLf+aWKL0
 y7w4Ye1x61LIY1dsjUXHTMyjIN717p7guDykyWRE4n+4YFmRUX9XWf4q4JzjJJYBEwsB
 DrNOVtf1p4KRGkREu2b63Y7oZLer+yOdoGTnTVPH8lbhHk2YRh3SNavst23rynPd9gBz
 exFrm5GQ6JPEQBA0GnKvLd1T/VMjr8LlgZv5f8gRV/1mC1lsXNRUfEB2HEdR296toA88
 p5QBEeF0A1iTtuGF+17SQM1dQ4xhTjh7PbPCWM1HWWF8Px08J2w7PvOmLriJi8vzeOZg
 mDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=3Fi8z3aDMK6SLGRFmW7/sd7tkTtOagycLE2d1dIDY6o=;
 b=qLVTPiqpW9iojKpNNZfqZxcxI6LbOdxaiBpqiRIUN7Qa6f9hxdfwtv8ijAb1s1hrDU
 jBxShUV7njGnE71gjUpbGwIayTmVOVqkIBYUP7tq3j3A2PNOK1cDeb6qkeAwUgMZHLZS
 pxpkguSHmIj8Df2WTjDIz/+ipfSrfM2JpsxC+ytKYdnEau67rBdeQlatwgBxaz0gZtOv
 925k8voP0oxDNBHMJy5s0IVahKVLxiGuEuf28ofQqUDg63jeut61gOhyK13zJ4sHcZJh
 3cDD8VqyO+vDz3AyoJk4PGLjOkrAk0AezvrftIC165tjEWcwLZGzCfGaQkriY4nwYeks
 uoag==
X-Gm-Message-State: AOAM532IPu3IY2lzHdbFa1PQxyYxrJZ+O434S9nwDW23YcpkfkumQJjM
 y18TbfoQN1LhUJ4pWZtOSDc=
X-Google-Smtp-Source: ABdhPJzDGa3wDnCUkAanIdz0B9tGf5GQ/noqhwonPNUk2tdsE1R02jIiz7q+ZxsBl5i6u1W9CUjWtw==
X-Received: by 2002:a62:7650:0:b029:1bb:aa42:aa96 with SMTP id
 r77-20020a6276500000b02901bbaa42aa96mr7240915pfc.33.1612578641762; 
 Fri, 05 Feb 2021 18:30:41 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id z27sm6358444pff.124.2021.02.05.18.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 18:30:41 -0800 (PST)
Date: Sat, 06 Feb 2021 12:30:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/8xx: Fix software emulation interrupt
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <ad782af87a222efc79cfb06079b0fd23d4224eaf.1612515180.git.christophe.leroy@csgroup.eu>
In-Reply-To: <ad782af87a222efc79cfb06079b0fd23d4224eaf.1612515180.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612578497.zykn0q97ns.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 5, 2021 6:56 pm:
> For unimplemented instructions or unimplemented SPRs, the 8xx triggers
> a "Software Emulation Exception" (0x1000). That interrupt doesn't set
> reason bits in SRR1 as the "Program Check Exception" does.
>=20
> Go through emulation_assist_interrupt() to set REASON_ILLEGAL.
>=20
> Fixes: fbbcc3bb139e ("powerpc/8xx: Remove SoftwareEmulation()")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> I'm wondering whether it wouldn't be better to set REASON_ILLEGAL
> in the exception prolog and still call program_check_exception.
> And do the same in book3s/64 to avoid the nightmare of an
> INTERRUPT_HANDLER calling another INTERRUPT_HANDLER.

Hmm, I missed this. We just change program_check_exception to
a common function which is called by both.

Thanks,
Nick

