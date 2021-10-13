Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F90142BED3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 13:21:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTqpq4qX8z30Bl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 22:21:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTqpK3K4Pz2yPs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 22:20:39 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HTqpC28Spz9sSP;
 Wed, 13 Oct 2021 13:20:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZcpVFyhFd8g; Wed, 13 Oct 2021 13:20:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HTqpC0fNwz9sSN;
 Wed, 13 Oct 2021 13:20:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EE53D8B77E;
 Wed, 13 Oct 2021 13:20:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3nizRho4O5jm; Wed, 13 Oct 2021 13:20:34 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B49778B763;
 Wed, 13 Oct 2021 13:20:34 +0200 (CEST)
Subject: Re: [PATCH v1 06/10] asm-generic: Refactor
 dereference_[kernel]_function_descriptor()
To: Kees Cook <keescook@chromium.org>, Helge Deller <deller@gmx.de>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <c215b244a19a07327ec81bf99f3c5f89c68af7b4.1633964380.git.christophe.leroy@csgroup.eu>
 <202110130002.A7C0A86@keescook>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c2904a2e-c112-f2bc-04a0-52b08b46c1ce@csgroup.eu>
Date: Wed, 13 Oct 2021 13:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202110130002.A7C0A86@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/10/2021 à 09:02, Kees Cook a écrit :
> On Mon, Oct 11, 2021 at 05:25:33PM +0200, Christophe Leroy wrote:
>> dereference_function_descriptor() and
>> dereference_kernel_function_descriptor() are identical on the
>> three architectures implementing them.
>>
>> Make it common.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/ia64/include/asm/sections.h    | 19 -------------------
>>   arch/parisc/include/asm/sections.h  |  9 ---------
>>   arch/parisc/kernel/process.c        | 21 ---------------------
>>   arch/powerpc/include/asm/sections.h | 23 -----------------------
>>   include/asm-generic/sections.h      | 18 ++++++++++++++++++
>>   5 files changed, 18 insertions(+), 72 deletions(-)
> 
> A diffstat to love. :)
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>

Unless somebody minds, I will make them out of line as
suggested by Helge in he's comment to patch 4.

Allthough there is no spectacular size reduction, the functions
are not worth being inlined as they are not used in critical pathes.
