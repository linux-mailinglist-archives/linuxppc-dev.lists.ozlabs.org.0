Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EAE354570
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 18:40:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDbxy0cJyz3brt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 02:40:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDbxc1dLdz2ywx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 02:40:33 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FDbxV0KV8z1s46c;
 Mon,  5 Apr 2021 18:40:29 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FDbxT3Vk9z1r1M2;
 Mon,  5 Apr 2021 18:40:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id DtCZL59VxmFl; Mon,  5 Apr 2021 18:40:28 +0200 (CEST)
X-Auth-Info: 6z9h5zfqjJcYWgfpdghFMrzk3A4Z23EfS8t6aq5TlIMwckKnIj5ELFwDdws2ilIh
Received: from igel.home (ppp-46-244-166-194.dynamic.mnet-online.de
 [46.244.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  5 Apr 2021 18:40:28 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id E6E382C36A5; Mon,  5 Apr 2021 18:40:27 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: power4 nap fixup in C
References: <20210312012044.3660743-1-npiggin@gmail.com>
 <87y2e6fu7v.fsf__9754.75274478725$1616992871$gmane$org@mpe.ellerman.id.au>
 <87v99aj7tr.fsf__47134.2879392736$1617031867$gmane$org@igel.home>
 <87r1jyj5e1.fsf@igel.home> <1617262357.w4yq2kiecw.astroid@bobo.none>
 <1617627247.3cjpyzcob4.astroid@bobo.none>
X-Yow: Leona, I want to CONFESS things to you..
 I want to WRAP you in a SCARLET ROBE trimmed with POLYVINYL CHLORIDE..
 I want to EMPTY your ASHTRAYS...
Date: Mon, 05 Apr 2021 18:40:27 +0200
In-Reply-To: <1617627247.3cjpyzcob4.astroid@bobo.none> (Nicholas Piggin's
 message of "Mon, 05 Apr 2021 22:56:31 +1000")
Message-ID: <87pmz8d6ro.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Apr 05 2021, Nicholas Piggin wrote:

> I worked it out. There was a window where it could take another 
> interrupt before the first one adjusts the nip.
>
> I managed to trigger it in qemu and this version fixed it.

Works for me as well.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
