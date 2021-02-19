Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC193201EF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 00:43:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj7Rp4QvWz3cKx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 10:43:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i9DhreR/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i9DhreR/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj7RM3x0Fz30NB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 10:42:38 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11JNV1Nb174109; Fri, 19 Feb 2021 18:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=W4HRt9rt7VE+dLmetxPYWNoKx7bCDFj1qgN3EA+vKec=;
 b=i9DhreR/jkELwna3Ud0e94tmCW13Paf8mfuUNHuHsCXS/ZQxgLxU8MIHW+65ArOw5Elw
 eD5lAtJk3wGJhCNNksV/V/BD8dIi1hngrQnTT9MrMRy9wOeFJey0poLBGRmWYh/t1A6M
 mnmYGYtI9RBvUIFELfHcyxfVq2wi4GoYfa5YY38fmRzQMv3EFsoqRr7z6SsK2eseYmKg
 YMJz2wXYBo089yub36i7GPl2gbgH/qfoQIu8AOoatoIBIW5ItqK9xuuTrDQ8ljhsU7af
 YLtHACTSsIseJ9Ufb4eDBbkPvfgExsTzo52TNt1lOxqCNnNkZeRlTzs4qem6UpNgKIaL 6w== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36tn71tsbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 18:42:21 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11JNaf4F010472;
 Fri, 19 Feb 2021 23:42:20 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 36p6dan744-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 23:42:20 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11JNgJRE20054442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 23:42:19 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91482112063;
 Fri, 19 Feb 2021 23:42:19 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D79BC112061;
 Fri, 19 Feb 2021 23:42:17 +0000 (GMT)
Received: from manicouagan.localdomain (unknown [9.85.174.98])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 19 Feb 2021 23:42:17 +0000 (GMT)
References: <20210219142552.762608-1-bauerman@linux.ibm.com>
 <5a28907e-9231-7a19-62ff-3ed1c0282642@linux.microsoft.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH] powerpc/kexec_file: Restore FDT size estimation for
 kdump kernel
In-reply-to: <5a28907e-9231-7a19-62ff-3ed1c0282642@linux.microsoft.com>
Date: Fri, 19 Feb 2021 20:42:16 -0300
Message-ID: <878s7jy693.fsf@manicouagan.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_08:2021-02-18,
 2021-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190187
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
Cc: Rob Herring <robh@kernel.org>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:

> On 2/19/21 6:25 AM, Thiago Jung Bauermann wrote:
>
> One small nit in the function header (please see below), but otherwise the
> change looks good.
>
> Reviewed-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

Thanks for your review. I incorporated your suggestion and will send v2
shortly.

>> --- a/arch/powerpc/kexec/file_load_64.c
>> +++ b/arch/powerpc/kexec/file_load_64.c
>> @@ -927,37 +927,27 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
>>   }
>>     /**
>> - * kexec_fdt_totalsize_ppc64 - Return the estimated size needed to setup FDT
>> - *                             for kexec/kdump kernel.
>> - * @image:                     kexec image being loaded.
>> + * kexec_extra_fdt_size_ppc63 - Return the estimated size needed to setup FDT
>
> Perhaps change to
>
> "Return the estimated additional size needed to setup FDT for kexec/kdump
> kernel"?

That's better indeed. I also hadn't noticed that I changed ppc64 to
ppc63. Fixed as well.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
