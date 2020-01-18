Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B03E1416C6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 10:26:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 480CHN4ptwzDr0C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2020 20:26:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 480CFf5v68zDqxb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2020 20:25:09 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00I9CX4Y139535
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2020 04:25:06 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xk0qth1aj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2020 04:25:06 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sandipan@linux.ibm.com>;
 Sat, 18 Jan 2020 09:25:04 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 18 Jan 2020 09:24:58 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00I9OvJG37879856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 Jan 2020 09:24:57 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38DE1AE04D;
 Sat, 18 Jan 2020 09:24:57 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6FCDAE045;
 Sat, 18 Jan 2020 09:24:52 +0000 (GMT)
Received: from [9.199.37.218] (unknown [9.199.37.218])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 18 Jan 2020 09:24:52 +0000 (GMT)
Subject: Re: [PATCH v16 00/23] selftests, powerpc, x86: Memory Protection Keys
To: Dave Hansen <dave.hansen@intel.com>
References: <cover.1579265066.git.sandipan@linux.ibm.com>
 <3a14815c-b9cb-f5a5-630a-0bfb25356429@intel.com>
From: Sandipan Das <sandipan@linux.ibm.com>
Date: Sat, 18 Jan 2020 14:54:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3a14815c-b9cb-f5a5-630a-0bfb25356429@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20011809-0016-0000-0000-000002DE80B1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011809-0017-0000-0000-000033411FB0
Message-Id: <88abbb6b-8e07-43e5-231f-0e54edcad3f7@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-18_02:2020-01-16,
 2020-01-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001180074
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
Cc: linux-arch@vger.kernel.org, fweimer@redhat.com, aneesh.kumar@linux.ibm.com,
 x86@kernel.org, linuxram@us.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mhocko@kernel.org, linux-mm@kvack.org, mingo@redhat.com,
 linux-kselftest@vger.kernel.org, msuchanek@suse.de, shuah@kernel.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 17/01/20 11:32 pm, Dave Hansen wrote:
> I also tested the series.  The 64-bit binary works fine.  But,
> 
> This is failing to build the x86 selftests:
> 
> make: *** No rule to make target 'protection_keys.c', needed by
> '/home/daveh/linux/tools/testing/selftests/x86/protection_keys_32'.  Stop.
> 
> I think you just forgot to remove the binary from the x86 Makefile.
> 
> Which reminds me: This removes the 32-bit binary.  x86 32-bit binaries
> exercise different paths than the 64-bit ones, so we like to have both.
>  Although it isn't *essential* it would really be nice to keep the
> 32-bit binary.
> 

Oops. Let me fix that. Thanks for testing this.

- Sandipan

