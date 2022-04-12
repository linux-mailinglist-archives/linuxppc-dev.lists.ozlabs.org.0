Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AFB4FCC4A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 04:18:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcqCT2vM2z3bpZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 12:18:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=chenjingwen6@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcqC51szpz2x9X
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 12:18:22 +1000 (AEST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Kcq8B06N8zgYW7;
 Tue, 12 Apr 2022 10:15:54 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 12 Apr 2022 10:17:42 +0800
Received: from linux-suspe12sp5.huawei.com (10.67.133.83) by
 dggpeml500017.china.huawei.com (7.185.36.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 12 Apr 2022 10:17:42 +0800
From: ChenJingwen <chenjingwen6@huawei.com>
To: <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] [Rebased for 5.4] powerpc/kasan: Fix early region not
 updated correctly
Date: Tue, 12 Apr 2022 10:17:41 +0800
Message-ID: <20220412021741.127386-1-chenjingwen6@huawei.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <fc39c36ea92e03ed5eb218ddbe83b34361034d9d.1648915982.git.christophe.leroy@csgroup.eu>
References: <fc39c36ea92e03ed5eb218ddbe83b34361034d9d.1648915982.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.133.83]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500017.china.huawei.com (7.185.36.243)
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
Cc: gregkh@linuxfoundation.org, chenjingwen6@huawei.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> This is backport for 5.4
> 
> Upstream commit 5647a94a26e352beed61788b46e035d9d12664cd

Thank you for your rebase.
I went on vacation and couldn't submit the code at that time
