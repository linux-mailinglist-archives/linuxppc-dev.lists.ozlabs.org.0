Return-Path: <linuxppc-dev+bounces-3545-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B279D7BEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 08:27:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xxcj74B11z2yYf;
	Mon, 25 Nov 2024 18:27:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732519627;
	cv=none; b=Z7PKEGy18x4WmSpIZ+H2B5z7VQbjB6lu4puGrGs2bwqO86gc1DSCI7ArzsO8yCcvNex/wzXprp0c9nP+ZuDXfPnRo4DKd5V6qZVDEIFZEAQH+BgCcg40IQyPSW7w6xOVJdb2g63H711iZUT8ySeicqT9SbxS/UjgddiXQAe6AhbDHVBMg6/r2Y48YK+sPaJOwmi6LPRTyifrJf8yU6IOlr8SJ1FTCFCnK9iL4OGwrObxct3+QE8pxuZjRicRE1e9Ctvn0Lm9ct0ff07ciYNEZoVZ4KGZ9NjWl9/qgieXoTBVeSi1SnAjdQ8U41EzHaxmFMr8VXIS4t6cWFROXNvrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732519627; c=relaxed/relaxed;
	bh=CekLY6TAN+2fLICxY17W/wDYBNEmemTtaf09cysFzS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imisjx3NZjxh7dqXhG40vFmD+5YuV9J98Z5YsL0HtHu+DLNV5gecZPpznacyEFnt2qfVk0gUwDXovv75vrDW6Rnt/rEDkUMMw5AAzZqFUTlh+vDW4CkvhB597LAZTIE0HMoYbaBjPPjRdHFhmUnsBFI63RmHQgdXYEZBp4lzp9/N+80r2Jwqrv6t8xsw7fwbDsa14mz+CGz06xDP+W29mY5Hu6Algb6mVlUVQJIwUE4NI5rvhLUVbxGexxTKy6IdOhN3kgDC8qc43NF+qRh2NFu5XhRc5SgIB3wvj5hF4SiKOf/+9Ryca/Y1ZPyBTjwJ1tVUWegc49uF0oT1nHYLBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xxcj55y1Cz2yXm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 18:27:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Xxchz27g4z9sPd;
	Mon, 25 Nov 2024 08:26:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hPPde6qatPkl; Mon, 25 Nov 2024 08:26:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xxchz1Mcqz9rvV;
	Mon, 25 Nov 2024 08:26:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1EB568B764;
	Mon, 25 Nov 2024 08:26:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OlEhmccigwwc; Mon, 25 Nov 2024 08:26:59 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DBF518B763;
	Mon, 25 Nov 2024 08:26:58 +0100 (CET)
Message-ID: <563bccb3-d9eb-4001-8c3e-6021c507f636@csgroup.eu>
Date: Mon, 25 Nov 2024 08:26:58 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] powerpc/machdep: Remove duplicated include in svm.c
To: Michael Ellerman <mpe@ellerman.id.au>,
 Yang Li <yang.lee@linux.alibaba.com>, npiggin@gmail.com, naveen@kernel.org,
 maddy@linux.ibm.com, Christoph Hellwig <hch@lst.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20241107010259.46308-1-yang.lee@linux.alibaba.com>
 <87msibcmeb.fsf@mpe.ellerman.id.au>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87msibcmeb.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 07/11/2024 à 12:29, Michael Ellerman a écrit :
> Yang Li <yang.lee@linux.alibaba.com> writes:
>> The header files linux/mem_encrypt.h is included twice in svm.c,
>> so one inclusion of each can be removed.
>>
>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11750
>> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>> ---
>>   arch/powerpc/platforms/pseries/svm.c | 1 -
>>   1 file changed, 1 deletion(-)
> 
> The two includes only appear in linux-next, and they both come from
> different trees. They are required in each tree to avoid breaking the
> build.
> 
> So no one can merge this patch until the two trees are merged into mainline.
> 

That's in linus tree now

Christophe

