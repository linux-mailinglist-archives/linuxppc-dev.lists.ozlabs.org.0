Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B2B94B705
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:00:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfdH60fh5z3fVN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:00:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdGk1RYhz3d8M
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:00:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WfdGZ54Sqz9sPd;
	Thu,  8 Aug 2024 09:00:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FF_P4QsPbfUQ; Thu,  8 Aug 2024 09:00:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WfdGZ4BYXz9rvV;
	Thu,  8 Aug 2024 09:00:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FC298B76C;
	Thu,  8 Aug 2024 09:00:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OS09V1Nd9zN9; Thu,  8 Aug 2024 09:00:22 +0200 (CEST)
Received: from [192.168.234.168] (unknown [192.168.234.168])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0259A8B763;
	Thu,  8 Aug 2024 09:00:21 +0200 (CEST)
Message-ID: <79fffe34-ce0b-4937-a85a-0ce566684887@csgroup.eu>
Date: Thu, 8 Aug 2024 09:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/ftrace: restore r2 to caller's stack on livepatch
 sibling call
To: Ryan Sullivan <rysulliv@redhat.com>, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20240724183321.9195-1-rysulliv@redhat.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240724183321.9195-1-rysulliv@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: pmladek@suse.com, joe.lawrence@redhat.com, jikos@kernel.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, mbenes@suse.cz, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/07/2024 à 20:33, Ryan Sullivan a écrit :
> [Vous ne recevez pas souvent de courriers de rysulliv@redhat.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Currently, on PowerPC machines, sibling calls in livepatched functions
> cause the stack to be corrupted and are thus not supported by tools
> such as kpatch. Below is an example stack frame showing one such
> currupted stacks:
> 
> RHEL-7.6: Linux 3.10.0 ppc64le
> 

...

> 
> This is caused by the toc stub generated on a sibling call:
> 

...

> 
> This patch restores r2 value to caller's stack, on a sibling call this
> will uncorrupt the caller's stack and otherwise will be redundant.

Be carefull. On powerpc/32, r2 contains the pointer to current struct. 
When I first read the subject of the patch I was puzzled.

You should say toc instead of r2, or make it explicit in the title that 
it is for powerpc/64

Christophe
