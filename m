Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6332A635A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 12:32:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR4JH6ZWhzDqNx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 22:32:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR4CG3YgXzDq9s
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 22:28:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CR4CF3tW4z8tVh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 22:28:09 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CR4CF1h89z9sVN; Wed,  4 Nov 2020 22:28:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=2001:a60:0:28:0:1:25:1;
 helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at bilbo;
 Wed, 04 Nov 2020 22:28:08 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CR4CD2vK6z9sVK
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Nov 2020 22:28:06 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CR42k54qMz1rwml;
 Wed,  4 Nov 2020 12:20:46 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CR42k3sCxz1qwll;
 Wed,  4 Nov 2020 12:20:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id wT3JsyRxCWWr; Wed,  4 Nov 2020 12:20:45 +0100 (CET)
X-Auth-Info: yCs6fd9Tu6vBgr465Kh7BESvaqTg94lsNqVy6DgZ75COoJ5OxtBaw0gsscDBJ0jV
Received: from igel.home (ppp-46-244-174-110.dynamic.mnet-online.de
 [46.244.174.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  4 Nov 2020 12:20:45 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 4F9A62C0A59; Wed,  4 Nov 2020 12:20:45 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Use asm_goto_volatile for put_user()
References: <20201104111742.672142-1-mpe@ellerman.id.au>
X-Yow: Thank god!!..  It's HENNY YOUNGMAN!!
Date: Wed, 04 Nov 2020 12:20:45 +0100
In-Reply-To: <20201104111742.672142-1-mpe@ellerman.id.au> (Michael Ellerman's
 message of "Wed, 4 Nov 2020 22:17:42 +1100")
Message-ID: <87a6vxid0y.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With that patch the kernel is working again.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
