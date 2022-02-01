Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD214A5BDB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 13:06:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp3Yd304Vz3bYq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 23:06:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=lkcl.net header.i=@lkcl.net header.a=rsa-sha256 header.s=201607131 header.b=HRCrndLT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=lkcl.net (client-ip=2a00:1098:82:f::1;
 helo=libre-soc.org; envelope-from=prvs=0031aac83d=lkcl@lkcl.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=lkcl.net header.i=@lkcl.net
 header.a=rsa-sha256 header.s=201607131 header.b=HRCrndLT; 
 dkim-atps=neutral
Received: from libre-soc.org (libre-soc.org [IPv6:2a00:1098:82:f::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp3Y0259nz2yPm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 23:05:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
 References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nl2iv7RGCFVM9xUx8KeWfP7J+sKHNA+3BynLRkORNAU=; b=HRCrndLTgjEZwwFX8l6l3LquvA
 hZdJKrmrfA3dcqW7a5qqTI/cABQ03p/ZoRYLhnH36IfdwFGxctK8ZGtG8DKbpiaOosldHeYePqZ2L
 S8MwrisB6TJ9HguPsfwD7a/R3Gxog71kKD/m2aNzdIsyMza8hNfRHO3kt+t9io4mgxSw=;
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by libre-soc.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <lkcl@lkcl.net>) id 1nEruj-0006Ae-6r
 for linuxppc-dev@lists.ozlabs.org; Tue, 01 Feb 2022 12:05:37 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 g15-20020a9d6b0f000000b005a062b0dc12so15967045otp.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 04:05:36 -0800 (PST)
X-Gm-Message-State: AOAM532uewOlefspDZnpb/eVRPAjFfgBaUTJhui7PoPsBZxXjW8VzcCl
 Qr+UWdj0V0v2Tvm4SBKwu9ZCiBvyKD3Zn64Q4sE=
X-Google-Smtp-Source: ABdhPJxgSb8CEEMzPHjIg/OlTBptypW6Lfd51hbyLqG8kikBufwztAEr1yH6qcq+EXZdtyQPTZ07qo4n4ZnwTE0s7ak=
X-Received: by 2002:ab0:6215:: with SMTP id m21mr9585215uao.65.1643716778713; 
 Tue, 01 Feb 2022 03:59:38 -0800 (PST)
MIME-Version: 1.0
References: <CAPweEDw710zFK8KLZY5gsQxEkQKrDiFkNRgABY9HJZ1rxpeVCg@mail.gmail.com>
 <1643598916.2hjoqtw60c.astroid@bobo.none>
 <994E627C-0194-4634-8DBC-0845493E6744@gmail.com>
 <1643696448.f3llnvzeyb.astroid@bobo.none> <87o83qn6qd.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o83qn6qd.fsf@mpe.ellerman.id.au>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Tue, 1 Feb 2022 11:59:27 +0000
X-Gmail-Original-Message-ID: <CAPweEDz8BqP3JMRi3SzWcH9K7BuyQbJDeXn-sgJDH7ePJB6qew@mail.gmail.com>
Message-ID: <CAPweEDz8BqP3JMRi3SzWcH9K7BuyQbJDeXn-sgJDH7ePJB6qew@mail.gmail.com>
Subject: Re: microwatt booting linux-5.7 under verilator
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: openpower-hdl-cores
 <openpower-hdl-cores@mailinglist.openpowerfoundation.org>,
 Libre-Soc General Development <libre-soc-dev@lists.libre-soc.org>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 1, 2022 at 11:53 AM Michael Ellerman <mpe@ellerman.id.au> wrote:

> If you build with CONFIG_RELOCATABLE=y and CONFIG_RELOCATABLE_TEST=y the
> kernel will run wherever you load it (must be 64K aligned), without
> copying itself down to zero first. That will save you a few cycles.

ahh, thank you :)

l.
