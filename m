Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EC4218A6C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 16:50:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B22K22qqtzDqdM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 00:49:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=compudj@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=ceRc8dnF; dkim-atps=neutral
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B22Cd1w54zDqWS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 00:45:16 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 7E1261B620E;
 Wed,  8 Jul 2020 10:45:13 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Et16AzUfdKBt; Wed,  8 Jul 2020 10:45:13 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 54EE11B5F4B;
 Wed,  8 Jul 2020 10:45:13 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 54EE11B5F4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1594219513;
 bh=SHut1EIp+ELt3B/h+9ybKH0lxKyV695z/1ZHRom0nLs=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ceRc8dnFJdzCaBbyosfCmjVeDRK7SdhnMeTKjClPV63x4les66JXU1GQNy7+AOKOX
 UUUvFXpoYDVl9AmncqWxL+huG3Q+gh4b1DnT+FN2ZSlkq7m2lzsxJh3luqvczyOLrY
 uIv+5AKi6O96A1yR2RhXnux2J/XwvTx3/pWX8HL159L20IvZx4d+BnTKYrlTuBndJ0
 IuFGoRBvkSFumwLrlcgaW+aeCFdcUKGynmrxh2fzqvSef45TMzdFWHfsRhUQR3U+WF
 uSsMpMYs8SKBQM960OVENYb6HrrSa7uK1U0hv7lLtNdSr6t1iddJYf29IJiaVGq/y5
 X/eESI7088GcQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id iWFdNSxASxig; Wed,  8 Jul 2020 10:45:13 -0400 (EDT)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
 by mail.efficios.com (Postfix) with ESMTP id 4C6071B6037;
 Wed,  8 Jul 2020 10:45:13 -0400 (EDT)
Date: Wed, 8 Jul 2020 10:45:13 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>
Message-ID: <873469922.2744.1594219513228.JavaMail.zimbra@efficios.com>
Subject: powerpc: Incorrect stw operand modifier in __set_pte_at
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_3955 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Index: ZxAKM7+GNRds2BqvHRzx1uNzHAoNkg==
Thread-Topic: powerpc: Incorrect stw operand modifier in __set_pte_at
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Reviewing use of the patterns "Un%Xn" with lwz and stw instructions
(where n should be the operand number) within the Linux kernel led
me to spot those 2 weird cases:

arch/powerpc/include/asm/nohash/pgtable.h:__set_pte_at()

                __asm__ __volatile__("\
                        stw%U0%X0 %2,%0\n\
                        eieio\n\
                        stw%U0%X0 %L2,%1"
                : "=m" (*ptep), "=m" (*((unsigned char *)ptep+4))
                : "r" (pte) : "memory");

I would have expected the stw to be:

                        stw%U1%X1 %L2,%1"

and:
arch/powerpc/include/asm/book3s/32/pgtable.h:__set_pte_at()

        __asm__ __volatile__("\
                stw%U0%X0 %2,%0\n\
                eieio\n\
                stw%U0%X0 %L2,%1"
        : "=m" (*ptep), "=m" (*((unsigned char *)ptep+4))
        : "r" (pte) : "memory");

where I would have expected:

                stw%U1%X1 %L2,%1"

Is it a bug or am I missing something ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
