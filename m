Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF91444AF5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 23:56:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hl2FG5YRBz2ywQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 09:56:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hl2Dq5h0Jz2xXW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 09:55:55 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Hl2DZ1Cttz1rk5k;
 Wed,  3 Nov 2021 23:55:42 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Hl2DZ0c1Rz1qqkB;
 Wed,  3 Nov 2021 23:55:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id ObE2FVGvG9S8; Wed,  3 Nov 2021 23:55:41 +0100 (CET)
X-Auth-Info: 1/kPN/gfGPOdnEJhiUgZ+8yoDc4cRsfvq/jzWT0YGeqCi81xVvIrGpH0PIaHKkVA
Received: from igel.home (ppp-46-244-172-4.dynamic.mnet-online.de
 [46.244.172.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  3 Nov 2021 23:55:41 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 626242C0CFF; Wed,  3 Nov 2021 23:55:40 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Finn Thain <fthain@linux-m68k.org>
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
 <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
 <48c3ed15-2ecf-cc12-c287-2b61457f5fb__21333.0969143257$1635819996$gmane$org@nippy.intranet>
 <87cznh39lk.fsf@igel.home>
 <3723058-87f1-cba7-c8ad-ac8dc5722abe@linux-m68k.org>
X-Yow: Yow!  Did something bad happen or am I in a drive-in movie??
Date: Wed, 03 Nov 2021 23:55:40 +0100
In-Reply-To: <3723058-87f1-cba7-c8ad-ac8dc5722abe@linux-m68k.org> (Finn
 Thain's message of "Thu, 4 Nov 2021 09:26:10 +1100 (AEDT)")
Message-ID: <875yt826j7.fsf@igel.home>
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
Cc: "Christopher M. Riedl" <cmr@linux.ibm.com>,
 Stan Johnson <stanley.johnson.001@protonmail.com>,
 linuxppc-dev@lists.ozlabs.org, Riccardo Mottola <riccardo.mottola@libero.it>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Nov 04 2021, Finn Thain wrote:

> Does your Xorg installation use --enable-suid-wrapper, Andreas?

Doesn't look like.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
