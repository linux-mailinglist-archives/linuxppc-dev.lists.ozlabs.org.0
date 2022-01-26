Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C6B49D418
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 22:05:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jkbpx1yk1z3cNB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:05:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=buttersideup.com header.i=@buttersideup.com header.a=rsa-sha256 header.s=2021022401 header.b=iReFAKfQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=buttersideup.com (client-ip=81.174.144.187;
 helo=ipv6test5.plus.com; envelope-from=tim@buttersideup.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=buttersideup.com header.i=@buttersideup.com
 header.a=rsa-sha256 header.s=2021022401 header.b=iReFAKfQ; 
 dkim-atps=neutral
X-Greylist: delayed 472 seconds by postgrey-1.36 at boromir;
 Thu, 27 Jan 2022 06:37:40 AEDT
Received: from ipv6test5.plus.com (ipv6test5.plus.com [81.174.144.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkYsJ1T1sz2xtw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 06:37:40 +1100 (AEDT)
Received: from [IPV6:2001:470:1b4a::e9a] (custard.lan
 [IPv6:2001:470:1b4a::e9a])
 by ipv6test5.plus.com (Postfix) with ESMTPSA id D46934970B1A;
 Wed, 26 Jan 2022 19:29:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buttersideup.com;
 s=2021022401; t=1643225380;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RuabK0xJIPI54XFQPZSBqYGVbq2/eb4MWWYfexa+gxI=;
 b=iReFAKfQbZ2BKXA0wUt7tIvHpcjXrOxnQzj5ifgGIa/DyFcQ/LPd8ESvnuCkgoreIsOkZW
 mCWE9sIy0A1ZcCOYswm8+3EcnhP/Q1jMi+3LgofqIbHCSBxOrdL5gp3sJ/jkmb5LRQL5Lo
 rJJByX4+UsP/KGtURc4BqjSZmx942T0=
Message-ID: <fa2149a4-83bf-58f9-1b9f-282c4afe0005@buttersideup.com>
Date: Wed, 26 Jan 2022 19:29:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] lib/raid6/test/Makefile: Use `$(pound)` instead of
 `\#` for Make 4.3
Content-Language: en-GB
To: Paul Menzel <pmenzel@molgen.mpg.de>, David Laight <David.Laight@ACULAB.COM>
References: <20220126114144.370517-1-pmenzel@molgen.mpg.de>
 <0214ae2639174812948a631ac4e142c8@AcuMS.aculab.com>
 <e2e25fc9-ff40-9183-6ca7-fab4708fa1d0@molgen.mpg.de>
From: Tim Small <tim@buttersideup.com>
In-Reply-To: <e2e25fc9-ff40-9183-6ca7-fab4708fa1d0@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 27 Jan 2022 08:04:49 +1100
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
Cc: linux-raid@vger.kernel.org, Song Liu <song@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Matt Brown <matthew.brown.dev@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/01/2022 12:12, Paul Menzel wrote:

> Sure, I can change that,

FWIW, the GNU Make documentation uses "Number signs" to refer to "#", 
and I think that may cause the least confusion across speakers of 
different dialects of English.

Tim.

