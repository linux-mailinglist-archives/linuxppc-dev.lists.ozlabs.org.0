Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A16A3501
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 12:33:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KbS40bfhzDr5J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 20:33:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KbQC0whpzDr0N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 20:32:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46KbQB6t3fz8sxB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2019 20:32:18 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46KbQB6YKmz9sN6; Fri, 30 Aug 2019 20:32:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46KbQB2sBvz9sMr
 for <linuxppc-dev@ozlabs.org>; Fri, 30 Aug 2019 20:32:16 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7UAViMx113180
 for <linuxppc-dev@ozlabs.org>; Fri, 30 Aug 2019 06:32:12 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2upyk5p6dw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 30 Aug 2019 06:32:12 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Fri, 30 Aug 2019 11:32:10 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 30 Aug 2019 11:32:06 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7UAW5bT51904560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Aug 2019 10:32:06 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D22E8A4053;
 Fri, 30 Aug 2019 10:32:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AB8DA4040;
 Fri, 30 Aug 2019 10:32:04 +0000 (GMT)
Received: from [9.199.196.167] (unknown [9.199.196.167])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 30 Aug 2019 10:32:04 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Oops (request_key_auth_describe) while running cve-2016-7042 from
 LTP
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20190830085646.14740-1-hdanton@sina.com>
Date: Fri, 30 Aug 2019 16:02:03 +0530
Content-Transfer-Encoding: 7bit
References: <20190830085646.14740-1-hdanton@sina.com>
To: Hillf Danton <hdanton@sina.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19083010-0012-0000-0000-000003449A8B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19083010-0013-0000-0000-0000217EDE26
Message-Id: <C41D3A16-835C-421C-9059-AABB7273E664@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-30_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908300114
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
Cc: dhowells@redhat.com, linuxppc-dev@ozlabs.org, keyrings@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 30-Aug-2019, at 2:26 PM, Hillf Danton <hdanton@sina.com> wrote:
> 
> 
> On Fri, 30 Aug 2019 12:18:07 +0530 Sachin Sant wrote:
>> 
>> [ 8074.351033] BUG: Kernel NULL pointer dereference at 0x00000038
>> [ 8074.351046] Faulting instruction address: 0xc0000000004ddf30
>> [ 8074.351052] Oops: Kernel access of bad area, sig: 11 [#1]
>> [ 8074.351056] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> 
> Add rcu gp.
> 
> --- a/security/keys/request_key_auth.c
> +++ b/security/keys/request_key_auth.c
> @@ -64,12 +64,19 @@ static int request_key_auth_instantiate(
> static void request_key_auth_describe(const struct key *key,
> 				      struct seq_file *m)
> {
> -	struct request_key_auth *rka = dereference_key_rcu(key);
> +	struct request_key_auth *rka;
> +
> +	rcu_read_lock();
> +	rka = dereference_key_rcu(key);
> +	if (!rka)
> +		goto out;
> 

Thanks for the patch. Works for me. Test ran fine without any problems.

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks
-Sachin

