Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D248322329D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 06:48:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7JXg23VqzDr5J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 14:48:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7JVp0MLYzDq99
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 14:46:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B7JVn6pCKz8tQV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 14:46:41 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B7JVn6FRXz9sRf; Fri, 17 Jul 2020 14:46:41 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B7JVm608Vz9sRW
 for <linuxppc-dev@ozlabs.org>; Fri, 17 Jul 2020 14:46:40 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06H4Voo3143975; Fri, 17 Jul 2020 00:46:35 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32auqup48t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 00:46:35 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06H4WMEl145082;
 Fri, 17 Jul 2020 00:46:35 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32auqup486-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 00:46:34 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06H4Uhtg011264;
 Fri, 17 Jul 2020 04:46:32 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 328rbqsxx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 04:46:32 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06H4kTdd43909294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jul 2020 04:46:30 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBD4352280;
 Fri, 17 Jul 2020 04:46:29 +0000 (GMT)
Received: from [9.102.1.129] (unknown [9.102.1.129])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D3ACF5227A;
 Fri, 17 Jul 2020 04:46:26 +0000 (GMT)
Subject: Re: [PATCH v3 02/12] powerpc/kexec_file: mark PPC64 specific code
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466085652.24747.2414199807974963385.stgit@hbathini.in.ibm.com>
 <87v9io8c13.fsf@morokweng.localdomain>
From: Hari Bathini <hbathini@linux.ibm.com>
Message-ID: <63d551a9-684b-768b-8b0f-2a0da68d7f11@linux.ibm.com>
Date: Fri, 17 Jul 2020 10:16:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87v9io8c13.fsf@morokweng.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_11:2020-07-16,
 2020-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=100
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 mlxscore=100 mlxlogscore=-1000 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007170029
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
Cc: Pingfan Liu <piliu@redhat.com>, Petr Tesarik <ptesarik@suse.cz>,
 Nayna Jain <nayna@linux.ibm.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 16/07/20 7:19 am, Thiago Jung Bauermann wrote:
> 
> I didn't forget about this patch. I just wanted to see more of the
> changes before comenting on it.
> 
> Hari Bathini <hbathini@linux.ibm.com> writes:
> 
>> Some of the kexec_file_load code isn't PPC64 specific. Move PPC64
>> specific code from kexec/file_load.c to kexec/file_load_64.c. Also,
>> rename purgatory/trampoline.S to purgatory/trampoline_64.S in the
>> same spirit.
> 
> There's only a 64 bit implementation of kexec_file_load() so this is a
> somewhat theoretical exercise, but there's no harm in getting the code
> organized, so:
> 
> Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> 
> I have just one question below.

<snip>

>> +/**
>> + * setup_new_fdt_ppc64 - Update the flattend device-tree of the kernel
>> + *                       being loaded.
>> + * @image:               kexec image being loaded.
>> + * @fdt:                 Flattened device tree for the next kernel.
>> + * @initrd_load_addr:    Address where the next initrd will be loaded.
>> + * @initrd_len:          Size of the next initrd, or 0 if there will be none.
>> + * @cmdline:             Command line for the next kernel, or NULL if there will
>> + *                       be none.
>> + *
>> + * Returns 0 on success, negative errno on error.
>> + */
>> +int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>> +			unsigned long initrd_load_addr,
>> +			unsigned long initrd_len, const char *cmdline)
>> +{
>> +	int chosen_node, ret;
>> +
>> +	/* Remove memory reservation for the current device tree. */
>> +	ret = delete_fdt_mem_rsv(fdt, __pa(initial_boot_params),
>> +				 fdt_totalsize(initial_boot_params));
>> +	if (ret == 0)
>> +		pr_debug("Removed old device tree reservation.\n");
>> +	else if (ret != -ENOENT) {
>> +		pr_err("Failed to remove old device-tree reservation.\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = setup_new_fdt(image, fdt, initrd_load_addr, initrd_len,
>> +			    cmdline, &chosen_node);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = fdt_setprop(fdt, chosen_node, "linux,booted-from-kexec", NULL, 0);
>> +	if (ret)
>> +		pr_err("Failed to update device-tree with linux,booted-from-kexec\n");
>> +
>> +	return ret;
>> +}
> 
> For setup_purgatory_ppc64() you start with an empty function and build
> from there, but for setup_new_fdt_ppc64() you moved some code here. Is
> the code above 64 bit specific?

Actually, I was not quiet sure if fdt updates like in patch 6 & patch 9 can be
done after setup_ima_buffer() call. If you can confirm, I will move them back
to setup_purgatory()

Thanks
Hari
