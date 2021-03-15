Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD10133AEE5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 10:33:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzWSb5pwQz300D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 20:33:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzWSG3n9Jz2yYf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 20:33:15 +1100 (AEDT)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DzWPs101CzrWBf;
 Mon, 15 Mar 2021 17:31:13 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 17:32:57 +0800
Subject: Re: [PATCH] powerpc: define the variable 'uaccess_flush' as static
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <dja@axtens.net>, <akpm@linux-foundation.org>, <rppt@kernel.org>,
 <aneesh.kumar@linux.ibm.com>
References: <20210312110638.178974-1-heying24@huawei.com>
 <a06a0dc8-c717-da4c-c5ad-eaf56bbbd896@kaod.org>
 <2c7bf6e0-d950-c728-bfe9-2db99a4d18a9@huawei.com>
 <c522ca02-4053-3e3d-f25e-2c1482c5a8bd@csgroup.eu>
From: "heying (H)" <heying24@huawei.com>
Message-ID: <ed3fe918-abe9-e463-3900-242f54047818@huawei.com>
Date: Mon, 15 Mar 2021 17:32:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c522ca02-4053-3e3d-f25e-2c1482c5a8bd@csgroup.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
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
Cc: johnny.chenyi@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

在 2021/3/15 17:16, Christophe Leroy 写道:
>
>
> I think W=1 will only report missing function prototypes.
>
> sparse also reports missing variables prototypes so that's better. All 
> should be fixed.
>
OK. I'll try to fix all the warnings in the file 
"arch/powerpc/kernel/setup_64.c" reported by sparse and send the patch 
V2 soon.


Thanks.

