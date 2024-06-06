Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 945138FDE55
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 07:49:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QtJGZlhg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvtgZ51Sbz3cWm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 15:49:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QtJGZlhg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvtfr0DNqz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 15:48:35 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4564fQ1l031562;
	Thu, 6 Jun 2024 05:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc : content-type : date
 : from : in-reply-to : message-id : mime-version : references : subject :
 to; s=pp1; bh=F1QxdnanM0DI+xMmZuQK1XU1kD0sRkv46FM+ALv8/RY=;
 b=QtJGZlhgqgx4YR8FKPwgMLc7QHJXCg1ncKiGb8ewrAUZYkfnr6a4dxPLnWAg13NWNePA
 vGZudAhNawb/e7bGe0QaJ/Pldlz+cuaBQ4Nr86ua8HjDUu1Kxx4By4nAV4JJ4+4Vj4AN
 tNXmeQDcTecG7/V5UjT0gVg+ypwNw1npXaZW8rtiIYTD0rgCPLqmKWybQEdrMixGqrNH
 Gv/bgOpJvacHCgUAfcu24rFbOSZ4Gm/3v5PNswzqqp7HTUa0fnpc0winUYwuXwJ0Z+Mn
 iOeM9Fw1zdPWbAOhZiMxJio+X2IevmzNgnr7ShIRk78MnLVf9qKTobWdKDA4ALwx8M6u 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yk4n18bee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 05:48:24 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4565mNsq004930;
	Thu, 6 Jun 2024 05:48:23 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yk4n18be9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 05:48:23 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4564gXQW008458;
	Thu, 6 Jun 2024 05:48:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ygec10xc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 05:48:22 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4565mIDC25559620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jun 2024 05:48:20 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75F6F20956;
	Thu,  6 Jun 2024 05:46:16 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 365242093B;
	Thu,  6 Jun 2024 05:46:12 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.43.32.207])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  6 Jun 2024 05:46:11 +0000 (GMT)
Date: Thu, 6 Jun 2024 11:16:08 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, corbet@lwn.net
Subject: Re: [PATCH v2 0/2] Fix doorbell emulation for v2 API on PPC
Message-ID: <yzixdicgdqcten6eglcc4zlhn3sbnqrax3ymzzqvdmxvdh63zx@xymyajel3aoh>
References: <20240605113913.83715-1-gautam@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605113913.83715-1-gautam@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EblB2tKXDq9detrDQrwOMaMKSlbJs6rb
X-Proofpoint-GUID: -G_Cdwm-ls8YhJt_YOO4Dh9rKtQGZgs8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxlogscore=583 mlxscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406060040
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 05, 2024 at 05:09:08PM GMT, Gautam Menghani wrote:
> Doorbell emulation for KVM on PAPR guests is broken as support for DPDES
> was not added in initial patch series [1].
> Add DPDES support and doorbell handling support for V2 API. 
> 
> [1] lore.kernel.org/linuxppc-dev/20230914030600.16993-1-jniethe5@gmail.com
> 
> Changes in v2:
> 1. Split DPDES support into its own patch
> 
> Gautam Menghani (2):
>   arch/powerpc/kvm: Add DPDES support in helper library for Guest state
>     buffer
>   arch/powerpc/kvm: Fix doorbell emulation for v2 API
> 
>  Documentation/arch/powerpc/kvm-nested.rst     | 4 +++-
>  arch/powerpc/include/asm/guest-state-buffer.h | 3 ++-
>  arch/powerpc/include/asm/kvm_book3s.h         | 1 +
>  arch/powerpc/kvm/book3s_hv.c                  | 5 +++++
>  arch/powerpc/kvm/book3s_hv_nestedv2.c         | 7 +++++++
>  arch/powerpc/kvm/test-guest-state-buffer.c    | 2 +-
>  6 files changed, 19 insertions(+), 3 deletions(-)
> 
> -- 
> 2.45.1
> 


Hi Michael,

This patch series is to be backported for all kernels >= 6.7. So the tag
should be 
Cc: stable@vger.kernel.org # v6.7+

and not
Cc: stable@vger.kernel.org # v6.7

Should I send a new version of this series or can you please make this 
change when pulling in your tree?

Thanks,
Gautam
