Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF06186379
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 03:57:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ggvm6CQpzDqCq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 13:57:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ggqR0CVZzDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 13:53:54 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02G2oSwB089998
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Mar 2020 22:53:52 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ysy4n2r68-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Mar 2020 22:53:52 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Mon, 16 Mar 2020 02:53:50 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 16 Mar 2020 02:53:46 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02G2rimi45089006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Mar 2020 02:53:44 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B71B24C044;
 Mon, 16 Mar 2020 02:53:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF6CC4C040;
 Mon, 16 Mar 2020 02:53:41 +0000 (GMT)
Received: from [9.85.83.196] (unknown [9.85.83.196])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 16 Mar 2020 02:53:41 +0000 (GMT)
Subject: Re: [PATCHv3 2/2] pseries/scm: buffer pmem's bound addr in dt for
 kexec kernel
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <1582882895-3142-1-git-send-email-kernelfans@gmail.com>
 <1583311651-29310-1-git-send-email-kernelfans@gmail.com>
 <1583311651-29310-3-git-send-email-kernelfans@gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Mon, 16 Mar 2020 08:23:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583311651-29310-3-git-send-email-kernelfans@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20031602-0016-0000-0000-000002F1AF09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031602-0017-0000-0000-00003355289B
Message-Id: <41abb04e-d481-040f-827b-c04ad7d2abb9@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-15_05:2020-03-12,
 2020-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003160008
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, kexec@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Dan Williams <dan.j.williams@intel.com>,
 Frank Rowand <frowand.list@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/4/20 2:17 PM, Pingfan Liu wrote:
> At present, plpar_hcall(H_SCM_BIND_MEM, ...) takes a very long time, so
> if dumping to fsdax, it will take a very long time.
> 


that should be fixed by

faa6d21153fd11e139dd880044521389b34a24f2
Author:       Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
AuthorDate:   Tue Sep 3 18:04:52 2019 +0530
Commit:       Michael Ellerman <mpe@ellerman.id.au>
CommitDate:   Wed Sep 25 08:32:59 2019 +1000

powerpc/nvdimm: use H_SCM_QUERY hcall on H_OVERLAP error

Right now we force an unbind of SCM memory at drcindex on H_OVERLAP error.
This really slows down operations like kexec where we get the H_OVERLAP
error because we don't go through a full hypervisor re init.

H_OVERLAP error for a H_SCM_BIND_MEM hcall indicates that SCM memory at
drc index is already bound. Since we don't specify a logical memory
address for bind hcall, we can use the H_SCM_QUERY hcall to query
the already bound logical address.




> Take a closer look, during the papr_scm initialization, the only
> configuration is through drc_pmem_bind()-> plpar_hcall(H_SCM_BIND_MEM,
> ...), which helps to set up the bound address.
> 
> On pseries, for kexec -l/-p kernel, there is no reset of hardware, and this
> step can be stepped around to save times.  So the pmem bound address can be
> passed to the 2nd kernel through a dynamic added property "bound-addr" in
> dt node 'ibm,pmemory'.
> 

-aneesh

