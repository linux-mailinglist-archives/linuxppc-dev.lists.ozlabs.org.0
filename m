Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D20804119
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 22:45:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Avl3ztQ8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Skcf03Qdfz3cT9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 08:45:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Avl3ztQ8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=quic_jasksing@quicinc.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2069 seconds by postgrey-1.37 at boromir; Mon, 04 Dec 2023 22:46:17 AEDT
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkMLx4SHtz3cc0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 22:46:16 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B46Mno0020040;
	Mon, 4 Dec 2023 11:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=e+ho6pr3AQa/V47Hgoe+tRla8f7dmqrQ7ZH/7sAQc2s=;
 b=Avl3ztQ8UI4sHvHFI3a8kOjnwbmsn1yPFbf5ErcptHImeHSjtlUdyq6j7OsNXHq4v8qm
 c8Bf/qwaYUaUy1xr5xmF2dQxtsq9EwPfaFHqQT1oqbGQYgaZ7ohdqZ9QaoDrRKyBDxjq
 L27izBCcyTDL7fCW/e4Ku0EXgkBoZ9YhNPkIqzOYgNXOP9FvjjGMeASBH4XBbKYG7NQz
 rpJv4E4LGmobkc1VoJKhHn47cuvufG60fi6awe2GucUI52CT3ki8HsvU3YhNkVbLaWaL
 JptkPs6+5gJJfdkQAZSE8dvDpKFyJ+GiWYQ1US6TxpvvDx34YIahXMwmf4mC+8iZUWVe Kg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3us81ygtwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 11:11:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4BBUZk002169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 11:11:30 GMT
Received: from [10.214.229.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 03:11:24 -0800
Message-ID: <6c52882c-c189-4a67-b8c0-0963ba856659@quicinc.com>
Date: Mon, 4 Dec 2023 16:41:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] CMDLINE: add generic builtin command line
Content-Language: en-US
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring
	<robh@kernel.org>,
        Daniel Gimpelevich
	<daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Tomas Mudrunka <tomas.mudrunka@gmail.com>,
        Sean Anderson
	<sean.anderson@seco.com>, <x86@kernel.org>,
        <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-2-danielwa@cisco.com>
From: Jaskaran Singh <quic_jasksing@quicinc.com>
In-Reply-To: <20231110013817.2378507-2-danielwa@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q6cxTo-435Y9FN1c34c0ojxeDLpAcLU4
X-Proofpoint-GUID: q6cxTo-435Y9FN1c34c0ojxeDLpAcLU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_06,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040085
X-Mailman-Approved-At: Tue, 05 Dec 2023 08:44:31 +1100
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
Cc: Ruslan Bilovol <rbilovol@cisco.com>, linux-kernel@vger.kernel.org, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/10/2023 7:08 AM, Daniel Walker wrote:
> diff --git a/lib/generic_cmdline.S b/lib/generic_cmdline.S
> new file mode 100644
> index 000000000000..223763f9eeb6
> --- /dev/null
> +++ b/lib/generic_cmdline.S
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <linux/export.h>
> +#include <linux/init.h>
> +
> +#include <asm/setup.h>
> +
> +        __INITDATA
> +
> +       .align 8
> +       .global cmdline_prepend
> +cmdline_prepend:
> +       .ifnc CONFIG_CMDLINE_PREPEND,""
> +       .ascii CONFIG_CMDLINE_PREPEND
> +       .string " "
> +       .else
> +       .byte 0x0
> +       .endif
> +#ifdef CONFIG_CMDLINE_EXTRA
> +       .space COMMAND_LINE_SIZE - (.-cmdline_prepend)
> +       .size cmdline_prepend, COMMAND_LINE_SIZE
> +#endif /* CONFIG_CMDLINE_EXTRA */
> +
> +cmdline_prepend_end:
> +       .size cmdline_prepend, (cmdline_prepend_end - cmdline_prepend)
> +
> +       .align 8
> +       .global cmdline_tmp
> +cmdline_tmp:
> +       .ifnc CONFIG_CMDLINE_PREPEND,""
> +       .size cmdline_tmp, COMMAND_LINE_SIZE
> +       .space COMMAND_LINE_SIZE
> +       .else
> +       .byte 0x0
> +       .endif
> +cmdline_tmp_end:
> +       .size cmdline_tmp, (cmdline_tmp_end - cmdline_tmp)
> +
> +       .align 8
> +       .global cmdline_append
> +       .size cmdline_append, COMMAND_LINE_SIZE
> +cmdline_append:
> +       .ifnc CONFIG_CMDLINE_APPEND,""
> +       .ascii " "
> +       .string CONFIG_CMDLINE_APPEND
> +       .else
> +       .byte 0x0
> +       .endif
> +#ifdef CONFIG_CMDLINE_EXTRA
> +       .space COMMAND_LINE_SIZE - (.-cmdline_append)
> +#endif /* CONFIG_CMDLINE_EXTRA */
> +cmdline_append_end:
> +       .size cmdline_append, (cmdline_append_end - cmdline_append)
> +

Hi Daniel,

I picked these patches to test a usecase of ours. generic_cmdline.S does
not escape semicolons in the CMDLINE_APPEND and CMDLINE_PREPEND strings.
Take this config snippet for example:

CONFIG_CMDLINE_APPEND="slub_debug=FZP,zs_handle,zspage;FZPU page_owner=on"
CONFIG_CMDLINE_BOOL=y
# CONFIG_CMDLINE_EXTRA is not set
# CONFIG_CMDLINE_OVERRIDE is not set
# CONFIG_CMDLINE_PREPEND is not set
# CONFIG_TEST_CMDLINE is not set

While compiling, the word FZPU is considered as a mnemonic because of
the semicolon preceding it causing parsing to fail:

kernel/lib/generic_cmdline.S: Assembler messages:
kernel/lib/generic_cmdline.S:42: Warning: missing closing `"'
kernel/lib/generic_cmdline.S:42: Error: unknown mnemonic `fzpu' -- `fzpu
page_owner=on",""'

Maybe Christophe's suggestion of moving this code to a C file and using
inline assembly helps mitigate similar problems?

Thanks,
Jaskaran.
