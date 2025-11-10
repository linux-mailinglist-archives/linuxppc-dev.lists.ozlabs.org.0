Return-Path: <linuxppc-dev+bounces-14008-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A28AC46609
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 12:50:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4nzd0KYLz2xqZ;
	Mon, 10 Nov 2025 22:50:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762775436;
	cv=none; b=Ue1lvgjBN5yh7rfwmOdoi61ho6tvkmfhrXogGKqY1ecJLEVnl4b45060IN7CXYOSnwJp1EIHXKC7x6kyBBoGZNp0JhEAygWX+GUZiAyj+odz3emTGO4VVgUU9sFfe/6pe5LfPk8q9FpxQucig71ffm+wpNlibKYfHKr00MYVETuJxV/I+GLNGtFCCu881njNFbKE1sYrosa7SNsSKeCFtuxzWjwBNyGt13khg3XfaykQwvCp1JIOBxR6chPUQRHbP9+uCUM+wPrTlPhfbM8rI3yx4e2RKNhmEDZDa4m16hM2DQ3gpqpXWD3GQS3AzEbGS2Fc082WWieLVlUn9CZ4WA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762775436; c=relaxed/relaxed;
	bh=nNFahur7RfWuwFZozuYxzup7bFaGQ4eo/xpPhbKkX9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNbNWa1MzXfOw1sbvetGm6udfPYnoSfH5eK/GvXiPpifSIVEuhGiyoGFSjTOsM+HcFr+O2qPv6DxUBxnaY3OjDGlHl/VbJ1Zme2DJinH1f9vSBqY6AMIYYAYjdTaGIuAmYjJas9ckSAXrF7Dm2Mm/rsWFxpjcXJYpKMQas+GcX/HCW5cvPcr7qMePEfSUafCC2TxCJcHsOUCiA7GzMuIEaZqYUfRJ0aIH7S+XegqI20+A3G49ZSw7yHkdKGhWTUCy/DNhxeABcmhOQLAVlRjV5nHqP7jn5ZkWAcgXek1W4Aeq/RAZ5YhIubN4HlPyYNsPKRbptpQBUGCMtzrNA/bBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4nzb5ZGhz2xFT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 22:50:34 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d4nbl2pTqz9sSS;
	Mon, 10 Nov 2025 12:33:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ju2cuXQ6JEfZ; Mon, 10 Nov 2025 12:33:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d4nbl0zrcz9sSR;
	Mon, 10 Nov 2025 12:33:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DFE738B764;
	Mon, 10 Nov 2025 12:33:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ioscGiQ2gGqe; Mon, 10 Nov 2025 12:33:22 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A62D8B763;
	Mon, 10 Nov 2025 12:33:22 +0100 (CET)
Message-ID: <d2e51443-49dd-445a-88aa-f29d7b777bce@csgroup.eu>
Date: Mon, 10 Nov 2025 12:33:22 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] powerpc/tools: drop `-o pipefail` in gcc check
 scripts
To: Jan Stancek <jstancek@redhat.com>,
 Justin Forbes <jforbes@fedoraproject.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, linux-kernel@vger.kernel.org, joe.lawrence@redhat.com
References: <cc6cdd116c3ad9d990df21f13c6d8e8a83815bbd.1758641374.git.jstancek@redhat.com>
 <CAFxkdApQVEqCjQMAUqy8cuKnMy8GY9j+brgPZBkxCpeGi5xHxA@mail.gmail.com>
 <CAASaF6zvFa-mPaPfKnBcerfVBkDt5B3TEn7P9jjAfentqSNmxQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CAASaF6zvFa-mPaPfKnBcerfVBkDt5B3TEn7P9jjAfentqSNmxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 30/10/2025 à 19:09, Jan Stancek a écrit :
> On Mon, Oct 6, 2025 at 10:19 PM Justin Forbes <jforbes@fedoraproject.org> wrote:
>>
>> On Tue, Sep 23, 2025 at 9:31 AM Jan Stancek <jstancek@redhat.com> wrote:
>>>
>>> We've been observing rare non-deterministic kconfig failures during
>>> olddefconfig, where ARCH_USING_PATCHABLE_FUNCTION_ENTRY was getting
>>> disabled and with it number of other config options that depend on it.
>>>
>>> The reason is that gcc-check-fpatchable-function-entry.sh can fail
>>> if `grep -q` (or scripts/dummy-tools/gcc) is fast enough to exit while
>>> there is still someone writing on other side of pipe. `pipefail`
>>> propagates that error up to kconfig.
>>>
>>> This can be seen for example with:
>>>    # (set -e; set -o pipefail; yes | grep -q y); echo $?
>>>    141
>>>
>>> or by running the actual check script in loop extensively:
>>>    ----------------------------- 8< -------------------------------
>>>    function kconfig()
>>>    {
>>>      for i in `seq 1 100`; do
>>>        arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh \
>>>          ./scripts/dummy-tools/gcc -mlittle-endian \
>>>          || { echo "Oops"; exit 1; }
>>>      done
>>>    }
>>>
>>>    for ((i=0; i<$(nproc); i++)); do kconfig & done
>>>    wait; echo "Done"
>>>    ----------------------------- >8 -------------------------------
>>>
>>> Fixes: 0f71dcfb4aef ("powerpc/ftrace: Add support for -fpatchable-function-entry")
>>> Fixes: b71c9ffb1405 ("powerpc: Add arch/powerpc/tools directory")
>>> Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
>>> Acked-by: Joe Lawrence <joe.lawrence@redhat.com>
>>> Signed-off-by: Jan Stancek <jstancek@redhat.com>
>>> ---
>>>   arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh | 1 -
>>>   arch/powerpc/tools/gcc-check-mprofile-kernel.sh           | 1 -
>>>   2 files changed, 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
>>> index 06706903503b..baed467a016b 100755
>>> --- a/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
>>> +++ b/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
>>> @@ -2,7 +2,6 @@
>>>   # SPDX-License-Identifier: GPL-2.0
>>>
>>>   set -e
>>> -set -o pipefail
>>>
>>>   # To debug, uncomment the following line
>>>   # set -x
>>> diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
>>> index 73e331e7660e..6193b0ed0c77 100755
>>> --- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
>>> +++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
>>> @@ -2,7 +2,6 @@
>>>   # SPDX-License-Identifier: GPL-2.0
>>>
>>>   set -e
>>> -set -o pipefail
>>>
>>>   # To debug, uncomment the following line
>>>   # set -x
>>> --
>>> 2.47.1
>>
>> Would love to see this picked up, it fixes a problem we have run into
>> with our CI.
>>
>> Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>
> 
> Thanks Justin.
> 
> Would any maintainers also care to review? Ty.
> 

Is the problem only with those scripts ? I see other scripts using 
pipefail in the kernel:

arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh:set -o pipefail
arch/powerpc/tools/gcc-check-mprofile-kernel.sh:set -o pipefail
drivers/gpu/drm/ci/dt-binding-check.sh:set -euxo pipefail
drivers/gpu/drm/ci/dtbs-check.sh:set -euxo pipefail
drivers/gpu/drm/ci/kunit.sh:set -euxo pipefail
drivers/gpu/drm/ci/setup-llvm-links.sh:set -euo pipefail
scripts/check-uapi.sh:set -o pipefail

Christophe


