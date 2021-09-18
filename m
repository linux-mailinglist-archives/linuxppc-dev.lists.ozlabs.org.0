Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7AB41067C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 14:47:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HBVwY1M7Rz305h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Sep 2021 22:47:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.42;
 helo=out30-42.freemail.mail.aliyun.com;
 envelope-from=xianting.tian@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HBVw45B5Rz2xnf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Sep 2021 22:47:29 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Uon0NRt_1631969229; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0Uon0NRt_1631969229) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 18 Sep 2021 20:47:10 +0800
Subject: Re: [PATCH v8 2/3] tty: hvc: pass DMA capable memory to put_chars()
To: Greg KH <gregkh@linuxfoundation.org>
References: <20210818082122.166881-1-xianting.tian@linux.alibaba.com>
 <20210818082122.166881-3-xianting.tian@linux.alibaba.com>
 <87pmu8ehkk.fsf@linkitivity.dja.id.au>
 <6e36640d-b55f-ece4-4cab-437ecec0964a@linux.alibaba.com>
 <614b778b-8486-c20f-d5ed-37cc3b92ada1@linux.alibaba.com>
 <YUXeSUVQRDXzAqhf@kroah.com>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <9678a0e1-f80f-89af-e7a0-f52bd914384d@linux.alibaba.com>
Date: Sat, 18 Sep 2021 20:47:09 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YUXeSUVQRDXzAqhf@kroah.com>
Content-Type: text/plain; charset=gbk; format=flowed
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
Cc: arnd@arndb.de, amit@kernel.org, linuxppc-dev@lists.ozlabs.org,
 shile.zhang@linux.alibaba.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, jirislaby@kernel.org,
 osandov@fb.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

thanks Greg, I will submit v9 patch for reviewing.

Before, I was waiting for a new reply:(

ÔÚ 2021/9/18 ÏÂÎç8:40, Greg KH Ð´µÀ:
> On Sat, Sep 18, 2021 at 08:32:01PM +0800, Xianting Tian wrote:
>> hi
>>
>> Will you consider to continue the disscussion of this patch? thanks
> I do not see a newer version of this series.
>
> thanks,
>
> greg k-h
