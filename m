Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A523E2709A9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 03:29:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtY5n2yQWzDqwN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 11:29:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=miaoqinglang@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtY4127WqzDqtV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 11:27:59 +1000 (AEST)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 23CC91B64D794E1EAAC7;
 Sat, 19 Sep 2020 09:27:52 +0800 (CST)
Received: from [10.174.179.91] (10.174.179.91) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Sat, 19 Sep 2020 09:27:47 +0800
Subject: Re: [PATCH -next] powerpc: Convert to DEFINE_SHOW_ATTRIBUTE
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200716090712.14375-1-miaoqinglang@huawei.com>
 <20200902045118.GD272502@thinks.paulus.ozlabs.org>
From: miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <088368fc-1bad-d973-39c7-86e8ba5c0f69@huawei.com>
Date: Sat, 19 Sep 2020 09:27:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200902045118.GD272502@thinks.paulus.ozlabs.org>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



ÔÚ 2020/9/2 12:51, Paul Mackerras Ð´µÀ:
> On Thu, Jul 16, 2020 at 05:07:12PM +0800, Qinglang Miao wrote:
>> From: Chen Huang <chenhuang5@huawei.com>
>>
>> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
>>
>> Signed-off-by: Chen Huang <chenhuang5@huawei.com>
> 
> For the arch/powerpc/kvm part:
> 
> Acked-by: Paul Mackerras <paulus@ozlabs.org>
> 
> I expect Michael Ellerman will take the patch through his tree.
> 
> Paul.
> .
Hi Michael and Paul,

I spilited this patch and resent them because I noticed that 
<4d4901c6d7>(turn .read -> .read_iter) in linux-next has been reverted.

New patches are against linux-next(20200917), and they can
be applied to mainline cleanly now.

Thanks.
> 
