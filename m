Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7445A4C1286
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 13:13:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Zgz64ryz3bb0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 23:13:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3Zgb24rCz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 23:13:13 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K3ZgV6HjGz9sSg;
 Wed, 23 Feb 2022 13:13:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZzUVXXyVezj; Wed, 23 Feb 2022 13:13:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K3ZgV5Y7wz9sSZ;
 Wed, 23 Feb 2022 13:13:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B037E8B778;
 Wed, 23 Feb 2022 13:13:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rk39Sk2aK3bV; Wed, 23 Feb 2022 13:13:10 +0100 (CET)
Received: from [192.168.7.201] (unknown [192.168.7.201])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4ED8F8B763;
 Wed, 23 Feb 2022 13:13:10 +0100 (CET)
Message-ID: <2c2b0f65-38bd-d7b8-b146-0daf96b03559@csgroup.eu>
Date: Wed, 23 Feb 2022 13:13:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/7] ftrace: Expose flags used for ftrace_replace_code()
Content-Language: fr-FR
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
References: <cover.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
 <51cba452b38ae55049bd15b0aeac6060cc1105f2.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <51cba452b38ae55049bd15b0aeac6060cc1105f2.1561634177.git.naveen.n.rao@linux.vnet.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/06/2019 à 13:23, Naveen N. Rao a écrit :
> Since ftrace_replace_code() is a __weak function and can be overridden,
> we need to expose the flags that can be set. So, move the flags enum to
> the header file.
> 
> Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

This series does apply anymore.

We have a link to it in https://github.com/linuxppc/issues/issues/386

I'll flag it "change requested"

Christophe
