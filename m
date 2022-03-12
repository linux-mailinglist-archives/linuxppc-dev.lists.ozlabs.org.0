Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD2C4D6E2B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 11:31:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFzcl6fjRz3bsT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 21:31:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFzbb3Zxfz2yxV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 21:30:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KFzbV61prz4xLY;
 Sat, 12 Mar 2022 21:30:46 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: jing yangyang <cgel.zte@gmail.com>, Geoff Levand <geoff@infradead.org>
In-Reply-To: <01647102607ce9640c9f27786d976109a3c4ea7e.1629197153.git.jing.yangyang@zte.com.cn>
References: <01647102607ce9640c9f27786d976109a3c4ea7e.1629197153.git.jing.yangyang@zte.com.cn>
Subject: Re: [PATCH linux-next] ps3: remove unneeded semicolon
Message-Id: <164708098933.827774.6685079426471019476.b4-ty@ellerman.id.au>
Date: Sat, 12 Mar 2022 21:29:49 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: jing yangyang <jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 Aug 2021 19:49:01 -0700, jing yangyang wrote:
> Eliminate the following coccicheck warning:
> 
> ./arch/powerpc/platforms/ps3/system-bus.c:606:2-3: Unneeded semicolon
> ./arch/powerpc/platforms/ps3/system-bus.c:765:2-3: Unneeded semicolon
> 
> 

Applied to powerpc/next.

[1/1] ps3: remove unneeded semicolon
      https://git.kernel.org/powerpc/c/9f5196065eeb96fee1a15f2eae31fe1fc7623ade

cheers
