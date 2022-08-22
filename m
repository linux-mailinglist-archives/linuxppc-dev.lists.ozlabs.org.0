Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8725259B7CE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 04:59:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M9xsX4pY9z3c3L
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 12:59:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 973 seconds by postgrey-1.36 at boromir; Mon, 22 Aug 2022 12:59:07 AEST
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M9xs72dt3z2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 12:59:04 +1000 (AEST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M9xR22bXzznTX2;
	Mon, 22 Aug 2022 10:39:58 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 22 Aug 2022 10:42:15 +0800
Received: from [127.0.0.1] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 22 Aug
 2022 10:42:14 +0800
Message-ID: <5003880a-0b0a-27d4-9fa0-3c6a4c75a9a1@huawei.com>
Date: Mon, 22 Aug 2022 10:42:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Fwd: [PATCH -next] objtool: use arch_jump_destination in
 read_intra_function_calls
References: <20220818014553.220261-1-chenzhongjin@huawei.com>
Content-Language: en-US
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <20220818014553.220261-1-chenzhongjin@huawei.com>
X-Forwarded-Message-Id: <20220818014553.220261-1-chenzhongjin@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500013.china.huawei.com (7.185.36.172)
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Sathvika Vasireddy <sv@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sorry that forgot to CC ppc.

Maybe this is related to your intra-function call warnings problem?
Just a guess.

-------- Forwarded Message --------
Subject: 	[PATCH -next] objtool: use arch_jump_destination in 
read_intra_function_calls
Date: 	Thu, 18 Aug 2022 09:45:53 +0800
From: 	Chen Zhongjin <chenzhongjin@huawei.com>
To: 	linux-kernel@vger.kernel.org
CC: 	jpoimboe@kernel.org, peterz@infradead.org, chenzhongjin@huawei.com



arch_jump_destination() is used instead of offset + len + immediate
for jump destination.
But in read_intra_function_calls it didn't get changed.
It can make trouble for other arches development such as arm or ppc.
Fix it.

Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
tools/objtool/check.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 0cec74da7ffe..b012d987a658 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2233,7 +2233,7 @@ static int read_intra_function_calls(struct 
objtool_file *file)
*/
insn->type = INSN_JUMP_UNCONDITIONAL;
- dest_off = insn->offset + insn->len + insn->immediate;
+ dest_off = arch_jump_destination(insn);
insn->jump_dest = find_insn(file, insn->sec, dest_off);
if (!insn->jump_dest) {
WARN_FUNC("can't find call dest at %s+0x%lx",

-- 
2.17.1


