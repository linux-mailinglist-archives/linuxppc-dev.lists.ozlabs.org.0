Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70364641F0B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 20:00:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQGGV4mZMz3bhJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 06:00:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LGvHERI6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LGvHERI6;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQGFX2NQLz2yxB
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 05:59:42 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id c66so6764107edf.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Dec 2022 10:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UWFacJGvShq0MLP6hc6MDufkupxByDzBx9Z7939niQ0=;
        b=LGvHERI6oyWwiCHULvH6sMEOSMhMXAN8vdxVZtzn4tnVQT2jXbF1aDKMhHjgOuz1k/
         pPR2sTh9q887dXIswwY3uGp1YA5p8rA9I48j+CeKgUq9Sr9lhsXVQBeCC8nQjK065y/b
         ktMEWuNc8pMWW+YeeFBlp1OPHjfW/iUIuLMBgAyc5zzvwev9qq0Per1/lVNlHVUArojs
         MbhFv/uq2GMD34aPqVzPb0tv4FNUOfPfIw7EdTpEJAt+gwa03v4YH4QY03coOwUb+YG7
         m+QPkcF5XR4M4nV2TYPv/BW9/ayofL0I3dTQj5pdCwl5fvhWzpKUdsy7DUxvzOLRv7z1
         hYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWFacJGvShq0MLP6hc6MDufkupxByDzBx9Z7939niQ0=;
        b=1usKrfk7u2rSFX7rlTgkTHNYAseychBfe1PASNl3BTU8BZ2I4YHdOEk9xx85PUlDQK
         mLAGDsnp7f5XgEEsdSuLZhlrR4DoLCGew6JceAFriRhJ5vcIbQv/gyAI8MxcZ71E64Y5
         zrHv50Oi4a4out9suqlvya9EChiqnSRl4wTVwXLXXE77//lYHQenU3I7+h8qqZzmhOqk
         MjFoVdgc+TFpPHzkTEceSMI5uG6qW+XW7qAPJbzWDZJd6y1ZAUshRWXKwMSeU7lPT/kQ
         nyPx4fzJ9FzjhwuYf7Qyvwxq1giQD/bbCUWKP8ZVgO9wbjb1rlddNUNnQxWtJdgBOE0V
         q87w==
X-Gm-Message-State: ANoB5pklXJnphcssoH+67gUcCgpQo4+Sd8M1XG5uul0bYqelSNsViI3y
	UJj6reOpFDyk+92t7818CFs=
X-Google-Smtp-Source: AA0mqf66vAKaq7DgWJVMxS61oXNDXn2p4ix9hDG7xu+24V4eKMbZP+QyHUC46ZpvsFrwMxwzBFs+OA==
X-Received: by 2002:aa7:c0c7:0:b0:46c:8142:3873 with SMTP id j7-20020aa7c0c7000000b0046c81423873mr4393459edp.428.1670180375069;
        Sun, 04 Dec 2022 10:59:35 -0800 (PST)
Received: from skbuf ([188.26.184.215])
        by smtp.gmail.com with ESMTPSA id z3-20020a170906240300b007aef930360asm5456794eja.59.2022.12.04.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:59:34 -0800 (PST)
Date: Sun, 4 Dec 2022 20:59:24 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH 5/5] powerpc: dts: remove label = "cpu" from DSA
 dt-binding
Message-ID: <20221204185924.a4q6cifhpyxaur6f@skbuf>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
 <20221130141040.32447-6-arinc.unal@arinc9.com>
 <87a647s8zg.fsf@mpe.ellerman.id.au>
 <20221201173902.zrtpeq4mkk3i3vpk@pali>
 <20221201234400.GA1692656-robh@kernel.org>
 <20221202193552.vehqk6u53n36zxwl@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202193552.vehqk6u53n36zxwl@pali>
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
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, netdev@vger.kernel.org, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pali,

On Fri, Dec 02, 2022 at 08:35:52PM +0100, Pali Roh�r wrote:
> On Thursday 01 December 2022 17:44:00 Rob Herring wrote:
> > On Thu, Dec 01, 2022 at 06:39:02PM +0100, Pali Roh�r wrote:
> > > I was told by Marek (CCed) that DSA port connected to CPU should have
> > > label "cpu" and not "cpu<number>". Modern way for specifying CPU port is
> > > by defining reference to network device, which there is already (&enet1
> > > and &enet0). So that change just "fixed" incorrect naming cpu0 and cpu1.
> > > 
> > > So probably linux kernel does not need label = "cpu" in DTS anymore. But
> > > this is not the reason to remove this property. Linux kernel does not
> > > use lot of other nodes and properties too... Device tree should describe
> > > hardware and not its usage in Linux. "label" property is valid in device
> > > tree and it exactly describes what or where is this node connected. And
> > > it may be used for other systems.
> > > 
> > > So I do not see a point in removing "label" properties from turris1x.dts
> > > file, nor from any other dts file.
> > 
> > Well, it seems like a bit of an abuse of 'label' to me. 'label' should 
> > be aligned with a sticker or other identifier identifying something to a 
> > human. Software should never care what the value of 'label' is.
> 
> But it already does. "label" property is used for setting (initial)
> network interface name for DSA drivers. And you can try to call e.g.
> git grep '"cpu"' net/dsa drivers/net/dsa to see that cpu is still
> present on some dsa places (probably relict or backward compatibility
> before eth reference).

Can you try to eliminate the word "probably" from the information you
transmit and be specific about when did the DSA binding parse or require
the 'label = "cpu"' property for CPU ports in any way?
