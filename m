Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE5719D318
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:05:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tvCV1QMNzDqnG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 20:05:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tv6L1ydrzDrvG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 20:00:42 +1100 (AEDT)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5E980234BFB7F53E05DE;
 Fri,  3 Apr 2020 17:00:36 +0800 (CST)
Received: from [127.0.0.1] (10.173.223.234) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0;
 Fri, 3 Apr 2020 17:00:33 +0800
Subject: Re: linux-next: Tree for Apr 3
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
References: <20200403162926.3ff57e99@canb.auug.org.au>
 <62438df4-3546-bfea-6e7f-825faaacfaff@huawei.com>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <97daf9ff-fff9-0fd2-6121-73eba88a50f4@huawei.com>
Date: Fri, 3 Apr 2020 17:00:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <62438df4-3546-bfea-6e7f-825faaacfaff@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.223.234]
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+cc linuxppc-dev@lists.ozlabs.org

On 2020/4/3 16:54, Yuehaibing wrote:
> 
> 
> On 2020/4/3 13:29, Stephen Rothwell wrote:
>> Hi all,
>>
>> The merge window has opened, so please do not add any material for the
>> next release into your linux-next included trees/branches until after
>> the merge window closes.
>>
>> Changes since 20200402:
>>
> 
> On PPC32, randcondfig warning this:
> 
> WARNING: unmet direct dependencies detected for HOTPLUG_CPU
>   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
>   Selected by [y]:
>   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]
> 

