Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD22F87C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 06:20:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Bwzj5b04zF3bX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 16:20:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="AwabfAw/"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BwxP51M3zDrJ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 16:18:00 +1100 (AEDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 61D1A214E0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 05:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573535878;
 bh=+sjdYVv8CDJT89mCUOL1IQ+FuBUStP5YIxV+BRhizMI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AwabfAw/3h3DTKe7ptAw21A+aiLqSS9Yxtb7Av60cvCyaX4JpmVRVRr8OsqAf4lNV
 QEz7Mq+KHshF2+zP6/N541Gce1O1w8RSqjiJso4xEz746D4OsJ0PWU9AL+EsC4yve/
 7mPCYSMKbwQdGzxYkXiLnR/LlvpOcRHS0co25vjo=
Received: by mail-qv1-f45.google.com with SMTP id f12so5909228qvu.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 21:17:58 -0800 (PST)
X-Gm-Message-State: APjAAAXXtzOAz9Fiv+CgFvitl5g5CfBqD4mkIbvIGuiq0V90OoLwqV+b
 3BylTtiP80FGq+B/t5oyL9wKW3kgQ4iMTb8Xscg=
X-Google-Smtp-Source: APXvYqyRMq8MPHBbv10LcomZfNYFYesotjA4C4S3ZUC/cErDRyyFxBF01/9DX6UFwCBG6keYQ/6e7NX4CI4hPzjyXJo=
X-Received: by 2002:ad4:462d:: with SMTP id x13mr7948364qvv.105.1573535877525; 
 Mon, 11 Nov 2019 21:17:57 -0800 (PST)
MIME-Version: 1.0
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-5-linux@rasmusvillemoes.dk>
In-Reply-To: <20191108130123.6839-5-linux@rasmusvillemoes.dk>
From: Timur Tabi <timur@kernel.org>
Date: Mon, 11 Nov 2019 23:17:19 -0600
X-Gmail-Original-Message-ID: <CAOZdJXU35+G5CMrS3247mgMjQH7__MxP8wpW6yjn1_MLD-sGqw@mail.gmail.com>
Message-ID: <CAOZdJXU35+G5CMrS3247mgMjQH7__MxP8wpW6yjn1_MLD-sGqw@mail.gmail.com>
Subject: Re: [PATCH v4 04/47] soc: fsl: qe: introduce qe_io{read,
 write}* wrappers
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
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
Cc: lkml <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 8, 2019 at 7:03 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> The QUICC engine drivers use the powerpc-specific out_be32() etc. In
> order to allow those drivers to build for other architectures, those
> must be replaced by iowrite32be(). However, on powerpc, out_be32() is
> a simple inline function while iowrite32be() is out-of-line. So in
> order not to introduce a performance regression on powerpc when making
> the drivers work on other architectures, introduce qe_io* helpers.

Isn't it also true that iowrite32be() assumes a little-endian platform
and always does a byte swap?
