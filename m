Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E977DBA6F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 14:17:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WeO0gDMg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJv2W2Cvzz3cRj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 00:17:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WeO0gDMg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJv1d518Dz30hn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 00:16:53 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39UDB2hV020561
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 13:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=O6+pgK7/B0b7vXi0p2yuS8Ih92N+s0HlzSlyWgOf/mU=;
 b=WeO0gDMgtY78dgblm/k5bcXGgMnqB9qT0InQO9fd3gi2iDEg9xLOvF+Ht44avOXK3g/8
 NLnjPI+TPRhxqrscgxqaSD98RMGgC+jw/awVcbhzZjUhL4UWA4bhHMYpYAZboiTCMye7
 vqThFNM/9uGw7Av/aRgolobsflBzJ1ITNK0AGCjZPqBJnv1q9RzJgckjWn0SDMWRE0qg
 v5/EmdWQgQ1GpitTum+vpgNELVMzLWp0vj60YxxV7rGNStkjxmeMZOou36d3DfvPAv4Y
 Vdmmx64yhwlEZypH1NGPQ1J1pkB/p4hgbBxqdj5M4sXqMeLe3iy3jM3ghxy8tihHyfN7 7Q== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u2d5288u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 13:16:49 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39UBQABL020321
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 13:16:48 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3u1d0y9dej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 13:16:48 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39UDGk8B26477126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 13:16:47 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1A7B5804B;
	Mon, 30 Oct 2023 13:16:46 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8174B58063;
	Mon, 30 Oct 2023 13:16:45 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.51.133])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Oct 2023 13:16:45 +0000 (GMT)
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 02/12] powerpc/pseries: Restructure hvc_get_chars()
 endianness
In-Reply-To: <20231011053711.93427-3-bgray@linux.ibm.com>
References: <20231011053711.93427-1-bgray@linux.ibm.com>
 <20231011053711.93427-3-bgray@linux.ibm.com>
Date: Mon, 30 Oct 2023 18:46:43 +0530
Message-ID: <87bkcg9rno.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S-9Fw9KZLmVQBkghmVLpvf_uOeyjg1Oj
X-Proofpoint-ORIG-GUID: S-9Fw9KZLmVQBkghmVLpvf_uOeyjg1Oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_10,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 spamscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310240000 definitions=main-2310300101
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Benjamin Gray <bgray@linux.ibm.com> writes:

> Sparse reports an endian mismatch in hvc_get_chars().
>
> At first it seemed like the retbuf should be __be64[], but actually
> retbuf holds serialized registers returned by the hypervisor call, so
> it's correctly CPU endian typed.
>
> Instead, it is the be64_to_cpu() that's misleading. The intent is to do
> a byte swap on a little endian CPU. The swap is required because we
> wanted to store the register values to memory without 'swapping' bytes,
> so that the high order byte of the first register is the first byte
> in the result buffer.
>
> In diagram form, on a LE CPU with the letters representing the return
> string bytes:
>
>     (register bytes) A B C D E F G H   I J K L M N O P
>   (retbuf mem bytes) H G F E D C B A   P O N M L K J I
> (buf/lbuf mem bytes) A B C D E F G H   I J K L M N O P
>
> So retbuf stores the registers in CPU endian, and buf always stores in
> big endian.
>
> So replace the byte swap function with cpu_to_be64() and cast lbuf as an
> array of __be64 to match the semantics closer.
>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/hvconsole.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/hvconsole.c b/arch/powerpc/platforms/pseries/hvconsole.c
> index 1ac52963e08b..647718a15e78 100644
> --- a/arch/powerpc/platforms/pseries/hvconsole.c
> +++ b/arch/powerpc/platforms/pseries/hvconsole.c
> @@ -29,11 +29,11 @@ int hvc_get_chars(uint32_t vtermno, char *buf, int count)
>  {
>  	long ret;
>  	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
> -	unsigned long *lbuf = (unsigned long *)buf;
> +	__be64 *lbuf = (__be64 __force *)buf;
>  
>  	ret = plpar_hcall(H_GET_TERM_CHAR, retbuf, vtermno);
> -	lbuf[0] = be64_to_cpu(retbuf[1]);
> -	lbuf[1] = be64_to_cpu(retbuf[2]);
> +	lbuf[0] = cpu_to_be64(retbuf[1]);
> +	lbuf[1] = cpu_to_be64(retbuf[2]);
>  
>  	if (ret == H_SUCCESS)
>  		return retbuf[0];
>

There is no functionality change in this patch. It is clarifying the
details that it expect the buf to have the big-endian format and retbuf
contains native endian format.

Not sure why this was not picked.

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
