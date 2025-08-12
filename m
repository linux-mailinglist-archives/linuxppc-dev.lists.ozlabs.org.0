Return-Path: <linuxppc-dev+bounces-10827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86293B21CBB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:07:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1KJY2Tlwz3dFL;
	Tue, 12 Aug 2025 15:07:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=111.206.215.185
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754974643;
	cv=none; b=Mck4AlrEVYhxHAs1y4FL8ZtOQJMPPVZF7ht5sjOp1IzA3FfQ8R4Ce420sc73JQu/0Fgr8ICGPSD5hLOvMqY4paSCgOez6Qcddy3kxma5RkoWx1vWB5nIn1kuLz3B7KScypD0njU0c9R4HwI3LLZIwzHthlOyNFfqG5h5iHgmG0FV2Cutr7q7ZEH5qUKsk0V3M+XudPBmBqtN4IIeAP5itRMF2VHUe3BJWIPmyIgx9mAGexWguC4JRxFWtPf6XCJ6OChI982AD7bm2iVREcUKE4d232iaTIC/JfWNh0BkNj58y3fM0ww5YxfYxDpfLiDUqEXmnL4wgfTheQyPvOuwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754974643; c=relaxed/relaxed;
	bh=/YPyP+J+AVFkZRqirrTtm++m3zVbA7i+GZq9KPqC7Y0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PzEj6RlLmoeFbMcEI7CZ5lyUHS+Meyg+h5La4UMu7iMe2zWpiYcaW1CkOu1qbh/IysEhfYMAc38iv4Su83J6v7Ssfv81Gg/UugdRpdwkI1xVMIVThiqRRoAcLzm6H7zfPeCcLnb5o73Uqu+eAkqdb6u8clvRaZvmljR4M4hY7DuGMt1YqG4ECIHuHHhm2V7ItyvrM4VqsW0r7DMPcW/rYcGUZ6nxxaBmWV4PrCcpVc2rI6CZTwxj8dLbSwF5q2AOWsFhBUgKI3qlrUjeFA4DKcjSys1ATYGBKuGC4y2wcMusY3/VhHOqCZmvVi3woHaRdkf3bDQOyFbnbzwbaZ+QOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass (client-ip=111.206.215.185; helo=baidu.com; envelope-from=wangfushuai@baidu.com; receiver=lists.ozlabs.org) smtp.mailfrom=baidu.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baidu.com (client-ip=111.206.215.185; helo=baidu.com; envelope-from=wangfushuai@baidu.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 79473 seconds by postgrey-1.37 at boromir; Tue, 12 Aug 2025 14:57:21 AEST
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1K4K3mlnz3cdm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 14:57:17 +1000 (AEST)
From: Fushuai Wang <wangfushuai@baidu.com>
To: <sshegde@linux.ibm.com>
CC: <christophe.leroy@csgroup.eu>, <frederic@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <wangfushuai@baidu.com>
Subject: Re: [PATCH] soc/fsl/qbman: Use for_each_online_cpu() instead of for_each_cpu()
Date: Tue, 12 Aug 2025 12:56:42 +0800
Message-ID: <20250812045642.54968-1-wangfushuai@baidu.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <f3ecce9f-22cf-48e2-843e-63f08a577e69@linux.ibm.com>
References: <f3ecce9f-22cf-48e2-843e-63f08a577e69@linux.ibm.com>
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
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.127.72.13]
X-ClientProxiedBy: bjkjy-exc4.internal.baidu.com (172.31.50.48) To
 bjhj-exc17.internal.baidu.com (172.31.4.15)
X-FEAS-Client-IP: 172.31.4.15
X-FE-Policy-ID: 52:10:53:SYSTEM
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>> Replace the opencoded for_each_cpu(cpu, cpu_online_mask) loop with the
>> more readable and equivalent for_each_online_cpu(cpu) macro.
>> 
>> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
>> ---
>>   drivers/soc/fsl/qbman/qman_test_stash.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
>> index f4d3c2146f4f..6f7597950aa3 100644
>> --- a/drivers/soc/fsl/qbman/qman_test_stash.c
>> +++ b/drivers/soc/fsl/qbman/qman_test_stash.c
>> @@ -103,7 +103,7 @@ static int on_all_cpus(int (*fn)(void))
>>   {
>>   	int cpu;
>>   
>> -	for_each_cpu(cpu, cpu_online_mask) {
>> +	for_each_online_cpu(cpu) {
>>   		struct bstrap bstrap = {
>>   			.fn = fn,
>>   			.started = ATOMIC_INIT(0)
> 
> Yes. This change makes sense given that for_each_online_cpu expands into the same.
> 
> Why not do for the remaining ones too?

I’m working on updating the remaining instances as well.
To keep the commits clear, I’m sending separate patches for each file/subsystem.

Regards,
Wang.

> linux_tip$ grep -Rw "for_each_cpu" * | grep  cpu_online_mask
> arch/riscv/kernel/unaligned_access_speed.c:     for_each_cpu(cpu, cpu_online_mask) {
> arch/riscv/kernel/unaligned_access_speed.c:     for_each_cpu(cpu, cpu_online_mask) {
> drivers/soc/fsl/qbman/qman_test_stash.c:        for_each_cpu(cpu, cpu_online_mask) {    ** current patch addresses this.
> drivers/infiniband/hw/hfi1/sdma.c:      for_each_cpu(cpu, cpu_online_mask) {
> drivers/cpuidle/cpuidle-tegra.c:        for_each_cpu(lcpu, cpu_online_mask) {
> include/rv/da_monitor.h:        for_each_cpu(cpu, cpu_online_mask) {
> kernel/trace/trace_osnoise.c:   for_each_cpu(cpu, cpu_online_mask) {
> kernel/trace/trace_osnoise.c:   for_each_cpu(cpu, cpu_online_mask) {
> 
> 
> Rest everyone seems to have moved.
> linux_tip$ grep -Rw "for_each_online_cpu" * | wc
>      416    1141   23047

