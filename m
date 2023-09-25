Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F5A7AD630
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 12:38:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j3LEEoDO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvK8v2ZB1z3clc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:38:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j3LEEoDO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvK743V14z3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 20:36:48 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38PA9c5W021138;
	Mon, 25 Sep 2023 10:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5F1oylzLfZW9ei1Y338Ggfpt72zuIfLri+q2JVeKhOU=;
 b=j3LEEoDO6B2rC1xB7qDwzrd8SOTCsTeKk9SF/a3bDEP95ESqgsFvjBwjDeMbRs5xX8ZF
 qeNcWVHWITijeh3uzB2dnZamQ+C+zpji9xFX7LIwugb0vz8ihpw5hnucbEBrsXCPVxQA
 wRvnNQmbBIEM1CJ6xngd6pxc5olVta1Q0hCvXxndvsBtS9DF7MLpE7KuAPsPPLjvIdAx
 G5gUzUydx84uswH+rx/A+E76F70Z5rZ/javu5Tp2T0e2GuMK7omNKDmTzEBnIEqevUG+
 iZ83zid2XYXgzwxPSrE57fsKDiqWDV+2tISCMMKxEvPMpTdGYv1BMC+fUvZaM3nkXYdn Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ta53qrh8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:36:41 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38PAa23J010172;
	Mon, 25 Sep 2023 10:36:41 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ta53qrh82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:36:41 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38PASBCV030392;
	Mon, 25 Sep 2023 10:36:40 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tad218v1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:36:40 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38PAabTB21234190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Sep 2023 10:36:38 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D890A20063;
	Mon, 25 Sep 2023 10:36:37 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C50552004F;
	Mon, 25 Sep 2023 10:36:34 +0000 (GMT)
Received: from [9.43.77.183] (unknown [9.43.77.183])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Sep 2023 10:36:34 +0000 (GMT)
Message-ID: <82088dc7-3010-8c5a-ce67-ccb395cf2b7e@linux.ibm.com>
Date: Mon, 25 Sep 2023 16:06:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V4 2/2] tools/perf/tests: Fix object code reading to skip
 address that falls out of text section
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        namhyung@kernel.org
References: <20230915053752.3012-1-atrajeev@linux.vnet.ibm.com>
 <20230915053752.3012-2-atrajeev@linux.vnet.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20230915053752.3012-2-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jNYwPN4E-IfbRrDigRXaFHAoC1xvIeAm
X-Proofpoint-ORIG-GUID: ElnTOcbXYreqWPy0Nj70khanp5OJBeEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-25_07,2023-09-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309250078
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
Cc: linux-perf-users@vger.kernel.org, Disha Goel <disgoel@linux.ibm.com>, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch looks good to me.

Reviewed-by: Kajol Jain <kjain@linux.ibm.com>

Thanks,
Kajol Jain

On 9/15/23 11:07, Athira Rajeev wrote:
> The testcase "Object code reading" fails in somecases
> for "fs_something" sub test as below:
> 
>     Reading object code for memory address: 0xc008000007f0142c
>     File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>     On file address is: 0x1114cc
>     Objdump command is: objdump -z -d --start-address=0x11142c --stop-address=0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
>     objdump read too few bytes: 128
>     test child finished with -1
> 
> This can alo be reproduced when running perf record with
> workload that exercises fs_something() code. In the test
> setup, this is exercising xfs code since root is xfs.
> 
>     # perf record ./a.out
>     # perf report -v |grep "xfs.ko"
>       0.76% a.out /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007de5efc B [k] xlog_cil_commit
>       0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007d5ae18 B [k] xfs_btree_key_offset
>       0.74% a.out  /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko  0xc008000007e11fd4 B [k] 0x0000000000112074
> 
> Here addr "0xc008000007e11fd4" is not resolved. since this is a
> kernel module, its offset is from the DSO. Xfs module is loaded
> at 0xc008000007d00000
> 
>    # cat /proc/modules | grep xfs
>     xfs 2228224 3 - Live 0xc008000007d00000
> 
> And size is 0x220000. So its loaded between  0xc008000007d00000
> and 0xc008000007f20000. From objdump, text section is:
>     text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4
> 
> Hence perf captured ip maps to 0x112074 which is:
> ( ip - start of module ) + a0
> 
> This offset 0x112074 falls out .text section which is up to 0x10f7bc
> In this case for module, the address 0xc008000007e11fd4 is pointing
> to stub instructions. This address range represents the module stubs
> which is allocated on module load and hence is not part of DSO offset.
> 
> To address this issue in "object code reading", skip the sample if
> address falls out of text section and is within the module end.
> Use the "text_end" member of "struct dso" to do this check.
> 
> To address this issue in "perf report", exploring an option of
> having stubs range as part of the /proc/kallsyms, so that perf
> report can resolve addresses in stubs range
> 
> However this patch uses text_end to skip the stub range for
> Object code reading testcase.
> 
> Reported-by: Disha Goel <disgoel@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Tested-by: Disha Goel<disgoel@linux.ibm.com>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
> Changelog:
>  v3 -> v4:
>  Fixed indent in V3
> 
>  v2 -> v3:
>  Used strtailcmp in comparison for module check and added Reviewed-by
>  from Adrian, Tested-by from Disha.
> 
>  v1 -> v2:
>  Updated comment to add description on which arch has stub and
>  reason for skipping as suggested by Adrian
> 
>  tools/perf/tests/code-reading.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
> index ed3815163d1b..9e6e6c985840 100644
> --- a/tools/perf/tests/code-reading.c
> +++ b/tools/perf/tests/code-reading.c
> @@ -269,6 +269,16 @@ static int read_object_code(u64 addr, size_t len, u8 cpumode,
>  	if (addr + len > map__end(al.map))
>  		len = map__end(al.map) - addr;
>  
> +	/*
> +	 * Some architectures (ex: powerpc) have stubs (trampolines) in kernel
> +	 * modules to manage long jumps. Check if the ip offset falls in stubs
> +	 * sections for kernel modules. And skip module address after text end
> +	 */
> +	if (!strtailcmp(dso->long_name, ".ko") && al.addr > dso->text_end) {
> +		pr_debug("skipping the module address %#"PRIx64" after text end\n", al.addr);
> +		goto out;
> +	}
> +
>  	/* Read the object code using perf */
>  	ret_len = dso__data_read_offset(dso, maps__machine(thread__maps(thread)),
>  					al.addr, buf1, len);
