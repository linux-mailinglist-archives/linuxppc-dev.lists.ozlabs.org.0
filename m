Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3284447EB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 19:08:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hkvrj0P23z2yZt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 05:08:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
X-Greylist: delayed 411 seconds by postgrey-1.36 at boromir;
 Thu, 04 Nov 2021 05:07:39 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkvrC2Sqrz2xBx
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 05:07:38 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Hkvh91D9vz1qwH4;
 Wed,  3 Nov 2021 19:00:41 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Hkvh90hDVz1qqkJ;
 Wed,  3 Nov 2021 19:00:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id rbHPHfyVOdeV; Wed,  3 Nov 2021 19:00:40 +0100 (CET)
X-Auth-Info: Rhg4tcukREDcGWTT1dcSoVRACLjvHFiHKvFs4+W11sECoukhHBeyyZumnJsIfZWU
Received: from igel.home (ppp-46-244-172-4.dynamic.mnet-online.de
 [46.244.172.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  3 Nov 2021 19:00:40 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 7B2052C0F33; Wed,  3 Nov 2021 09:51:51 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Finn Thain <fthain@linux-m68k.org>
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
 <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
 <48c3ed15-2ecf-cc12-c287-2b61457f5fb__21333.0969143257$1635819996$gmane$org@nippy.intranet>
X-Yow: I love ROCK 'N ROLL!  I memorized the all WORDS to ``WIPE-OUT'' in
 1965!!
Date: Wed, 03 Nov 2021 09:51:51 +0100
In-Reply-To: <48c3ed15-2ecf-cc12-c287-2b61457f5fb__21333.0969143257$1635819996$gmane$org@nippy.intranet>
 (Finn Thain's message of "Tue, 2 Nov 2021 13:20:21 +1100 (AEDT)")
Message-ID: <87cznh39lk.fsf@igel.home>
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

On Nov 02 2021, Finn Thain wrote:

> After many builds and tests, Stan and I were able to determine that this 
> regression only affects builds with CONFIG_USER_NS=y. That is,
>
> d3ccc9781560  + CONFIG_USER_NS=y  -->  fail
> d3ccc9781560  + CONFIG_USER_NS=n  -->  okay
> d3ccc9781560~ + CONFIG_USER_NS=y  -->  okay
> d3ccc9781560~ + CONFIG_USER_NS=n  -->  okay

On my iBook G4, X is working alright with 5.15 and CONFIG_USER_NS=y.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
