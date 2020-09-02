Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D502A25AEAE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 17:21:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhSMR55M5zDr0m
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 01:21:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhSHR6zmczDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 01:17:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BhSHF0YFGz9tySq;
 Wed,  2 Sep 2020 17:17:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id VNiYSj_8XU-g; Wed,  2 Sep 2020 17:17:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BhSHD6TLCz9tySn;
 Wed,  2 Sep 2020 17:17:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 54AFA8B7ED;
 Wed,  2 Sep 2020 17:17:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Ob8p81vLm4sB; Wed,  2 Sep 2020 17:17:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FF028B7EA;
 Wed,  2 Sep 2020 17:17:45 +0200 (CEST)
Subject: Re: [PATCH 10/10] powerpc: remove address space overrides using
 set_fs()
To: Christoph Hellwig <hch@lst.de>
References: <20200827150030.282762-1-hch@lst.de>
 <20200827150030.282762-11-hch@lst.de>
 <8974838a-a0b1-1806-4a3a-e983deda67ca@csgroup.eu>
 <20200902123646.GA31184@lst.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d78cb4be-48a9-a7c5-d9d1-d04d2a02b4c6@csgroup.eu>
Date: Wed, 2 Sep 2020 17:17:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200902123646.GA31184@lst.de>
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
Cc: linux-arch@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/09/2020 à 14:36, Christoph Hellwig a écrit :
> On Wed, Sep 02, 2020 at 08:15:12AM +0200, Christophe Leroy wrote:
>>> -		return 0;
>>> -	return (size == 0 || size - 1 <= seg.seg - addr);
>>> +	if (addr >= TASK_SIZE_MAX)
>>> +		return false;
>>> +	if (size == 0)
>>> +		return false;
>>
>> __access_ok() was returning true when size == 0 up to now. Any reason to
>> return false now ?
> 
> No, this is accidental and broken.  Can you re-run your benchmark with
> this fixed?
> 

With this fix, I get

root@vgoippro:~# time dd if=/dev/zero of=/dev/null count=1M
1048576+0 records in
1048576+0 records out
536870912 bytes (512.0MB) copied, 6.776327 seconds, 75.6MB/s
real    0m 6.78s
user    0m 1.64s
sys     0m 5.13s

That's still far from the 91.7MB/s I get with 5.9-rc2, but better than 
the 65.8MB/s I got yesterday with your series. Still some way to go thought.

Christophe
