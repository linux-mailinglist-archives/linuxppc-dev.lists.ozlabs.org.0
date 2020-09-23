Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 180292761A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 22:05:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxTh44cFRzDqf4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 06:05:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=G5NSr1RQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxTf81t3zzDqMC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 06:04:12 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08NK2BWK013668; Wed, 23 Sep 2020 16:03:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Ljy02159OZxWl2db8KxekGtDxFn+FrRkst2rG7nzEC4=;
 b=G5NSr1RQTTO1ZgVL4nuzY8BIJfmj+DLZ4U7PNM4fbE4RvUrFJFD9Q45xLCGNR8VeAmce
 2FSfMzzeatnLRoQqvDQ6SgLkOEnnk7AUt7tWgg4uhTYK13ZHPUCeTEJIJqECkb2nMgV9
 140MLIVVTlc7sZujwNa3QxqVjcP/HVjZi4yfsc4zjpkCVj5qk28fviadQ3wAmBDywv68
 P2yiDJCm6SfTfaT4rZBS8bJqS6JvvDV+nEozDaye8FElVnw40q9oaZOQ3sum2484t8nT
 /o2vE1+C8GXejAA6SiTEKa3hG6K0/wj9/OxMbNPxwQcXUf3BuNLRK1VzZdVquGDZwnIV xA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33rck5gqd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 16:03:34 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08NK2fkp015746;
 Wed, 23 Sep 2020 16:03:33 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33rck5gqbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 16:03:33 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08NK3DGi024629;
 Wed, 23 Sep 2020 20:03:31 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 33n9m7tayt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 20:03:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08NK3Q6J24576380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Sep 2020 20:03:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B776311C050;
 Wed, 23 Sep 2020 20:03:28 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A665711C04A;
 Wed, 23 Sep 2020 20:03:21 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.10.187])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Sep 2020 20:03:21 +0000 (GMT)
Message-ID: <1fd254a926ce8c477d28adae4fe900d3f1619c52.camel@linux.ibm.com>
Subject: Re: [PATCH v6 0/3] Carry forward IMA measurement log on kexec on ARM64
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 bauerman@linux.ibm.com, robh@kernel.org, gregkh@linuxfoundation.org,
 james.morse@arm.com, catalin.marinas@arm.com, sashal@kernel.org,
 will@kernel.org, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, robh+dt@kernel.org, frowand.list@gmail.com,
 vincenzo.frascino@arm.com, mark.rutland@arm.com,
 dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com,
 pasha.tatashin@soleen.com, allison@lohutok.net,
 kstewart@linuxfoundation.org, takahiro.akashi@linaro.org,
 tglx@linutronix.de, masahiroy@kernel.org, bhsharma@redhat.com,
 mbrugger@suse.com, hsinyi@chromium.org, tao.li@vivo.com,
 christophe.leroy@c-s.fr
Date: Wed, 23 Sep 2020 16:03:20 -0400
In-Reply-To: <20200908230856.9799-1-nramas@linux.microsoft.com>
References: <20200908230856.9799-1-nramas@linux.microsoft.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-12.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_16:2020-09-23,
 2020-09-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230145
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
Cc: devicetree@vger.kernel.org, balajib@linux.microsoft.com,
 Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 prsriva@linux.microsoft.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Cc'ing Nayna Jain, linuxppc-dev@lists.ozlabs.org]

Hi Lakshmi,

On Tue, 2020-09-08 at 16:08 -0700, Lakshmi Ramasubramanian wrote:
> On kexec file load Integrity Measurement Architecture(IMA) subsystem
> may verify the IMA signature of the kernel and initramfs, and measure
> it. The command line parameters passed to the kernel in the kexec call
> may also be measured by IMA. A remote attestation service can verify
> the measurement through the IMA log and the TPM PCR data. This can be
> achieved only if the IMA measurement log is carried over from
> the current kernel to the next kernel across the kexec call.
> However in the current implementation the IMA measurement logs are not
> carried over on ARM64 platforms. Therefore a remote attestation service
> cannot verify the authenticity of the running kernel on ARM64 platforms
> when the kernel is updated through the kexec system call.
> 
> This patch series adds support for carrying forward the IMA measurement
> log on kexec on ARM64. powerpc already supports carrying forward
> the IMA measurement log on kexec.
> 
> This series refactors the platform independent code defined for powerpc
> such that it can be reused for ARM64 as well. A chosen node namely
> "linux,ima-kexec-buffer" is added to the DTB for ARM64 to hold
> the address and the size of the memory reserved to carry
> the IMA measurement log.
> 
> This patch series has been tested for ARM64 platform using QEMU.
> I would like help from the community for testing this change on powerpc.
> Thanks.

Getting access to and upgrading our group's Power system firmware took
time due to limited employee site access.  Confirmed, with these
patches applied, ima-evm-utils still properly verifies carrying the IMA
measurement list across kexec.

I plan on reviewing this patch set shortly.

thanks,

Mimi

> 
> This series is based on commit f4d51dffc6c0 ("Linux 5.9-rc4") in
> https://github.com/torvalds/linux "master" branch.
> 
> Changelog:
> 
> v6:
>   - Remove any existing FDT_PROP_IMA_KEXEC_BUFFER property in the device
>     tree and also its corresponding memory reservation in the currently
>     running kernel.
>   - Moved the function remove_ima_buffer() defined for powerpc to IMA
>     and renamed the function to ima_remove_kexec_buffer(). Also, moved
>     delete_fdt_mem_rsv() from powerpc to IMA.
> 
> v5:
>   - Merged get_addr_size_cells() and do_get_kexec_buffer() into a single
>     function when moving the arch independent code from powerpc to IMA
>   - Reverted the change to use FDT functions in powerpc code and added
>     back the original code in get_addr_size_cells() and
>     do_get_kexec_buffer() for powerpc.
>   - Added fdt_add_mem_rsv() for ARM64 to reserve the memory for
>     the IMA log buffer during kexec.
>   - Fixed the warning reported by kernel test bot for ARM64
>     arch_ima_add_kexec_buffer() - moved this function to a new file
>     namely arch/arm64/kernel/ima_kexec.c
> 
> v4:
>   - Submitting the patch series on behalf of the original author
>     Prakhar Srivastava <prsriva@linux.microsoft.com>
>   - Moved FDT_PROP_IMA_KEXEC_BUFFER ("linux,ima-kexec-buffer") to
>     libfdt.h so that it can be shared by multiple platforms.
> 
> v3:
> Breakup patches further into separate patches.
>   - Refactoring non architecture specific code out of powerpc
>   - Update powerpc related code to use fdt functions
>   - Update IMA buffer read related code to use of functions
>   - Add support to store the memory information of the IMA
>     measurement logs to be carried forward.
>   - Update the property strings to align with documented nodes
>     https://github.com/devicetree-org/dt-schema/pull/46
> 
> v2:
>   Break patches into separate patches.
>   - Powerpc related Refactoring
>   - Updating the docuemntation for chosen node
>   - Updating arm64 to support IMA buffer pass
> 
> v1:
>   Refactoring carrying over IMA measuremnet logs over Kexec. This patch
>     moves the non-architecture specific code out of powerpc and adds to
>     security/ima.(Suggested by Thiago)
>   Add Documentation regarding the ima-kexec-buffer node in the chosen
>     node documentation
> 
> v0:
>   Add a layer of abstraction to use the memory reserved by device tree
>     for ima buffer pass.
>   Add support for ima buffer pass using reserved memory for arm64 kexec.
>     Update the arch sepcific code path in kexec file load to store the
>     ima buffer in the reserved memory. The same reserved memory is read
>     on kexec or cold boot.
> 
> Lakshmi Ramasubramanian (3):
>   powerpc: Refactor kexec functions to move arch independent code to IMA
>   arm64: Store IMA log information in kimage used for kexec
>   arm64: Add IMA kexec buffer to DTB
> 
>  arch/arm64/Kconfig                      |   1 +
>  arch/arm64/include/asm/ima.h            |  18 ++++
>  arch/arm64/include/asm/kexec.h          |   3 +
>  arch/arm64/kernel/Makefile              |   1 +
>  arch/arm64/kernel/ima_kexec.c           |  34 ++++++++
>  arch/arm64/kernel/machine_kexec_file.c  |  18 ++++
>  arch/powerpc/include/asm/ima.h          |  11 +--
>  arch/powerpc/include/asm/kexec.h        |   1 -
>  arch/powerpc/kexec/file_load.c          |  33 +-------
>  arch/powerpc/kexec/ima.c                | 104 +-----------------------
>  include/linux/ima.h                     |   2 +
>  include/linux/kexec.h                   |  11 +++
>  include/linux/libfdt.h                  |   3 +
>  security/integrity/ima/Makefile         |   3 +-
>  security/integrity/ima/ima.h            |   2 +
>  security/integrity/ima/ima_fdt.c        |  80 ++++++++++++++++++
>  security/integrity/ima/ima_kexec.c      |  58 +++++++++++++
>  security/integrity/ima/ima_kexec_file.c |  51 ++++++++++++
>  18 files changed, 289 insertions(+), 145 deletions(-)
>  create mode 100644 arch/arm64/include/asm/ima.h
>  create mode 100644 arch/arm64/kernel/ima_kexec.c
>  create mode 100644 security/integrity/ima/ima_fdt.c
>  create mode 100644 security/integrity/ima/ima_kexec_file.c
> 


