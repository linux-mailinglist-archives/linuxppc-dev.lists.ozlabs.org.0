Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A119A40B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 05:59:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sXW7470CzDqyw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 14:58:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sXT8463wzDqwh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 14:57:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iILQn5JH; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48sXT72921z9sR4;
 Wed,  1 Apr 2020 14:57:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585713435;
 bh=fvngq1sPJ5YgLHIlPBXnLdcLFe4HkR6IPOe4OTs009s=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=iILQn5JHI0PvsDjCo4WKts5uA7KK28AWOr2iNvKu9vMJJV9nH3U+KEyAESBsi0FwX
 AKyAGYXx6atq/Q0HNXYAGe5zOTSaufX9larVlT4PiVRVFn41fcWzI1WmjKZuKFSs1H
 szgPHHD1xlpyhp4xfhAXSy4s61B21VgfJ1t9fqa38jCrmATkuoUzVoVp/jRqZmfLch
 VtVpAwbfuAk9m395civbtStIWFL2bzmb3X9vTOsgESX6UYDbKGUhlc8pk3h4+rOcC4
 1BPiJDDemgK4KY2BvBfy+iKVnCA0qegv3flaUsHCCQcCComJ+51R3Fgc0yNXlhBzFa
 NOt2RpQfENePQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: shivakanth k <shiva.jaishankar@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: Emulate ppc64le builds on x86/x64 machine
In-Reply-To: <CAMksNJXP5BKoS245igR2aNXVnf6Yvh_zXseyvg=Q7+h-0gavcQ@mail.gmail.com>
References: <CAMksNJXP5BKoS245igR2aNXVnf6Yvh_zXseyvg=Q7+h-0gavcQ@mail.gmail.com>
Date: Wed, 01 Apr 2020 14:57:24 +1100
Message-ID: <877dyzvowr.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

shivakanth k <shiva.jaishankar@gmail.com> writes:

> Hi ,
> Could you please help me to set up ppc64le 0n liunux machine

There's some instructions here:

https://github.com/linuxppc/wiki/wiki/Building-powerpc-kernels

cheers
