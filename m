Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E3D39F711
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 14:47:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzqkl3THRz3bvg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 22:47:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzqkL36fzz2yyG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 22:46:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FzqkB2cr1zBDc0;
 Tue,  8 Jun 2021 14:46:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5jIKldteYWR6; Tue,  8 Jun 2021 14:46:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FzqkB1jkszBDbW;
 Tue,  8 Jun 2021 14:46:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2BA768B7BB;
 Tue,  8 Jun 2021 14:46:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 71_pEKagHxiX; Tue,  8 Jun 2021 14:46:42 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F21F8B7A8;
 Tue,  8 Jun 2021 14:46:41 +0200 (CEST)
Subject: Re: [PATCH v2 00/12] powerpc: Cleanup use of 'struct ppc_inst'
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1621516826.git.christophe.leroy@csgroup.eu>
Message-ID: <e28c4639-00b3-6bf9-6c5e-72e251372cb4@csgroup.eu>
Date: Tue, 8 Jun 2021 14:46:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1621516826.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: jniethe5@gmail.com, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Le 20/05/2021 à 15:50, Christophe Leroy a écrit :
> This series is a cleanup of the use of 'struct ppc_inst'.
> 
> A confusion is made between internal representation of powerpc
> instructions with 'struct ppc_inst' and in-memory code which is
> and will always be an array of 'unsigned int'.
> 
> This series cleans it up.
> 
> First patch is fixing detection of missing '__user' flag by sparse
> when using get_user_instr().
> 
> Last part of the series does some source code cleanup in
> optprobes, it is put at the ends of this series because of
> clashes with the 'struct ppc_inst' cleanups.

What are your plans about this series ? I fear that the more we wait the more we get additional bad 
uses of 'struct ppc_inst'.
There are several people working around places that play with instructions, so I think the sooner it 
gets cleaned the better it is. Do you agree ?

Thanks
Christophe
