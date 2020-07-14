Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C564E21FF89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 23:03:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5tK36c8MzDqX7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 07:03:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5tGd6QjLzDqNx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 07:01:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B5tGd3j6dz8tVt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 07:01:13 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B5tGd2lSXz9sRf; Wed, 15 Jul 2020 07:01:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B5tGc4nFcz9sRK
 for <linuxppc-dev@ozlabs.org>; Wed, 15 Jul 2020 07:01:12 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06EKXDR6194217; Tue, 14 Jul 2020 17:01:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3298wuxnag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 17:01:00 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06EKjYw8038895;
 Tue, 14 Jul 2020 17:01:00 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3298wuxn9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 17:00:59 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06EKu6P9015438;
 Tue, 14 Jul 2020 21:00:59 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 327529a5mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 21:00:59 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06EL0wlO38928860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jul 2020 21:00:58 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26234AE062;
 Tue, 14 Jul 2020 21:00:58 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D977AE067;
 Tue, 14 Jul 2020 21:00:53 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.66.159])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Jul 2020 21:00:52 +0000 (GMT)
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466083461.24747.6919654118386889005.stgit@hbathini.in.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 01/12] kexec_file: allow archs to handle special
 regions while locating memory hole
In-reply-to: <159466083461.24747.6919654118386889005.stgit@hbathini.in.ibm.com>
Date: Tue, 14 Jul 2020 18:00:49 -0300
Message-ID: <875zap95ha.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-14_09:2020-07-14,
 2020-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=755 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007140143
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
Cc: kernel test robot <lkp@intel.com>, Pingfan Liu <piliu@redhat.com>,
 Nayna Jain <nayna@linux.ibm.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hari Bathini <hbathini@linux.ibm.com> writes:

> Some architectures may have special memory regions, within the given
> memory range, which can't be used for the buffer in a kexec segment.
> Implement weak arch_kexec_locate_mem_hole() definition which arch code
> may override, to take care of special regions, while trying to locate
> a memory hole.
>
> Also, add the missing declarations for arch overridable functions and
> and drop the __weak descriptors in the declarations to avoid non-weak
> definitions from becoming weak.
>
> Reported-by: kernel test robot <lkp@intel.com>
> [lkp: In v1, arch_kimage_file_post_load_cleanup() declaration was missing]
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Acked-by: Dave Young <dyoung@redhat.com>
> Tested-by: Pingfan Liu <piliu@redhat.com>

Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
