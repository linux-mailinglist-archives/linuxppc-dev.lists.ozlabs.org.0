Return-Path: <linuxppc-dev+bounces-10813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A2CB2127F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 18:47:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c10sf4tmpz3dCm;
	Tue, 12 Aug 2025 02:47:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754930822;
	cv=none; b=FIOGGcNqauGJnOrEiea0LfmgZvpC6OsS9LgHd2Q2i4d6hkr8KT04KcxgQLzj6Vx20XdBJytsgEjKxasXnACKuiH9MiPLC3iI6ytBZGGP2ta+BMe44FiH+L6FvXABuWr8xFqUc46ujwRtbDRaM3iTHlhFpYD8dBGiEgj94YZY4Gt/bCu9jHHSs6V8i0GpXGUSkMszCUw1B0NOp/TLscmMYKM5oNzZEFWsCJ4d38HIXfE9PDhfcmAdrbQG4oFZ9gqRjqRGjzHvsFXENbolH2Z7K9/mWFxiV51V7exqty57QA2mgJMm/LVxxUBc3RB521EHg7MgnUm6Ky/QjAcC3vbenw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754930822; c=relaxed/relaxed;
	bh=i8LsXBMRBe/Icg4da9jE4AlWAsPYCbJGuzx7DJqs7+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCnF8JBr0/znIYHGko6Qc8Gde0EIjiBp/3q6t/dZ5N4LJLja8/TayVNcdZkDnoHhg3vu9h9V8D7f01tu1g0CfqWW4SPp99siGt45tYAfTw6ZZM9765aT5RXPa9muRe5REKQv4y5neOFd7sJxstfI2EwNK0x1nsDo5QSFDTnnxN9JjCkTnyEzkdaI7S0pvQHIFGpVTwfRyQPQfAhhMbwC1HR67JHy27+d5oh5JUPdMZcjODn5vntvElBjoI1GofVFXsM1sdkipYqilroy3hcQfABQX4kPoiX1HJrijOjiRaC/cZ0RKW0SEx8VnMS0zbVFhcR8i2PWR70w1l8g5kdPKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pvUcqneq; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pvUcqneq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c10sd2bS6z3dBs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 02:47:00 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BA8WMr027956;
	Mon, 11 Aug 2025 16:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=i8LsXB
	MRBe/Icg4da9jE4AlWAsPYCbJGuzx7DJqs7+8=; b=pvUcqneqANvc7ZJ3wXGNpF
	8d/UNG2ORVtv9z8kuz1JFSj+2Pf307wacnhWibXtJ8MvSudc2ZRNc6MALykKZysf
	p9svoc9ee2SxmWSto1ih9W3gx9757J/a/K1EsSGhlnYJyJUn6F8bAdJLLilQAvUx
	E/OrYd6sUwcZ/+tbMhVNqOLWFMq5narkdFfsWfMP/rv3yp79pxqR139nJz2Qy0N6
	ZnmQkT4EYmlu63YOcnCzC9oL4KXtPqd4VIotCVAuOB1aF33VN93o7xoUYtGukMtj
	rd51vZ9kuqEOcgF6gFkgXCKIpKu7k6dicxxpXbgix/vXQtf1ZBQ4AN8ahdTQ6eSA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx2ctdat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 16:46:43 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57BG7uH8017617;
	Mon, 11 Aug 2025 16:46:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48ekc3ed6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 16:46:42 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57BGkeJZ47448424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Aug 2025 16:46:40 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59F5A20043;
	Mon, 11 Aug 2025 16:46:40 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 023E020040;
	Mon, 11 Aug 2025 16:46:39 +0000 (GMT)
Received: from [9.39.30.243] (unknown [9.39.30.243])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 11 Aug 2025 16:46:38 +0000 (GMT)
Message-ID: <f3ecce9f-22cf-48e2-843e-63f08a577e69@linux.ibm.com>
Date: Mon, 11 Aug 2025 22:16:38 +0530
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
Subject: Re: [PATCH] soc/fsl/qbman: Use for_each_online_cpu() instead of
 for_each_cpu()
To: Fushuai Wang <wangfushuai@baidu.com>
Cc: frederic@kernel.org, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
References: <20250811065216.3320-1-wangfushuai@baidu.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250811065216.3320-1-wangfushuai@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNiBTYWx0ZWRfXzUjSuxKKKX8J
 NIaAIJsCrluSo5NbhwWQJ+X9uLkf919nigjMkco6BbFFc5a/uHZT8WzAC+py6gT6myDO/mgBYve
 +HVOAOr/0qvkXD66X2bNKuE5c4LzorK3dQrdvFz+ZXC/0UTx8CmLBk0dOWN1A/mJg/kEFqt5C2E
 ggZhjUhfdNwm4QjQXJ2M+6ysrhYzMelsLKVvVt50crY9g7uUKJ81EDEZn/lGr5yNdvtouZoDk0I
 wjLYwCHZ9WNXwrWu5a4C/3Vi5io9qe8jsxEykyGqG3v5eXfozxE81sgwoR08weXvGNWy/5noMk2
 d6ny8FdV7zbFkMT8OUNk3cEiMJsU6jw6gXpvoCCWE231RkZ3d0FcJPjowMA0LELm7lijW1kgr25
 T0XItL4i+K4UpQKRn0B2g8GyzubcCNPnRBaQxrcwdqaZft4uPn0oEcJxJ9naryoEdT63hryq
X-Proofpoint-GUID: TDgLOFCUzs6KSeu4QXexSOYJXoB8Jad6
X-Authority-Analysis: v=2.4 cv=C9zpyRP+ c=1 sm=1 tr=0 ts=689a1e73 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=zuLzuavZAAAA:8 a=VATuJ96wsPKbvXY_zzoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: TDgLOFCUzs6KSeu4QXexSOYJXoB8Jad6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=977 suspectscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508110106
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/11/25 12:22, Fushuai Wang wrote:
> Replace the opencoded for_each_cpu(cpu, cpu_online_mask) loop with the
> more readable and equivalent for_each_online_cpu(cpu) macro.
> 
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> ---
>   drivers/soc/fsl/qbman/qman_test_stash.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
> index f4d3c2146f4f..6f7597950aa3 100644
> --- a/drivers/soc/fsl/qbman/qman_test_stash.c
> +++ b/drivers/soc/fsl/qbman/qman_test_stash.c
> @@ -103,7 +103,7 @@ static int on_all_cpus(int (*fn)(void))
>   {
>   	int cpu;
>   
> -	for_each_cpu(cpu, cpu_online_mask) {
> +	for_each_online_cpu(cpu) {
>   		struct bstrap bstrap = {
>   			.fn = fn,
>   			.started = ATOMIC_INIT(0)

Yes. This change makes sense given that for_each_online_cpu expands into the same.

Why not do for the remaining ones too?

linux_tip$ grep -Rw "for_each_cpu" * | grep  cpu_online_mask
arch/riscv/kernel/unaligned_access_speed.c:     for_each_cpu(cpu, cpu_online_mask) {
arch/riscv/kernel/unaligned_access_speed.c:     for_each_cpu(cpu, cpu_online_mask) {
drivers/soc/fsl/qbman/qman_test_stash.c:        for_each_cpu(cpu, cpu_online_mask) {    ** current patch addresses this.
drivers/infiniband/hw/hfi1/sdma.c:      for_each_cpu(cpu, cpu_online_mask) {
drivers/cpuidle/cpuidle-tegra.c:        for_each_cpu(lcpu, cpu_online_mask) {
include/rv/da_monitor.h:        for_each_cpu(cpu, cpu_online_mask) {
kernel/trace/trace_osnoise.c:   for_each_cpu(cpu, cpu_online_mask) {
kernel/trace/trace_osnoise.c:   for_each_cpu(cpu, cpu_online_mask) {


Rest everyone seems to have moved.
linux_tip$ grep -Rw "for_each_online_cpu" * | wc
     416    1141   23047



